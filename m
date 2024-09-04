Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725DE96C3BB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790555.1200420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfm-0002n0-Tc; Wed, 04 Sep 2024 16:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790555.1200420; Wed, 04 Sep 2024 16:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfm-0002fi-M7; Wed, 04 Sep 2024 16:15:58 +0000
Received: by outflank-mailman (input) for mailman id 790555;
 Wed, 04 Sep 2024 16:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfk-0000I6-R3
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:56 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6feaa82-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:56 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f6514f23b6so19840491fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:56 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f6151881dcsm26217611fa.124.2024.09.04.09.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:54 -0700 (PDT)
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
X-Inumbo-ID: f6feaa82-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466556; x=1726071356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn/Mzsj0J8g/Mphb+PXQ5WHUtYUEk9GjObY40SBe48s=;
        b=aAnh+FEeyrd1mo7qxAuBWBCnrbCHW/amr4H/pwcwAxJUHxwVCNyvcSnZE+cPJ9naMS
         +Kovigp1eGbNUIr+JyO75Jchku1dx0jY5OQ3SyRRLofyALoPrZ/KFmEMdwD3y3bhqAzf
         MAkuZXE4qhSnMHqJ15DfPtaisM0fLYC49Ox42TZadZ3HM+FGMWOiexPqtB3h5v6N1YOe
         IV0cDW19onLs3vO8/njo7nkhTIYUy9RqjsFCW5sQBCvUXdYB4a/azMMAQdpuRIG3Sb4T
         2xA4w6rdl11wPsOeuax/ai0d/Lc2vwdrHxCNHO6Dpcuyk96fc7fcAoDNMm1CVzHFvlW4
         W53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466556; x=1726071356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nn/Mzsj0J8g/Mphb+PXQ5WHUtYUEk9GjObY40SBe48s=;
        b=W33nRkkZgL7J5crBB1fbayoCRKXYx5VEzK8QHGVgy1h253C8lNCXjfMEcU4iVEnGfE
         WNGooLnXJyGJS5pT4j3C3L4gCzRoH9trAzblc4yK8bOUcci2HMBh1oiAU+VZTucxopFs
         r0FfsTO5WnIOxfoV0hkjdfABLQXNJVYeZ/x7jnfnUT++viFHkcO2O4pBBujqKXuGVF1l
         K8vbcwOkhYew0mWwMfb8HR8RAoDTglBPutxukGhwwPydVKt2pnWZQNmcZsC3sp0+QMLv
         kMVHh5rYkQFu7HReBf8+CqTP8bTVVAV1kJJjBhth87RM964Q5kyutQgmk1aiuu63mjus
         5ZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUr96729X/VTjoX/YJM2petLpyZEQZcWCwXxqcz6I0iQt7dlrsZ81dH8HL6e5TiS1yLS874Pohv19A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDftWFjOeKDeq8wbrSB4bJ69/Ssq8jV5IM/+XXoaNvtCn93PRs
	VHT6CVrPML9gtx9+DchZ+9snlufyfLJDKLTnzM0D5U7DCwAo5Weu
X-Google-Smtp-Source: AGHT+IF6S1OoJeZCF42GJKo/qiy2ZeZ6a9HHHlUxboixNuGEbZq+dI0mGFAzSTpOvJ4LlUMQwdzjQw==
X-Received: by 2002:a2e:bc19:0:b0:2f5:966:c22e with SMTP id 38308e7fff4ca-2f6105d74e3mr207636241fa.11.1725466555495;
        Wed, 04 Sep 2024 09:15:55 -0700 (PDT)
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
Subject: [PULL v1 09/12] hw/arm: xenpvh: Reverse virtio-mmio creation order
Date: Wed,  4 Sep 2024 18:15:33 +0200
Message-ID: <20240904161537.664189-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
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


