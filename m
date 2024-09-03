Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA5969955
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 11:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788906.1198415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQ0u-0002hq-5P; Tue, 03 Sep 2024 09:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788906.1198415; Tue, 03 Sep 2024 09:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQ0u-0002gJ-1h; Tue, 03 Sep 2024 09:39:52 +0000
Received: by outflank-mailman (input) for mailman id 788906;
 Tue, 03 Sep 2024 09:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u+Iv=QB=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1slQ0s-0002d1-NP
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 09:39:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75768e6b-69d8-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 11:39:48 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-cKnan7THOsWkPt_fmuljOg-1; Tue, 03 Sep 2024 05:39:46 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-428040f49f9so47754165e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 02:39:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0f41sm164222235e9.19.2024.09.03.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 02:39:43 -0700 (PDT)
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
X-Inumbo-ID: 75768e6b-69d8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
	b=Hh5kBEjOrdKZk3kRJinPc6wdUa5u6DXLTuWECSxYMTKrHHUGqSFrQ2EZzMzn9n3jPjSkDp
	GC6ifzE63Y1thpL3mpxcPpx/fxnMhjD+tQ5mrxZr3Pk0X0fXkFZ29JbgHWf97tb3WJzpaF
	VBc2DqBSZXXc3dJ3AutwG9VxR12KmZ0=
X-MC-Unique: cKnan7THOsWkPt_fmuljOg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356385; x=1725961185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIxA/7+yR2jXA4ieeKPuD5EUL5lArHR8csGiCMl6eW4=;
        b=lfGdR18+o07XVi1viD8z/DMpdnio2xz0OmdRU3fUO9HNvxV8yo78CS2XTBN9sJAQIb
         wtjdl/52oTwWL1mF/mune6lSBRXdI8NmbUffhGD9paguxrxQPk+XGpvTNFj1S1R1b5Va
         nXFrNTBSDUWxiEA0045jdfI9oJbxY06WIh/7z3vpIM0KSYtxDrZrdW8CRnXeJy8b6sNF
         ksKaCGd+9dm0260aSrNTToAYXLAyUBI39W3lOz+k84iSCkg4H/wq0gtbAzqNo6mq1Fsm
         IH3N4qNvLgyEZ54pPumJWUz8Tzmr+QJizVvysOzj+drl2NCcTt/olzz765UzyYZKaZ1c
         ehWA==
X-Forwarded-Encrypted: i=1; AJvYcCXr2WMVi276uJ0xNSbD94UAZpWkVvibF7bwZ2PNjzCEtgCAzD1xizALJOCFWlVFoibwcaBBa63qGLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmueWOgFz4G17FmlQOYssLmbFXi/pZpJKFGXjzxv+9vgNVNJBc
	3XyqdZv/JORtkAsrtrZKwfC4WUm1J+DxZNyatFOapyXnkwgtEblC3TpcpAfxx1DGkvYCMZr86EX
	n8QYrPgXmVQxcci8nNkqjneGwnkfOnCH2fYb3PdsRnULFpaZEkYMuGhEsQAE0MZFy
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124596405e9.12.1725356385061;
        Tue, 03 Sep 2024 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9ZT+cp/JOzMdJ0eMMwlRMn2QkU5Mi38V0c6sZIqJTMhc/MD50iSbcQF046e0ymvaKlJlng==
X-Received: by 2002:a05:600c:1f90:b0:429:dc88:7e65 with SMTP id 5b1f17b1804b1-42bb02ecb7emr124595995e9.12.1725356384137;
        Tue, 03 Sep 2024 02:39:44 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903053917-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240903072744.GA2082@lst.de>
MIME-Version: 1.0
In-Reply-To: <20240903072744.GA2082@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 09:27:44AM +0200, Christoph Hellwig wrote:
> I've pulled this into the dma-mapping for-next tree, although I'd
> love to see one of the vdpa maintainers look over patch 1.  I'm
> pretty sure it's correct, but a confirmation would be good.

Missed patch 1, I was wondering why I'm CC'd. Looks good, thanks.


