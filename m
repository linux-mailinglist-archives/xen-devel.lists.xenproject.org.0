Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296679C6F4D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835551.1251415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBChp-0003oR-HT; Wed, 13 Nov 2024 12:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835551.1251415; Wed, 13 Nov 2024 12:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBChp-0003mR-El; Wed, 13 Nov 2024 12:42:45 +0000
Received: by outflank-mailman (input) for mailman id 835551;
 Wed, 13 Nov 2024 12:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFXx=SI=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tBChn-0003m4-NK
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:42:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38ff5b9-a1bc-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 13:42:38 +0100 (CET)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-NU5M9BqyOWKA1ezNeTdULg-1; Wed, 13 Nov 2024 07:42:36 -0500
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37d49887a2cso378732f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:42:36 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:42:34 -0800 (PST)
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
X-Inumbo-ID: c38ff5b9-a1bc-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMjkuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMzOGZmNWI5LWExYmMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTAxNzU4LjkzNTU0Miwic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
	b=ELpsqMTysSyQRHEvpusLFYcuTawBspYW34aV2LlbvzHdElDoMbe12lI/pfGCajQ+Lai1XU
	esBbGyUTKLdlu2XHrVTaxfrHTQWfdG+YCxxTE9mz44FtdFcDtbzN/sUCmp7YTXOytKQ0rm
	IfutlPiLYmYZZQN6J4VPUqiSku47wbI=
X-MC-Unique: NU5M9BqyOWKA1ezNeTdULg-1
X-Mimecast-MFC-AGG-ID: NU5M9BqyOWKA1ezNeTdULg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501755; x=1732106555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
        b=f4h5zBf9xshAWeLgnQ9oE7YSLeKjxsvDz5hsZiS6hR3+RbHJC9axkQq0eYQAa8/Xyz
         5Bbv3nnl2Dbmdm4emCK2mfFgaPzIzlaAUuFGsBVInYAhmkygc0EYmTTXIsilWq6oWbor
         44pgXY4RV4ds+nsMJsdlRZMQmK1TIBeiBMLZucLlVU1xeKPtQdoqKbgnkhvJSHxoKiEq
         4IUbQW8lUfpPV4dMtiCjGpr0ZX7zDkLhkG/vGcXCyDKtfOjPfZR4QzM4N8UW6oHJUF43
         pIy1fGA+82DjjwRLI8oTT8XfcGKF1jnhUtMxHVuF4YQTgVJeTdi5vD6ZGlIgnKRT7j55
         DeLg==
X-Forwarded-Encrypted: i=1; AJvYcCVryq/p9pQCxp3LYzwJPFNjUCeWkLSxRDuUL6Vi2AE32FlJFYe94CEjSG00K70Qv+C3RBwvBdBuBSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcPfqbiIAhm1aVInde8CDVzP6zKCeQxTq9ApkjTWo1p7gQT1ZC
	YxDCgJhd15jvxT8+1DWpTtgWXjDb4z9PZKAYN2AeH+sBvu7ni+ogJFYD6BYhLSF/NQEGdas9shd
	gEk4Vh/OI50e4yTyg1+iWMs4jEGhVp+mxNrk27lexXQmxRrbK4AT5dXZQyyp0GxXU
X-Received: by 2002:a05:6000:2d84:b0:381:f443:21c6 with SMTP id ffacd0b85a97d-381f44325dbmr11520840f8f.0.1731501755004;
        Wed, 13 Nov 2024 04:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpGOsc1jx0uRyavECo6HCq0VfxiOW2oXCFxduoG1UVcDJiaH+xI1Ywem/WU8zILNl7MjLF9A==
X-Received: by 2002:a05:6000:2d84:b0:381:f443:21c6 with SMTP id ffacd0b85a97d-381f44325dbmr11520807f8f.0.1731501754619;
        Wed, 13 Nov 2024 04:42:34 -0800 (PST)
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
Subject: [PATCH v2 02/11] drivers/xen: Use never-managed version of pci_intx()
Date: Wed, 13 Nov 2024 13:41:50 +0100
Message-ID: <20241113124158.22863-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113124158.22863-2-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYTgrl-dM6K43ReAJj4lpnHETycH_l85eVsFIZL7ZKM_1731501755
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

xen enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-pciback/conf_space_header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index fc0332645966..8d26d64232e8 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -106,7 +106,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 
 	if (dev_data && dev_data->allow_interrupt_control &&
 	    ((cmd->val ^ value) & PCI_COMMAND_INTX_DISABLE))
-		pci_intx(dev, !(value & PCI_COMMAND_INTX_DISABLE));
+		pci_intx_unmanaged(dev, !(value & PCI_COMMAND_INTX_DISABLE));
 
 	cmd->val = value;
 
-- 
2.47.0


