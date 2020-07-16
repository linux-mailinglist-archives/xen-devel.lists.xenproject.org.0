Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6E222266
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 14:37:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw38Q-00017A-JD; Thu, 16 Jul 2020 12:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxFF=A3=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jw38P-000173-6z
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 12:37:09 +0000
X-Inumbo-ID: 0fd91844-c761-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd91844-c761-11ea-bb8b-bc764e2007e4;
 Thu, 16 Jul 2020 12:37:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s10so6841937wrw.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mB1xxUu5zqmOlJyeJOkLUsa5p10TlJZt5oeYf/aQyPQ=;
 b=ARb60FeHPT4lfmhfWj5c3Dc/GDZ7UeDtLAXLlobXruj8nFLuFB8D7NGC+HwAJ4+Pl5
 ftFweWixOb1ptNP3cP2cdVoqSGHphD6ybCp/hLm/0UaMIV/T3fRr2FUHNPfVRrF0fAJt
 Vzby7G4rs6h1XU7Iu2oLv8VCIaFKAiAlB5T28WiZrAe3z0KgBjSVDvRW5ivN8RJgKfw+
 oR4nWU1wPrBBVSopd6Ii3lgiTLcc/TgEH5xypsyd/1UVRTY+xV9x7g+fLlK8k54MTeov
 IZ332Gh1fr2+UV+VAY0oXfYxOdBWWXdQsnGZ3M0ABYdsmImf7s7Ur2WyZ4dQ9vypJTnP
 pSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mB1xxUu5zqmOlJyeJOkLUsa5p10TlJZt5oeYf/aQyPQ=;
 b=d9FTn02njEE8L+H7HYMj0pERy0sfHU5L5rV/Rb5dzm6OylxtZYTOBiBhVATDYhZzxv
 YdLqoVJk8YQlEfSrjHsItEm9x06vVZerKu1pieJrbdVlXOVaDEd/De+0zIlJ5keFZoM7
 jSOnWGp5nIphj7jAY22Os5TjRoA4IY1ycGVP5XQMw3axrP9LdZWPqieZDmN5tjDTWtzu
 ewORAHAyyOwPEZTnuQrvOXzDdH85Yrxmq3w2Ob1I+A9yCTeyPW2KgPA87/qHH1eeThiQ
 7dxc9D5u5hsg5F0tL//+P1dNzoCxIKDR/n4Sq3rxKpdwCA6Q7sqH21nMtDerppqAhU0D
 E+pQ==
X-Gm-Message-State: AOAM533h/a+8NEYiKpLrwFNlVuacC7fD8FCy0Y/301/9aL5oDZP/NZjv
 hmUwoPE6EttM69MnJSTz/wk=
X-Google-Smtp-Source: ABdhPJz9g/vGJP2RKVZgF9h6f20OFk4NNucEE3jZ+fi3QR4RP7R2yi143VXJ45AZJ8lOK4q+3nyDgQ==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr4796592wrs.353.1594903027555; 
 Thu, 16 Jul 2020 05:37:07 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id c194sm8336673wme.8.2020.07.16.05.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:37:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 0/2] block/block-backend: Let blk_attach_dev()
 provide helpful error
Date: Thu, 16 Jul 2020 14:37:02 +0200
Message-Id: <20200716123704.6557-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A pair of patches which helps me debug an issue with block
drive already attached.

Suggestions to correctly/better use the Error API welcome, in
particular in qdev-properties-system::set_drive_helper().

Since v1:
- Rebased after 668f62ec62 ("error: Eliminate error_propagate()")

Philippe Mathieu-Daudé (2):
  block/block-backend: Trace blk_attach_dev()
  block/block-backend: Let blk_attach_dev() provide helpful error

 include/sysemu/block-backend.h   |  2 +-
 block/block-backend.c            | 12 +++++++++++-
 hw/block/fdc.c                   |  4 +---
 hw/block/swim.c                  |  4 +---
 hw/block/xen-block.c             |  5 +++--
 hw/core/qdev-properties-system.c | 16 +++++++++-------
 hw/ide/qdev.c                    |  4 +---
 hw/scsi/scsi-disk.c              |  4 +---
 block/trace-events               |  1 +
 9 files changed, 29 insertions(+), 23 deletions(-)

-- 
2.21.3


