Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD29B2E786
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 23:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087636.1445571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoqQt-0000P8-Ib; Wed, 20 Aug 2025 21:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087636.1445571; Wed, 20 Aug 2025 21:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoqQt-0000MZ-G0; Wed, 20 Aug 2025 21:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1087636;
 Wed, 20 Aug 2025 21:33:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uoqQr-0000MT-PE
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 21:33:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uoqQq-00FEWP-2P;
 Wed, 20 Aug 2025 21:33:20 +0000
Received: from [2a02:8012:3a1:0:d81d:920:5c70:442f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uoqQq-00AeVQ-24;
 Wed, 20 Aug 2025 21:33:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=fdJpON6ZcjwjfhRGu6cRmoP1KoEainZH+ZkZYlDTWaQ=; b=SwhDypONDS3tghlv+ZoV8Y64jX
	6EWmCRVSgBy1sCIbaCOCoA4QWE+YSjjFobOIcayhBp48EHzH4PnvbA6KefN2Y0PldMaxkuOFgp83v
	uFNUcHO4L5P8JNcQBwrGrKAEg0Eqa2hIdDa1Ir1p+JYyPUN496iLjfSQwvfYubnJJu+w=;
Message-ID: <304cffd8-498d-447f-a8b0-cda694393ec8@xen.org>
Date: Wed, 20 Aug 2025 22:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Julien Grall <jgrall@amazon.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-2-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250812223024.2364749-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 12/08/2025 23:30, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, there are two different domain ID allocation implementations:
> 
>    1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>    2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>       max_init_domid (both Arm and x86).
> 
> The domain ID allocation covers dom0 or late hwdom, predefined domains,
> post-boot domains, excluding Xen system domains (domid >=
> DOMID_FIRST_RESERVED).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Note, fixing dependency on max_init_domid is out of scope of this patch.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> new common/domid.c based on the bitmap.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use it if
>    ID is not used;
> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
>    starting from the last used ID.
>    Implementation guarantees that two consecutive calls will never return the
>    same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
>    excluded from the allocation range.
> 
> Remove is_free_domid() helper as it is not needed now.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
 > Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
 > ---> Changes since v15:
> - fixup for check after the first pass in the bitarray in domid_alloc()

This was a good catch from Jan. Has a unit-test been added for this issue?

Anyway, my reviewed-by holds.

Cheers,

-- 
Julien Grall


