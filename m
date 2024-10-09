Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82D9962FC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813874.1226934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCN-00065T-Fu; Wed, 09 Oct 2024 08:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813874.1226934; Wed, 09 Oct 2024 08:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCN-0005zq-3V; Wed, 09 Oct 2024 08:37:35 +0000
Received: by outflank-mailman (input) for mailman id 813874;
 Wed, 09 Oct 2024 08:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sySBp-0005FO-Be
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:37:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a67d4ad1-8619-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:37:00 +0200 (CEST)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-SP56zgMvMUybXpx4qb8Eow-1; Wed, 09 Oct 2024 04:36:58 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7afdf50bfcaso139001485a.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:36:58 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:36:56 -0700 (PDT)
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
X-Inumbo-ID: a67d4ad1-8619-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PPm9S1zRcO86dlq3mHzZGXnJgcIWsisXbqhvFp0Kes=;
	b=cfQGjjcnjw+Foio7/PqFa84qZtptYKB3xcumLVdkQSxRZE7iw7TP6MxrDRS/VwNmj9CZ+7
	Gw6ZT5u5bga40p2OD4ZoVlePPDLAMaOoVgSNSuM2Uc7L0xpWF4w5Fd6Odu/ih3PFldqo0D
	Q+EK9B8fY6541HY42KHjLKTBaDpd5KY=
X-MC-Unique: SP56zgMvMUybXpx4qb8Eow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463018; x=1729067818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PPm9S1zRcO86dlq3mHzZGXnJgcIWsisXbqhvFp0Kes=;
        b=U2aco2lhaciho1JgBqiadwLqbXrzYTxP1OhTXNhdllY7tPcNM2NROgar1fmk9GQHyK
         CDfoY71o2QngMZWjv+TCAbgrzFgMUyMPsh1fenkSq4QxEEwwJmOFxLNZBWaAm2kf1VNW
         r+16MxUTgFA7RtQLRdeqc2RRnNExtpw0Az5/pASzn9WlMwUo+qlCNsef2eRrDrDtUGeb
         ebBduQjD6C3l9KPhF7KypWms5mq+MKxcC7hwoQspUpfNjW6o/flnUXOCm4pWk9i5knfr
         x+Q7t7x8pkTLYaUWaeREcpD9pAik/8oy1bWcc/tQQPi41O9bwIC6+mdIwQucjTZ5Z1h5
         yo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD9P4m0Z7Sen19+1krcwdamAUWBqkgaZDFyFuuHOyh7T6b0BedPD8UMP+aVTC398GNoEI4609d8/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6eyCfh7SDaOoDl13LmyiJ256uXCIqoJ/iFWLBI1erRKaB+uQJ
	ksc3mBZtxJYoz7gEGwCW/EI+9EKp0uXJbuKuL/cBY3OOIE2Bjb1ZMV/lYekXSWarhxT2wpQqaW0
	KTvpntMSQFdiPXl0rJG866tc3rKffM4hH9ampMiD76fon9uePkzbq7Hl6ucbTtAfB
X-Received: by 2002:a05:620a:40d2:b0:7af:cea1:2dd6 with SMTP id af79cd13be357-7afcea13062mr575428985a.9.1728463017661;
        Wed, 09 Oct 2024 01:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvN3DzIDBf5agA7u3XzrMCdDXSCcUz6hrKViBRxZsE1bbVXxxuhuZe+LfXJzoxle8rULiRWQ==
X-Received: by 2002:a05:620a:40d2:b0:7af:cea1:2dd6 with SMTP id af79cd13be357-7afcea13062mr575422585a.9.1728463017195;
        Wed, 09 Oct 2024 01:36:57 -0700 (PDT)
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
Subject: [RFC PATCH 02/13] ALSA: hda: hda_intel: Use always-managed version of pcim_intx()
Date: Wed,  9 Oct 2024 10:35:08 +0200
Message-ID: <20241009083519.10088-3-pstanner@redhat.com>
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

hda_intel enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd2a6..b44ca7b6e54f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
 	}
 	bus->irq = chip->pci->irq;
 	chip->card->sync_irq = bus->irq;
-	pci_intx(chip->pci, !chip->msi);
+	pcim_intx(chip->pci, !chip->msi);
 	return 0;
 }
 
-- 
2.46.1


