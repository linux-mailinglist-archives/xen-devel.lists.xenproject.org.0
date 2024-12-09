Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E129E95B1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851188.1265328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTZ-0001As-Fz; Mon, 09 Dec 2024 13:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851188.1265328; Mon, 09 Dec 2024 13:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTZ-00018N-Cm; Mon, 09 Dec 2024 13:07:01 +0000
Received: by outflank-mailman (input) for mailman id 851188;
 Mon, 09 Dec 2024 13:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTX-0000ch-Qa
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:06:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78b0736b-b62e-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 14:06:59 +0100 (CET)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-xvUCrlphP5afoRypEeNXAg-1; Mon, 09 Dec 2024 08:06:55 -0500
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385f0829430so2934808f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:06:54 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:06:52 -0800 (PST)
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
X-Inumbo-ID: 78b0736b-b62e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BJlyFDGVHa1KIDhGsh03tIghv1/oE2/0tVlBeLCm6QY=;
	b=Qlr8oNK28eNpw682MBL8U6SKkhMY5HjbyugMJQqarq/kxKRPxLdwOlOcGk88idw0DAkY6g
	9025gnylQ1//eg6ZsJ+2FkNeW819UX70LrXGgO17U6/Akb9yuSuM5D0ZwLYTnoxU8w1E1C
	/nDYcE0dnWaG1X8D0BBb4Q0hAw0rkMc=
X-MC-Unique: xvUCrlphP5afoRypEeNXAg-1
X-Mimecast-MFC-AGG-ID: xvUCrlphP5afoRypEeNXAg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749613; x=1734354413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJlyFDGVHa1KIDhGsh03tIghv1/oE2/0tVlBeLCm6QY=;
        b=UmrWczkwFZ6DzVKtS+UvCHlehJ0K0AbkSGyEIweHQr0i1R9tpja9ULKHEkmqvWQM6i
         VxyUJsrHwXZpV22plcFZ/ERk7N/mp36Fo8now+/IazDwGCspKZHPe3/ZIOwIyQKcZz3b
         MOUmghjNuhskKc0Yj+al7oWdzNMaSfvcOzhkqEQcq8Y+tQomVSFstCvcaYs9wBh5YxJ0
         b2kUr6wRyvhjjAgiUTzILrr6pyjKHQvDPckGHj7R8rWE/EH4xhaoZsHmhs3F2r8SCDKw
         aP3Giu/VGytFw3tBeM/modxNc7rQPZm7VWaiWnl/8zIO77aEid9c8tg5SfdeaG5zbWqp
         sVwA==
X-Forwarded-Encrypted: i=1; AJvYcCUHl4CN4TIUl4n4HzANL9NCinl7ConNHq66t0JYWAZeNgNfBMyzBqgGoR1u///hl+nV3RMeI/lGqhQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd1cIax3Biy6ZtFkPOmzP3oXXXUmwX/Gcuf+Y+BTN2XtWGhqzG
	Zh6YdtAzjjCqsFUP4ZupOTDBugENo2l+rg4JU86W5ukeQkYqo53qqexw2vcxMlFI3VtLJHs4pVL
	R9aMRN0wKWAaVtn2wTd9NlB2QB/yrmUTGVpM0sYOHKtQko1f+uoMPhYoiFmzSECHu
X-Gm-Gg: ASbGncuwftnq+Cm+S2pJCmXWAuQMRu1eCpQQl2irt45JrH7/4AUtBUwL7FMJ0auWUaq
	FZEGEUaxi2lCahdpETzbohMJG6hBdeHJr0jfoAooz0xWu1PxaCvE1PdQzZKt3jOkLUHpBwM65Vh
	CSNsrauLHUnm72OeZ8iepuCllG2vqt94JiKIWO/xEKa+79q0MrBKuSJrHuiKntGQAkMxfkBBMwI
	G6XjQlzbRh/+1Ie36TrVvAJWcOQKkkmVv1dHx6OiZ4JU6cdEgirdpk0JedfzPAQCIsN/McDP2uW
	O3ww31Bn
X-Received: by 2002:a05:6000:2d08:b0:386:144d:680f with SMTP id ffacd0b85a97d-386453fd870mr188104f8f.54.1733749613282;
        Mon, 09 Dec 2024 05:06:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj1wppsmKOkdvfdKSfuff+I9JjxqlZHOEEdHEk5K3zylRh/0qa/2JfnJnGp4etqXepLTEqow==
X-Received: by 2002:a05:6000:2d08:b0:386:144d:680f with SMTP id ffacd0b85a97d-386453fd870mr188043f8f.54.1733749612866;
        Mon, 09 Dec 2024 05:06:52 -0800 (PST)
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
Subject: [PATCH v3 03/11] net/ethernet: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:25 +0100
Message-ID: <20241209130632.132074-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sRO3flFZN5rImIblnx9bF4jePElaLmy0JByv90d20Wo_1733749613
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

broadcom/bnx2x and brocade/bna enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 2 +-
 drivers/net/ethernet/brocade/bna/bnad.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 678829646cec..2ae63d6e6792 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -1669,7 +1669,7 @@ static void bnx2x_igu_int_enable(struct bnx2x *bp)
 	REG_WR(bp, IGU_REG_PF_CONFIGURATION, val);
 
 	if (val & IGU_PF_CONF_INT_LINE_EN)
-		pci_intx(bp->pdev, true);
+		pci_intx_unmanaged(bp->pdev, true);
 
 	barrier();
 
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index ece6f3b48327..2b37462d406e 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -2669,7 +2669,7 @@ bnad_enable_msix(struct bnad *bnad)
 		}
 	}
 
-	pci_intx(bnad->pcidev, 0);
+	pci_intx_unmanaged(bnad->pcidev, 0);
 
 	return;
 
-- 
2.47.1


