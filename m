Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC982A0AC2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 17:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16027.39287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYWzw-0003U7-Km; Fri, 30 Oct 2020 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16027.39287; Fri, 30 Oct 2020 16:11:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYWzw-0003Ti-HU; Fri, 30 Oct 2020 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 16027;
 Fri, 30 Oct 2020 16:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYWzu-0003Tc-HM
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:11:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a436ede-ba2e-4948-a8a2-8e0e6f7e1a15;
 Fri, 30 Oct 2020 16:11:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86243AC1F;
 Fri, 30 Oct 2020 16:11:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYWzu-0003Tc-HM
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:11:26 +0000
X-Inumbo-ID: 6a436ede-ba2e-4948-a8a2-8e0e6f7e1a15
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6a436ede-ba2e-4948-a8a2-8e0e6f7e1a15;
	Fri, 30 Oct 2020 16:11:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604074284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fwc3PBndyk5a5z4eQZLAdZbQCP/HMzFvnVlmD3MlYmw=;
	b=cf4f+MqHwUb7XitBNLK69yXUbcxecp2d46FYj3dOvJl98L7HhLkPP+hq+aq0eyl7Ixeqgs
	VeHkmKYz2bHaki5a/o8BHqJASmLwLuc2vQ5oi6AXgbR+9x2PmnhLWGNt3kEOcgSqmaxbpo
	GaRfjJ2b5WJNgQgLXyrEI2rg6pThMRY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 86243AC1F;
	Fri, 30 Oct 2020 16:11:24 +0000 (UTC)
Subject: Re: [PATCH 4/5] iommu: set 'hap_pt_share' and 'need_sync' flags
 earlier in iommu_domain_init()
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9fd4db4-3bb6-e5dc-877b-17486a8fe635@suse.com>
Date: Fri, 30 Oct 2020 17:11:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-5-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 11:49, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -174,15 +174,6 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
>      hd->node = NUMA_NO_NODE;
>  #endif
>  
> -    ret = arch_iommu_domain_init(d);
> -    if ( ret )
> -        return ret;
> -
> -    hd->platform_ops = iommu_get_ops();
> -    ret = hd->platform_ops->init(d);
> -    if ( ret || is_system_domain(d) )
> -        return ret;

Are you suggesting the is_system_domain() here has become
unnecessary? If so, it would be nice if you could say when
or why. Otherwise I would assume it's needed to avoid
setting one or both of the fields.

Jan

