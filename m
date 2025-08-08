Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBFB1EDEE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074933.1437403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukR6U-0003lS-Vp; Fri, 08 Aug 2025 17:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074933.1437403; Fri, 08 Aug 2025 17:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukR6U-0003jb-TC; Fri, 08 Aug 2025 17:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1074933;
 Fri, 08 Aug 2025 17:42:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukR6T-0003jV-RB
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:42:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukR6T-0083iv-0h;
 Fri, 08 Aug 2025 17:42:05 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukR6T-009O9f-03;
 Fri, 08 Aug 2025 17:42:05 +0000
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
	bh=D0daikWVaMxeVMkcoBVafYdjcbgci5pTVOZNNWWTonk=; b=pnix0kgfFb3Sfu0NbB+qNtw2BW
	tq95Hxco2hejXGkqnAUcainMjO8LWSCxscG/+nH9lbrhhVWETVYJD7OLcpjYwyj9gvDnHD6RmxhPj
	Fs/w6y3SzOlJKUsI48BbeX9HtbMo506h1nUIxdIdix/r2nXL/YdFf0XtPtzQUZGtl+ic=;
Message-ID: <400bf35e-65cc-40a6-ae7a-3c134e6d9c49@xen.org>
Date: Fri, 8 Aug 2025 18:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/4] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250808021938.669855-1-dmukhin@ford.com>
 <20250808021938.669855-2-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250808021938.669855-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 08/08/2025 03:19, dmkhn@proton.me wrote:
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

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


