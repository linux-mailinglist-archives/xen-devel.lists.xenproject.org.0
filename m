Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F9234625
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UVI-0001Hz-Gb; Fri, 31 Jul 2020 12:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcXq=BK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k1UVG-0001HZ-Kd
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:51:14 +0000
X-Inumbo-ID: 83bd0c26-d32c-11ea-8e30-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83bd0c26-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:51:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t23so8799919ljc.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B/WYQkneNHHasyBibLNJc39P94On0q0Yf/0dGxBiCnM=;
 b=bH1oegfq4F1BjeNTK0Nmijn8MhoTBmIOgLZoaVfUGo0h2JoRT+aO14I78TeLvdBHYm
 Pt4W0qwPJ4s9jm03v4G0XX/uCdXRfRLPIyYfE7mgknlRuHgczule6rCWmicdbvvZkVR5
 FK1yg1ZEqij2/fftNtqZXSMUYpyr8RLHPKXEKIlnDfhXUcnkj7I+tcnqEu4OLCIdRvwU
 kdCVHuuI5NS6sIq8V5pwcioRFKnchzzF27Gus5xnrUP4lSfxpu9uXYL8eh3rwklF60Hw
 yDmB2W+Hz3BQ8SKUUY/ifYHZeaBqiQgP66TgtLdW15C+Z/XUEQZamtVRWmfGMyn6Brg4
 z6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B/WYQkneNHHasyBibLNJc39P94On0q0Yf/0dGxBiCnM=;
 b=gjc7/A1TVz9DhXvzya6kfyEf1DWDRZamQpv63xihwdlpdvJ8HScRVsHr5X22pNfUfH
 FYVojepZL/YFXbQRxHli+pQpPouXeBKv/4XSQcL17nsCo6N3d5WZ8+/lpTGz5piUH0l4
 StYxCaj1B4ck6SL87xWaupKJ7xNr5Wy2ef1G8OlV2RKdk55132Z004eHZQdtOT9saLtf
 tUWFKYmmlv/i/C8Oug0yERMYmKlnQKSVi0DOV37UIc75kIK8r1QiHzgIDydsKEnSEgd9
 Z96T2cC5oDgUW7BI8e8s2KZU0ddsYxUMhrB6OQvFRII0ErLA+p4bhCFvliib9Bvb71wd
 mByw==
X-Gm-Message-State: AOAM531AOo9yCMgE/rjuYJ9OWR3jhckcG+4I0k01sLVrQweH/mjuJgfG
 9a1OqejHEHdPvcRRYWZvIFgw19kkA+4=
X-Google-Smtp-Source: ABdhPJwQKJDe178RRgB019PdVZcaJRxYEd+DG5Tp68DUOkwsyOEYd5yGBw9xFWQf08QnB4cwBtO9VA==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr1822750ljc.159.1596199872208; 
 Fri, 31 Jul 2020 05:51:12 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:11 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/6] Fixes and improvements for Xen pvdrm
Date: Fri, 31 Jul 2020 15:51:03 +0300
Message-Id: <20200731125109.18666-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hello,

This series contains an assorted set of fixes and improvements for
the Xen para-virtualized display driver and grant device driver which
I have collected over the last couple of months:

1. Minor fixes to grant device driver and drm/xen-front.

2. New format (YUYV) added to the list of the PV DRM supported formats
which allows the driver to be used in zero-copying use-cases when
a camera device is the source of the dma-bufs.

3. Synchronization with the latest para-virtualized protocol definition
in Xen [1].

4. SGT offset is now propagated to the backend: while importing a dmabuf
it is possible that the data of the buffer is put with offset which is
indicated by the SGT offset. This is needed for some GPUs which have
non-zero offset.

5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
request which allows frontends to request EDID structure per
connector. This request is optional and if not supported by the
backend then visible area is still defined by the relevant
XenStore's "resolution" property.
If backend provides EDID with XENDISPL_OP_GET_EDID request then
its values must take precedence over the resolutions defined in
XenStore.

Thank you,
Oleksandr Andrushchenko

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0

Oleksandr Andrushchenko (6):
  xen/gntdev: Fix dmabuf import with non-zero sgt offset
  drm/xen-front: Fix misused IS_ERR_OR_NULL checks
  drm/xen-front: Add YUYV to supported formats
  xen: Sync up with the canonical protocol definition in Xen
  drm/xen-front: Pass dumb buffer data offset to the backend
  drm/xen-front: Add support for EDID based configuration

 drivers/gpu/drm/xen/xen_drm_front.c         | 72 +++++++++++++++-
 drivers/gpu/drm/xen/xen_drm_front.h         | 11 ++-
 drivers/gpu/drm/xen/xen_drm_front_cfg.c     | 82 +++++++++++++++++++
 drivers/gpu/drm/xen/xen_drm_front_cfg.h     |  7 ++
 drivers/gpu/drm/xen/xen_drm_front_conn.c    | 27 +++++-
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  3 +
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.h |  3 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c     | 11 +--
 drivers/gpu/drm/xen/xen_drm_front_kms.c     |  7 +-
 drivers/xen/gntdev-dmabuf.c                 |  8 ++
 include/xen/interface/io/displif.h          | 91 ++++++++++++++++++++-
 11 files changed, 305 insertions(+), 17 deletions(-)

-- 
2.17.1


