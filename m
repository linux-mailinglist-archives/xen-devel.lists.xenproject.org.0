Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F343329F476
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 20:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14582.35997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYDDD-0007P3-Sm; Thu, 29 Oct 2020 19:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14582.35997; Thu, 29 Oct 2020 19:03:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYDDD-0007Oe-P5; Thu, 29 Oct 2020 19:03:51 +0000
Received: by outflank-mailman (input) for mailman id 14582;
 Thu, 29 Oct 2020 19:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/pEi=EE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kYDDC-0007OZ-9F
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:03:50 +0000
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d77ef8ef-a576-42f2-bd4f-ebcbb3d3e1f8;
 Thu, 29 Oct 2020 19:03:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u62so4708732iod.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 12:03:49 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:fcfe:e213:efe5:2016])
 by smtp.gmail.com with ESMTPSA id g185sm2958818ilh.35.2020.10.29.12.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 12:03:47 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/pEi=EE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kYDDC-0007OZ-9F
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:03:50 +0000
X-Inumbo-ID: d77ef8ef-a576-42f2-bd4f-ebcbb3d3e1f8
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d77ef8ef-a576-42f2-bd4f-ebcbb3d3e1f8;
	Thu, 29 Oct 2020 19:03:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u62so4708732iod.8
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PjoN1VtNrqCy9Sd+SGhiFGDyT8M6kw114LQQ5wrE1Lk=;
        b=D4vmX/hVLY7pNXdyr/ARgCUQIxYP/peLKolCkz11AlYWKAV6E9FliRldyvgKm2W5RJ
         uWy81iRgo1aX5zEBx0XYHgTYskhIC/fsuHpZ7JTm/H8/9cm8G9jkt2Hqjr3VYhh6D0Ps
         G8WFwGj3kxrucyjP0lhi4AimJgd839QVFVgZJTC9HeaLHjuKqOxRmRSgj28ByEnfht/5
         SAoVWBoKT+aNuKZLyclqBnm44XpLVadCcr216ap5SfflL8QMsZ6I+AOdV5xCpMsRqPF0
         OQ4iLkV5G2zIAUf6fKAgCG4cgvMosGZfKGXkz9pbjPyNIWuLCQq3P3qtFtukLKvCBbzn
         YK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PjoN1VtNrqCy9Sd+SGhiFGDyT8M6kw114LQQ5wrE1Lk=;
        b=pfXwWHsMtSHS2u3hk9+cFFCAyl+0wqyeYiPeOwYphrSCGIxyOUByqL7DPiVcERM7lX
         e8Ww40TLUzVak9T+xERtABIAYDBBYXgV+5uYn0CjSeqY1u5JHl+uh0l1xQdRCNVCvFfq
         8OCoY+/InI8+hqEOononNU15LmOHSvPhdDUmyTJAuqizd+Q7NAH0JvAFzSwc0J/PjNZw
         27rdJ5b0oJfPHYYsB9tOy8JmpcCslncpZ5surf42zbuOdznLmT28i/xRMniaBfNThe8a
         3IQPDIJFT+UR23hTVzEEOuYEwaYGUD/z7rEPoRzRnIOP5yJfCiVBS1sXre6FVdtXmy+W
         eqWQ==
X-Gm-Message-State: AOAM5305oB/iXwsAprNSUMJ6tSfw+MqctH2shOivbnW6tKRROyO66zkQ
	pQYVwx2tuO/DjOgCPQm7eFWNiJpAkjQ=
X-Google-Smtp-Source: ABdhPJzOhp5U22ALopDDwWzUDzIt6Hf9u9tG4Ta9al7tHl/lc6geiR7/6WbaApxLlPxn4MzcDPMGGA==
X-Received: by 2002:a02:48:: with SMTP id 69mr4618562jaa.108.1603998228652;
        Thu, 29 Oct 2020 12:03:48 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:fcfe:e213:efe5:2016])
        by smtp.gmail.com with ESMTPSA id g185sm2958818ilh.35.2020.10.29.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:03:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] libxl: Add suppress-vmdesc to QEMU machine
Date: Thu, 29 Oct 2020 15:03:32 -0400
Message-Id: <20201029190332.31161-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device model state saved by QMP xen-save-devices-state doesn't
include the vmdesc json.  When restoring an HVM, xen-load-devices-state
always triggers "Expected vmdescription section, but got 0".  This is
not a problem when restore comes from a file.  However, when QEMU runs
in a linux stubdom and comes over a console, EOF is not received.  This
causes a delay restoring - though it does restore.

Setting suppress-vmdesc skips looking for the vmdesc during restore and
avoids the wait.

QEMU 5.2 enables suppress-vmdesc by default for xenfv, but this change
sets it manually for xenfv and xen_platform_pci=0 when -machine pc is
use.

QEMU commit 9850c6047b8b "migration: Allow to suppress vmdesc
submission" added suppress-vmdesc in QEMU 2.3.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
QEMU 2.3 came out in 2015, so setting suppress-vmdesc unilaterally
should be okay...  Is this okay?
---
 tools/libs/light/libxl_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index d1ff35dda3..3da83259c0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1778,9 +1778,9 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             /* Switching here to the machine "pc" which does not add
              * the xen-platform device instead of the default "xenfv" machine.
              */
-            machinearg = libxl__strdup(gc, "pc,accel=xen");
+            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
         } else {
-            machinearg = libxl__strdup(gc, "xenfv");
+            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
         }
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g = (1ULL << 32) -
-- 
2.25.1


