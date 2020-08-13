Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80B2433F5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 08:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k66c3-00025k-Uv; Thu, 13 Aug 2020 06:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cFh=BX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k66c2-00025f-BZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 06:21:18 +0000
X-Inumbo-ID: f9531c7a-62fc-4311-9bd9-2da340c49280
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9531c7a-62fc-4311-9bd9-2da340c49280;
 Thu, 13 Aug 2020 06:21:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d2so2452734lfj.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wDWU02+wCKok8nwDMeBlH97/pQcKgRkp+JF5JymdpUo=;
 b=jDpTVC3sIm7gufDjf0d+/+hJrzDRXPB5ir1t8eW5KL1T4aQ4sPLBnwenLQJBq8qKIT
 jbWxj5JszQNrbU7t/NghozcTj8mbbQlIm6qR389+tdkpQMibep+6sVKx04ZpKchRa7LV
 GNarSi2rJdVEBIeItxbNSzQqwt1BU78frDE9wbp2rvt/2v1RWsrdGtn4StePHqGj+jOs
 0hkOuKOaNcoKsUQjwgop4MRJCWhnqOQS/C5bdq1bBa5QlE+tS3/4sQxnvthYHBWU4xY8
 HfUDYiAqSdSuj7GT21GU5fs5apPoGqXCDyMaqNXkiNYk+hF3l+HR3QJrDN2l/Qih7nVD
 R67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wDWU02+wCKok8nwDMeBlH97/pQcKgRkp+JF5JymdpUo=;
 b=szaviOpSQ6XkXboI/nEF69NUy47+7kUdAU/HZaXeei8EfKsWl7vWxMga/rtXnc9OX0
 WWiTvWOPQX+7eGAIX+EPEme/Sa6ARScp2wiGlYxDxUt4Oyy3bIOAr600o9NtElJ8fbgC
 vmkI2HwsWEZeKILk+ku6HTjFF+SB6lXs4gpNyeQ0HM0keP5PcQ1aLc44/MS8R8EQKJYs
 cnIC44lNRKBd3HNFCsbSVpOUOUJ/x7KO4EzTwD1+s2NZBseHgDnzPgYlOa9Pw+OSd2qj
 iG4Sr8bM5A7jeBbLhMgYqvFFhBeg8bbt1zNcanXwL7/wvJRuUFGdVF89dE011ZQ5UI+4
 RUiQ==
X-Gm-Message-State: AOAM531ylC/DWBvcJBaoNPahd+VV6fl62Qjb0ksGylNjZ+uGbbse3fqw
 crROgv0WvxC3ALBw8kfU341xH1VxyII=
X-Google-Smtp-Source: ABdhPJyM6kqvqKmDAxBHlLEed6fda0trrJcviieTKINPyset90Po5kDy6xXF6opl++WeilsLdmCx8A==
X-Received: by 2002:ac2:5ec8:: with SMTP id d8mr1391609lfq.169.1597299675256; 
 Wed, 12 Aug 2020 23:21:15 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:14 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com,
 intel-gfx@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Date: Thu, 13 Aug 2020 09:21:08 +0300
Message-Id: <20200813062113.11030-1-andr2000@gmail.com>
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

Thank you,
Oleksandr Andrushchenko

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0

Changes since v1:
=================

1. Removed patch which adds EDID to PV DRM as it needs more time for review:
"5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
request which allows frontends to request EDID structure per
connector. This request is optional and if not supported by the
backend then visible area is still defined by the relevant
XenStore's "resolution" property.
If backend provides EDID with XENDISPL_OP_GET_EDID request then
its values must take precedence over the resolutions defined in
XenStore."
I will send this as a dedicated patch.

2. Added missing CC stable for the patches with fixes

Oleksandr Andrushchenko (5):
  xen/gntdev: Fix dmabuf import with non-zero sgt offset
  drm/xen-front: Fix misused IS_ERR_OR_NULL checks
  drm/xen-front: Add YUYV to supported formats
  xen: Sync up with the canonical protocol definition in Xen
  drm/xen-front: Pass dumb buffer data offset to the backend

 drivers/gpu/drm/xen/xen_drm_front.c      | 10 +--
 drivers/gpu/drm/xen/xen_drm_front.h      |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c |  1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c  | 11 +--
 drivers/gpu/drm/xen/xen_drm_front_kms.c  |  2 +-
 drivers/xen/gntdev-dmabuf.c              |  8 +++
 include/xen/interface/io/displif.h       | 91 +++++++++++++++++++++++-
 7 files changed, 111 insertions(+), 14 deletions(-)

-- 
2.17.1


