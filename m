Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371CA10450
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 11:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871108.1282149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG2-0006b6-GQ; Tue, 14 Jan 2025 10:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871108.1282149; Tue, 14 Jan 2025 10:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeG2-0006UY-CC; Tue, 14 Jan 2025 10:34:50 +0000
Received: by outflank-mailman (input) for mailman id 871108;
 Tue, 14 Jan 2025 10:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXeG1-0006Sh-Hu
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 10:34:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d233095-d263-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 11:34:47 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so145273766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 02:34:47 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060533sm614255366b.23.2025.01.14.02.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 02:34:46 -0800 (PST)
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
X-Inumbo-ID: 2d233095-d263-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736850887; x=1737455687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZU2rMw7aFNypI2l6diI5iIm2rhPqMg33NxACGe4Tyg=;
        b=GNCyW5FZrA/+lopzbAAbKj6lGKPj88F19h47zBKOERhrsG7f4CRg9OZqD325Xbt2eK
         6muyF5HpzMNWg4Q3a7BlHy4TLINfLqF8hBX9UDyfgiBJCRj6gOFN21sCD+p7EC7zag5a
         ga7m4oPV1jfo7XD0K57GZVjBz1IY0H3kHpKzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850887; x=1737455687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZU2rMw7aFNypI2l6diI5iIm2rhPqMg33NxACGe4Tyg=;
        b=DIvPE3yoUMyD/r9GjaOtKb/QS4Lb0C3/sqkEo+veZGiIUmvZyfHy4eeWUpVgDc2yMj
         VHTUyMqC7fSc9XUcGLwoh80ho0GW8Qy0QGeXbqGXCQruAB0YLwd8HEWoYWiyoddek3XV
         mof9vbEJMoyLfwT3RsdYe954gpR2fiyxVeO7cyFFck7IWvsrVOtGH0jsgOe3d+nBcSAf
         WIYOLnrm3yl78cQwQtNV+odkz/v1enTHtbDQw+Qz1IfhwEdyUkjzqX6sx0MtIQh40AVR
         cOP9EAKyAXs7/EaFsd4fg2TD7wZAmLiCbkTVXpfepqAHmSQU/+147MaZiFImOpOz5ml5
         TJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVEmN7bs+Kkz3nDfI+e/bkDyESn7hCRUeCG5Z7H5rQBy8bxVqqlR9P6elbFlC49cq+Pi/s25dOhR6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp5eiwDcNGHJAULsjRC6TzkEKUH6ccIoTeVP2qlhmrfPpz0nW4
	X+VeDa8x+nhktRkl58d9OpGs7i7mqAg9FSZx0HI2dxFN5eAli7GI85tY+i8kdP0=
X-Gm-Gg: ASbGncu5gX7MoAXzmnwhq8rts2LdN33aXJiO9xrDCiOq/O2fxCXCZlJeQZJMIes6gsu
	0RFoImG4Ymnzx2is5Iqt0IxoCjqkReldQ1n/lVvhZEHC99cu/xgTjxanAiTaAH16DurHyKOd/M6
	E7T10gQDnxnRDxhgS14ADz+k49um7XpI/LwNi3hOnf5mVDY1zGUFckSTaDXLxrUU6yxHQG5m3RE
	9yliW18WOBsx+8H+Jjdz7/8Tn3M2I3Ht5ydWxr2ZBwI1mL9Lt9FXrXsNcWtnYj+HvA=
X-Google-Smtp-Source: AGHT+IGrlgmiY5VqhHCHxlAvhEi6Yk1f8mgu/4U5ZjNErcoWMIXni6SJK+Ov+D9vuAGhmZvwfqL6FQ==
X-Received: by 2002:a17:907:3ea3:b0:aac:333:a0a1 with SMTP id a640c23a62f3a-ab2c3d3e817mr1696220466b.32.1736850887183;
        Tue, 14 Jan 2025 02:34:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v2 1/3] xen/pci: do not register devices with segments >= 0x10000
Date: Tue, 14 Jan 2025 11:33:11 +0100
Message-ID: <20250114103315.51328-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250114103315.51328-1-roger.pau@citrix.com>
References: <20250114103315.51328-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current hypercall interface for doing PCI device operations always uses
a segment field that has a 16 bit width.  However on Linux there are buses
like VMD that hook up devices into the PCI hierarchy at segment >= 0x10000,
after the maximum possible segment enumerated in ACPI.

Attempting to register or manage those devices with Xen would result in
errors at best, or overlaps with existing devices living on the truncated
equivalent segment values.  Note also that the VMD segment numbers are
arbitrarily assigned by the OS, and hence there would need to be some
negotiation between Xen and the OS to agree on how to enumerate VMD
segments and devices behind them.

Skip notifying Xen about those devices.  Given how VMD bridges can
multiplex interrupts on behalf of devices behind them there's no need for
Xen to be aware of such devices for them to be usable by Linux.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust commit message width to 75 columns.
 - Expand commit message.
---
 drivers/xen/pci.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 416f231809cb..08e82fd1263e 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -43,6 +43,13 @@ static int xen_add_device(struct device *dev)
 		pci_mcfg_reserved = true;
 	}
 #endif
+
+	if (pci_domain_nr(pci_dev->bus) >> 16) {
+		dev_info(dev,
+			 "not registering with Xen: invalid PCI segment\n");
+		return 0;
+	}
+
 	if (pci_seg_supported) {
 		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
 
@@ -149,6 +156,12 @@ static int xen_remove_device(struct device *dev)
 	int r;
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 
+	if (pci_domain_nr(pci_dev->bus) >> 16) {
+		dev_info(dev,
+			 "not unregistering with Xen: invalid PCI segment\n");
+		return 0;
+	}
+
 	if (pci_seg_supported) {
 		struct physdev_pci_device device = {
 			.seg = pci_domain_nr(pci_dev->bus),
@@ -182,6 +195,12 @@ int xen_reset_device(const struct pci_dev *dev)
 		.flags = PCI_DEVICE_RESET_FLR,
 	};
 
+	if (pci_domain_nr(dev->bus) >> 16) {
+		dev_info(&dev->dev,
+			 "unable to notify Xen of device reset: invalid PCI segment\n");
+		return 0;
+	}
+
 	return HYPERVISOR_physdev_op(PHYSDEVOP_pci_device_reset, &device);
 }
 EXPORT_SYMBOL_GPL(xen_reset_device);
-- 
2.46.0


