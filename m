Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D7511C7E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315309.533789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlBQ-0006Vi-3h; Wed, 27 Apr 2022 17:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315309.533789; Wed, 27 Apr 2022 17:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlBQ-0006SX-0L; Wed, 27 Apr 2022 17:10:32 +0000
Received: by outflank-mailman (input) for mailman id 315309;
 Wed, 27 Apr 2022 17:10:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlBO-0006SR-B4
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:10:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlBN-0002e5-0I; Wed, 27 Apr 2022 17:10:29 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlBM-0008QF-QD; Wed, 27 Apr 2022 17:10:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Sdm7aF/zqtosI88SlSaLElO7E01lEWpPolZLCpOxVlo=; b=gPm1HJsTY/6I7vMeCQkswE8Shw
	yTvwoM5EA4MdoPmrWEHh03j9CnBIHELU+o0MgQM+U46Ny8/Rv/NF2LuUKYnYtJdRgRhLUfJPr9LRr
	9HEuWMN6ug5I0MlrBWp34x5iQKf8xIsnjHmtDP+Li35IyWvPUasjQiSi4mG8MJ9KNPkI=;
Message-ID: <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
Date: Wed, 27 Apr 2022 18:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-169781-mainreport@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, David Vrabel <dvrabel@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <osstest-169781-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 17:38, osstest service owner wrote:
> flight 169781 xen-unstable-smoke real [real]
> flight 169785 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169781/
> http://logs.test-lab.xenproject.org/osstest/logs/169785/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169773

Well, I was overly optimistic :(. This now breaks in the ITS code:

Apr 27 13:23:14.324831 (XEN) Xen call trace:
Apr 27 13:23:14.324855 (XEN)    [<000000000022a678>] 
alloc_xenheap_pages+0x178/0x194 (PC)
Apr 27 13:23:14.336856 (XEN)    [<000000000022a670>] 
alloc_xenheap_pages+0x170/0x194 (LR)
Apr 27 13:23:14.336886 (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
Apr 27 13:23:14.348773 (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
Apr 27 13:23:14.348808 (XEN)    [<000000000027b4e4>] 
gicv3_lpi_init_rdist+0x54/0x324
Apr 27 13:23:14.348835 (XEN)    [<0000000000279898>] 
arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46c
Apr 27 13:23:14.360799 (XEN)    [<0000000000279bfc>] 
arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
Apr 27 13:23:14.372796 (XEN)    [<0000000000277054>] 
gic_init_secondary_cpu+0x18/0x30
Apr 27 13:23:14.372829 (XEN)    [<0000000000284518>] 
start_secondary+0x1a8/0x234
Apr 27 13:23:14.372856 (XEN)    [<0000010722aa4200>] 0000010722aa4200
Apr 27 13:23:14.384793 (XEN)
Apr 27 13:23:14.384823 (XEN)
Apr 27 13:23:14.384845 (XEN) ****************************************
Apr 27 13:23:14.384869 (XEN) Panic on CPU 2:
Apr 27 13:23:14.384891 (XEN) Assertion '!in_irq() && 
(local_irq_is_enabled() || num_online_cpus() <= 1)' failed at 
common/page_alloc.c:2212
Apr 27 13:23:14.396805 (XEN) ****************************************

The GICv3 LPI code contains a few calls to xmalloc() that will be done 
while initializing the GIC CPU interface. I don't think we can delay the 
initialization of the LPI part past local_irq_enable(). So I think we 
will need to allocate the memory when preparing the CPU.

Any thoughts?

Cheers,

-- 
Julien Grall

