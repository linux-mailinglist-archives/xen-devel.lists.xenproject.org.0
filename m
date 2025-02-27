Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698BA48200
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898182.1306763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfDc-0001AZ-Fa; Thu, 27 Feb 2025 14:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898182.1306763; Thu, 27 Feb 2025 14:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfDc-00017m-BA; Thu, 27 Feb 2025 14:50:32 +0000
Received: by outflank-mailman (input) for mailman id 898182;
 Thu, 27 Feb 2025 14:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcRf=VS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tnfDa-00012A-Pk
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:50:30 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fceebe5-f51a-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 15:50:29 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5dedae49c63so1768300a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:50:29 -0800 (PST)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb5927sm1169710a12.53.2025.02.27.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:50:26 -0800 (PST)
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
X-Inumbo-ID: 2fceebe5-f51a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740667828; x=1741272628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL7GQVjUzjLg9lk8430dC5QosMySgAdQwlmn75yWWQY=;
        b=PSfBhnnhdGyC7cZaOn8Y6kHfD9xOG06zSWnm5DsWVR18+MF6DAJeTMbg91OLstWy8n
         82B44892655HrCxVPnZPzJLkDklSSzh5vGbDMDoY2pEGaLPMeoXDgVrwV3Mqrwjse+ek
         bb/TMFUhMxSxKoxmuhgTcwqhCOR55WGiI6LtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667828; x=1741272628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DL7GQVjUzjLg9lk8430dC5QosMySgAdQwlmn75yWWQY=;
        b=JXOaIkmiWyutrJ0j4ziUwNcIoUGq3/+Pl5KiNZaCdde/q8AYn6iXu1J6bTJuFxmTrS
         +3dWByb+mxfZfSEOK82YcNskPPC9WcO+cC9TkTP8CygK0xu8OQCKWwvn75LTPKGOLP35
         ngy4BM1J9iupiuUODPsmn2mnAmd+4r9KoSUj3tqf+n8MU441KXVijcVC8wBP/Rq4B947
         NZ29D6zDZOffmnSuu5q8VaPqekMwnocCaNx1Uuu6AcaMoBraxGukPYPAzO9CHrFCaWgg
         cEKpe8DzTZ9hVyihpOWNbJ6wGNoJUIVQEf+6RtboB/YMtvgg7kjzzMhv2HEGTdsTZ/Ie
         rPJg==
X-Gm-Message-State: AOJu0YxPhAQ9eV9qv7EY5rISX2ViIDMf+5fV3LMhTl7KE+CwA3o6wtOK
	9xzsW7VlRPIhDOllgyas5JurH6ASAhGDsRcoOFmJCubD3MIRKL9IldKYLJihcrV95d5T+jQp0En
	h
X-Gm-Gg: ASbGnctZnGk6C99DymsW52lFOvOHd6q86SBNyzmEDUqDrI51ibeT+wQ2GAj8FTnYftT
	H0kxt+/WNWKMoxHp6f67fCHd/QnMwlWkOUAXcMWhJDwevbACyKKO/mGGzHQJnU7DaFQDJq/p5IK
	YP9FZzwhMzckecz1R8oUOhCJj7+qE4aucnVpa0r9g0pcFZogoaRRrwBJiUiqKk/Bg1jd19VBCQj
	E7J4f5GAcaAH6MEOr+5XODB2EmGgMVMOFUBce6V8aYGhnLLxBfIU63IKKJIO7V1yG4V2+gGHgZc
	zNnR322gPAEh3F23F0bRpjqhIOKdIeKoSzi+eXqVFlPX9HqA46yOkdZujOl5YA9PBg==
X-Google-Smtp-Source: AGHT+IGRvMe2rXEL5ocoy5Zl+QpTBISfmDkxZx112r9QomOkAyIB+XxUpSAYrFRY61XCOHlRKjn34w==
X-Received: by 2002:a05:6402:430f:b0:5e0:4710:5f47 with SMTP id 4fb4d7f45d1cf-5e0b7243e16mr27359409a12.23.1740667827673;
        Thu, 27 Feb 2025 06:50:27 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Juergen Gross" <jgross@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
	"Bjorn Helgaas" <bhelgaas@google.com>
Subject: [PATCH v2] xen: Add support for XenServer 6.1 platform device
Date: Thu, 27 Feb 2025 14:50:15 +0000
Message-ID: <20250227145016.25350-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225140400.23992-1-frediano.ziglio@cloud.com>
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On XenServer on Windows machine a platform device with ID 2 instead of
1 is used.

This device is mainly identical to device 1 but due to some Windows
update behaviour it was decided to use a device with a different ID.

This causes compatibility issues with Linux which expects, if Xen
is detected, to find a Xen platform device (5853:0001) otherwise code
will crash due to some missing initialization (specifically grant
tables). Specifically from dmesg

    RIP: 0010:gnttab_expand+0x29/0x210
    Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89 fd
          41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49 02
          <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff ff
          44 39
    RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086
    ...

The device 2 is presented by Xapi adding device specification to
Qemu command line.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 drivers/xen/platform-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 544d3f9010b9..1db82da56db6 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -26,6 +26,8 @@
 
 #define DRV_NAME    "xen-platform-pci"
 
+#define PCI_DEVICE_ID_XEN_PLATFORM_XS61	0x0002
+
 static unsigned long platform_mmio;
 static unsigned long platform_mmio_alloc;
 static unsigned long platform_mmiolen;
@@ -174,6 +176,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 static const struct pci_device_id platform_pci_tbl[] = {
 	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM,
 		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61,
+		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{0,}
 };
 
-- 
2.48.1

