Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB499638B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813926.1227008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySLy-0003cl-7N; Wed, 09 Oct 2024 08:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813926.1227008; Wed, 09 Oct 2024 08:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySLy-0003aV-4I; Wed, 09 Oct 2024 08:47:30 +0000
Received: by outflank-mailman (input) for mailman id 813926;
 Wed, 09 Oct 2024 08:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sySD0-0005FO-U3
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:38:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2077015-8619-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:38:13 +0200 (CEST)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-TvXbMQwgPnWCiL0A48mcDw-1; Wed, 09 Oct 2024 04:38:11 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ae48475234so1704795985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:38:11 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
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
X-Inumbo-ID: d2077015-8619-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whIiuNRJJmYlfQ3wiaGZ/HmATem6GNPoxo7pUmmbAqQ=;
	b=Bz6g2jtMcXJ35p1DBRCmU+vHVfDIx21l8GhMaNcfvqZnKjJOkcqnTegv+C0dclJFjMYyt0
	218CqExSDlE98E2qUhFYk/qY28u4iXVhj2dWchIu8lJFW4Kw0CB//DYVrEMwmcedRcsojA
	yA+GaUSgX9KvP/DiWg9m87GIzUWhTbc=
X-MC-Unique: TvXbMQwgPnWCiL0A48mcDw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463091; x=1729067891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whIiuNRJJmYlfQ3wiaGZ/HmATem6GNPoxo7pUmmbAqQ=;
        b=Amj7/fgy4ZTtykF1EiAB9IGK1mvj9/ovEwC1GCWeG3UDwNNpdYS2YH8AbSgdv6ErKu
         y6yj6gFLfjjNAdYP+bftwD6W23GX0vagEWrbROn1bcI05dcRKVJo4vOdwbo2DbIpmX7+
         bXPuuckqwocMvRq/QobP+gB+X5+Y9U9lig/JBWmiQ6lVv7OThx1ufGG0P/m11TP+6reV
         AsjlIEO0syV7zUwrj+J99yZbCza1CigDanYy6TEJ1gRUq5g/JEjG9jnM/aAFq3qxI629
         tVvoxdZMJK6AlJY9xzm9+THWIEeEEXIa38DjABHzaMlolaml1tmB94dL5+3GK93JhVzx
         NZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVfKK1YIrO9mRRDuu8fqBh1s9eJr/Gh7AJy8Gj397M1Nf3qKOg5/J7jGDetKKTSHodkIj27hObUX8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoXb5S3awtBFhuowHKC4VWIdWfsUmgG/v9W9pkg1DD2Eb+BK4O
	TU0FGPv1KkAJebgwTzBFudTPr54Jojnejq3QhmwAgbMmLnARf193Js9zK0JjrQeEc/Vlfm3uSIq
	HwfQpnYLq5OJQ/vRhvBZ6pwpVj7IwZJaU7/kZ9JtMli0UxOAXLOdQ498Ok5q+WuR8
X-Received: by 2002:a05:620a:6006:b0:7a9:ab72:7374 with SMTP id af79cd13be357-7b10ed4fff8mr102281485a.35.1728463090674;
        Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/MgCEUv0CJEAIc6rr0qvcu86NTMXEfUgLL+h2hiKBHzQb8C5W8ydxW51ghGpiTPgzdZQtmw==
X-Received: by 2002:a05:620a:6006:b0:7a9:ab72:7374 with SMTP id af79cd13be357-7b10ed4fff8mr102275485a.35.1728463090297;
        Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
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
Subject: [RFC PATCH 10/13] staging: rts5280: Use always-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:16 +0200
Message-ID: <20241009083519.10088-11-pstanner@redhat.com>
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

rts5208 enables its PCI-Device with pcim_enable_device(). Thus, it needs the
always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/staging/rts5208/rtsx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index c4f54c311d05..4831eb035bf7 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -246,7 +246,7 @@ static int rtsx_acquire_irq(struct rtsx_dev *dev)
 	}
 
 	dev->irq = dev->pci->irq;
-	pci_intx(dev->pci, !chip->msi_en);
+	pcim_intx(dev->pci, !chip->msi_en);
 
 	return 0;
 }
-- 
2.46.1


