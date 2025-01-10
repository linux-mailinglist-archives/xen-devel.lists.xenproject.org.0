Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5DBA092D1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869651.1281105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaL-0008NJ-8k; Fri, 10 Jan 2025 14:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869651.1281105; Fri, 10 Jan 2025 14:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaL-0008Lp-66; Fri, 10 Jan 2025 14:02:01 +0000
Received: by outflank-mailman (input) for mailman id 869651;
 Fri, 10 Jan 2025 14:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWFaK-00087j-HY
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:02:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d56e1f-cf5b-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:01:59 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso396605266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:02:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af680sm172606166b.141.2025.01.10.06.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:01:58 -0800 (PST)
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
X-Inumbo-ID: 75d56e1f-cf5b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736517719; x=1737122519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/I7HoDRHZV0XTx2nTCcpli5SpYI0/lHKSshoL/AVNY=;
        b=QMinFTb7SbAa341SjgNGEyyBkdnnG5yi+3eqU9cWVeAoyldRz6kHfZtrMTHPPNHSVi
         C1XFLytJS6HM3QudySM16wCcgiHcXJHKSrup3U6j+ehsdooENjKcSEjQ8OrpLsVuhT0d
         hDIZCuFMOpqOI55mnNWKBBsh5oeoUDDTSvidc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517719; x=1737122519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/I7HoDRHZV0XTx2nTCcpli5SpYI0/lHKSshoL/AVNY=;
        b=h7iejfp883N1VdvX9UARZ+1C62h/P0dboNePuQXqxRE1MEH9VRZ3yeylNu5M5jRlHF
         ygJgL6OcwlQLtoGq5y5MP9bF2mHgVXs1Uxg9++Fg7T9tZLmD2V6HXyJL86ROtUygG/qf
         JR8PwbTHjPVZ+PocyFH7UmV4FqaoirMlRVVKMNhtGapkkSTlVDPziPsQua3eTf8Fr0Tr
         fCEOgvPy7L9a05ToTKkxg6Rxe/PKa8mvUzlPw5abRUY5mBdUf2MscCMdCSvJR/mHTK1Z
         5rNwQAZpZZYskln1rAUWAOCQZEUx/azVgd32vZq5sTsxrNqSkjOCRUoYafQRSXDh5sKP
         uHsw==
X-Forwarded-Encrypted: i=1; AJvYcCUpZoKL7RkCA9YQwGjQOpDgataz5ls89gWPDQqLSqIvpI2fdQ8v1dbIY5IDDFsObqN+egVB02gvPU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOmuG3ctGO8MiO8ZuK+aQx9HPFFs1F9fJ3Pgul6bEujSwrUxiP
	tMT2wNKT+2OJpkbhJ7o57HmcAJXTZzJvGfEU6sI9hwCq7ep3Tj45jdIMyVyFE14=
X-Gm-Gg: ASbGncurGt2Wd22JaTu9/D+uIcq7yzu9F9n4zH8W58Is62WFgwkKM9kwBzYX0Upm6ri
	n6uSkJKxAXpt7UUYFf20ojvjiRMCQcg1xKyudc13Lmmcf2AtFDCadUTmXPpicP/R77ReUT1cf6k
	kvDWmTjTpgAi23Qa6nr5/etWp//5pLlYkVD2DlDOfIyIWoEoPs4Qb1KVyL4opaSfc9TxmXWonkI
	cSwBrS0F89GDyuqq345CyZ81zBC8M3aYBfCRz8Z6OPueOqN5QockFwJhC8ItG4l19A=
X-Google-Smtp-Source: AGHT+IHQABlx0ljsChy/AaNgLOa5tG+fbxwnozWPPmywCwKrdUKAOZN8SDFE4NcVHC8wzrW5y/A8Dw==
X-Received: by 2002:a17:907:c588:b0:ab2:c208:732d with SMTP id a640c23a62f3a-ab2c2087cbbmr743393166b.40.1736517719125;
        Fri, 10 Jan 2025 06:01:59 -0800 (PST)
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
Subject: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Date: Fri, 10 Jan 2025 15:01:49 +0100
Message-ID: <20250110140152.27624-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110140152.27624-1-roger.pau@citrix.com>
References: <20250110140152.27624-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MSI remapping bypass (directly configuring MSI entries for devices on the VMD
bus) won't work under Xen, as Xen is not aware of devices in such bus, and
hence cannot configure the entries using the pIRQ interface in the PV case, and
in the PVH case traps won't be setup for MSI entries for such devices.

Until Xen is aware of devices in the VMD bus prevent the
VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as any
kind of Xen guest.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/pci/controller/vmd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 264a180403a0..d9b7510ace29 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -965,6 +965,15 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct vmd_dev *vmd;
 	int err;
 
+	if (xen_domain())
+		/*
+		 * Xen doesn't have knowledge about devices in the VMD bus.
+		 * Bypass of MSI remapping won't work in that case as direct
+		 * write to the MSI entries won't result in functional
+		 * interrupts.
+		 */
+		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
+
 	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
 		return -ENOMEM;
 
-- 
2.46.0


