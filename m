Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFAF28E5E1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 20:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6969.18227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSl5F-0007EG-6d; Wed, 14 Oct 2020 18:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6969.18227; Wed, 14 Oct 2020 18:01:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSl5F-0007Dt-3S; Wed, 14 Oct 2020 18:01:05 +0000
Received: by outflank-mailman (input) for mailman id 6969;
 Wed, 14 Oct 2020 18:01:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSl5D-0007Do-Td
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:01:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3f57e28-5412-44d1-9c84-41d7861661f6;
 Wed, 14 Oct 2020 18:01:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSl5D-0007Do-Td
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:01:03 +0000
X-Inumbo-ID: f3f57e28-5412-44d1-9c84-41d7861661f6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3f57e28-5412-44d1-9c84-41d7861661f6;
	Wed, 14 Oct 2020 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602698461;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Bsx+Dx6Lh8fE0ZMgl+U7zDJoPgfY04D/vS2PEzoUDxU=;
  b=WhIWVp3SJ3PrDydIeHcEPbpqCjGQXpwJPhLikH5FrGhRpZZtPEzkhhLJ
   Ft9XyzZQpjor/1FylJkUzoZm7sztNB5zK08Mvd0+fHvnSs70KNHe744KH
   uo8vZd0fUmMmZapIK24OHdTnLnjv523uBT1OQOFJ4myOFOCRuJ/vL6y/q
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aRW7qphm8ic4zqDSfvKalmd4NB/chpgENDhlVRYZr7360V+BSUab/iZ74xf0V4LB8xe+6ZtSjK
 DWNvOaL9Ox/v51Kf+UTICGW20gRmn48e0pKGhZRGUaGVlmb4rJNpJV/CKzl5eSTQ+gzkzlk3KP
 xSQOEa/D+qRpaPNwWUHoiySpwVRm7H1Uk4be36k43Ds+A71S5t24QKG+rE1ZHt6GkuwJ184gxj
 blR1l2ricZ1hvGRzhATSNTfI/tC2nowUZgHNYLuI207vVFXzmnyFnPVd6tSzW0HX36ANjLH6f7
 7yY=
X-SBRS: 2.5
X-MesageID: 29077229
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="29077229"
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
 <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <307753b0-fef8-658d-f897-8c0eb99ce3e5@citrix.com>
Date: Wed, 14 Oct 2020 19:00:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 13/10/2020 16:51, Jan Beulich wrote:
> On 12.10.2020 15:49, Andrew Cooper wrote:
>> All interrupts and exceptions pass a struct cpu_user_regs up into C.  This
>> contains the legacy vm86 fields from 32bit days, which are beyond the
>> hardware-pushed frame.
>>
>> Accessing these fields is generally illegal, as they are logically out of
>> bounds for anything other than an interrupt/exception hitting ring1/3 code.
>>
>> Unfortunately, the #DF handler uses these fields as part of preparing the
>> state dump, and being IST, accesses the adjacent stack frame.
>>
>> This has been broken forever, but c/s 6001660473 "x86/shstk: Rework the stack
>> layout to support shadow stacks" repositioned the #DF stack to be adjacent to
>> the guard page, which turns this OoB write into a fatal pagefault:
>>
>>   (XEN) *** DOUBLE FAULT ***
>>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>>   (XEN) CPU:    4
>>   (XEN) RIP:    e008:[<ffff82d04031fd4f>] traps.c#read_registers+0x29/0xc1
>>   (XEN) RFLAGS: 0000000000050086   CONTEXT: hypervisor (d1v0)
>>   ...
>>   (XEN) Xen call trace:
>>   (XEN)    [<ffff82d04031fd4f>] R traps.c#read_registers+0x29/0xc1
>>   (XEN)    [<ffff82d0403207b3>] F do_double_fault+0x3d/0x7e
>>   (XEN)    [<ffff82d04039acd7>] F double_fault+0x107/0x110
>>   (XEN)
>>   (XEN) Pagetable walk from ffff830236f6d008:
>>   (XEN)  L4[0x106] = 80000000bfa9b063 ffffffffffffffff
>>   (XEN)  L3[0x008] = 0000000236ffd063 ffffffffffffffff
>>   (XEN)  L2[0x1b7] = 0000000236ffc063 ffffffffffffffff
>>   (XEN)  L1[0x16d] = 8000000236f6d161 ffffffffffffffff
>>   (XEN)
>>   (XEN) ****************************************
>>   (XEN) Panic on CPU 4:
>>   (XEN) FATAL PAGE FAULT
>>   (XEN) [error_code=0003]
>>   (XEN) Faulting linear address: ffff830236f6d008
>>   (XEN) ****************************************
>>   (XEN)
>>
>> and rendering the main #DF analysis broken.
>>
>> The proper fix is to delete cpu_user_regs.es and later, so no
>> interrupt/exception path can access OoB, but this needs disentangling from the
>> PV ABI first.
>>
>> Not-really-fixes: 6001660473 ("x86/shstk: Rework the stack layout to support shadow stacks")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Is it perhaps worth also saying explicitly that the other IST
> stacks don't suffer the same problem because show_registers()
> makes an local copy of the passed in struct? (Doing so also
> for #DF would apparently be an alternative solution.)

They're not safe.  They merely don't explode.

https://lore.kernel.org/xen-devel/1532546157-5974-1-git-send-email-andrew.cooper3@citrix.com/
was "fixed" by CET-SS turning the guard page from not present to
read-only, but the same CET-SS series swapped #DB for #DF when it comes
to the single OoB write problem case.

~Andrew

