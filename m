Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE62A3B836
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892511.1301487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHZ-0008QO-Pb; Wed, 19 Feb 2025 09:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892511.1301487; Wed, 19 Feb 2025 09:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHZ-0008Og-MQ; Wed, 19 Feb 2025 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 892511;
 Wed, 19 Feb 2025 09:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkgHY-00082q-Eu
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:22:16 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d368d1-eea3-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 10:22:15 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-220bff984a0so116188365ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:22:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5348e68sm101300795ad.28.2025.02.19.01.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:22:13 -0800 (PST)
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
X-Inumbo-ID: 01d368d1-eea3-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739956934; x=1740561734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZJg6bVS4EQSvqcvYB18UYZOZ9WdLOPfmEHjgud3AfI=;
        b=vsFlE8k6dfFN8uEkx8rfLF+cVkGYb+3AQtDtEBe7wUq07MEPlH7fyy4rafS9xldvaS
         JKji4HPGSDklymQDdt9KgHtpKBNO/aMVE73jn9cGNC/ysLyoaMvsOgQSyISo/tZU5GPd
         Y56VMmTbBEB4WidBSp0R2lxNtsFU+73ZtQcJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956934; x=1740561734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZJg6bVS4EQSvqcvYB18UYZOZ9WdLOPfmEHjgud3AfI=;
        b=t8h6poOyDEgfoMdRSnhhkjs77MoDFq9sq+sLp2IJPnIMJZa7gptANtSOuBIIyQILDd
         JCkewBA1JoJw5lQjf5T9v5fUAOG0r7SVqSv3VWF3Gl/mMkV+YvRiMUyBPGpVhVygvkVG
         zoF9zvRr/E3t7YNAstLytLWtxXgL9AVEhURvtRAMWnargzxw0VaBhPlTS35O/u/GEvAZ
         cz1kEMN0cUH1jRMsqOYx1l4Z5A6DOgJ9sKOX6Z8d3RbLGjp8YGbfJ45LW8SxdrZXQJcJ
         1ws95ognKKpD7j3DG1+tmrhrsRlMUP6zzHVfo4LGH0xUkY00q3LWCGPlNG1kpN0tW97T
         3MMA==
X-Forwarded-Encrypted: i=1; AJvYcCVpObdthNtDMa3Kx+AGbE6izksgpvXc/AjcR7kMr1xa/MQFtLaRucsU+3xbtNb5cjJz3UzqVSmnvC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxooO+MqISSjCkshM9dLkG7CuaEsDbf5l7smBjxvVmubz8/cZqz
	EP6X+UK3IpE8e5KT8p6/klrz6pmvugZXSqM93/GekEQMDhR7eNFBhsNHdSZ08/8=
X-Gm-Gg: ASbGnctw7Dyhzi5fErLkMCY1yeGVhpuZ8a3S6BHn/O4i5dZIw2n0gY4I9r2g0eIV7Z+
	6GXNnO9zCGd6GIdmJArCP5QO3tF/ruzyHkuVT4TKmF9dN/zXgmpzXIejQ+cTkqufFhRb2n2ikSD
	kxJsTD6hVjNHofjwVbXm7VGHCC3AYUEhmJW4Q/HjDE1lqlh+hvXQtdd/gpwDpo++H6Z3uM8xk+a
	oEHtGbDTFl7/Klt85xu0W18t6mCAbfZ303I+29G2lAKegFntcKepGGHR0BvbJtffGxImgnUr/Q2
	5+VOLUlDMschQm9HHMr+
X-Google-Smtp-Source: AGHT+IH2CJE5OkGckIlv4JN5MuajJLAOUuGuc18ZFqOtmBHZImObUq5mVTJXCcZHX2k+NCDuJBVy7A==
X-Received: by 2002:a17:903:41c8:b0:215:853d:38 with SMTP id d9443c01a7336-2210405d2ffmr289308605ad.25.1739956934306;
        Wed, 19 Feb 2025 01:22:14 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v3 1/3] xen/pci: Do not register devices with segments >= 0x10000
Date: Wed, 19 Feb 2025 10:20:55 +0100
Message-ID: <20250219092059.90850-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219092059.90850-1-roger.pau@citrix.com>
References: <20250219092059.90850-1-roger.pau@citrix.com>
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
Acked-by: Juergen Gross <jgross@suse.com>
---
Changes since v2:
 - Capitalize subject.
 - Add extra comments to note thet 16bit segments value hypercall interface
   limitation.

Changes since v1:
 - Adjust commit message width to 75 columns.
 - Expand commit message.
---
 drivers/xen/pci.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 416f231809cb..bfe07adb3e3a 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -43,6 +43,18 @@ static int xen_add_device(struct device *dev)
 		pci_mcfg_reserved = true;
 	}
 #endif
+
+	if (pci_domain_nr(pci_dev->bus) >> 16) {
+		/*
+		 * The hypercall interface is limited to 16bit PCI segment
+		 * values, do not attempt to register devices with Xen in
+		 * segments greater or equal than 0x10000.
+		 */
+		dev_info(dev,
+			 "not registering with Xen: invalid PCI segment\n");
+		return 0;
+	}
+
 	if (pci_seg_supported) {
 		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
 
@@ -149,6 +161,16 @@ static int xen_remove_device(struct device *dev)
 	int r;
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 
+	if (pci_domain_nr(pci_dev->bus) >> 16) {
+		/*
+		 * The hypercall interface is limited to 16bit PCI segment
+		 * values.
+		 */
+		dev_info(dev,
+			 "not unregistering with Xen: invalid PCI segment\n");
+		return 0;
+	}
+
 	if (pci_seg_supported) {
 		struct physdev_pci_device device = {
 			.seg = pci_domain_nr(pci_dev->bus),
@@ -182,6 +204,16 @@ int xen_reset_device(const struct pci_dev *dev)
 		.flags = PCI_DEVICE_RESET_FLR,
 	};
 
+	if (pci_domain_nr(dev->bus) >> 16) {
+		/*
+		 * The hypercall interface is limited to 16bit PCI segment
+		 * values.
+		 */
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


