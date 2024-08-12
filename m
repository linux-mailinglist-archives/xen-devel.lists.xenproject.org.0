Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE494EDB0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775495.1185766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkq-0000x1-Im; Mon, 12 Aug 2024 13:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775495.1185766; Mon, 12 Aug 2024 13:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkq-0000uh-E0; Mon, 12 Aug 2024 13:06:32 +0000
Received: by outflank-mailman (input) for mailman id 775495;
 Mon, 12 Aug 2024 13:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUko-0007ep-St
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:30 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0432a9c-58ab-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:06:29 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso46452721fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f1ac89sm734534e87.184.2024.08.12.06.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:25 -0700 (PDT)
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
X-Inumbo-ID: b0432a9c-58ab-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467989; x=1724072789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhh0TpUXfvKDYo1bINWU88Yt0WNYvGv2suBFZ023AEo=;
        b=f4oioUWGILPFUlnvv002QkQz5v79f+efVXkV0vDSfW/dycdVphHWEOMEIss7s+bAcL
         tcdoemY0DyllfXWB5tB6v43MV8VsNDza1p0hnOXdnhkhrFjpq2oP9WIACUtOvQdWN8KW
         0xPPgx95CNTH+dzhw25lGDvJpuc2amxo1gTEfAPWpzm+wBQ5RdILQ05PU2CmibKlenbK
         FHeU3xNZwVyXQRzDIOZl/BtH19AB/9bLAV9q7qy54N17RNnGZLQBTbcvX0Yigd88YRfl
         LIX3G2xMpp6rWgXBFve/dNGSFVurD4GY3INKFuSk6LiQImCYiG+UoGmBI+Bnq/CP+A6e
         r5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467989; x=1724072789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhh0TpUXfvKDYo1bINWU88Yt0WNYvGv2suBFZ023AEo=;
        b=O6IbwXecgwnSQXiszo9tBVvNqqQPE67UEyY1hSRstoC2h6ticKSlVdaYENSRleN4cH
         rhuNAShYxNzyXuuPG+cNcSsj5YGHl49HYqb5uBkbKrUotGEOe8Wm0o6lw9slKd09E0Rt
         N8Re0EPF6wVGyvQSWYnvsSk+2ZU7q1Xnzy6LHw8PLtMlw/37lCo70gRJ9QKpKo6QB1qg
         lHy/w92E1Le3VzKwn1r83VW6wFSnvkCHwBKlekNvIFmolMOb7ltsf62VwcHRlNpBm2h1
         owlzroQ/nHIzLkXTTFE0zZsIWmQs1RRcn2iI98b1dgdoog6/em11k7jN+x+ISI0viEv+
         dWCA==
X-Forwarded-Encrypted: i=1; AJvYcCWrQz7u7vXU7oOA6s4Aw3XiymoZOz7cZvjipESddFFDEK2zdTReKUvdK/ZOO36HIaiqBbh3m6bB6Zt18SLwK99Yt/2xEJu9gkRarvxXslk=
X-Gm-Message-State: AOJu0YxFSFBVA2Ugj8GaIxfi1wuBDrZ6m3Zr9DXjqAkDX1sVmtkrwJFT
	4vxBG6oCRx7eiNqhZHDGdM8LGh/iGtuKqpcOwntozPApWsbgeCb6
X-Google-Smtp-Source: AGHT+IHSkZQghDr6Glb8JEvdreF6qFC+N2jFtbTRBNglrKRLKqDk7xPj3u/onfFEY6yEqggs5c2vsg==
X-Received: by 2002:a05:6512:1296:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-53213693c31mr31960e87.43.1723467988154;
        Mon, 12 Aug 2024 06:06:28 -0700 (PDT)
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
Subject: [PATCH v1 07/10] hw/arm: xenpvh: Reverse virtio-mmio creation order
Date: Mon, 12 Aug 2024 15:06:02 +0200
Message-ID: <20240812130606.90410-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
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
---
 hw/xen/xen-pvh-common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 0d368398d0..69a2dbdb6d 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -73,7 +73,18 @@ static void xen_create_virtio_mmio_devices(XenPVHCommonState *s)
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


