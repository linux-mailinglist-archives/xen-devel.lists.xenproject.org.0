Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1E901A21
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 07:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736846.1142931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGXK1-0003Gs-G4; Mon, 10 Jun 2024 05:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736846.1142931; Mon, 10 Jun 2024 05:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGXK1-0003FL-CY; Mon, 10 Jun 2024 05:11:57 +0000
Received: by outflank-mailman (input) for mailman id 736846;
 Sun, 09 Jun 2024 18:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSGE=NL=gmail.com=jain.abhinav177@srs-se1.protection.inumbo.net>)
 id 1sGNWp-0001TT-R1
 for xen-devel@lists.xenproject.org; Sun, 09 Jun 2024 18:44:31 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db7e3a7-2690-11ef-90a2-e314d9c70b13;
 Sun, 09 Jun 2024 20:44:30 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-704261a1f67so887901b3a.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 11:44:30 -0700 (PDT)
Received: from dev0.. ([132.154.51.183]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6e2b38167a2sm3714385a12.90.2024.06.09.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 11:44:28 -0700 (PDT)
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
X-Inumbo-ID: 4db7e3a7-2690-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717958668; x=1718563468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUUN5jvMypW6P+Pp1YvyXgjvxQ678L4ijvc2XJHbh1A=;
        b=AGN9YmvmorPQ3+LWljXpwdOcvwq0QiuVBdNR2yfO/bOKI10cJC8w1eIXka62kxcsXy
         GL+bCzQZkqv8Vkfxxmr5O+RAVEkyh0EbK2Cn7zq4aNy1PIFgRgTaHfsOU27JyVAYCKw3
         0kWHJC0IRy81n0KVTd035PlVtWO2fqPeLgnM+s8o51Cxj6xcHIVkJ+b6R0Z0USOsMd53
         xtaGJXG3+XwR0Y9LYVnadZHp43oeUChwq3FIpaBh7XO7L109N/z++uJm98DOglmJljWb
         2OJ2+hkXSbTYoGnQj7wAPSl0aiVQTB6snmXXVd3P+Ir+ootBQzmoFYk6D4fCfcGRqE2k
         BWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717958668; x=1718563468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUUN5jvMypW6P+Pp1YvyXgjvxQ678L4ijvc2XJHbh1A=;
        b=KE68/JB9CpjH8QZDIoGXUHs6wyqOVnPdsf2omAhwDg/OMvvfoU93HJNLiO9SP3MZjq
         1y2PndJKt9nn2n8Hwr3oNoqDtFRUsI/fjEMmZmWH08X9WPfeNdEyo47bboVN3T+sexiX
         kp3zQvwyfx+G+xhnGfIQ8hIMlY7mW1JXo6YbTHv8ivTSJAVRx0eCpZYANuY5+hiK5N6R
         P7oLmEVQNPqYPVLPCHO9OXmrVSqxzbqnjuh5ooEo0bvLhnXZagaEle3BJnSs0W2SYy7x
         IAFTQ7l8ZGx4ehWhLQp51dL10xtE9/FPswLI3wjPltWpBPVs8qFVBA4Y43aMbZm6GbOq
         Evzw==
X-Forwarded-Encrypted: i=1; AJvYcCVdtdldg6e0zSpHfVn0efDYe6JiQG+BGyE97S7r9PiT+voLLarS3ETto1RcuVmsfGJvppIbsmefOdP+xZjTfRqk4Swrgn2UAbmF7RktXeI=
X-Gm-Message-State: AOJu0YwevMZKbXXWSD7iqaL4aFsj8MJ6bSVQhzxv1NSd2W5iihkBSbAe
	s8dTh+IIHUfKonqYDwWBpeAMq2v1dWpHAtyaqAYy7izB9rPky0Vg
X-Google-Smtp-Source: AGHT+IHKKiBJNRWQNNKgV62vwr/OlJ+hKJrqkVpM54C1atGqjWvBWdpuEMXjHXRaNIX0ePqrcNmTIg==
X-Received: by 2002:a05:6a00:17a3:b0:705:96b5:8bf2 with SMTP id d2e1a72fcca58-70596b596a2mr946312b3a.3.1717958668561;
        Sun, 09 Jun 2024 11:44:28 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	jain.abhinav177@gmail.com
Subject: [PATCH] xen: xen-pciback: Export a bridge and all its children as per TODO
Date: Sun,  9 Jun 2024 18:44:10 +0000
Message-Id: <20240609184410.53500-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if the device is a bridge.
If it is a bridge, iterate over all its child devices and export them.
Log error if the export fails for any particular device logging details.
Export error string is split across lines as I could see several
other such occurrences in the file.
Please let me know if I should change it in some way.

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 39 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b11e401f1b1e..d15271d33ad6 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -258,14 +258,37 @@ static int xen_pcibk_export_device(struct xen_pcibk_device *pdev,
 		xen_register_device_domain_owner(dev, pdev->xdev->otherend_id);
 	}
 
-	/* TODO: It'd be nice to export a bridge and have all of its children
-	 * get exported with it. This may be best done in xend (which will
-	 * have to calculate resource usage anyway) but we probably want to
-	 * put something in here to ensure that if a bridge gets given to a
-	 * driver domain, that all devices under that bridge are not given
-	 * to other driver domains (as he who controls the bridge can disable
-	 * it and stop the other devices from working).
-	 */
+	/* Check if the device is a bridge and export all its children */
+	if ((dev->hdr_type && PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
+		struct pci_dev *child = NULL;
+
+		/* Iterate over all the devices in this bridge */
+		list_for_each_entry(child, &dev->subordinate->devices,
+				bus_list) {
+			dev_dbg(&pdev->xdev->dev,
+				"exporting child device %04x:%02x:%02x.%d\n",
+				child->domain, child->bus->number,
+				PCI_SLOT(child->devfn),
+				PCI_FUNC(child->devfn));
+
+			err = xen_pcibk_export_device(pdev,
+						      child->domain,
+						      child->bus->number,
+						      PCI_SLOT(child->devfn),
+						      PCI_FUNC(child->devfn),
+						      devid);
+			if (err) {
+				dev_err(&pdev->xdev->dev,
+					"failed to export child device : "
+					"%04x:%02x:%02x.%d\n",
+					child->domain,
+					child->bus->number,
+					PCI_SLOT(child->devfn),
+					PCI_FUNC(child->devfn));
+				goto out;
+			}
+		}
+	}
 out:
 	return err;
 }
-- 
2.34.1


