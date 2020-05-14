Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34B1D35AD
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGEW-000193-2C; Thu, 14 May 2020 15:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k5kQ=64=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZGEU-00018y-Aw
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:57:14 +0000
X-Inumbo-ID: 93c9408a-95fb-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c9408a-95fb-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OB8EQH1kjQWMC46INt+AuR5nFnjyJsUf4LPFKk3OaiI=; b=iFU3EZOay3yylMAfOjH6smBfBG
 jOMZSrcz0P5HNxBFL6bbROdNPC8BGBF5URo3kOmoigZcJpGtihorxuDy4+4CazkcFvjQVJxoQ/T4/
 locifI76x0PWZgVAQGqY6FxIdgbjMeKbJv7sRtrn0Ttp3cpENz9hy7G7njvc62WWEOY0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZGET-0002qK-G7; Thu, 14 May 2020 15:57:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZGET-0004UU-9L; Thu, 14 May 2020 15:57:13 +0000
Subject: Re: Error during update_runstate_area with KPTI activated
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
Date: Thu, 14 May 2020 16:57:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: nd <nd@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 14/05/2020 15:28, Bertrand Marquis wrote:
> Hi,

Hi,

> 
> When executing linux on arm64 with KPTI activated (in Dom0 or in a DomU), I have a lot of walk page table errors like this:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> After implementing a call trace, I found that the problem was coming from the update_runstate_area when linux has KPTI activated.
> 
> I have the following call trace:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
> 
> Discussing this subject with Stefano, he pointed me to a discussion started a year ago on this subject here:
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
> 
> And a patch was submitted:
> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
> 
> I rebased this patch on current master and it is solving the problem I have seen.
> 
> It sounds to me like a good solution to introduce a VCPUOP_register_runstate_phys_memory_area to not depend on the area actually being mapped in the guest when a context switch is being done (which is actually the problem happening when a context switch is trigger while a guest is running in EL0).
> 
> Is there any reason why this was not merged at the end ?

I just skimmed through the thread to remind myself the state. AFAICT, 
this is blocked on the contributor to clarify the intended interaction 
and provide a new version.

I am still in favor of the new hypercall (and still in my todo list) but 
I haven't yet found time to revive the series.

Would you be willing to take over the series? I would be happy to bring 
you up to speed and provide review.

Cheers,

-- 
Julien Grall

