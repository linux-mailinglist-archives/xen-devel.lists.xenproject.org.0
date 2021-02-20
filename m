Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2E83205A1
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 15:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87237.164379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSvi-0001rF-I8; Sat, 20 Feb 2021 14:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87237.164379; Sat, 20 Feb 2021 14:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSvi-0001qq-Eb; Sat, 20 Feb 2021 14:08:18 +0000
Received: by outflank-mailman (input) for mailman id 87237;
 Sat, 20 Feb 2021 14:08:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDSvg-0001qj-RE
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 14:08:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDSvg-000463-KT; Sat, 20 Feb 2021 14:08:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDSvg-0007sM-EA; Sat, 20 Feb 2021 14:08:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y/L+TsqwEzk77RBuVx+nbuFwNE4gXiVh8QgeJ6Fe0K0=; b=hYeIcxlXtrhXIIrztk8doRIWbc
	34AnuqoO8eaj7q5VKv7OrnJlwsQrczuCnZ9C6BatZCBdy4egR2NEhaebrA3n6u6ili457McpiEaEM
	rM+02y7Uex/hQxeP3nEibVtGeAoJpgzGgE90mcqamsVhV0iJTulA3Ov8mgL08PFvg4Mw=;
Subject: Re: ISPENDR implementation (WAS Re: [linux-linus test] 159463:
 regressions - FAIL)
To: Julien Grall <julien.grall.oss@gmail.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <CAJ=z9a0bi2fAcaTMwez5AyQbqP1u1P1r0hzeXb2SK2vRd8O37Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b0e78be6-f914-fa0b-dc8a-23b21f434afa@xen.org>
Date: Sat, 20 Feb 2021 14:08:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a0bi2fAcaTMwez5AyQbqP1u1P1r0hzeXb2SK2vRd8O37Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/02/2021 23:12, Julien Grall wrote:
> Hi all,
> 
> On Fri, 19 Feb 2021 at 22:19, osstest service owner
> <osstest-admin@xenproject.org> wrote:
>>
>> flight 159463 linux-linus real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/159463/
> 
> [...]
> 
>>   test-arm64-arm64-xl-seattle                                  fail
> 
> [...]
> 
>>   test-arm64-arm64-xl-thunderx                                 pass
> 
> While looking at the log to check whether we fixed the Arm bug, I
> noticed that Linux will boot on Thunder-X but not Seattle.
> 
>  From the log:
> 
> (XEN) d0v3: vGICD: unhandled word write 0x00000020000000 to ISPENDR44
> Feb 18 17:01:19.426532 (XEN) traps.c:2013:d0v3 HSR=0x93820047
> pc=0xffff8000104aec2c gva=0xffff80001000522c gpa=0x000000e111022c
> 
> [...]
> 
> Feb 18 17:01:19.618568 [   27.097702] Call trace:
> 
> Feb 18 17:01:19.618612 [   27.100215]  gic_retrigger+0x2c/0x38
> 
> Feb 18 17:01:19.630516 [   27.103861]  irq_startup+0x78/0x138
> 
> Feb 18 17:01:19.630575 [   27.107419]  __enable_irq+0x70/0x80
> 
> Feb 18 17:01:19.630622 [   27.110978]  enable_irq+0x50/0xa0
> 
> Feb 18 17:01:19.642499 [   27.114363]  xgbe_one_poll+0xc8/0xd8
> 
> Feb 18 17:01:19.642558 [   27.118009]  net_rx_action+0x110/0x3a8
> 
> Feb 18 17:01:19.642605 [   27.121828]  __do_softirq+0x124/0x288
> 
> Feb 18 17:01:19.654496 [   27.125560]  irq_exit+0xe0/0xf0
> 
> Feb 18 17:01:19.654555 [   27.128772]  __handle_domain_irq+0x68/0xc0
> 
> Feb 18 17:01:19.654603 [   27.132939]  gic_handle_irq+0xa8/0xe0
> 
> Feb 18 17:01:19.654647 [   27.136671]  el1_irq+0xb0/0x180
> 
> Feb 18 17:01:19.666482 [   27.139883]  arch_cpu_idle+0x18/0x28
> 
> Feb 18 17:01:19.666540 [   27.143528]  default_idle_call+0x24/0x5c
> 
> Feb 18 17:01:19.666587 [   27.147524]  do_idle+0x204/0x278
> 
> Feb 18 17:01:19.678517 [   27.150819]  cpu_startup_entry+0x24/0x68
> 
> Feb 18 17:01:19.678577 [   27.154812]  secondary_start_kernel+0x174/0x188
> 
> Feb 18 17:01:19.678625 [   27.159415] Code: f9409063 d37e6821 91080021
> 8b010061 (b9000022)
> 
> Feb 18 17:01:19.690480 [   27.165582] ---[ end trace a7aadb3ae629b57f ]---
> 
> It looks like that Linux will now try to set the interrupt pending by
> writing ISPENDR when the interrupt is re-enabled.
> 
> I think the ISPENDR write emulation is easier to implement compare to
> the other missing IS{PENDR, ACTIVER).
> 
> It should be possible to emulate as follows:
>    1) For virtual interrupts, just call vgic_inject_irq()
>    2) For physical interrupts, set pending at the HW level. This will
> raise an interrupt that will call vgic_inject_irq().
> 
> The vGIC in KVM will directly set the physical interrupt active to
> avoid the round trip. But I am not sure we can do it safely in our
> current vGIC to avoid the guest de-activating the interrupt too early
> (the virtual interrupt may already be pending/active).
> 
> Any thoughts?

I have posted a patch [1]. This should help to discuss about the 
approach taken.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20210220140412.31610-1-julien@xen.org/T/#u

-- 
Julien Grall

