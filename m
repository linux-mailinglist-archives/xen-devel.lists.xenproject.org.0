Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D4A441BC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 15:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895817.1304459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmvYn-0007rP-7s; Tue, 25 Feb 2025 14:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895817.1304459; Tue, 25 Feb 2025 14:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmvYn-0007pc-4q; Tue, 25 Feb 2025 14:05:21 +0000
Received: by outflank-mailman (input) for mailman id 895817;
 Tue, 25 Feb 2025 14:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7elt=VQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tmvYl-0007pW-Kt
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 14:05:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1c93d7-f381-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 15:05:18 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso224646366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 06:05:18 -0800 (PST)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbef5sm149367966b.14.2025.02.25.06.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 06:05:16 -0800 (PST)
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
X-Inumbo-ID: 8b1c93d7-f381-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740492317; x=1741097117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6461ban+1g2qu9SgG0oSTcJISIZ7Z8nL0LN7J32hL00=;
        b=iGKkoZD0GTIj8EjeM0hCSZel2jsZbdg7+u5YHlsHV7Vw4ihanvsbyl7ROgDL6t73TO
         8rca7LL80FJ8xE+AmoQOEs5VPrgoxiuAMGzcfhfF9txKg0W+cUiSDw5cruhE3ucHyZv9
         CC/DYgWpnxER9sxvVsyk/kv0tiimmX9rlhfv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492317; x=1741097117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6461ban+1g2qu9SgG0oSTcJISIZ7Z8nL0LN7J32hL00=;
        b=hXl1qRjPjpd9r8qbz5GXz2CIGGtMpZG+I0idwJspRorO+X6WAbH/agM9K4sFT1eiLU
         gbrw/ZbNFi7MTP4nh2yU88jfnaVHdh3G7biJR3MusPZtNpMlrQNYCYaaUC/GRQjqrIsG
         jrojvAWjKf7ypWfS0+JbDkACAXMQcelBWbY0zdh472+CAwS57lKI5kdpqSPynNsLngkc
         iQprtzE4pO5hhcC6ksg/3bC1xe2EZG33qsuU0QxQ+3uCJZ2Ctn7Uc6WVof7HzRQMs6e4
         VVDmw8cjLuNpwVpEYZ/ArpAHZ0MH0Fp9hnCzcgtvjR3Q72/DybLMy6475flIAULYl9rO
         DocA==
X-Gm-Message-State: AOJu0YydNXUlwmLr9sfHQKJmQLJh8cqxu5EHr6LAx2Fprlvob2Y8vYdH
	kUDoLD/tLapPhS6lpq0aMLMMo37nuSf1bIP2Rkom5VWZ3n4BitWhp3OOZuXHhXGQnIjfwQoAY7Y
	t
X-Gm-Gg: ASbGnctrlGAvfBfWHhRG/AIefvKOSoWOoL50mOnv0AAk2GbOZEZP2Nyaxf6xNr/OVdd
	WxFHFvMyZ1YjehUiEcyAdaKaJDZ5vGK3BHBjq+hWUvjCUlO9E7Hrvqa6iOcNljOn9cY6T5TVeca
	nZxmKWB8O48wi+TzoSw1iR6JxdkDk+AmO/yj91a8ygnxeKCnwouSwJdtI0GGAo/mzcGbE/QVpSD
	gQAlCg2PVx50YnDHwUY213zXGQdtQC7JPfIYOTR9y1zw2Tqz3ESWCq3HFNT2fh/IHaCl4cnXBMd
	42ZSI5QgUHXNh/V2SYhxQFkSt0g97B7CswNtta4zCKocTikkAER4+ZESOlrf6jy9MA==
X-Google-Smtp-Source: AGHT+IF9aVZ271pd7Rivr+4PMLzSxl4QN0DdFXBiXSE8kbbx+f24AkB2D93JM67HV9at4+50ibsh4g==
X-Received: by 2002:a17:906:7950:b0:ab7:63fa:e4ab with SMTP id a640c23a62f3a-abc0cd0b6bamr1855443966b.0.1740492317294;
        Tue, 25 Feb 2025 06:05:17 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Juergen Gross" <jgross@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
	"Bjorn Helgaas" <bhelgaas@google.com>
Subject: [PATCH] xen: Add support for XenServer 6.1 platform device
Date: Tue, 25 Feb 2025 14:03:53 +0000
Message-ID: <20250225140400.23992-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On XenServer on Windows machine a platform device with ID 2 instead of
1 is used.
This device is mainly identical to device 1 but due to some Windows
update behaviour it was decided to use a device with a different ID.
This causes compatibility issues with Linux which expects, if Xen
is detected, to find a Xen platform device (5853:0001) otherwise code
will crash due to some missing initialization (specifically grant
tables).
The device 2 is presented by Xapi adding device specification to
Qemu command line.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 drivers/xen/platform-pci.c | 2 ++
 include/linux/pci_ids.h    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 544d3f9010b9..9cefc7d6bcba 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -174,6 +174,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 static const struct pci_device_id platform_pci_tbl[] = {
 	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM,
 		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61,
+		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{0,}
 };
 
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1a2594a38199..e4791fd97ee0 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3241,6 +3241,7 @@
 
 #define PCI_VENDOR_ID_XEN		0x5853
 #define PCI_DEVICE_ID_XEN_PLATFORM	0x0001
+#define PCI_DEVICE_ID_XEN_PLATFORM_XS61	0x0002
 
 #define PCI_VENDOR_ID_OCZ		0x1b85
 
-- 
2.48.1


