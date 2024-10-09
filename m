Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68D996304
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813876.1226940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCN-0006IO-Pt; Wed, 09 Oct 2024 08:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813876.1226940; Wed, 09 Oct 2024 08:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCN-00063J-H3; Wed, 09 Oct 2024 08:37:35 +0000
Received: by outflank-mailman (input) for mailman id 813876;
 Wed, 09 Oct 2024 08:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sySBy-0005FO-8Z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:37:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abcfa615-8619-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:37:09 +0200 (CEST)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-ezTiMZxBNFWzDhGghn2v3w-1; Wed, 09 Oct 2024 04:37:07 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7a9af65cf73so621438485a.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:37:07 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:37:05 -0700 (PDT)
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
X-Inumbo-ID: abcfa615-8619-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNVTMVvkzsZ7hvF5EavB0JCPwkl/fF5os/K0NJtlfsw=;
	b=CtYtZVBzjPRz2qlo5j/9U6WtImTvTaLKuzHFoHorvmMmBGMp30L8IQaPRX8x1kqRaZbVqp
	CtbH91cfHwA30xykZq+8qsDt/Kvx78rZa0cqG5u6SQWWOsIpgp+VITPNScsVprlxbtjrgj
	J0YJuXGt36WluLx994AED6ECztSBx0c=
X-MC-Unique: ezTiMZxBNFWzDhGghn2v3w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463027; x=1729067827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNVTMVvkzsZ7hvF5EavB0JCPwkl/fF5os/K0NJtlfsw=;
        b=QlHWw6lSOIjXjPLqSHbhfp/PYZjYt5jKbmPYRaQINodjiG0C4QO6Zn2g/PCBw6bnP5
         MnqIn2FFKN5UG0fuYi1OFid4tCzFVuyhVOOyRaP38nTztpXGsy83IIXeZ0vS9bzl2xS3
         WsH0CxluAtOH1mCbTg0kb3No2bOJo53ySAV7U7f3aA3Fgi30ZqUCIEf/0MBebB8ynlaD
         CWWhCVe9aFPVPp3hCVOIlVwOreo3SZjalbe3gqqlDAAmsGquhNGUHtXLqvXnZ/6obhp0
         aCA2CMoEnHkq4oYy8Jp6l8ZuiWe4I7GwlmWHxfd54IsxTLC78OVD5OMBHcjmGU03/Hpc
         pFvw==
X-Forwarded-Encrypted: i=1; AJvYcCUcl2oqSe/mkIiNQA0TbMuuXjOHqde+Yjf8taOnK6dndaymRoaKMqx3bS6lgd9aixp0JF1Sk8XDnvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8uHSQOV5VtAmdNAocWet3RH34NXyqlleZIKZRzdWGZsRx33Cd
	c5EjatxSXXl2M+FttUGgOf6CvfSq+BP1zR6bYRDmC8PO91Lzx/p5+lVggz89buMmXd5ekLcMny4
	/Kv9J99rM4A70s5w8aP2dNCje+cBtq0D0yDrE/fDOvIn5nPkp+CdcWYnY9z9Wp1wy
X-Received: by 2002:a05:620a:1786:b0:7a9:b9c6:ab4d with SMTP id af79cd13be357-7b0874b2e98mr203714085a.51.1728463026703;
        Wed, 09 Oct 2024 01:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E0hV0KwQQvESOvv48X2ciqeB9+Uq53IkSsAgik+9QXi7ONASinXEowAITLecuVI2IQ519Q==
X-Received: by 2002:a05:620a:1786:b0:7a9:b9c6:ab4d with SMTP id af79cd13be357-7b0874b2e98mr203707485a.51.1728463026267;
        Wed, 09 Oct 2024 01:37:06 -0700 (PDT)
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
Subject: [RFC PATCH 03/13] drivers/xen: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:09 +0200
Message-ID: <20241009083519.10088-4-pstanner@redhat.com>
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

xen enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
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
2.46.1


