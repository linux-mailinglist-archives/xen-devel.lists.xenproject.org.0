Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8B8A9C72
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708399.1107300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSZI-0004cf-Im; Thu, 18 Apr 2024 14:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708399.1107300; Thu, 18 Apr 2024 14:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSZI-0004a0-FT; Thu, 18 Apr 2024 14:16:52 +0000
Received: by outflank-mailman (input) for mailman id 708399;
 Thu, 18 Apr 2024 14:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8zc=LX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rxSZH-0004Xr-10
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:16:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a23d2b1-fd8e-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 16:16:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1713449801860743.8701847337641;
 Thu, 18 Apr 2024 07:16:41 -0700 (PDT)
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
X-Inumbo-ID: 4a23d2b1-fd8e-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1713449803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e5VY6k6Nl/EOqdaPc/TtW7Vnkh4yALblW2RuiPMsA9Bchn/jyUTAVtDljPNyq2GqJ0Djz6J4OVEn65ImJE+8Cj5NA+JfJf36zWwZSGwZhtqmJzg6PtqS/HHYWXuZRtUKqpdo87feuFJy+9ZV3wKiUulTAWghzMeAjG73MUZ+/6Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713449803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tdd9JOG5byPrDoiaHI+jtnaoj4Tu1DTO/RbclmCVzvI=; 
	b=LTjBXCiT8egxSlk+oiG6dxvq3yNsW9viZFQIfpFLMRPmjEZBRxDi6ZeSy0GwLPXgUQ3KbZjBGC6H7bTAmAfs/8/kY7JBqUjsGjSqVo0/6bL15wzA+leR/Gdol1VRZDpoxWP9UlgB2nZtqOoSgBo+7qJN9uYzKrQhnVSUrclF96k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713449803;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Tdd9JOG5byPrDoiaHI+jtnaoj4Tu1DTO/RbclmCVzvI=;
	b=qzH/5JyoqD4AuNb7STKQeGEgNLLnOzB3c52PcGbSzZE4lE7u9XoZeB6jRFlldaZR
	DxPXkeBwbkuj++qzd99CEt2vlTxv+w8ASSfGtC5H+rT8PMs6gVkiy4PzA/x8QaJdm5s
	x2Wkztehy4TcVYFPlIFsIWRKNE5OGGOQP34Utdm8=
Message-ID: <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
Date: Thu, 18 Apr 2024 10:16:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] DOMCTL-based guest magic region allocation for 11
 domUs
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/9/24 00:53, Henry Wang wrote:
> An error message can seen from the init-dom0less application on
> direct-mapped 1:1 domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> This is because populate_physmap() automatically assumes gfn == mfn
> for direct mapped domains. This cannot be true for the magic pages
> that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
> helper application executed in Dom0. For domain using statically
> allocated memory but not 1:1 direct-mapped, similar error "failed to
> retrieve a reserved page" can be seen as the reserved memory list
> is empty at that time.
> 
> This series tries to fix this issue using a DOMCTL-based approach,
> because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
> and inform the toolstack about the region found by hypervisor for
> mapping the magic pages. Patch 1 introduced a new DOMCTL to get the
> guest memory map, currently only used for the magic page regions.
> Patch 2 generalized the extended region finding logic so that it can
> be reused for other use cases such as finding 1:1 domU magic regions.
> Patch 3 uses the same approach as finding the extended regions to find
> the guest magic page regions for direct-mapped DomUs. Patch 4 avoids
> hardcoding all base addresses of guest magic region in the init-dom0less
> application by consuming the newly introduced DOMCTL. Patch 5 is a
> simple patch to do some code duplication clean-up in xc.

Hey Henry,

To help provide some perspective, these issues are not experienced with 
hyperlaunch. This is because we understood early on that you cannot move 
a lightweight version of the toolstack into hypervisor init and not 
provide a mechanism to communicate what it did to the runtime control 
plane. We evaluated the possible mechanism, to include introducing a new 
hypercall op, and ultimately settled on using hypfs. The primary reason 
is this information is static data that, while informative later, is 
only necessary for the control plane to understand the state of the 
system. As a result, hyperlaunch is able to allocate any and all special 
pages required as part of domain construction and communicate their 
addresses to the control plane. As for XSM, hypfs is already protected 
and at this time we do not see any domain builder information needing to 
be restricted separately from the data already present in hypfs.

I would like to make the suggestion that instead of continuing down this 
path, perhaps you might consider adopting the hyperlaunch usage of 
hypfs. Then adjust dom0less domain construction to allocate the special 
pages at construction time. The original hyperlaunch series includes a 
patch that provides the helper app for the xenstore announcement. And I 
can provide you with updated versions if that would be helpful.

V/r,
Daniel P. Smith

