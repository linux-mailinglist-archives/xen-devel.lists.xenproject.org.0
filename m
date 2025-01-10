Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC29A092D8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869652.1281116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaX-0000If-GK; Fri, 10 Jan 2025 14:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869652.1281116; Fri, 10 Jan 2025 14:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFaX-0000GP-CO; Fri, 10 Jan 2025 14:02:13 +0000
Received: by outflank-mailman (input) for mailman id 869652;
 Fri, 10 Jan 2025 14:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWFaW-00087j-H0
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:02:12 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cf7048a-cf5b-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:02:11 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso2788498a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:02:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9645408sm167312266b.166.2025.01.10.06.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:01:56 -0800 (PST)
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
X-Inumbo-ID: 7cf7048a-cf5b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736517731; x=1737122531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOPaP/mU6vt7fi9w+3JVCzGSZ59QyAsOxxCexGJ2z2A=;
        b=lgqmdGsm7aX+MHobDZxNnSbI6MFy2MGYFbrvlAudAwgFTdmpJ2oIKGBAXSOqreqtx5
         ob4qyVDIgd7UieAmXi+j9IwJo/4FPSz+bvKgSvS8iz27DfUL9G+33Jt08eaYM5Wf7YZq
         HtJyNZ8HoqXL8m46GWa6CvagUAJZ3Qg70hM2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517731; x=1737122531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOPaP/mU6vt7fi9w+3JVCzGSZ59QyAsOxxCexGJ2z2A=;
        b=TIkgHSTPhuigIbnHB+xwKExVXZYl1mhIiy38ka6pekRts89S9wn6zZMVoOmoXhdyy0
         t2JXPpAITR3GobdwbY39yDUTGRijdLcxRGy2lzItw39OHO0rgwOAH9NXetwxqmoJwBFl
         7EiGsxF3JIZO3pc8C5nZ4jBVlCRRliEmHQt6VMipmmKW6o8CAfqxatm8P0mc8G/P+HvS
         XYPtGKb8s6PPAlh6E4ZIcjohQUuncDtUrfk6IKkVp+EOl+/uK3YcrJV4qfF6uE4cHgsR
         nKlhW8DBekgDQ3h0Ss4/WJEJzrmITguHMX9AFy3/pT68UTkaJT5jCERZRChycMUIZ1K5
         OGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw/ygP3Lh1poDP3r6gXDc4iDZE6iFtPfMELLBmq3rwQyasYGU5z1Frem3D7W8UHYnBZQhQz7bBGqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZvf+cnUxrH2vzMkHKimJxX13/Qh007T6wXTQFDXcPs8cy6XGC
	8JVB6D/aDUoHZx87KpYmpq9El21Hv+vYFHLMlXI+/2Py17P2X7+Osq+6b1SxJuCKuHZNByyOXuj
	E
X-Gm-Gg: ASbGncuk+EtZbOaoXkYebP8OTX1oV4vL637gJ9sZ1xAeMV2Ps5Q/E6i7U8tWSvm9b4H
	WWmMhD11gw77kSp5l2exUr95BjInSiYfMIMBqcelVA7K3zwysWy+pDKx+ZRkCvkVHsJUdhE9g6t
	OIiiIvnsrnLPqIA+jckxx18Ir3zSsu2DLYniugWZ+ZONKa1ryI3I4cF9k5lhI6S+SJuerHUjSvs
	vUoODb66OSam5U456/8Rc76X0kboXFRFmS7KLPKT/hr0+kAr5Gzm4a1Ar6H21StlXU=
X-Google-Smtp-Source: AGHT+IHwiF6pZdggWtSRTr6pLMwM8np6twiqSyLvaaV8RNsdWeIBSWUdDT3itr1SN8CI6AcxoSrZBQ==
X-Received: by 2002:a17:907:94c8:b0:aaf:7321:f05a with SMTP id a640c23a62f3a-ab2abc6e773mr980949866b.46.1736517717515;
        Fri, 10 Jan 2025 06:01:57 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 1/3] xen/pci: do not register devices outside of PCI segment scope
Date: Fri, 10 Jan 2025 15:01:48 +0100
Message-ID: <20250110140152.27624-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110140152.27624-1-roger.pau@citrix.com>
References: <20250110140152.27624-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PCI segment value is limited to 16 bits, however there are buses like VMD
that fake being part of the PCI topology by adding segment with a number
outside the scope of the PCI firmware specification range (>= 0x10000). The
MCFG ACPI Table "PCI Segment Group Number" field is defined as having a 16 bit
width.

Attempting to register or manage those devices with Xen would result in errors
at best, or overlaps with existing devices living on the truncated equivalent
segment values.

Skip notifying Xen about those devices.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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


