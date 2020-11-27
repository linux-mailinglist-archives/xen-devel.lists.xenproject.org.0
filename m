Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B752C687E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 16:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39573.72513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kifPU-0004WR-1O; Fri, 27 Nov 2020 15:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39573.72513; Fri, 27 Nov 2020 15:11:44 +0000
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
	id 1kifPT-0004W2-UY; Fri, 27 Nov 2020 15:11:43 +0000
Received: by outflank-mailman (input) for mailman id 39573;
 Fri, 27 Nov 2020 15:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kifPS-0004Vx-Um
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:11:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d085c82-2c1d-44ac-a00c-60b34cdc29ff;
 Fri, 27 Nov 2020 15:11:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9806AC2D;
 Fri, 27 Nov 2020 15:11:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kifPS-0004Vx-Um
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:11:42 +0000
X-Inumbo-ID: 4d085c82-2c1d-44ac-a00c-60b34cdc29ff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4d085c82-2c1d-44ac-a00c-60b34cdc29ff;
	Fri, 27 Nov 2020 15:11:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606489901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKwWJdqq6fY6+MN6akTmVY1AxQwgPhj6tjhLCt6Z5NU=;
	b=csr8vpBsYRNhd5pvRISq+9iALBsnBhAbqCAdJaJPUqIuXybGXfGevXMEqJL8dU7TQSZD/7
	hiuDkCoR8N1222vD37ftzmMmtMYDbdJILHUNFtXmtugirlp9zfxPkyVUk5VqNee52y02Pw
	t/Mbci1EZGM9IJJdh+172aaVuRS+sb4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D9806AC2D;
	Fri, 27 Nov 2020 15:11:40 +0000 (UTC)
Subject: Re: [PATCH v10 5/7] vtd: use a bit field for root_entry
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c53f148f-0d3d-764d-7a50-f85ec5e30737@suse.com>
Date: Fri, 27 Nov 2020 16:11:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120132440.1141-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:24, Paul Durrant wrote:
> @@ -85,25 +85,28 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
>          return false;
>      }
>  
> -    root_entry = map_vtd_domain_page(iommu->root_maddr);
> -    if ( !root_present(root_entry[pdev->bus]) )
> +    root_entries = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);

Why the cast, the more that ...

> +    root_entry = &root_entries[pdev->bus];
> +    if ( !root_entry->p )
>          goto out;
>  
> -    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
> -    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
> +    context_entries = map_vtd_domain_page(root_entry->ctp);

... you have none here? With this dropped
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

