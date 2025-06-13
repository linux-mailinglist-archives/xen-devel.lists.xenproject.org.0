Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D39CAD8905
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 12:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014181.1392421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1Pq-0001wR-Sr; Fri, 13 Jun 2025 10:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014181.1392421; Fri, 13 Jun 2025 10:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1Pq-0001ty-P1; Fri, 13 Jun 2025 10:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1014181;
 Fri, 13 Jun 2025 10:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkHq=Y4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uQ1Pp-0001ZT-Q5
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 10:13:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d252ff-483f-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 12:13:38 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so16103875e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 03:13:38 -0700 (PDT)
Received: from localhost.localdomain (188.226.6.51.dyn.plus.net.
 [51.6.226.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b7741bsm1908658f8f.98.2025.06.13.03.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 03:13:37 -0700 (PDT)
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
X-Inumbo-ID: 12d252ff-483f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749809618; x=1750414418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1g0iRNh3eWaIg453dC2caqEusUjyjQC++hqpu26lyrk=;
        b=C442qQFFupaR4cMxB/HFXW+1oCbwsYb177rmrHehPqkCBWtD+XWfuB2ZzjLu/VQoBK
         rqge1BgsHMapldKbTKiIXL9upr2eyu6wPkJz9k7oofO++LoYL4HX2mHvS/+M6orJW3B8
         uYNOnUSlA4Y3A8XlxmvKJj7DmFZECGXPBeSlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749809618; x=1750414418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1g0iRNh3eWaIg453dC2caqEusUjyjQC++hqpu26lyrk=;
        b=pHHeJae1+mgCyUrPMlQmA7mVFz0fxAfNOi3MoorCno2Pij5DvcSDUB6P9ujgr+2r+k
         O21qkd6Qpfs4zUOdJ60ASCnlJDD19TnDxzqVzhP8UELDYiUb4D1ypKxF55mFdXvz+Flz
         gGD8DqUDoxTynAJQzDpnBs9krIiamRfSunGyAIMTiua2QSuY2D6TNQoHWYhxqSiwM7fE
         HykNElSK9lIkz6VG77n7V08xpLqlNt6qgYvkKCUXATY778s86BrAXgXtH7nhyPRJekZ6
         PoSvW6Iecm8yp9X2b/8LG7tflRW/peaAIyQM2Uw2njz0+btD+vJKdvxSeGlHS/RX+ePc
         Tt+A==
X-Gm-Message-State: AOJu0YzHjKFlpRl4k0VxNBo9r3i8OFJC00rr4fSuRI/Jhwro5uU9qs8m
	CWFoNgewGJzh7dwXLdFlkIRYfECyJvMfLijfY+anA2UgBdDvN0p53uSGw3HWNb3L3rmEsxGKd+6
	E4zOld7Y=
X-Gm-Gg: ASbGncvPJ4kT5B4YxEspa8LVdxrMwqBA0EmPkcvRYmulVVS5nIiJcn1Hvqs8YbRaiZx
	FkjRhC61KyLfeW7uoCF8TUrmqDvX1wXFPGCZ+ZjNb85u8UFvQ0NIc5FeiHy03hf9WK+pZSmgLy8
	oB4cke2td9WTiP+R2QXDZPa4yUgDEdNVLwzVrU3jQx9bBNNxtLrS7343qKoxqImj4UPk5agz65m
	cXBFe2z+zrbfWF2yLKBb+JRopk9YmG9kFX3djxVdoc6Oi+GG1iMbTyCCwHB6BVP5CUgXK9oceBJ
	0kCD+Kn4SE8vSh0lSXXld2h9JMtE//CIXR7qtrxsbko10NkSYOrbaHqpM/04jIxvUjS6bVdrsd9
	2odKCATjuxvwuIA22B3S38Kw6NIlQnw==
X-Google-Smtp-Source: AGHT+IGfth0o918N3ezBc4IxajMTow9a3lvStQGcrOpV1RbH+j39h+zN5BGWfFdqPEAyTfy+k3l9cg==
X-Received: by 2002:a05:600c:6095:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-45334b0fc1emr25217705e9.14.1749809617714;
        Fri, 13 Jun 2025 03:13:37 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] drivers/pci: Add minor comment for maximum capability constant
Date: Fri, 13 Jun 2025 11:13:32 +0100
Message-ID: <20250613101334.164310-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment is similar to extended capabilities in the function
below.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index acf4cebe42..e1ddde90eb 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -11,7 +11,7 @@
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
 {
     u8 id;
-    int max_cap = 48;
+    int max_cap = 48; /* 192 bytes, minimum 4 bytes per capability */
     u8 pos = PCI_CAPABILITY_LIST;
     u16 status;
 
-- 
2.43.0


