Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A141F342660
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 20:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99391.189038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNKz1-0004EQ-2K; Fri, 19 Mar 2021 19:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99391.189038; Fri, 19 Mar 2021 19:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNKz0-0004E3-VR; Fri, 19 Mar 2021 19:40:30 +0000
Received: by outflank-mailman (input) for mailman id 99391;
 Fri, 19 Mar 2021 19:40:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBZJ=IR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lNKyy-0004Dx-UL
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 19:40:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7fc75cf-206c-44e0-9bf5-42b82bf637f9;
 Fri, 19 Mar 2021 19:40:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 264AD61970;
 Fri, 19 Mar 2021 19:40:27 +0000 (UTC)
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
X-Inumbo-ID: f7fc75cf-206c-44e0-9bf5-42b82bf637f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616182827;
	bh=T7flvrSgdHXO3f/MiGIVzYZs0Fury6+UcbBVEbxOjEM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CnKfQ4BeVPDGMUTUafutFmXqQSlXx5hXQ4X/Kl6/bJwSVa4i47uFc9XIP53XVVoQV
	 HULVXseGb4hu8D8s4QeFYmOZb5bnVZ6pNj8lRIIAfdxXpoN8JVb6YGag1gGwXQEGMh
	 +NqpNVl1xEMpjxtWr1wECavrRR48gxRGeRW7iRMAEJratA8QeCF+D6nYbnM3hShoVD
	 068tRl6jDuEDQgYB6oyEvQ5UBpdgjq9yfPds1x6BTZ16i+oP7KgFslhgmZc8vFQCq8
	 SnWgd3ahTZkNM9W3mcU4HJ6Gs4JU547qBvzKj8r2J+ZbSBjePIflHVGflReV13E4pS
	 OeNTeEdu0zDhA==
Date: Fri, 19 Mar 2021 12:40:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: preparations for 4.13.3
In-Reply-To: <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
Message-ID: <alpine.DEB.2.21.2103191238121.439@sstabellini-ThinkPad-T480s>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com> <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Mar 2021, Julien Grall wrote:
> Hi Jan & Stefano,
> 
> On 08/03/2021 09:49, Jan Beulich wrote:
> > All,
> > 
> > the release is overdue (my apologies). Please point out backports
> > you find missing from the respective staging branches, but which
> > you consider relevant.
> > > Ones that I have queued already, but which hadn't passed the push
> > gate to master yet when doing a swipe late last week, are
> > 
> > c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
> > 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without
> > reserved bits
> > 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when
> > running virtualized
> 
> I would like to also consider the following one:
> 
> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 2}
> drivers (4.11+ as updating the security support)
> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>     To support newer kernel on stable Xen
> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.13+)
> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 (4.13+)
> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped (4.13
> only)
> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before
> vcpu_pause() returns (4.13 only)
> 
> I have put in parentheses the list of versions targeted.


Thanks that was very helpful. I took care of those commits plus a
couple of others:

934bb4c87cf2 xen/arm: Document the erratum #853709 related to Cortex A72
a702c80ec193 xen/arm: call iomem_permit_access for passthrough devices
2fb361c36aa9 xen/arm: mm: Remove ; at the end of mm_printk()
284aed024f58 xen/arm: vgic-v3: fix GICD_ISACTIVER range

