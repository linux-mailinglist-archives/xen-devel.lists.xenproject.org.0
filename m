Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2595126B6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315620.534164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqfk-00052P-U8; Wed, 27 Apr 2022 23:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315620.534164; Wed, 27 Apr 2022 23:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqfk-000501-RE; Wed, 27 Apr 2022 23:02:12 +0000
Received: by outflank-mailman (input) for mailman id 315620;
 Wed, 27 Apr 2022 23:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njqfj-0004zv-7c
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 23:02:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10168384-c67e-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 01:02:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8045C61EB1;
 Wed, 27 Apr 2022 23:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E312C385B3;
 Wed, 27 Apr 2022 23:02:06 +0000 (UTC)
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
X-Inumbo-ID: 10168384-c67e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651100526;
	bh=2B0I6UKvUahmLNSo7IJecEPRSchsOYXKzGhpm2fjGfA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iWBvdqT4Qbwoh8GS0FE0U+3z8IjbOdIrIB+iUg8neoPXQ/0gONGe+OhYJN+vMexTB
	 IAsa7lGrQ8KxXbqwxi8iA2tMb6cYDi3NyE374HAKBYxHXe9IxD9TV0gkAQmM8ZS9Z4
	 lxzOaUjoeoLvll8SKdhSqH6dFWAk1HZk6ibxPsW9oZl5Rr9TlylM39adOi91tW4kzM
	 h8FOt9hL48grw2OKXn2Wy2XjaChLVMLrcTsG8KbOFyzbUvxPZ42N4IJ3tvyS8P6Uff
	 OKbNTDYsY5ErNtrUxecTB/IVX3DJGW48T5wbtnk/ZZsaGMH+uBF3JMB87oScH9eKRO
	 lFFGSWaT4p9PA==
Date: Wed, 27 Apr 2022 16:02:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    David Vrabel <dvrabel@amazon.co.uk>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
In-Reply-To: <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
References: <osstest-169781-mainreport@xen.org> <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Apr 2022, Julien Grall wrote:
> On 27/04/2022 17:38, osstest service owner wrote:
> > flight 169781 xen-unstable-smoke real [real]
> > flight 169785 xen-unstable-smoke real-retest [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/169781/
> > http://logs.test-lab.xenproject.org/osstest/logs/169785/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs.
> > 169773
> 
> Well, I was overly optimistic :(. This now breaks in the ITS code:
> 
> Apr 27 13:23:14.324831 (XEN) Xen call trace:
> Apr 27 13:23:14.324855 (XEN)    [<000000000022a678>]
> alloc_xenheap_pages+0x178/0x194 (PC)
> Apr 27 13:23:14.336856 (XEN)    [<000000000022a670>]
> alloc_xenheap_pages+0x170/0x194 (LR)
> Apr 27 13:23:14.336886 (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
> Apr 27 13:23:14.348773 (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
> Apr 27 13:23:14.348808 (XEN)    [<000000000027b4e4>]
> gicv3_lpi_init_rdist+0x54/0x324
> Apr 27 13:23:14.348835 (XEN)    [<0000000000279898>]
> arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46c
> Apr 27 13:23:14.360799 (XEN)    [<0000000000279bfc>]
> arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
> Apr 27 13:23:14.372796 (XEN)    [<0000000000277054>]
> gic_init_secondary_cpu+0x18/0x30
> Apr 27 13:23:14.372829 (XEN)    [<0000000000284518>]
> start_secondary+0x1a8/0x234
> Apr 27 13:23:14.372856 (XEN)    [<0000010722aa4200>] 0000010722aa4200
> Apr 27 13:23:14.384793 (XEN)
> Apr 27 13:23:14.384823 (XEN)
> Apr 27 13:23:14.384845 (XEN) ****************************************
> Apr 27 13:23:14.384869 (XEN) Panic on CPU 2:
> Apr 27 13:23:14.384891 (XEN) Assertion '!in_irq() && (local_irq_is_enabled()
> || num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
> Apr 27 13:23:14.396805 (XEN) ****************************************
> 
> The GICv3 LPI code contains a few calls to xmalloc() that will be done while
> initializing the GIC CPU interface. I don't think we can delay the
> initialization of the LPI part past local_irq_enable(). So I think we will
> need to allocate the memory when preparing the CPU.
> 
> Any thoughts?


As a general principle I think the ASSERT is a good idea, and it should
make the code better and safer. I would not change the code to make the
ASSERT go away if not to improve the code.

In this case, gicv3_lpi_init_rdist and gicv3_lpi_allocate_pendtable
should be __init functions although they are not marked as __init at the
moment.

It seems to me that it is acceptable to allocate memory with interrupt
disabled during __init. I cannot see any drawbacks with it. I think we
should change the ASSERT to only trigger after __init: system_state ==
SYS_STATE_active.

What do you think?

