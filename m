Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F3A99F627
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819321.1232645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meD-000726-JY; Tue, 15 Oct 2024 18:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819321.1232645; Tue, 15 Oct 2024 18:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meD-0006zH-Gc; Tue, 15 Oct 2024 18:51:57 +0000
Received: by outflank-mailman (input) for mailman id 819321;
 Tue, 15 Oct 2024 18:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0meC-0006G4-1B
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:51:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bee5f45-8b26-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 20:51:55 +0200 (CEST)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-epSy9yN1N36e3VnBmIOQYw-1; Tue, 15 Oct 2024 14:51:52 -0400
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2faca747f94so37293221fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:51:52 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:51:49 -0700 (PDT)
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
X-Inumbo-ID: 8bee5f45-8b26-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
	b=XHvPnXR/Fi+6T5w+v20GvhmTgH3gtr2+S0JaXqM0t6dd1WGFuWh+ATO6h/8jGF0r6SwHzV
	b3AzzCm8bazCtkCCCANqznWDM26eHv4qZ0jDinRcDZLeamvQ7dpIARXtF59SnPi6o2+jPv
	eGNDwT8sZxoaKXBduoL+DrbCUObvlBI=
X-MC-Unique: epSy9yN1N36e3VnBmIOQYw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018311; x=1729623111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UdUsG2Ce2FuhD+Vr0J1b3PhjfLKCU3S+xUJ9DfCqJQ=;
        b=CKgt7WrvUvAa3mX9wwi1rSxkNL6JEaF9e839nfW4MjxdXAdgwNfN5BhTQtqd/tYT8o
         i/AD2fBvKKZseeDUexSK1SEuocpO/NDkGa4Pyl2hfr4RYZrCuIaEY9tLqkuK9JAWNLgv
         g/hWXXYRz7RjriDkgfqg5QsqTqXdLm5ZcmxTjKp0/FkOvacVLbOGiW8nQvBs+s6JDhrj
         Evhl4Q9JE/wr1dcEEjXbS99x6YLFxAJ5Vp77V8NsvcBk+5OQhMV+uZzfTFfYWzgLkeEa
         s3CsAPdjl8ybvElwAJEjcMZu5TXUYuaK5nocEcANLaaNXG3/sYdWSBJzVmKJzWjbweeu
         893Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOMbwbqxXajvHGZx0tDFtiL3E0mpaB0SwTCNYVymcI3YKF+2ZsEZv7ELDK6zPlmWDmqAl7mT8BwJI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRVWqEFcuiVuhDHQeljCypD4rSTGeY2tXjwzBFvMWH2RxPv6d+
	Pacxx4MEry0WjP2HraSyVP6DrGHTGMiI0Ppqc7C8s+bGritq00tZq2ty5/6EOjL3buiBpj1vrRO
	p1vQMxWuM355uAd4OcJPcZTHgyiEe2bkda9+jhYBIXOpgCSfZHviSoA16Wg92v131
X-Received: by 2002:a2e:be13:0:b0:2fa:c0fc:e3d6 with SMTP id 38308e7fff4ca-2fb326fc5a0mr82286071fa.7.1729018310963;
        Tue, 15 Oct 2024 11:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg0lXB9d95359mfSRgxCA4dveTgVHKUj5pW+Si5SQOi+coS4w/96kFO+qIGBhPz8zuJnYPgA==
X-Received: by 2002:a2e:be13:0:b0:2fa:c0fc:e3d6 with SMTP id 38308e7fff4ca-2fb326fc5a0mr82285671fa.7.1729018310336;
        Tue, 15 Oct 2024 11:51:50 -0700 (PDT)
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
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 03/13] drivers/xen: Use never-managed version of pci_intx()
Date: Tue, 15 Oct 2024 20:51:13 +0200
Message-ID: <20241015185124.64726-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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


