Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4639E95B3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851196.1265358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTh-00028h-J9; Mon, 09 Dec 2024 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851196.1265358; Mon, 09 Dec 2024 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTh-00025x-Eh; Mon, 09 Dec 2024 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 851196;
 Mon, 09 Dec 2024 13:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTg-0000OS-8l
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:07:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d204215-b62e-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 14:07:06 +0100 (CET)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-W9DMkNCnNM6IcveM0LyOzw-1; Mon, 09 Dec 2024 08:06:58 -0500
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385df115288so1806905f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:06:58 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:06:56 -0800 (PST)
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
X-Inumbo-ID: 7d204215-b62e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGrvh/xDUNx0Zym0wN3Xe7A7dJtO5ZhSWVvmuSF27ww=;
	b=Z5+FKy7ioJjd8a8u3GNDGGSVChuU+Ji3ernXFZ5vODPI/JynNHeat5aeykaVEkoYK4SWQq
	YCqrzsCjamKy2JkM1ClyQvj/viB+BRPGuRnEjZu30nTJUIPngVk3hyENQoYcMycZ+rqfcu
	4Z7F5FYHyyXM0HPXvivgNbzJtWom/CQ=
X-MC-Unique: W9DMkNCnNM6IcveM0LyOzw-1
X-Mimecast-MFC-AGG-ID: W9DMkNCnNM6IcveM0LyOzw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749617; x=1734354417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGrvh/xDUNx0Zym0wN3Xe7A7dJtO5ZhSWVvmuSF27ww=;
        b=gHJcg0AUcHUT4pzhzzyWpHPS7YoqicnkTqyRSLhudJuHydRvLWb77aeYgXodt4POoh
         xbotmjNoDt3I4NNKVrpw4CjxW5TI5N7/RFPwrlUE24YGvSox0OB7+Kx65O3wBXVkDJvj
         uq01klZTsjbdnAcXOQ/nVoCx0E1/PoJQsoZIoKBetNL7QhbY1LqnlvLroFjl/nIO5O0U
         302bhKOkM/01RT2Btp2W/xdA/Edlz6W9p3v1b/IiM1N8uiMEYW7b1X3l3hldfOtFkqZT
         DCITgnFedYLpFC/cgHujN3h8L4ywAfJmlyhkkwyqAm9FPBuA9GLeRA9w+9WkLZH6oWIf
         l2yw==
X-Forwarded-Encrypted: i=1; AJvYcCW+h0Dl2B4y/+XRvfewGq0u1GWpZSWjPkTxl1jhAibXqWdyiaeIzTJseONmsYzV03sRwHGlA1UZuW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwROzCNlnSamZGR9myCRMKMBQDN1GL4RRuHf5DE+OoS6v5Co+MT
	H7Xsjsj7bywYu1FyLuCqUFUw7BjshYpYLtAbooI4nehNCwXOzmeIys+cKdFK/G+OG44u09IuZEE
	af1cT0XyJTdel00w3YjJXNzIYb6D968lObMdcvzXf+/pBHZvDrSUJsHcf9CJXS5cy
X-Gm-Gg: ASbGnctOoXd7Grr6ot/DRWrcUeADDNjPvVGTLhqoCOPZfmd29OnRokksnTnXDv/lrT1
	v0nbwPO8mNaAMXe9/WH7orG7akaK1YEHg310iC1uJUG8+RoBU3e6YnIJHZrgV6AuOiUovfmnKI0
	k0s7muy7LbTB4UZxHu7X/qOancvqPKe7kNOUMtFLzZZclE5HenryJDapeG458Mu9htFuA3aOHR5
	DRZS7L9IJHZBgOeP+KpGSY3fvqb/dDDMBJGjUCTKRRGSK1TjlLSN2jFt8oZd7ArVO1mKQZp1S06
	G9ok+ZeN
X-Received: by 2002:a5d:47c9:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-386453d6c46mr225651f8f.22.1733749617417;
        Mon, 09 Dec 2024 05:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+w+VXnhTGgYCQrqoxE7Q0eQycE2/xL59lBRJp9LXmIJ3oiAACyABfaofCQ1IoSgKVucKxLg==
X-Received: by 2002:a5d:47c9:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-386453d6c46mr225568f8f.22.1733749616959;
        Mon, 09 Dec 2024 05:06:56 -0800 (PST)
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 05/11] misc: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:27 +0100
Message-ID: <20241209130632.132074-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rogXN74MqKl5dDgRxmQ7IPX_Ruvc0sue5YY4JdVmxqI_1733749617
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

cardreader/rtsx_pcr.c and tifm_7xx1.c enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 2 +-
 drivers/misc/tifm_7xx1.c           | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index be3d4e0e50cc..e25e6d560dd7 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
 	}
 
 	pcr->irq = pcr->pci->irq;
-	pci_intx(pcr->pci, !pcr->msi_en);
+	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
 
 	return 0;
 }
diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index 1d54680d6ed2..5f9c7ccae8d2 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 		goto err_out;
 	}
 
-	pci_intx(dev, 1);
+	pci_intx_unmanaged(dev, 1);
 
 	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
 				? 4 : 2, &dev->dev);
@@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 err_out_free:
 	tifm_free_adapter(fm);
 err_out_int:
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 err_out:
 	if (!pci_dev_busy)
@@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
 		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
 
 	iounmap(fm->addr);
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 
 	pci_disable_device(dev);
-- 
2.47.1


