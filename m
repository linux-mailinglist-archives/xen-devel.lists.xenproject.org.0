Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB595DCCF
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 09:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782869.1192393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shlfD-0000yx-3k; Sat, 24 Aug 2024 07:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782869.1192393; Sat, 24 Aug 2024 07:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shlfD-0000x2-02; Sat, 24 Aug 2024 07:58:23 +0000
Received: by outflank-mailman (input) for mailman id 782869;
 Sat, 24 Aug 2024 07:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ztRH=PX=linux.intel.com=sakari.ailus@srs-se1.protection.inumbo.net>)
 id 1shlfC-0000wR-1u
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2024 07:58:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fe45cb6-61ee-11ef-a50a-bb4a2ccca743;
 Sat, 24 Aug 2024 09:58:20 +0200 (CEST)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 00:58:17 -0700
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 00:58:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id AF4D411F95D;
 Sat, 24 Aug 2024 10:58:07 +0300 (EEST)
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
X-Inumbo-ID: 9fe45cb6-61ee-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724486301; x=1756022301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MuJabAXZNXC3PzKmb+ctuTHQcVD5uw07JOm0cukiHM=;
  b=AyDngEiMx9Pvn2XVXyb7hwGsBU2p10K8iW4w+ZW50bNezag17HWHDbwj
   eABqAGvPTXpLYZkQ3Cxz9Le2n9sJ8yaBTlM67cleBWwVSUc00OiM30F58
   dMauW8TOUSY4+yMp6Eec85JNEHsFkuUQQ6W5MZSQyAMBCv+8A+GC7b6u6
   lmAWN7CVO1TUY2WwRuot8cFV0uejGI6+VfE4JNgx5DDGuaKq8PfDlWcpM
   jq5u8+HpulwWnmC1WIW5jiQ3jeRltENbGc00sskuXOrpNv/PiAIn2m+8A
   e4SQNBAQo6JeNv8+9Tci+T4xPB4TqxuHCClTsN5N+WmiGSs5FFbvZIs8D
   Q==;
X-CSE-ConnectionGUID: sF/w6BFBTbqdcnB1HrveGQ==
X-CSE-MsgGUID: igDkzHi5ReqKezJ4/LocWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23126436"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="23126436"
X-CSE-ConnectionGUID: xNO1WY6SQfimIDbJMyQklA==
X-CSE-MsgGUID: Re7yuOLNQLu2fGkmVM310w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="99531438"
Date: Sat, 24 Aug 2024 07:58:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture
 feature
Message-ID: <ZsmSj6ZBZqBtjALU@kekkonen.localdomain>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>

Hi Christoph,

On Sat, Aug 24, 2024 at 05:57:58AM +0200, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # for IPU6

We'll address this for IPU6 but I can't give a timeline for that right now.

-- 
Kind regards,

Sakari Ailus

