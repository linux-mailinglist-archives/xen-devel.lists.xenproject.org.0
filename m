Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C21BB175
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 00:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTC6z-0003nB-MC; Mon, 27 Apr 2020 22:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTC6y-0003n6-My
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 22:20:24 +0000
X-Inumbo-ID: 494374f0-88d5-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 494374f0-88d5-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588026024;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3sraytr6HrfoRHDcADWH34H1LOvDJDFtM1bTiIrvDVo=;
 b=JcndWCZRfCws8eD+Rp1vd5U/W4CnBYposM5kO0eKAEffApSLPf7ash+Y
 ckHzwYgkjfZVFgR7MeMREQIsCHnpkT3enWKcAlGpmsE6OMwNm0EEVyzV0
 LoiJweNPB4zDaM3HfeQOG/IGP0DAp5pvbNy/MunWEO7JJ0O3hsbbGbl8I A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bu2StfbPck1E+pVw/UOyPFrjx2PoKDBaIRezDdvmIwEmU8y01JyJ50JJjk/kexf3rXfQozMJDm
 OW4v3EFfhbsBC9qDGsxprm44xCJCn2dQCjgK2taUqHJ9yxsqdu9lfOjxyuJSp6umINKdsmN+K5
 9zAnBFZX6A9GUzJ0EICa7C6AFlV5G2OXdPGWys383QRAK8B6ZLXMPVHGItOLPbJICiN+/GfVRN
 EIHHXYs+znl4ziPO/YBKukzsLjmeRvKmbmDkJirt34fgAhVFNnYUfjElKXOTVOqVEetOWABnq1
 1ZE=
X-SBRS: 2.7
X-MesageID: 16317181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,325,1583211600"; d="scan'208";a="16317181"
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
To: Jan Beulich <jbeulich@suse.com>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
 <ca3374ed-6e00-7ab2-8255-f74c16b5ad3d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ec073c8d-61a2-79ef-1ffe-d34e26a5319d@citrix.com>
Date: Mon, 27 Apr 2020 23:20:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ca3374ed-6e00-7ab2-8255-f74c16b5ad3d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 27/04/2020 16:28, Jan Beulich wrote:
> On 27.04.2020 14:20, Andrew Cooper wrote:
>> The logic is completely undocumented and almost impossible to follow.  It
>> actually uses return oriented programming.  Rewrite it to conform to more
>> normal call mechanics, and leave a big comment explaining thing.  As well as
>> the code being easier to follow, it will execute faster as it isn't fighting
>> the branch predictor.
>>
>> Move the ioemul_handle_quirk() function pointer from traps.c to
>> ioport_emulate.c.  There is no reason for it to be in neither of the two
>> translation units which use it.  Alter the behaviour to return the number of
>> bytes written into the stub.
>>
>> Access the addresses of the host/guest helpers with extern const char arrays.
>> Nothing good will come of C thinking they are regular functions.
> I agree with the C aspect, but imo the assembly routines should,
> with the changes you make, be marked as being ordinary functions.

Despite the changes, they are still very much not ordinary functions,
and cannot be used by C.

I have no objection to marking them as STT_FUNCTION (as this doesn't
mean C function), but...

> A reasonable linker would then warn about the C file wanting an
> STT_OBJECT while the assembly file provides an STT_FUNC. I'd
> therefore prefer, along with marking the functions as such, to
> have them also declared as functions in C.

... there is literally nothing safe which C can do with them other than
manipulate their address.

Writing it like this is specifically prevents something from compiling
which will explode at runtime, is someone is naive enough to try using
the function from C.

>> --- a/xen/arch/x86/ioport_emulate.c
>> +++ b/xen/arch/x86/ioport_emulate.c
>> @@ -8,7 +8,10 @@
>>  #include <xen/sched.h>
>>  #include <xen/dmi.h>
>>  
>> -static bool ioemul_handle_proliant_quirk(
>> +unsigned int (*ioemul_handle_quirk)(
>> +    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
> Would you mind adding __read_mostly on this occasion?
>
>> @@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
>>          0xa8, 0x80, /*    test $0x80, %al */
>>          0x75, 0xfb, /*    jnz 1b          */
>>          0x9d,       /*    popf            */
>> -        0xc3,       /*    ret             */
>>      };
>>      uint16_t port = regs->dx;
>>      uint8_t value = regs->al;
>>  
>>      if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
>> -        return false;
>> +        return 0;
>>  
>>      memcpy(io_emul_stub, stub, sizeof(stub));
>> -    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));
> So you treat a build failure for a runtime crash.

I presume you mean s/treat/trade/ here, and the answer is no, not really.

There is nothing which actually forced a connection between the build
time checks and runtime behaviour, so it was only a facade of safety,
not real safety.

>  I can see the
> advantages of the new approach, but the original got away with
> less stub space.

Stub space doesn't matter, so long as it fits.  In particular, ...

> If our L1_CACHE_SHIFT wasn't hard coded to 7
> just to cover some unusual CPUs, your new approach would, if I
> got the counting and calculations right, not work (with a value
> resulting in a 64-byte cache line size).

... the SYSCALL stubs use 64 bytes so Xen cannot function with a shift
less than 7.

> Introducing a Kconfig
> option for this should imo not come with a need to re-work the
> logic here again. Therefore I'd like us to think about a way
> to make the space needed not exceed 32 bytes.

And why would we ever want an option like that?  (I know how you're
going to answer this, so I'm going to pre-emptively point out that there
are hundreds of kilobytes of easier-to-shrink per-cpu data structures
than this one).

Honestly, this suggestion is a total waste of time and effort.  It is an
enormous amount of complexity to micro-optimise a problem which doesn't
exist in the first place.

The stubs are already 128 bytes per CPU and cannot be made smaller. 
Attempting to turn this particular stub into <32 has no benefit (the
stubs don't actually get smaller), and major costs.

~Andrew

