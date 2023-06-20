Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D547372E4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552118.862049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAd-0003UP-Er; Tue, 20 Jun 2023 17:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552118.862049; Tue, 20 Jun 2023 17:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfAd-0003QZ-Ah; Tue, 20 Jun 2023 17:29:35 +0000
Received: by outflank-mailman (input) for mailman id 552118;
 Tue, 20 Jun 2023 17:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7g-0004q1-L1
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:32 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 980c656c-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:30 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5701eaf0d04so52045437b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:30 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:28 -0700 (PDT)
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
X-Inumbo-ID: 980c656c-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281989; x=1689873989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A524XPsKBXV8yIUUkONAn98uAFCiKVTYyMvCRnHwi2c=;
        b=iQ/RkOUENSnolhvtv9AkWVvC4+UoqgOn8Qysgb9xM3IofX21Tzz6Tk0oEZuJOA/e/3
         4b4tNVmMbG7HVhgB2DPb/TeYAHtGMylmnD3PJGacsE6/UpjcGwS+jXQ9UYlvdfzS+y8W
         +Vu4tu3igfZ700VaRbou+aFFluHvMdiysHJurJ1+8YlyD5mkRIgzLOMNBKfFmqyq/QtV
         e4/X4zvaJw2dDt7kr+97WsS0/n2+F2Co2wdODsrDd0BtitsYUXbJ6XJ4MLgdQtK4MhsU
         JFdQFOyU4xBA1kNZjcfwHK2JxiV8LkG0adb9oUxGBPDx1/yQrCCu2Mhlu2/Rgp5Tt9wY
         uRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281989; x=1689873989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A524XPsKBXV8yIUUkONAn98uAFCiKVTYyMvCRnHwi2c=;
        b=JDWdEL5p0O4RX9n3yG9K6mNndOj+47mLRXuqEAD1eyAVvylFJCFAu5kfO/q5XMojq+
         xKfyonHOwQoAy2+KDyV+jhBkZE8U4uPIeX1Ky3nbdnutaROf0tG6MeEEQdTK2ik5bzNF
         qr8YQqFZdEDmxjEEXdQLtza4lu6tFizzeWNtib445GBKCC2eNfvC/HpUz64o9KMu7hBZ
         hog9kjRPx0ErL3BjRoKxINXJksbSik6YkLKDKW6j1mQN93BEbLIUWHdLrFEwkCPjDU1z
         wVLtdhW7FsMakWabdOi3GH6vsEjkIuSfaQcmFcy6Bu81hIRbcYJzTXKiHbYIgi/MfCJh
         gCjA==
X-Gm-Message-State: AC+VfDzEpb+kOp5Ji1nNFiL5kLmYB+1FWl+lyZLHaOgNeuU/wEyDoAMQ
	6EBi7+VId4OllOuNkCHdEck=
X-Google-Smtp-Source: ACHHUZ6S4m8fu+H0OgrlYLgV+H0vy/atkpSHK7ZVonYsWljbCF1QmDliwrTxL0EO6NGWYcflU0wPUw==
X-Received: by 2002:a81:6684:0:b0:568:f2c:ee40 with SMTP id a126-20020a816684000000b005680f2cee40mr12259954ywc.3.1687281989562;
        Tue, 20 Jun 2023 10:26:29 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 17/23] xen/pt: add Resizable BAR PCIe Extended Capability descriptor and sizing
Date: Tue, 20 Jun 2023 13:24:51 -0400
Message-Id: <30ddc5858c9a309ed4ab812ab93b3e930b7bfd68.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike other PCIe Extended Capabilities, we currently cannot allow attempts
to use Resizable BAR Capability. Without specifically handling BAR resizing
we're likely end up with corrupted MMIO hole layout if guest OS will
attempt to use this feature. Actually, recent Windows versions started
to understand and use the Resizable BAR Capability (see [1]).

For now, we need to hide the Resizable BAR Capability from guest OS until
BAR resizing emulation support will be implemented in Xen. This support
is a pretty much mandatory todo-feature as the effect of writing
to Resizable BAR control registers can be considered similar
to reprogramming normal BAR registers -- i.e. this needs to be handled
explicitly, resulting in corresponding MMIO BAR range(s) remapping.
Until then, we mark the Resizable BAR Capability as
XEN_PT_GRP_TYPE_HARDWIRED.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt_config_init.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 1fba0b9d6c..c5157ee3ee 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2093,6 +2093,27 @@ static int xen_pt_ext_cap_pmux_size_init(XenPCIPassthroughState *s,
     return ret;
 }
 
+/* get Resizable BAR Extended Capability register group size */
+static int xen_pt_ext_cap_rebar_size_init(XenPCIPassthroughState *s,
+                                          const XenPTRegGroupInfo *grp_reg,
+                                          uint32_t base_offset,
+                                          uint32_t *size)
+{
+    uint32_t rebar_ctl = 0;
+    uint32_t num_entries;
+
+    int ret = xen_host_pci_get_long(&s->real_device,
+                                    base_offset + PCI_REBAR_CTRL,
+                                    &rebar_ctl);
+    num_entries =
+        (rebar_ctl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
+
+    *size = num_entries*8 + 4;
+
+    log_pcie_extended_cap(s, "Resizable BAR", base_offset, *size);
+    return ret;
+}
+
 static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
     /* Header Type0 reg group */
     {
@@ -2424,6 +2445,13 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
         .size_init  = xen_pt_ext_cap_dpc_size_init,
         .emu_regs   = xen_pt_ext_cap_emu_reg_dummy,
     },
+    /* Resizable BAR Extended Capability reg group */
+    {
+        .grp_id     = PCIE_EXT_CAP_ID(PCI_EXT_CAP_ID_REBAR),
+        .grp_type   = XEN_PT_GRP_TYPE_HARDWIRED,
+        .grp_size   = 0xFF,
+        .size_init  = xen_pt_ext_cap_rebar_size_init,
+    },
     {
         .grp_size = 0,
     },
-- 
2.34.1


