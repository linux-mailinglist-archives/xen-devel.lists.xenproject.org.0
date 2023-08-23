Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72027862AE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 23:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589600.921577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvbf-0005ao-3b; Wed, 23 Aug 2023 21:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589600.921577; Wed, 23 Aug 2023 21:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvbf-0005Z9-0h; Wed, 23 Aug 2023 21:41:39 +0000
Received: by outflank-mailman (input) for mailman id 589600;
 Wed, 23 Aug 2023 21:41:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYvbd-0005Z1-Ip
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 21:41:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvbd-0004bF-76; Wed, 23 Aug 2023 21:41:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvbd-0001dQ-03; Wed, 23 Aug 2023 21:41:37 +0000
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
	bh=6MXRR/V0olNLHzpA754gywBZykkrjki1ZAMf6CjQ47s=; b=bA57UFeK2K9q8ELmujbWuYgHKI
	jNsyvXZyVW3+n4dbwpHxcDyfYbclmXDMx8+X/7it79kxC1Y5kpb2wUOLkBZACyTpALmLNcbfs8pAH
	xvsCF1Fn/o83qv2hw+PW8A0dIm9qsuN8mglzHbPJSqDvS0ywM6g2YsE26hTqzMcUEong=;
Message-ID: <95eae735-b306-42d1-a1f0-68dcceb413a7@xen.org>
Date: Wed, 23 Aug 2023 22:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 13/19] asm/smp.h: Fix circular dependency for
 device_tree.h and rwlock.h
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-14-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-14-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> function which are browsing the dt_host at the same time. To avoid the race
> conditions, we will need to add a rwlock to protect access to the dt_host.
> However, adding rwlock in device_tree.h causes following circular dependency:
>      device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
> 
> To fix this, removed the "#include <xen/device_tree.h> and forward declared
> "struct dt_device_node".
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

