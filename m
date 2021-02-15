Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8431B5D5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 09:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85076.159491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZ0M-0004p8-PE; Mon, 15 Feb 2021 08:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85076.159491; Mon, 15 Feb 2021 08:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZ0M-0004oj-Lr; Mon, 15 Feb 2021 08:13:14 +0000
Received: by outflank-mailman (input) for mailman id 85076;
 Mon, 15 Feb 2021 08:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBZ0L-0004oe-85
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 08:13:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc8ae3b-e56a-4109-aea9-4ed6e3968418;
 Mon, 15 Feb 2021 08:13:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A9CFB125;
 Mon, 15 Feb 2021 08:13:11 +0000 (UTC)
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
X-Inumbo-ID: 5cc8ae3b-e56a-4109-aea9-4ed6e3968418
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613376791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwQC7DNBt5mvznk9zQZ/2vgKpu2DIGAAc5dNymRR2wQ=;
	b=Er/2MQpqVt3Sb+EhLvE8IW1bLvydTGL9IBa030cUDoEQWBW3CPcVmZxJQLAIkk0LDqJdd/
	1GY2wMZBBJIPpl2leYDMQeylOkPr45V8MK/7g2aSCTdQ46cT9gCt3/xH9KDlFVaYqh+hw0
	OaEwyMUEzSnG+bqhRMFfiiTsTiHSN6A=
Subject: Re: [PATCH] xen/iommu: arm: Don't insert an IOMMU mapping when the
 grantee and granter...
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>, xen-devel@lists.xenproject.org
References: <20210214143504.23099-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a827099-1d8f-826d-42ef-743d86d9ccce@suse.com>
Date: Mon, 15 Feb 2021 09:13:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210214143504.23099-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.02.2021 15:35, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> ... are the same.
> 
> When the IOMMU is enabled and the domain is direct mapped (e.g. Dom0),
> Xen will insert a 1:1 mapping for each grant mapping in the P2M to
> allow DMA.
> 
> This works quite well when the grantee and granter and not the same
> because the GFN in the P2M should not be mapped. However, if they are
> the same, we will overwrite the mapping. Worse, it will be completely
> removed when the grant is unmapped.
> 
> As the domain is direct mapped, a 1:1 mapping should always present in
> the P2M. This is not 100% guaranteed if the domain decides to mess with
> the P2M. However, such domain would already end up in trouble as the
> page would be soon be freed (when the last reference dropped).
> 
> Add an additional check in arm_iommu_{,un}map_page() to check whether
> the page belongs to the domain. If it is belongs to it, then ignore the
> request.

Doesn't this want / need solving in grant_table.c itself, as it also
affects PV on x86? Or alternatively in gnttab_need_iommu_mapping(),
handing the macro the MFN alongside the domain? No matter which one
was chosen, it could at the same time avoid the expensive mapkind()
invocation in this case.

Jan

