Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C404215848
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 15:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsR8h-00036n-O3; Mon, 06 Jul 2020 13:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnCI=AR=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jsR8g-00036i-8X
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 13:26:30 +0000
X-Inumbo-ID: 4cbb88b4-bf8c-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cbb88b4-bf8c-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 13:26:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f18so32847578wrs.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSVh3xZmU5Rl/VlxY1hhYknTsE0eO5DVOcNMGKELemE=;
 b=qbnbFANxBTkqeC8ntLvePUEA/6O+OhVKoiQ3wU8s9JPQSj4pshbaGeOTNW7MAamPcu
 Su+J3Dd1u74P4moHRgtiNEk57vt/sKjMkE9cJ46oAlj8Xe4Ltx59jSHx/tSifGlkp9jT
 jbSmk+3wA+8Uyjfv74QRqOXNsvpz9jkOL8r40qFfwnHqcWwWPWUUu5MwltusREfB6Yc0
 pS6kgkug7Yp/zCYMoPi2XhqG6MiJiRGd7USoADPe+zJglJiboMUZG8IhQY4v81cPu9zV
 mQl7kmK5T2dLV1wubFA+r0qPiAve69N7SG3QCH2MZOTHvjpa/0djo5deiRXNEJBfIsQR
 1Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tSVh3xZmU5Rl/VlxY1hhYknTsE0eO5DVOcNMGKELemE=;
 b=SObFtEo0FMMb6I6mv14zMP6QV6awC4NOuPmAVbTREIR42OBN2Gp5D49Y/3WaUn+hCj
 vmYJ5V9P6ijW2KOGfB9HshPbQBF6yhPU1IXE7vdTF2nuVkYqMp3ZDKn6pUXfhqbVIrDI
 Oft8I65wugyhja49XLFXggun/gKr39z451gvJ6FJXQmlReI6b2k/geLfwXp4qypwm2fs
 UZ+SU8Q+TTUeeSYEDO3cCdqJupMgfgMn2HYRnPpzV8SZ7JL0mAANSC4qqzHEAP8R5Aat
 j0XJHQyreTzsh14zUD0wXt8ID/PL5MbxxJu812/iPgG6ooRjELGe3hY12AOojKhttR64
 g53w==
X-Gm-Message-State: AOAM531xPPvHIUXLccHKKB9BNqDdrUVa9pKGLVeTr+8qlqluqlxVDZg5
 UwwCxeqNyDS1nV5plWd/Vmw=
X-Google-Smtp-Source: ABdhPJy3fteBFpWnCcBm76WBnCreC3Ozl3AURYlcuW7tquHy8jvwLRuhDJFqfAi9hiIEX+1alLgbyg==
X-Received: by 2002:adf:f203:: with SMTP id p3mr20519115wro.331.1594041988856; 
 Mon, 06 Jul 2020 06:26:28 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w2sm24447004wrs.77.2020.07.06.06.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 06:26:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/block-backend: Let blk_attach_dev() provide helpful
 error
Date: Mon,  6 Jul 2020 15:26:24 +0200
Message-Id: <20200706132626.22133-1-f4bug@amsat.org>
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

Philippe Mathieu-Daudé (2):
  block/block-backend: Trace blk_attach_dev()
  block/block-backend: Let blk_attach_dev() provide helpful error

 include/sysemu/block-backend.h   |  2 +-
 block/block-backend.c            | 12 +++++++++++-
 hw/block/fdc.c                   |  4 +---
 hw/block/swim.c                  |  4 +---
 hw/block/xen-block.c             |  5 +++--
 hw/core/qdev-properties-system.c | 17 ++++++++++-------
 hw/ide/qdev.c                    |  4 +---
 hw/scsi/scsi-disk.c              |  4 +---
 block/trace-events               |  1 +
 9 files changed, 30 insertions(+), 23 deletions(-)

-- 
2.21.3


