Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746128D184
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6304.16806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMaQ-00025k-Q9; Tue, 13 Oct 2020 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6304.16806; Tue, 13 Oct 2020 15:51:38 +0000
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
	id 1kSMaQ-00025N-Mq; Tue, 13 Oct 2020 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 6304;
 Tue, 13 Oct 2020 15:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMaO-00025I-E2
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:51:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a4d8b98-a51b-41db-8046-95cfce1ea284;
 Tue, 13 Oct 2020 15:51:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2FB3AAB2;
 Tue, 13 Oct 2020 15:51:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMaO-00025I-E2
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:51:36 +0000
X-Inumbo-ID: 3a4d8b98-a51b-41db-8046-95cfce1ea284
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3a4d8b98-a51b-41db-8046-95cfce1ea284;
	Tue, 13 Oct 2020 15:51:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602604294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vytuRpDje9ZD49Qmz7nTj2lJFZPkcVg367sRD5G5lm4=;
	b=nqKFjCvuksYsuqacn2mahUNSmaqt0QfO3Kve2ioeuME3+0b0o+N2quzDB4ZQIzwLRCTHRs
	ylXsBMvGa3/FGZ6pYN8Yj9OYthxmpNwvsGNS863olmdPgIudo+g532th9PnybshmNP8trI
	gV710Ea+r2awu/eORBYlfe+KjH3NU/8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C2FB3AAB2;
	Tue, 13 Oct 2020 15:51:34 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
Date: Tue, 13 Oct 2020 17:51:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012134908.27497-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.10.2020 15:49, Andrew Cooper wrote:
> All interrupts and exceptions pass a struct cpu_user_regs up into C.  This
> contains the legacy vm86 fields from 32bit days, which are beyond the
> hardware-pushed frame.
> 
> Accessing these fields is generally illegal, as they are logically out of
> bounds for anything other than an interrupt/exception hitting ring1/3 code.
> 
> Unfortunately, the #DF handler uses these fields as part of preparing the
> state dump, and being IST, accesses the adjacent stack frame.
> 
> This has been broken forever, but c/s 6001660473 "x86/shstk: Rework the stack
> layout to support shadow stacks" repositioned the #DF stack to be adjacent to
> the guard page, which turns this OoB write into a fatal pagefault:
> 
>   (XEN) *** DOUBLE FAULT ***
>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>   (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
>   (XEN) CPU:    4
>   (XEN) RIP:    e008:[<ffff82d04031fd4f>] traps.c#read_registers+0x29/0xc1
>   (XEN) RFLAGS: 0000000000050086   CONTEXT: hypervisor (d1v0)
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04031fd4f>] R traps.c#read_registers+0x29/0xc1
>   (XEN)    [<ffff82d0403207b3>] F do_double_fault+0x3d/0x7e
>   (XEN)    [<ffff82d04039acd7>] F double_fault+0x107/0x110
>   (XEN)
>   (XEN) Pagetable walk from ffff830236f6d008:
>   (XEN)  L4[0x106] = 80000000bfa9b063 ffffffffffffffff
>   (XEN)  L3[0x008] = 0000000236ffd063 ffffffffffffffff
>   (XEN)  L2[0x1b7] = 0000000236ffc063 ffffffffffffffff
>   (XEN)  L1[0x16d] = 8000000236f6d161 ffffffffffffffff
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 4:
>   (XEN) FATAL PAGE FAULT
>   (XEN) [error_code=0003]
>   (XEN) Faulting linear address: ffff830236f6d008
>   (XEN) ****************************************
>   (XEN)
> 
> and rendering the main #DF analysis broken.
> 
> The proper fix is to delete cpu_user_regs.es and later, so no
> interrupt/exception path can access OoB, but this needs disentangling from the
> PV ABI first.
> 
> Not-really-fixes: 6001660473 ("x86/shstk: Rework the stack layout to support shadow stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Is it perhaps worth also saying explicitly that the other IST
stacks don't suffer the same problem because show_registers()
makes an local copy of the passed in struct? (Doing so also
for #DF would apparently be an alternative solution.)

Jan

