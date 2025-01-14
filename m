Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53281A1044E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 11:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871109.1282162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG6-0006yq-Mx; Tue, 14 Jan 2025 10:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871109.1282162; Tue, 14 Jan 2025 10:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG6-0006w4-Jj; Tue, 14 Jan 2025 10:34:54 +0000
Received: by outflank-mailman (input) for mailman id 871109;
 Tue, 14 Jan 2025 10:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXeG5-0006up-GI
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 10:34:53 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e7e0a50-d263-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 11:34:50 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso873307566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 02:34:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c913605csm608116266b.82.2025.01.14.02.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 02:34:48 -0800 (PST)
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
X-Inumbo-ID: 2e7e0a50-d263-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736850889; x=1737455689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aKUOtOG9BVgReGI+Nw2NzmnaZPU8conWgd+JDzRbKo=;
        b=PEF0JckHlBB5UuSMXMf3o/TTr0oR4JR/dBXCz6JAonXaY4eAf+XgxG3dMuT9jQIT8i
         BkFJXrnsCPuaQDp9RYaL8h6B0s3bdLwzE6WQ1GC+A01ntBMd/t+3Pig0kAEtQljsMUNq
         hUK84aLw5frsu4tn9+cySDJEoAlivNQQMTaT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850889; x=1737455689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aKUOtOG9BVgReGI+Nw2NzmnaZPU8conWgd+JDzRbKo=;
        b=Whk7UM1J3zyvEbSnvkm5uKBY3GwCmMzsZA9VQWYl5LtOe6HYyvxjvNuEMdzkmvF9Rc
         Kvzw0eE5Sxak6aRQhre1MRXVKQ/ZtgKjfmhgpsX/UvKUeUIDHWiSmWgGs+7HeXqLztPi
         VbflmSLbpgjZwTZU7o7AqFmQgPmZGoNsAnIbtXLd6DpxT8Ib/DtJs6rSc+ay4AOXNM+h
         lP0VfIJ6bSSBuz0MwD9L7xr75cJFwrWYuPKSrQ8ZwrlOmAq8HIzp8jlBMQuW7OZd7FDr
         WTCsdO7qA0Zish0m9eGxxj+y6umHFeSIjxmYoLXAjvoVjA7xkj7kLuch3yHr8Es1QqNq
         LQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVgYmn+S0NJTgSP1lHPtLJrTiULiQUyzK0eSkNNR9uFxDuzpw6jpx7ZHVgv8aZGLYSk4oBzi5fHJ0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVAU9uBzVi/5ETPCKzFAd4Oiyo8q9GVrYXmTpPieBULovY/QcZ
	THXwyIz5Cr8BPrKTBrdAlf+SkDWZcotOGU7UdpOBBQ2q8cBJK9z/MLvRBBzkDsM=
X-Gm-Gg: ASbGncu83HbuqOJ+nfOeX9PYv1f4/ijD9/0TGm5V5AdYp2Ibjpx483Fq5/iX0X3M/xB
	skfa77e0eoyCzwI20ARksg7a4iYz6qOi9i9wXxw+56iJ1dq5nzlxTMs+jsV1U0Pm7HyypBckrEh
	OyjDP3pwDpOj9tdFNapgq1TlnyVsax9xIRJsBnPTwRzuH8vr0Hg8TbEoJm5YB0Ek+arzy7/FKI9
	9sBouoUat7MTlSvjJ+GsTlEub1WUs1pDqjfEl2RcBFSlEoJfQp7jDHIxGE5YG8QMFE=
X-Google-Smtp-Source: AGHT+IHu5De2z/QFEQRsmLROwHRAnH4F5r3sr8PBreqTBE5z0L97HWAie9gr7imKD5uPM/cH1y3q+A==
X-Received: by 2002:a17:906:4fcb:b0:ab2:fefe:7156 with SMTP id a640c23a62f3a-ab2fefe94f8mr1052272666b.43.1736850889114;
        Tue, 14 Jan 2025 02:34:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 2/3] vmd: disable MSI remapping bypass under Xen
Date: Tue, 14 Jan 2025 11:33:12 +0100
Message-ID: <20250114103315.51328-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250114103315.51328-1-roger.pau@citrix.com>
References: <20250114103315.51328-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MSI remapping bypass (directly configuring MSI entries for devices on the
VMD bus) won't work under Xen, as Xen is not aware of devices in such bus,
and hence cannot configure the entries using the pIRQ interface in the PV
case, and in the PVH case traps won't be setup for MSI entries for such
devices.

Until Xen is aware of devices in the VMD bus prevent the
VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as
any kind of Xen guest.

The MSI remapping bypass is an optional feature of VMD bridges, and hence
when running under Xen it will be masked and devices will be forced to
redirect its interrupts from the VMD bridge.  That mode of operation must
always be supported by VMD bridges and works when Xen is not aware of
devices behind the VMD bridge.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add xen header.
 - Expand comment.
---
 drivers/pci/controller/vmd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 264a180403a0..33c9514bd926 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -17,6 +17,8 @@
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
 
+#include <xen/xen.h>
+
 #include <asm/irqdomain.h>
 
 #define VMD_CFGBAR	0
@@ -965,6 +967,23 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct vmd_dev *vmd;
 	int err;
 
+	if (xen_domain())
+		/*
+		 * Xen doesn't have knowledge about devices in the VMD bus
+		 * because the config space of devices behind the VMD bridge is
+		 * not known to Xen, and hence Xen cannot discover or configure
+		 * them in any way.
+		 *
+		 * Bypass of MSI remapping won't work in that case as direct
+		 * write by Linux to the MSI entries won't result in functional
+		 * interrupts, as it's Xen the entity that manages the host
+		 * interrupt controller and must configure interrupts.
+		 * However multiplexing of interrupts by the VMD bridge will
+		 * work under Xen, so force the usage of that mode which must
+		 * always be supported by VMD bridges.
+		 */
+		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
+
 	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
 		return -ENOMEM;
 
-- 
2.46.0


