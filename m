Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B39E95B4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851207.1265396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTn-0003Mq-Hs; Mon, 09 Dec 2024 13:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851207.1265396; Mon, 09 Dec 2024 13:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTn-0003El-9r; Mon, 09 Dec 2024 13:07:15 +0000
Received: by outflank-mailman (input) for mailman id 851207;
 Mon, 09 Dec 2024 13:07:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTl-0000OS-Nm
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:07:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80721f25-b62e-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 14:07:12 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-uac86oUmOFObv_Lg_jXchQ-1; Mon, 09 Dec 2024 08:07:09 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434c214c05aso36610395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:07:09 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:07:07 -0800 (PST)
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
X-Inumbo-ID: 80721f25-b62e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cg5FDrf0+9NG9f4wa7LEIeg49zn7uGzDf8HKpIKXKbU=;
	b=VM7y4uGewQosbc7LfMjsniDOAjbmfqEqTJM42BDCKc9Prxx5eOrQ9Nsp/YveAiXus5TM5u
	RdvYDaOP306MnCVwa/0Dtc58OJT5j3poeEwL5ne0FQHuohxfTjALZIn5hsALMbQ7VU494a
	FfncfBtBrqtNN+JsovTTGurqk97jNj0=
X-MC-Unique: uac86oUmOFObv_Lg_jXchQ-1
X-Mimecast-MFC-AGG-ID: uac86oUmOFObv_Lg_jXchQ
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749628; x=1734354428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cg5FDrf0+9NG9f4wa7LEIeg49zn7uGzDf8HKpIKXKbU=;
        b=UM/DCV4uO3y2wmmhuGo2y7fpAF8WnvwEOtFTdnGCmhU9PWOpXpdUJ3uPt/AsAuhCxU
         xpEvUCneoqWvlMVV/79z4/YQGkTy4o65/WvtOQuktpMCwrbzXYRSKlxydQBtJRb7yCtv
         1qwvR2XE3g3R7YKM5ivOhV8rXgE9+VL8JAfdmRiKvROY3CAF1vXz3S+BdlNjsNyPgGbh
         VTlua+1Wj5TPXhBK3hScteyIibOcDjmTyxzNrve2sexzKeX9ddngPiy+3rqsiKK8K0LJ
         KyFaoxzIsVE+aYrJsG0GSvOwkwxV0okgqEkOOd16RxUvJztinx+gYKZROO81CFLV9Mz9
         hlxw==
X-Forwarded-Encrypted: i=1; AJvYcCUxjBMTcbl5aG43oKgdn5T50BTxtA6+CPW/KnPeo2jUrX/d9T+sABX8CBUTY5qvpVDnlAuLN3bxyWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQz4OB9aUhuAip86SGVP3KjwQX2BZcXv/PaF3oytCBEgSKkIXW
	fyB8G9SSI4p+kZrj+Xpfy1p8B6yU2b7tZz4rHOoi9cwy97yFpBnQm4HFIAsWsDDgnl7NPQwHmEJ
	fn1/7QuGfdZszL6kZ6/PTrxGA/m3xF6ljUQzAByQpi+ky00NdqhO9096+HJkqiwZL
X-Gm-Gg: ASbGnculvldtMHU4GE1CvMRcpdpw67hIDzEXYV6utI9GrjhOfMDUl30oje3doc0Vq8B
	zTu5cyAQKMd/hyDEwiwE3kerEgRxf/FLOl4aVOgx1KlqSOEgnm++IoeJ9M6SXJvvm307ZRElSYW
	416Dj+mxGL9bpDZtty+n8prmny6Hol8ZYf4I9UF4sU0Z6iFMfEKgXXpz9xB7oCM8Ir33FaNc3hG
	RLEuu1HLHw+nkZGK0fZAU/+6bUuwRtfFVND1+goZwKULWmdVuygt2JppTRKWq1DwA4WYyNh2h9v
	ZELL4Ufd
X-Received: by 2002:a05:6000:2d12:b0:385:faec:d94d with SMTP id ffacd0b85a97d-3862b3e2f99mr6786250f8f.51.1733749628311;
        Mon, 09 Dec 2024 05:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzvkT5DctzF6sU2GBgKgYj4TZMfZMHtf63D+x4hcRmPdkPLtxCBfCUCCjCewKM8z5+rRuxWg==
X-Received: by 2002:a05:6000:2d12:b0:385:faec:d94d with SMTP id ffacd0b85a97d-3862b3e2f99mr6786186f8f.51.1733749627860;
        Mon, 09 Dec 2024 05:07:07 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: amien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 10/11] HID: amd_sfh: Use always-managed version of pcim_intx()
Date: Mon,  9 Dec 2024 14:06:32 +0100
Message-ID: <20241209130632.132074-12-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cokNTiC4lOpw8nwSmQlxwFLcd9thvpkkTOzojUKq7_k_1733749628
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

All users of amd_mp2_pci_remove(), where pci_intx() is used, call
pcim_enable_device(), which is why the driver needs the always-managed
version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 0c28ca349bcd..48cfd0c58241 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -122,7 +122,7 @@ int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
 {
 	int rc;
 
-	pci_intx(privdata->pdev, true);
+	pcim_intx(privdata->pdev, true);
 
 	rc = devm_request_irq(&privdata->pdev->dev, privdata->pdev->irq,
 			      amd_sfh_irq_handler, 0, DRIVER_NAME, privdata);
@@ -248,7 +248,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	struct amd_mp2_dev *mp2 = privdata;
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
-	pci_intx(mp2->pdev, false);
+	pcim_intx(mp2->pdev, false);
 	amd_sfh_clear_intr(mp2);
 }
 
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index db36d87d5634..ec9feb8e023b 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -289,7 +289,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	sfh_deinit_emp2();
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
-	pci_intx(mp2->pdev, false);
+	pcim_intx(mp2->pdev, false);
 	amd_sfh_clear_intr(mp2);
 }
 
-- 
2.47.1


