Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194909C6F48
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835559.1251487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBChy-0005dk-IW; Wed, 13 Nov 2024 12:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835559.1251487; Wed, 13 Nov 2024 12:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBChy-0005Zv-Bq; Wed, 13 Nov 2024 12:42:54 +0000
Received: by outflank-mailman (input) for mailman id 835559;
 Wed, 13 Nov 2024 12:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFXx=SI=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tBChv-0003m4-RJ
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:42:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0d8b05-a1bc-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 13:42:49 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-Znl_OwPCOsGvl-aZhJUwyA-1; Wed, 13 Nov 2024 07:42:47 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4314a22ed8bso48055185e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:42:47 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:42:45 -0800 (PST)
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
X-Inumbo-ID: ca0d8b05-a1bc-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMzMuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNhMGQ4YjA1LWExYmMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTAxNzcwLjA1MTM5Mywic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NsJKOkpA+QoYlzqeYDbY0Dl9xjdlxWNvzFNzd4dMwhk=;
	b=MFK04fSO1v4A8gg0Q4b7u1tPHBYnvQhE36O67GxgPRlhWI/kyTLgxwmsbVYu8YV7XmJv80
	nugar1/I4YYnUgaVRe/7nzUVsWqDl9li8nffyoeBCI/0qN/4cMhtVwnMf1miCpPMWeMr4p
	aUg3NbNnuAJtkB8Y8eHXSLjjVYH6M6g=
X-MC-Unique: Znl_OwPCOsGvl-aZhJUwyA-1
X-Mimecast-MFC-AGG-ID: Znl_OwPCOsGvl-aZhJUwyA
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501766; x=1732106566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsJKOkpA+QoYlzqeYDbY0Dl9xjdlxWNvzFNzd4dMwhk=;
        b=aAbxIYZEr6T4v8WFmToDPtFqT0hSqwKD7GTSp+shpdLMWQ+riJ/VD59T2f3M9r/Laa
         cpuQzVektd2LsMf3fItP97F2uixGJKOZfuRmGIlcdxeqlYLE7fwi9d4NKRkFLrQ+YsQ5
         Xns65Q1uBfoASImLT1wMYOcIajXWy514wJBI85jQYGMUDV4QVdSoRhTr8YsSM2boA6bi
         f2DNZL307YYFO8P9iMfT/uTwweu80L4rWX6XavrZcgwUXxMWEbZ8BwVswecChJLobtEZ
         6ceEZHGiyoZXxhV7GkpwIiJpBFUQuAuprUBFirK2ARBbx5Zs2tDKkhLI7UFPooL6zEdP
         Xzbw==
X-Forwarded-Encrypted: i=1; AJvYcCUHCT63qyIt3bV+h5ltn1wP3fXhoJhm74L/0Te0fNb5WNDMNJnPnIJNYDINluw6/3taUQhIbrKW7R0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgtfNQzWzWf7cqgtcpMPoHLUDAFu5/sOu3bBHgE+R/9IliFG7k
	WOkPA0C9J2h/8eFrtMb2TlV24A+/Oo5AALRteulAkLAz5MaPwZAMOf19mSXmP0RAdIlTRyRNx72
	T3fYTtp1sMFLn2uLfgNyW9cffYN1Bi/5jx5Uq22+1mGiMM6hR+NGY4ef0ACNUzOD/
X-Received: by 2002:a5d:47ac:0:b0:37d:5282:1339 with SMTP id ffacd0b85a97d-3820df6136cmr2369033f8f.22.1731501766128;
        Wed, 13 Nov 2024 04:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpjkcG3JEnob3xzqfsNCARyMkng1y9gR5mdhMcNm6Gi1JEJjom42U2s4Q7CInAPcp8pAzepA==
X-Received: by 2002:a5d:47ac:0:b0:37d:5282:1339 with SMTP id ffacd0b85a97d-3820df6136cmr2368992f8f.22.1731501765706;
        Wed, 13 Nov 2024 04:42:45 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
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
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Ankit Agrawal <ankita@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 07/11] PCI: MSI: Use never-managed version of pci_intx()
Date: Wed, 13 Nov 2024 13:41:55 +0100
Message-ID: <20241113124158.22863-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113124158.22863-2-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ONzCFdd622infrRSa4EIP7GLsp2bCmZ2icVg8xy3jQI_1731501766
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

MSI sets up its own separate devres callback implicitly in
pcim_setup_msi_release(). This callback ultimately uses pci_intx(),
which is problematic since the callback of course runs on driver-detach.

That problem has last been described here:
https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.camel@redhat.com/

Replace the call to pci_intx() with one to the never-managed version
pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/msi/api.c | 2 +-
 drivers/pci/msi/msi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index b956ce591f96..c95e2e7dc9ab 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -289,7 +289,7 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 			 */
 			if (affd)
 				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
+			pci_intx_unmanaged(dev, 1);
 			return 1;
 		}
 	}
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 3a45879d85db..53f13b09db50 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -268,7 +268,7 @@ EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
 {
 	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
-		pci_intx(dev, enable);
+		pci_intx_unmanaged(dev, enable);
 }
 
 static void pci_msi_set_enable(struct pci_dev *dev, int enable)
-- 
2.47.0


