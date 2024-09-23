Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEE97ED73
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802112.1212252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTK-0007wr-Nr; Mon, 23 Sep 2024 14:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802112.1212252; Mon, 23 Sep 2024 14:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTK-0007uP-Kp; Mon, 23 Sep 2024 14:55:30 +0000
Received: by outflank-mailman (input) for mailman id 802112;
 Mon, 23 Sep 2024 14:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfwC=QV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sskTI-0007uD-Jt
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:55:28 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddba5cb6-79bb-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 16:55:26 +0200 (CEST)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-49bcb3d0d6fso1467259137.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:55:26 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-49e6b343070sm3626517137.11.2024.09.23.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:55:24 -0700 (PDT)
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
X-Inumbo-ID: ddba5cb6-79bb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103325; x=1727708125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QQOENS13gaCUbXadLVFx2Tu1Z0wMPeEs0jQvlcRlJg=;
        b=MLf4J4B1IXqoTOdD3btsMk5ImsB3GpkJmVk3LOmCwR+1ag+nMCfPz9qYZvsCgutOUy
         6liMp8YQJNeLcqmPFh/wQCUWN9PNqH11Ww7hMfSkBV4nmbfcHdvqvlLxLIg8uI52PG2O
         nv212mKJdOGQajHOqQGHPFJQY3wVRcXodE9GIK0s7u9yyxhtXUb/Bi0+L3Fzkj7q6z4+
         y3/OSDX2mFgR6zKPvlmiQ6bVdmdpgSuFwNyK8w+uICLIMu/BE28H3mot1PO1VsMZCG98
         +E4mlUvIQ/uipx5AtH616OVplYKDaNU0IvWQVg/4qT9IXVE1vUTgX2cSZdOR97NLNoDv
         wNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103325; x=1727708125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QQOENS13gaCUbXadLVFx2Tu1Z0wMPeEs0jQvlcRlJg=;
        b=oU49QEZ/d11EwRk/54fGEg+NN+V7T7n2yLdwTiH0lAaQ8qAvcVAff1zCe0vjCJbQQa
         776+ouzame4sR7+KAv/Vr+IdF8+ZT6T9VN/3GDsr68tKoHwdooU7rTdkvCMNfakQg3k/
         gMSoSZRnxFxHUREtIRsR2n/Wo9BCfhbnWE19oMY+utd6mhszTlNacX7Jm0j2XsJ1/Rcc
         qqUj/X/xkN4YLPJsudJgDcqNFH3zoLkRO3T2RNcO0IXjI5M2AaP++E2u656XvocuZDh9
         JGXua3FLT0SrBLjlJQdSomQypPoUQLGRWBsQWjkMo5gpzkCZLJfP0VM1zzLe0lw44c/C
         47ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW799Q7WvfKpFB+MSgWuAuztBprKJzNbEZU1t79NHPg1iMYDBkzrkuA4BE0o05VeVP6zQK2XUq0SNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkeUDyFMXZ/xhTO//RuPT2YVVGbt6ron2weSiZrPlyjO+QMC8y
	Ub97sg91NTxxhggG7fKFJ873YwAM9pVfEErPPs5M31f+kl0xi86d
X-Google-Smtp-Source: AGHT+IFWpltF4DszBNmdJLzxxWpl0+PQALaUS57FnKxMcmGpkC84SrzYntpJhu1WF5lbFBJlQoOcCw==
X-Received: by 2002:a05:6102:50ab:b0:498:d12b:4774 with SMTP id ada2fe7eead31-49fc755285fmr7477451137.7.1727103324966;
        Mon, 23 Sep 2024 07:55:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 23 Sep 2024 16:55:16 +0200
Message-ID: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI on the ARM PVH machine. First we add a way to control the use
of buffered IOREQ's since those are not supported on Xen/ARM.
Finally we enable the PCI support.

I've published some instructions on how to try this including the work in
progress Xen side of the PVH PCI support:
https://github.com/edgarigl/docs/blob/master/xen/pvh/virtio-pci-dom0less.md

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Change handle_ioreq from int to uint8_t.
* Fallback to legacy API if buffered ioreqs are enabled and also if
  the new API is not supported. Clarify with comments.


Edgar E. Iglesias (4):
  hw/xen: Expose handle_bufioreq in xen_register_ioreq
  hw/xen: xenpvh: Disable buffered IOREQs for ARM
  hw/xen: xenpvh: Add pci-intx-irq-base property
  hw/arm: xenpvh: Enable PCI for ARM PVH

 hw/arm/xen-pvh.c                |  17 ++++++
 hw/i386/xen/xen-hvm.c           |   4 +-
 hw/i386/xen/xen-pvh.c           |   3 +
 hw/xen/xen-hvm-common.c         | 101 ++++++++++++++++++++------------
 hw/xen/xen-pvh-common.c         |  40 ++++++++++++-
 include/hw/xen/xen-hvm-common.h |   3 +
 include/hw/xen/xen-pvh-common.h |   3 +
 include/hw/xen/xen_native.h     |   3 +-
 8 files changed, 133 insertions(+), 41 deletions(-)

-- 
2.43.0


