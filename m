Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHNSLMRz62kLNAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:44:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5645F86B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293610.1571232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGpQ-0006Cu-Ib; Fri, 24 Apr 2026 13:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293610.1571232; Fri, 24 Apr 2026 13:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGpQ-0006Ax-Fc; Fri, 24 Apr 2026 13:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1293610;
 Fri, 24 Apr 2026 13:44:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wGGpO-0006Ap-JT
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:44:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGGpO-00Assh-0C
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:44:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69eb73a7-e002-0a2a0a5209dd-0a2a45058eba-40
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:44:17 +0200
Received: from [209.85.219.42] (helo=mail-qv1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 69eb73b0-aaa8-0a2a45050019-d155db2ab144-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:44:17 +0200
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-89fc4147f2eso87346046d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 06:44:17 -0700 (PDT)
Received: from ziepe.ca
 (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net.
 [47.54.130.67]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ac6c3e7sm188611786d6.13.2026.04.24.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 06:44:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wGGpL-00000002Zm3-0EMP;
 Fri, 24 Apr 2026 10:44:15 -0300
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
        d=ziepe.ca; s=google; t=1777038256; x=1777643056; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zv88UvTgiwZqXaUOezK9Ft5EGGZMSyJ0Ff2r4iX0Lmc=;
        b=GU6Hwu+EOS9412cO5so1hF0OVMNgRl6YCD9GcixQp0LIMFLrepqs1kYdulpnAlD9j7
         Sy9wp4zTuYkuLApf++FuBBr7PlwnS3eKMfFM1Mg6L93XaG+hqEPsAl+AHvV4jK5EBseI
         4WYLWarhTGOPMfJNeSVGOpgdFmz/TxXVsK+vq701eVg86621VqVeS19P4pdBSq0B9R11
         0ojoB0xPolIn6N1iMFX7PH0/o3lyAaqwfBiLpfVOJSeeJKfP7U9rl2eHTzSO9Xq/ONTG
         89QrV//QAeAP/fxWlhMFO7H7oEbT0XxadTL179KwBIXZ1t/5D9Pk2j+ZZVBYtsve88sT
         lDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038256; x=1777643056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv88UvTgiwZqXaUOezK9Ft5EGGZMSyJ0Ff2r4iX0Lmc=;
        b=qLZrC4d3/vVg4vLTMcHqXj5J1y+YDWFd5+tB+1TR6kKXkBR2ailiou68njkAvQyQkL
         0NoxuWtDZ28oTHxvC6uroUCIK3JdvPSJCyjL31iOe+vIMk1vkTr9buVTqWZf++Ohr8Yx
         0Do68/LdOEoCjnYYqdpEhsx56TPbvPRvuSV8JSjk1j20edeX946mGRs16NuBqznQS3mC
         K1Oi+cIQhvyijDqvi5VbKxuggJk+TX9PL6ztPzmY3IeJZ3idIRoaglYvlhYLJmu3k4kf
         ZixWwvn8AJyoGZU7qNTaQsBISqbale/ssvSjiJr7Lbor0FX3fdA/eAt3jrWPAqfumKmD
         wesg==
X-Forwarded-Encrypted: i=1; AFNElJ/X3tnbR0aCSwsxlvfHdYerA4gjK6TWjWeqfwlfyIbXj0oQ0jpWHF3VAto9fX80YYtiCEcAIRgdqug=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1ucOpdAEiA6Zh8dSupKx1pcqkT3SAJ9JHb1utZYQFHowKmd3i
	32BLeQje0YJ7B4QpBCIUQPpv1Zm5ilsOUu/CVhGhNTyP21u0Hi7hp13TUuyWZstOolA=
X-Gm-Gg: AeBDieu5tKH3adGF1Wp35qzCmSJBdQBgZM9/R+83pwzDOxITXBCcHVmB+XFtiFqyfq5
	cYjxruABBulA0cIbDcVHA78BOzTOr8AGl+Am9KvPG5EJ5VAlnQAgTylslZ9ghaKkiYr539G/5kX
	T1mFKn2hH1owRI+DyFsn+f4BhAwMQ5eQ8V7BVjr4/Lpi+llTfQmbHv34Le12K56u30lSwWrPnXb
	L7hu6cS8oM3l8SfcAu1YQBvgP3/8exFBvogBl5IS8mFC0G6L9j+YCDIhsyPYSzqPSCcNCghwEHj
	8OiDmVNdX1g21hDsXn5bR5IhRKAu3zhm0xrs1sTOmnkpeCczHEQe7ihI8Fy8kAMSlyJ++NfkVqP
	ON7NFX0FHKhTffCuqxFfiZ6Z76e8E80tRweScRF3AezR6iwAO9f/qvJKyf66MCEZj1JWFou4woC
	qPVWW3nLoZCK8QjGri/mEXDWJP8BaKoiJPs+5oANcukC4ZZcgth2MPdfyxd4LzQnmHsOixtOHkb
	RFmmnWHG5DXS7tGcy3Rkzke+xg=
X-Received: by 2002:a05:6214:20a8:b0:8ac:a914:c2cd with SMTP id 6a1803df08f44-8b0280808cfmr513452986d6.20.1777038256324;
        Fri, 24 Apr 2026 06:44:16 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:44:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Message-ID: <20260424134415.GZ3611611@ziepe.ca>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
 <20260420230137.GQ2577880@ziepe.ca>
 <aesUTxAl2qWZiqoT@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aesUTxAl2qWZiqoT@shlinux89>
X-purgate-ID: tlsNG-c201ff/1777038257-E1DDB443-69B718B2/0/0
X-purgate-type: clean
X-purgate-size: 2065
X-Rspamd-Queue-Id: 11F5645F86B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,nxp.com:email,ziepe.ca:dkim,ziepe.ca:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

On Fri, Apr 24, 2026 at 02:57:19PM +0800, Peng Fan wrote:
> Hi Jason,
> 
> On Mon, Apr 20, 2026 at 08:01:37PM -0300, Jason Gunthorpe wrote:
> >On Wed, Apr 15, 2026 at 11:08:36PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
> >> physical address passed in refers to normal RAM that is part of the
> >> kernel linear(direct) mapping, as it unconditionally derives a CPU
> >> virtual address via phys_to_virt().
> >> 
> >> With Xen swiotlb, devices may use per-device coherent DMA memory,
> >> such as reserved-memory regions described by 'shared-dma-pool',
> >> which are assigned to dev->dma_mem. These regions may be marked
> >> no-map in DT and therefore are not part of the kernel linear map.
> >> In such cases, pfn_valid() still returns true, but phys_to_virt()
> >> is not valid and cache maintenance via arch_sync_dma_* will fault.
> >> 
> >> Prevent this by excluding devices with a private DMA memory pool
> >> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
> >> fall back to xen_dma_sync_* for those devices to avoid invalid
> >> phys_to_virt() conversions for no-map DMA memory while preserving the
> >> existing fast path for normal, linear-mapped RAM.
> >
> >I think this is the same sort of weirdness the other two CC threads are
> >dealing with.. We already have two different flags indicating the
> >cache flush should be skipped, it would make more sense to have the
> >swiotlb mangle the flags, just like for cc.
> >
> >https://lore.kernel.org/r/20260420061415.3650870-1-aneesh.kumar@kernel.org
> >
> >Then you know that the swiotlb was used and it should flow down to
> >here.
> 
> Xen fully implements dev->dma_ops and does not leak hypervisor-specific
> semantics outside of it.

It may have its own re-implementation but the same remarks apply. The
flags in attrs should be correct and you should not be putting random
boolean checks all over the place to make up for incorrect flags.

Jason

