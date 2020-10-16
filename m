Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16729039F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7891.20850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTNRm-00060K-V8; Fri, 16 Oct 2020 10:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7891.20850; Fri, 16 Oct 2020 10:58:54 +0000
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
	id 1kTNRm-0005zf-RV; Fri, 16 Oct 2020 10:58:54 +0000
Received: by outflank-mailman (input) for mailman id 7891;
 Fri, 16 Oct 2020 10:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kTNRm-0005rq-5m
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7d3f7fc-74af-4701-ab2e-9f7e155bf591;
 Fri, 16 Oct 2020 10:58:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iki1=DX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kTNRm-0005rq-5m
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:58:54 +0000
X-Inumbo-ID: f7d3f7fc-74af-4701-ab2e-9f7e155bf591
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7d3f7fc-74af-4701-ab2e-9f7e155bf591;
	Fri, 16 Oct 2020 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602845927;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+pBWnlvHDSSn8Da8INJJHrIl0uMpvD+yNPP15XdmzxA=;
  b=FFUNqfbiabPa9I+Mo/AyGc1L17JS4ic6HwWzdAkbUC5uj/p5bu3dFSno
   HD3wJGuiBNgk7I24+FW3SsR7qcg3w1eT7ymsIEkMz3BrTqec7CbzgsE/p
   0/gikMUeFZRO7IteZOcsjhF+HCWavGH6XEeS+jJidrf/tseV6P65QbAUn
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Rj08be3xfhrcr2A/tvCTIlSKgbNhWftc1HWPAzgN4TrmbwWrltuiAFTUXeCKdjONFpCyVotEzr
 ptcOuFyIRMs+TTMfnIG5HEejogIdWpH5mSIQv9QoRCYuVrMrfsfOVRYGL9/tjmNyIalrExokch
 wq2rzxcfDCi3R9bibI03cmB5cfZCqzYdzbWide3zucpxtuof9USyVR6udxc7UKOzEt2f1rYXmi
 0rvP37wEK4hftLpr+m8+UEuiWs7OJFaj0LiMjxJY2qlJmBqyGOTRBZYD4hLXuCqudXb7vt2RP2
 Xtk=
X-SBRS: 2.5
X-MesageID: 29159332
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,382,1596513600"; 
   d="scan'208";a="29159332"
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
 <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
 <307753b0-fef8-658d-f897-8c0eb99ce3e5@citrix.com>
 <948f0753-561b-15e8-bf8c-52ff507133d2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dbd19cd0-316a-c62f-de7b-627ada4df350@citrix.com>
Date: Fri, 16 Oct 2020 11:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <948f0753-561b-15e8-bf8c-52ff507133d2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 08:27, Jan Beulich wrote:
> On 14.10.2020 20:00, Andrew Cooper wrote:
>> On 13/10/2020 16:51, Jan Beulich wrote:
>>> On 12.10.2020 15:49, Andrew Cooper wrote:
>>>> All interrupts and exceptions pass a struct cpu_user_regs up into C.  This
>>>> contains the legacy vm86 fields from 32bit days, which are beyond the
>>>> hardware-pushed frame.
>>>>
>>>> Accessing these fields is generally illegal, as they are logically out of
>>>> bounds for anything other than an interrupt/exception hitting ring1/3 code.
>>>>
>>>> Unfortunately, the #DF handler uses these fields as part of preparing the
>>>> state dump, and being IST, accesses the adjacent stack frame.
>>>>
>>>> This has been broken forever, but c/s 6001660473 "x86/shstk: Rework the stack
>>>> layout to support shadow stacks" repositioned the #DF stack to be adjacent to
>>>> the guard page, which turns this OoB write into a fatal pagefault:
>>>>
>>>>   (XEN) *** DOUBLE FAULT ***
>>>>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>>>>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>>>>   (XEN) CPU:    4
>>>>   (XEN) RIP:    e008:[<ffff82d04031fd4f>] traps.c#read_registers+0x29/0xc1
>>>>   (XEN) RFLAGS: 0000000000050086   CONTEXT: hypervisor (d1v0)
>>>>   ...
>>>>   (XEN) Xen call trace:
>>>>   (XEN)    [<ffff82d04031fd4f>] R traps.c#read_registers+0x29/0xc1
>>>>   (XEN)    [<ffff82d0403207b3>] F do_double_fault+0x3d/0x7e
>>>>   (XEN)    [<ffff82d04039acd7>] F double_fault+0x107/0x110
>>>>   (XEN)
>>>>   (XEN) Pagetable walk from ffff830236f6d008:
>>>>   (XEN)  L4[0x106] = 80000000bfa9b063 ffffffffffffffff
>>>>   (XEN)  L3[0x008] = 0000000236ffd063 ffffffffffffffff
>>>>   (XEN)  L2[0x1b7] = 0000000236ffc063 ffffffffffffffff
>>>>   (XEN)  L1[0x16d] = 8000000236f6d161 ffffffffffffffff
>>>>   (XEN)
>>>>   (XEN) ****************************************
>>>>   (XEN) Panic on CPU 4:
>>>>   (XEN) FATAL PAGE FAULT
>>>>   (XEN) [error_code=0003]
>>>>   (XEN) Faulting linear address: ffff830236f6d008
>>>>   (XEN) ****************************************
>>>>   (XEN)
>>>>
>>>> and rendering the main #DF analysis broken.
>>>>
>>>> The proper fix is to delete cpu_user_regs.es and later, so no
>>>> interrupt/exception path can access OoB, but this needs disentangling from the
>>>> PV ABI first.
>>>>
>>>> Not-really-fixes: 6001660473 ("x86/shstk: Rework the stack layout to support shadow stacks")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Is it perhaps worth also saying explicitly that the other IST
>>> stacks don't suffer the same problem because show_registers()
>>> makes an local copy of the passed in struct? (Doing so also
>>> for #DF would apparently be an alternative solution.)
>> They're not safe.  They merely don't explode.
>>
>> https://lore.kernel.org/xen-devel/1532546157-5974-1-git-send-email-andrew.cooper3@citrix.com/
>> was "fixed" by CET-SS turning the guard page from not present to
>> read-only, but the same CET-SS series swapped #DB for #DF when it comes
>> to the single OoB write problem case.
> I see. While indeed I didn't pay attention to the OoB read aspect,
> me saying "the other IST stacks don't suffer the same problem" was
> still correct, wasn't it? Anyway - not a big deal.

I've tweaked the commit message to make this more clear.

--8<---
Accessing these fields is generally illegal, as they are logically out of
bounds for anything other than an interrupt/exception hitting ring1/3 code.

show_registers() unconditionally reads these fields, but the content is
discarded before use.  This is benign right now, as all parts of the
stack are
readable, including the guard pages.

However, read_registers() in the #DF handler writes to these fields as
part of
preparing the state dump, and being IST, hits the adjacent stack frame.
--8<--

~Andrew

