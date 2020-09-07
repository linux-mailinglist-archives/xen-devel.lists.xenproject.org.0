Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C625F352
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 08:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFAo4-000573-E7; Mon, 07 Sep 2020 06:39:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I9DM=CQ=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1kFAo2-00056y-Rm
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 06:39:10 +0000
X-Inumbo-ID: e74c073f-a8f8-46a7-9f8c-c9793616da91
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e74c073f-a8f8-46a7-9f8c-c9793616da91;
 Mon, 07 Sep 2020 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599460749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eetlFRw0D/x8ec2NAwaNQj2c548Ry8s5O0p6d1F8FMM=;
 b=TzlNsHSkATPykCXba6pqSSYwROuSCUakNUrc5jBJk39V7R6DeYfBFDZv1PaTiu62WaROiM
 i/06j5yyYlRhWO2WCLZKLGmlE4EUUzd9jiUAIMiy3ergJmiKx4lURuXzOPzukjPQIPV9/V
 fcb1oJPQuaLIeWSkwG52Xh27B0jWits=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Im-pi5WkMveRzazWd9YxPQ-1; Mon, 07 Sep 2020 02:39:07 -0400
X-MC-Unique: Im-pi5WkMveRzazWd9YxPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C6F2427FD;
 Mon,  7 Sep 2020 06:39:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83EBB19C4F;
 Mon,  7 Sep 2020 06:39:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9445C9A83; Mon,  7 Sep 2020 08:39:01 +0200 (CEST)
Date: Mon, 7 Sep 2020 08:39:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] drm: allow limiting the scatter list size.
Message-ID: <20200907063901.atwjdxz7iqyra22h@sirius.home.kraxel.org>
References: <20200818092017.26290-1-kraxel@redhat.com>
 <20200818092017.26290-2-kraxel@redhat.com>
 <20200901074043.GT2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901074043.GT2352366@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> > +	/**
> > +	 * @max_segment:
> > +	 *
> > +	 * Max size for scatter list segments.  When unset the default
> > +	 * (SCATTERLIST_MAX_SEGMENT) is used.
> > +	 */
> > +	size_t max_segment;
> 
> Is there no better place for this then "at the bottom"? drm_device is a
> huge structure, piling stuff up randomly doesn't make it better :-)

Moved next to the other gem fields for now (v3 posted).

> I think ideally we'd have a gem substruct like we have on the modeset side
> at least.

Phew, that'll be quite some churn in the tree.  And there aren't that many
gem-related fields in struct drm_device.

So you are looking for something like below (header changes only)?

take care,
  Gerd

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c455ef404ca6..950167ede98a 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -299,22 +299,8 @@ struct drm_device {
 	/** @mode_config: Current mode config */
 	struct drm_mode_config mode_config;
 
-	/** @object_name_lock: GEM information */
-	struct mutex object_name_lock;
-
-	/** @object_name_idr: GEM information */
-	struct idr object_name_idr;
-
-	/** @vma_offset_manager: GEM information */
-	struct drm_vma_offset_manager *vma_offset_manager;
-
-	/**
-	 * @max_segment:
-	 *
-	 * Max size for scatter list segments for GEM objects.  When
-	 * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
-	 */
-	size_t max_segment;
+	/** @gem_config: Current GEM config */
+	struct drm_gem_config gem_config;
 
 	/** @vram_mm: VRAM MM memory manager */
 	struct drm_vram_mm *vram_mm;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 337a48321705..74129fb29fb8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,6 +39,25 @@
 
 #include <drm/drm_vma_manager.h>
 
+struct drm_gem_config {
+	/** @object_name_lock: GEM information */
+	struct mutex object_name_lock;
+
+	/** @object_name_idr: GEM information */
+	struct idr object_name_idr;
+
+	/** @vma_offset_manager: GEM information */
+	struct drm_vma_offset_manager *vma_offset_manager;
+
+	/**
+	 * @max_segment:
+	 *
+	 * Max size for scatter list segments for GEM objects.  When
+	 * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
+	 */
+	size_t max_segment;
+};
+
 struct drm_gem_object;
 
 /**


