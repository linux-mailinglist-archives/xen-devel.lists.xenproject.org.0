Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58911F8B11
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 00:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkarM-00009w-Mt; Sun, 14 Jun 2020 22:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkarL-00009r-OD
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 22:12:11 +0000
X-Inumbo-ID: 17dec9f0-ae8c-11ea-8496-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17dec9f0-ae8c-11ea-8496-bc764e2007e4;
 Sun, 14 Jun 2020 22:12:11 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id mb16so15382679ejb.4
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t7J+vBnr5qW0YqDWMwMgwG/Ldp8mMdAgk7lsL5Cc8KQ=;
 b=L1VerG+DAo+zLQDiLJsKgrMb/5MmrJDCWpZpmflYixnse0YsI5GbLqL1+vtDofLlwV
 FXuC8JmKPu1XAEHWk9uuengbfJDrCy6E18aNc16jIzYNJLeJa/HsZzuYv0rpRl2FPiWh
 KjYWdCgpbhD9vDp/xIHfVLCBpGHwHMFwEvkYcTv/t+zyVVAIPY3QY/Ddp8MpLeVScslT
 e9Yblpka8SmCTzMW/q/Z9B4t10cdMAz+4Grq63oz7vUNyaW43STf9vGgK0VvV60BqnP5
 CK5wsBNGz01vJDlAL8lOKMtWmXWu96hn0g2XxrMkCiNTeWroVBLiA6KLVLx+nwy5u1SB
 vWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t7J+vBnr5qW0YqDWMwMgwG/Ldp8mMdAgk7lsL5Cc8KQ=;
 b=DmKBQoZSxfqRxZnwgodrZQ1MXKa7IhfLXU6ysiyT5pEVUZ0atSt3sFvonR/Lw5Wfes
 shb3Jn/X1wW6d+bCZZhKzqi/DKwaoB+5DQ8Ga/PCfZwiZ3A0FxQdOIKfPqeVcEv+iies
 jSe1Pf78z4QYIYKztROe/Y2FwzSYLESsf03AbXZlMPPdzSAPqMBhME5aXd1+0eq1WsjC
 AO+WwIc8z9L10TWUZ1q7cVoVabnSTBh8Mq/UybMsUBIURnAYRppWrePBqAfXoW21nv5h
 3r3fSQG/OTz7RV74FESNgpOZiZo4lpX0IZjxZJeFM0NRg6H9/lZVUSDi6/8Vr+32Mj53
 aNZg==
X-Gm-Message-State: AOAM531wmHctbNd0aY/tbvcxrItRYtHxIXpeNDM/pC325hhnFHFrEJcp
 blj9yPauKSYusoIE1GH9WrxnBga7QPvTLQ==
X-Google-Smtp-Source: ABdhPJxCisGBa7uuX9xs30Kf/32tkoMOjxd0hCAn7Ith9LY2zPfToaisRP4aWH2JR2DMw+aNK1ynsw==
X-Received: by 2002:a17:906:aad8:: with SMTP id
 kt24mr22651804ejb.527.1592172730202; 
 Sun, 14 Jun 2020 15:12:10 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id o13sm7772828ejb.46.2020.06.14.15.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 15:12:09 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] IGD Passthrough fixes for linux based stubdomains
Date: Sun, 14 Jun 2020 22:12:00 +0000
Message-Id: <cover.1592171394.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 Anthony PERARD <anthony.perard@citrix.com>, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

The included patches are a small subset of a bigger patch set spanning few 
projects aiming to isolate the GPU in Qubes OS to a dedicated security domain.
I'm doing this together with 3 colleagues as part of our Bachelors thesis.

Right now qemu assumes it runs in dom0 so it may grant access to
required memory regions and ioports to the target domain for the IGD to work. 
This is no longer the case with linux based stubdomains as the stubdom is 
not privileged. Moving some logic from qemu to libxl is necessary for 
some features to work inside a stubdomain. The included patches were tested
on a few laptops(together with the linked qemu patchset) and they work
fine.

Grzegorz Uriasz (3):
  tools/libxl: Grant VGA IO port permission for stubdom/target domain
  tools/libxl: Grant permission for mapping opregions to the target
    domain
  tools/libxl: Directly map VBIOS to stubdomain

 tools/libxl/libxl_pci.c | 153 +++++++++++++++++++++++++++++++++-------
 1 file changed, 127 insertions(+), 26 deletions(-)

-- 
2.27.0


