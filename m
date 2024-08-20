Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DA95894F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780538.1190244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsD-00044C-7r; Tue, 20 Aug 2024 14:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780538.1190244; Tue, 20 Aug 2024 14:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsC-00040n-W0; Tue, 20 Aug 2024 14:30:12 +0000
Received: by outflank-mailman (input) for mailman id 780538;
 Tue, 20 Aug 2024 14:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPsC-0000m9-24
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:12 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b51dbfee-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:11 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53346132365so347421e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:11 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d420bc6sm1791128e87.241.2024.08.20.07.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:09 -0700 (PDT)
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
X-Inumbo-ID: b51dbfee-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164211; x=1724769011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn/Mzsj0J8g/Mphb+PXQ5WHUtYUEk9GjObY40SBe48s=;
        b=E4eNChmDOSB3t3Dl53CQtsKq8Matjrpyo2dVwb4BzVLMzZGNv1GKCAZDb5gj8q2Enf
         RnSGCf1jTzsJ0GtHMPkKOZOTphPgUCW6mWfQS81QydV3tJeMCy4ab1LyougUoWJ74L3+
         pS9+1b2UbKRz+1eQ0zS+UCocbmlJDuR4ydu4Q2c+MsPdxMunm8WmrPXChfMktDuhnKCV
         O+8NmNDEKMCBA+YVJLspv9XTT9ziH+DCzSOFcMcQcWzPk0LRh8ssJGWjtwB6RPyH+BHo
         +8gDW3bmDVnOTPx86oJzBCb5PCwNQh0YzsBHz+yKWfD80GMpNABt8e2zbWSflD59Djj4
         Z7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164211; x=1724769011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nn/Mzsj0J8g/Mphb+PXQ5WHUtYUEk9GjObY40SBe48s=;
        b=rHaaS5v0NX63AhTdMKlV2XKgDU7Mo0/Vc/fjZZzBQTFBFzmBW5GcdAn7VyJmOSb2Uo
         4bjjviXCpG8vTX56RiBE/sNxs0OCkIHHoZLi3GrFN8gVbv2//OzrHO5GG+oL47YtebI+
         GSqqMjeyr6n+ZRDEEUjndyRpyyBdohrS2q58Bg9aWkTUku16rpjObHgwgKoHEJ3mQGrx
         G950kOOhsoKFUu5NbQNFsBv3LarwL3T0Uq3+8Kgetam6GesvFXLSF0yCRYb7VeKNT5vN
         UHqVGHCZ9pTzc5QasOsdeJEXo7OhAcXgVoHLcQpntecTac04bIFTFcp4qLhZsVyDL5i4
         mg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXuwLYF1eafKEqXePjutpSnPSaNP9cJaCFL9XU7Rm6EHKST6OTtJRzkJJycXPe2+LcCcrM1P10+YZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRcom7TwLxKRMEcYlw7YPSGRa9hH9PRJUHxPXjQims61C95Fb6
	DOTPpSVHBMPhYbum+jiRac91/o08AeDhK0dQV3Vs4gQKuZ6sQ/Ps
X-Google-Smtp-Source: AGHT+IFotZ4Ec+2t7CYxqYEsIJgRWw4/u9z0FOKI55M7uGGokh/ts3s1WXBedzrQkXbLGgZ+ZDCasA==
X-Received: by 2002:a05:6512:3a90:b0:52f:d15f:d46b with SMTP id 2adb3069b0e04-5331c696aefmr9419582e87.14.1724164210397;
        Tue, 20 Aug 2024 07:30:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 09/12] hw/arm: xenpvh: Reverse virtio-mmio creation order
Date: Tue, 20 Aug 2024 16:29:46 +0200
Message-ID: <20240820142949.533381-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

We've been creating the virtio-mmio devices in forwards order
but since the qbus lists prepend (rather than append) entries,
the virtio busses end up with decreasing base address order.

Xen enables virtio-mmio nodes in forwards order so there's been
a missmatch. So far, we've been working around this with an
out-of-tree patch to Xen.

This reverses the order making sure the virtio busses end up
ordered with increasing base addresses avoiding the need to
patch Xen.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-pvh-common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 880e8143d7..295f920442 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -75,7 +75,18 @@ static void xen_create_virtio_mmio_devices(XenPVHMachineState *s)
 {
     int i;
 
-    for (i = 0; i < s->cfg.virtio_mmio_num; i++) {
+    /*
+     * We create the transports in reverse order. Since qbus_realize()
+     * prepends (not appends) new child buses, the decrementing loop below will
+     * create a list of virtio-mmio buses with increasing base addresses.
+     *
+     * When a -device option is processed from the command line,
+     * qbus_find_recursive() picks the next free virtio-mmio bus in forwards
+     * order.
+     *
+     * This is what the Xen tools expect.
+     */
+    for (i = s->cfg.virtio_mmio_num - 1; i >= 0; i--) {
         hwaddr base = s->cfg.virtio_mmio.base + i * s->cfg.virtio_mmio.size;
         qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
                                          s->cfg.virtio_mmio_irq_base + i);
-- 
2.43.0


