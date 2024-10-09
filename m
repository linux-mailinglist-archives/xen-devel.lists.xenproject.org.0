Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC49963B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813948.1227038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySOS-0006HE-9E; Wed, 09 Oct 2024 08:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813948.1227038; Wed, 09 Oct 2024 08:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySOS-0006Ct-5I; Wed, 09 Oct 2024 08:50:04 +0000
Received: by outflank-mailman (input) for mailman id 813948;
 Wed, 09 Oct 2024 08:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sySDA-00075z-Bp
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:38:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d77e6865-8619-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 10:38:22 +0200 (CEST)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-a05JQfFwOAmxRoW0v3wIIQ-1; Wed, 09 Oct 2024 04:38:20 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a9a71b17a3so1133298285a.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:38:20 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:38:19 -0700 (PDT)
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
X-Inumbo-ID: d77e6865-8619-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ4XyKRMzVRAPh09Ypw2QkYDvdqyB5dqjRwvTDPzI5M=;
	b=DozHLYbJ3JpEc8AHBMq252GE0GfrwECVkSxQPO077ghyDBoDndKzi4gpNWeBChl0bttNed
	3I74KRar+NT2r/9zKfc4W0SU/ENWE10leT554V/yEHABu7M1bCHZwXjpCKJTmP66tGQj4G
	Yj0Wus8IvC2gr53J9KaGqSVlbiiUS9U=
X-MC-Unique: a05JQfFwOAmxRoW0v3wIIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463100; x=1729067900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ4XyKRMzVRAPh09Ypw2QkYDvdqyB5dqjRwvTDPzI5M=;
        b=WfXFMj5owm4MBB3Jsy9nwzEkGrQ+KWZlkorvLSj+3wfdpvU6YqIY81T9T/P1Rcnw5F
         pBVUHJ6x8hsLNRrODZBgGnGPNLl4Yfkt7Q/cWL04rciGH+KPZStVMkQWPNXbMHq+UFEx
         lfBQO0Mih/++es9Bvdr4oEHRFyuehI8VcpgFKTWwEUlh9zARaS47tsvQOKIOVJU6OWRV
         KnYC3JJPTeb+rq4FQ6PVluMkDfrMPhoo88xFt6zUm07voo7e1ZFXml+zANVawykU24lD
         46E34pNUXv5mGLRf+lTAOvBQnC4GG6CN6kZsj26CN4cgtpzJFpVqnMYF7H0awpH5DcWO
         9qHg==
X-Forwarded-Encrypted: i=1; AJvYcCXIMV/yJvcgA1aOqSDuymAmBr5GmkIUix9/bmgFEpLUeHVx1MkPskUGZy2hrpX74noM+CmIiRExwM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4XKaz241qE/w9roEFNhmu76Fx4SP8Nf8fX4TzN+wKbxDNckd9
	OKD33owPLlMNK3We0nm1HlFUDfyyLp55Y+pgQgee+eD4DwEK4E5eeY6JyN1wIrTLTwOkX8gwGqs
	kT3v/mMeUpb2F/iM6i/7d5Fp4dR0mUy89PcDo3msvZTEGl3ayU/6n3x616g2JY54O
X-Received: by 2002:a05:620a:191e:b0:7ae:5c5b:a3ee with SMTP id af79cd13be357-7b07954eaf1mr214935085a.30.1728463099809;
        Wed, 09 Oct 2024 01:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEohpGdz3FQCfvuYPGv1Kgp6VmjNVq/mWsuKLRVQIwcRgXug1EQeuW78e0HsYLtO7HnORD33g==
X-Received: by 2002:a05:620a:191e:b0:7ae:5c5b:a3ee with SMTP id af79cd13be357-7b07954eaf1mr214929685a.30.1728463099420;
        Wed, 09 Oct 2024 01:38:19 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 11/13] wifi: qtnfmac: use always-managed version of pcim_intx()
Date: Wed,  9 Oct 2024 10:35:17 +0200
Message-ID: <20241009083519.10088-12-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs the
always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
index f66eb43094d4..3adcfac2886f 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
@@ -204,7 +204,7 @@ static void qtnf_pcie_init_irq(struct qtnf_pcie_bus_priv *priv, bool use_msi)
 
 	if (!priv->msi_enabled) {
 		pr_warn("legacy PCIE interrupts enabled\n");
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 	}
 }
 
-- 
2.46.1


