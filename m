Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C81BA7F5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 17:29:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT5gj-0005n2-0g; Mon, 27 Apr 2020 15:28:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT5gh-0005mx-IA
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 15:28:51 +0000
X-Inumbo-ID: cb74ff28-889b-11ea-97ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb74ff28-889b-11ea-97ac-12813bfff9fa;
 Mon, 27 Apr 2020 15:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 020A3AF3B;
 Mon, 27 Apr 2020 15:28:48 +0000 (UTC)
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca3374ed-6e00-7ab2-8255-f74c16b5ad3d@suse.com>
Date: Mon, 27 Apr 2020 17:28:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427122041.7162-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.2020 14:20, Andrew Cooper wrote:
> The logic is completely undocumented and almost impossible to follow.  It
> actually uses return oriented programming.  Rewrite it to conform to more
> normal call mechanics, and leave a big comment explaining thing.  As well as
> the code being easier to follow, it will execute faster as it isn't fighting
> the branch predictor.
> 
> Move the ioemul_handle_quirk() function pointer from traps.c to
> ioport_emulate.c.  There is no reason for it to be in neither of the two
> translation units which use it.  Alter the behaviour to return the number of
> bytes written into the stub.
> 
> Access the addresses of the host/guest helpers with extern const char arrays.
> Nothing good will come of C thinking they are regular functions.

I agree with the C aspect, but imo the assembly routines should,
with the changes you make, be marked as being ordinary functions.
A reasonable linker would then warn about the C file wanting an
STT_OBJECT while the assembly file provides an STT_FUNC. I'd
therefore prefer, along with marking the functions as such, to
have them also declared as functions in C.

> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -8,7 +8,10 @@
>  #include <xen/sched.h>
>  #include <xen/dmi.h>
>  
> -static bool ioemul_handle_proliant_quirk(
> +unsigned int (*ioemul_handle_quirk)(
> +    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);

Would you mind adding __read_mostly on this occasion?

> @@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
>          0xa8, 0x80, /*    test $0x80, %al */
>          0x75, 0xfb, /*    jnz 1b          */
>          0x9d,       /*    popf            */
> -        0xc3,       /*    ret             */
>      };
>      uint16_t port = regs->dx;
>      uint8_t value = regs->al;
>  
>      if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
> -        return false;
> +        return 0;
>  
>      memcpy(io_emul_stub, stub, sizeof(stub));
> -    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));

So you treat a build failure for a runtime crash. I can see the
advantages of the new approach, but the original got away with
less stub space. If our L1_CACHE_SHIFT wasn't hard coded to 7
just to cover some unusual CPUs, your new approach would, if I
got the counting and calculations right, not work (with a value
resulting in a 64-byte cache line size). Introducing a Kconfig
option for this should imo not come with a need to re-work the
logic here again. Therefore I'd like us to think about a way
to make the space needed not exceed 32 bytes.

One option might be to arrange for some or all of R12-R15 to
not need spilling. And of course there then still ought to be
a BUILD_BUG_ON() identifying ahead of any testing that yet
smaller cache line sizes would indeed require re-work here.

Jan

