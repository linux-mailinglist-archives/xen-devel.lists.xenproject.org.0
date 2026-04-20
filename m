Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFC6DZqw5mknzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:02:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86867434C80
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288222.1568513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wExce-0007di-PQ; Mon, 20 Apr 2026 23:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288222.1568513; Mon, 20 Apr 2026 23:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wExce-0007ax-MT; Mon, 20 Apr 2026 23:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1288222;
 Mon, 20 Apr 2026 23:01:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wExcc-0007ar-PM
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:01:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wExcb-00CNNH-JO
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:01:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69e6b04a-2eae-0a2a0a5409dd-0a2a45079480-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:01:41 +0200
Received: from [209.85.161.46] (helo=mail-oo1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69e6b054-229c-0a2a45070019-d155a12eb56e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:01:41 +0200
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-6949192b843so350829eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:01:40 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69493183021sm916652eaf.13.2026.04.20.16.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 16:01:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wExcX-0000000F9El-2c2Z;
 Mon, 20 Apr 2026 20:01:37 -0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=ziepe.ca header.i="@ziepe.ca" header.h="In-Reply-To:Content-Disposition:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776726099; x=1777330899; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW4xQG7nqF+lf+D3IisD78kFapb+PoH04igJOs6rmhM=;
        b=T/YUpw94PDt0+KdHeC2H9DWpCE5pIFPyjuyxa9fOmBKQ0Nd8qHzSlKXvXmc9y4CF3z
         Nod+6Phu90L+lCyOYESupAfqWSbl5CXxzVMNFKduslcECGV8v3yDGnEndKr6O0xyzmui
         AR+IW+xoVITsyHabAR4KsQWdXsWTIi68mcnLDjWf6MoYOvX3IS0TnIEHHvx8VwsEri/D
         4AsnvLiks7qtTllmAiqzQq5ztx7KJGUL+IyjL5Fsp7GFqyHmLL/1Jp2DjLArX/lDqG/i
         ALdwbCue+m/fjlpysQMzDS/F6E483EwDO70N3NGbow+ksjxnX/iMl8NVHFshbNraRVwZ
         UPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726099; x=1777330899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW4xQG7nqF+lf+D3IisD78kFapb+PoH04igJOs6rmhM=;
        b=DkOI4rVxjf3Tm2nigxXIl9UjPraNkzZgsJxcVQMvXLdC68cH24ER890hGO57vHPcNQ
         PPXp5XaxE/tYbjdLOMm94rsaGx+tKtzZGImmMkdHQHAVwgUaYv4vcwcMhRabl0T4dnPU
         4C7/5sGxbBl6sXHoiVSVe/BegmhUu/Rz8ogpfLZ6TxcgIpEhsU00gnz2WRrZ3EW2u8Ux
         mUEs+ZRfN6xVDD3IBd3k4zy9F0PcJOFxH4U7G+23ac3ff66nIvshY6hjlkZ6Qo7IyM4x
         ntkqwmYLc9p6WqH/vGCHPIHlfoFDwqEqTIRlRi09TTLElYEk6qIrSI5pWBPVC+OyC3+V
         n5rg==
X-Forwarded-Encrypted: i=1; AFNElJ/jNpAQ3LEGhSEPQaQsNYwol70vPwU/YHuvOEiDnnTmiA6HRC75JLwOeLrg0lasKlPCmoS0aiJRse0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzF+zdXcpA8T/RbP8KpOeWWxoXxnyDkqDNAKpATvpXVefCo6+V
	pcAKH4hgc6n19jJZ4Xarw5AfDsrawrlzfqz2VYJ54bh66KWwQD5HfwFV+H7aW+0ODHo=
X-Gm-Gg: AeBDievGBYvus6vmZ04abTZ2SbDtEukBI1wPOuyHX4X2cfmwQJXPvCRLouXvEbMia2l
	WcsAp69PecHg8xqYK/Hb9a+NLSlnnmYE12pRSdZTuy22ERtJd5UztRZgVxZ4tWzKR1Dq6Xt/NOP
	1b6vVs9B0Gq3jpJWnws/gCaA3l3cogBnrgkAJrpwCPJYKt9iSfKoi45qP7ujYEfF7EZPPmtEDDp
	0uLYJis8lp5XG9pJu5yAORMylYca/oI9FshLgFL5lElqcxL8rA+El8uc4q+S8TlhAFfg0mBHUDm
	WRc6uVl9EotjK+lk25FNH2LBvFFdGFoc9NAqW2MAYzef985xQ3gwlyrkHUz0UkcqaiKE0JoKOPE
	hTDREMu30HoZIKMzl8/peYUMZXYNpqznuPF76VHfG5wn2HpTFlIB76EV+6cL1xgdWLEnm9D+cD8
	egEuZlCipu
X-Received: by 2002:a05:6820:1508:b0:694:9840:843a with SMTP id 006d021491bc7-69498408649mr135366eaf.7.1776726099292;
        Mon, 20 Apr 2026 16:01:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:01:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Message-ID: <20260420230137.GQ2577880@ziepe.ca>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
X-purgate-ID: tlsNG-ef75cf/1776726101-AFB78C48-24534E36/0/0
X-purgate-type: clean
X-purgate-size: 2212
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 86867434C80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:08:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
> physical address passed in refers to normal RAM that is part of the
> kernel linear(direct) mapping, as it unconditionally derives a CPU
> virtual address via phys_to_virt().
> 
> With Xen swiotlb, devices may use per-device coherent DMA memory,
> such as reserved-memory regions described by 'shared-dma-pool',
> which are assigned to dev->dma_mem. These regions may be marked
> no-map in DT and therefore are not part of the kernel linear map.
> In such cases, pfn_valid() still returns true, but phys_to_virt()
> is not valid and cache maintenance via arch_sync_dma_* will fault.
> 
> Prevent this by excluding devices with a private DMA memory pool
> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
> fall back to xen_dma_sync_* for those devices to avoid invalid
> phys_to_virt() conversions for no-map DMA memory while preserving the
> existing fast path for normal, linear-mapped RAM.

I think this is the same sort of weirdness the other two CC threads are
dealing with.. We already have two different flags indicating the
cache flush should be skipped, it would make more sense to have the
swiotlb mangle the flags, just like for cc.

https://lore.kernel.org/r/20260420061415.3650870-1-aneesh.kumar@kernel.org

Then you know that the swiotlb was used and it should flow down to
here.

>   * physical address to use is returned.
> @@ -262,7 +267,8 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  
>  done:
>  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
> -		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
> +		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))) &&
> +		    !dev_has_private_dma_pool(dev)) {

Also this pfn_valid() is totally bogus. Unless DMA_ATTR_MMIO the phys
must have a struct page, be pfn_valid, etc.

This is why you are getting into trouble here, beacuse swiotlb created
a non-struct page address and passed it to lower layers without
setting something like DMA_ATTR_MMIO..

Jason

