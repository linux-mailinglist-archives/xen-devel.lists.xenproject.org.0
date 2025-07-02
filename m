Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790DAF10BF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 11:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030833.1404501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuCv-0005Zc-Bj; Wed, 02 Jul 2025 09:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030833.1404501; Wed, 02 Jul 2025 09:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuCv-0005Xc-8G; Wed, 02 Jul 2025 09:56:49 +0000
Received: by outflank-mailman (input) for mailman id 1030833;
 Wed, 02 Jul 2025 09:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuNh=ZP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWuCu-0005XW-Mk
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 09:56:48 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de4dfcd3-572a-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 11:56:48 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so3080420f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 02:56:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4538a421434sm195619435e9.37.2025.07.02.02.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 02:56:46 -0700 (PDT)
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
X-Inumbo-ID: de4dfcd3-572a-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751450207; x=1752055007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Htsf62fHZXCM2ecupDyN5l6pRsivz8v6y1I8qAW0u6c=;
        b=aaXqnQSyf3N99fpxp8w/DPHPNHgIc3DZAdljueyXsgp7MmURbQZXuimBNuIcW5jI7d
         rGIkQ9m6+n1B3EaWbIeEQ2RzO59t4iOIoR4r0yJR517wcbkRp52ekyUmLeQyqTn/rgRe
         o3SHenwWeIdUhjP8F9Y/TcqjGhTXjWvsVsw1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450207; x=1752055007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Htsf62fHZXCM2ecupDyN5l6pRsivz8v6y1I8qAW0u6c=;
        b=XZdlqvOh3kOT+T9xIk2cjrBNDvcD4lr9+t4PXM73eOHvIRMAw1GNc7/nHVoasBLhpc
         DuHo+Q2jggDt5mAA8GvoFDJlS2zOYhyAfQG8Y/YNyULtUun9pKufZakbB1UfL2/TbFSR
         xvxe25GcekLVWnxIPNlzC1F04BV0y+EvUOzrh47EyQ4M4tI2kSJMNSWoqG6hGnU2WVay
         IWdwjmEc7I2ecHYDCPhex6QLd86fN3rqR+XBKQ3roMFkDX13Lo439PlHAF/61cGP1DH9
         rz+3V3wvoJ3ke0xqk+eQjotu/XcxRtEDuKexkBWORzZXEzBmRGYQIi+Oh5zQFwGbHjBf
         9AbQ==
X-Gm-Message-State: AOJu0YzMdPpnhvf30L9kRS3ewydR0OEpD0nzfl+wXYAb4KnWTjeIeKQH
	CMoX4+NkOBKaPDe+6rSXJQYPCC1t904r6U87Jrj2YPuOonNNSZQR5uoM4OIbGuqe+b9to/OH8cw
	XmJip
X-Gm-Gg: ASbGncuiV1uP/dVwHQevhdALQt6VVlqUeLlgaPD1Z8grNUMfzkqKiIbAEU2UYWxLbtF
	pQHVirIimaOSe53KjjBJY6EWI6+fMXXehJmJ1tZEFYogwdBkpHaoITTYL6M0Xas+vOG7BLnnIm8
	YkpzyuBaL8D5B9v69kIKRV3yGyKxn+p5BMUasc8KApXQvDSa8TDt2UZT0oKxiTRnH8lpVtisFU6
	mOHX7kvjoBKh3+Vzp9WV/Lxfx0WXdMIvHrOfvXvPXJToLauIRPfpX5dMOyrrbh4huUTokKbROs5
	GAdn0hUoLAe+YQhT6YoQUmdOSK/cfm6sUCgs6has2nI311bLAhwuR+BJ2ItUGch2UOwHgl02I5T
	+WRwiHwuK3+CNK6CM0RGKtOu9OIsyWA==
X-Google-Smtp-Source: AGHT+IHdWPMaSBpTj7cRc2BSp3T5WJXBETsvT7OSqtBlZ1ZeJiX3FF98kEewRc7XVdjCi8K6Ek4ARA==
X-Received: by 2002:a05:6000:481d:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3b1ff524e0fmr1638246f8f.23.1751450206899;
        Wed, 02 Jul 2025 02:56:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/golang: update auto-generated libxl based types
Date: Wed,  2 Jul 2025 11:56:39 +0200
Message-ID: <20250702095639.90927-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As a result of the addition of a new field in libxl domain build info
structure the golang types need to be regnerated, this was missing as part
of 22650d6054.

Regenerate the headers now.

Reported-by: Juergen Gross <jgross@suse.com>
Fixes: 22650d605462 ('x86/hvmloader: select xen platform pci MMIO BAR UC or WB MTRR cache attribute')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/golang/xenlight/helpers.gen.go | 6 ++++++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 191be8729775..c45df1005f2f 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1277,6 +1277,9 @@ x.Soundhw = C.GoString(tmp.soundhw)
 if err := x.XenPlatformPci.fromC(&tmp.xen_platform_pci);err != nil {
 return fmt.Errorf("converting field XenPlatformPci: %v", err)
 }
+if err := x.XenPlatformPciBarUc.fromC(&tmp.xen_platform_pci_bar_uc);err != nil {
+return fmt.Errorf("converting field XenPlatformPciBarUc: %v", err)
+}
 if err := x.UsbdeviceList.fromC(&tmp.usbdevice_list);err != nil {
 return fmt.Errorf("converting field UsbdeviceList: %v", err)
 }
@@ -1621,6 +1624,9 @@ hvm.soundhw = C.CString(tmp.Soundhw)}
 if err := tmp.XenPlatformPci.toC(&hvm.xen_platform_pci); err != nil {
 return fmt.Errorf("converting field XenPlatformPci: %v", err)
 }
+if err := tmp.XenPlatformPciBarUc.toC(&hvm.xen_platform_pci_bar_uc); err != nil {
+return fmt.Errorf("converting field XenPlatformPciBarUc: %v", err)
+}
 if err := tmp.UsbdeviceList.toC(&hvm.usbdevice_list); err != nil {
 return fmt.Errorf("converting field UsbdeviceList: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 656933c6c9ee..61e322f20ae0 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -654,6 +654,7 @@ Usbdevice string
 VkbDevice Defbool
 Soundhw string
 XenPlatformPci Defbool
+XenPlatformPciBarUc Defbool
 UsbdeviceList StringList
 VendorDevice VendorDevice
 MsVmGenid MsVmGenid
-- 
2.49.0


