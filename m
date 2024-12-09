Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96BD9E95B8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851187.1265319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTW-0000t7-8l; Mon, 09 Dec 2024 13:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851187.1265319; Mon, 09 Dec 2024 13:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTW-0000rD-5c; Mon, 09 Dec 2024 13:06:58 +0000
Received: by outflank-mailman (input) for mailman id 851187;
 Mon, 09 Dec 2024 13:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTV-0000ch-98
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:06:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7654070e-b62e-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 14:06:55 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-LOaZd975P36jbMOlT3Bxdw-1; Mon, 09 Dec 2024 08:06:52 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434f15c1c8fso8812925e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:06:52 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:06:49 -0800 (PST)
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
X-Inumbo-ID: 7654070e-b62e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzWiWxh4LRhHWrBZAH8gP8nNmxU8jwjjwHhpaGNecfw=;
	b=I2MU793kCJdxJqWTyIzOLeN324MDOAIZWMJja0gGcnDsxSHSaA29/T3dlUkmscviVXNiIS
	ITZ7sAM23lg0YyhO/j1V92jOxLUXwxC4+scckBibwmjVJ/pVr1z+cAqekNMX8/kw5Dtawo
	9x5/6mPpQCGTNuvvADbsXdyJzSw2zQs=
X-MC-Unique: LOaZd975P36jbMOlT3Bxdw-1
X-Mimecast-MFC-AGG-ID: LOaZd975P36jbMOlT3Bxdw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749611; x=1734354411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzWiWxh4LRhHWrBZAH8gP8nNmxU8jwjjwHhpaGNecfw=;
        b=IC8E8oD7z/QrNevycVXHIgUUs7YGZmtfwINnZEIyYllslclfY9OvpvWp2+O2qEHH3u
         1of0E6UqcYFWu8rMHLDSQaqI/iTsSneqWK39aFPPMGsknRwE6GIAgPiOExgq43RYeAi0
         PigQukEXbH9pkOr+LuQraexTKXEzJgSZhMOKDCfP9NQ2Bom58TsnTuA8H51YpM+A877R
         llwyeNpZgK/7JaUCoUlQmcEa3OSRg1QFqYrR9ewjZh/lqhE5xDsUeiHFJ2aipKgl+n49
         iDPw8tDwfXN8/wZa5/aHyw80Tb5R2xm7HWRB5QA9pCJoxnmGOVMzK2YAw6mCVfoPZX7y
         q/rA==
X-Forwarded-Encrypted: i=1; AJvYcCW7DuNs81tnxjaUVUsxYJhole7w8qTUrTGy2+mITE4apu/Y2rjoedMb7FeX0P3V6DYFzU7bb7FzazI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRySCvMopfj+qhvB+NCOAgdppeK/G+7nwoaiRMHjTYUSa58qvg
	k4OvdMT9MH5hNGybekGbXW2XUfYedVJfSxdIThWTGNtv4rzZdThCG+iK1J1Xuhne8gXw5Z2CaDu
	+XVdHJGm9IkmxSU7QNChwkeZv13EH/kVwuwR/QKnJDejY8ZR+y6sdNKTnySnb0cbq
X-Gm-Gg: ASbGncsBuR1Oeax9Kmi5BTstQ9ZWcngF4giPqZfMDQ5v/7ZlYyxa2wEDnUFa+s7qHkM
	ZgOBoSLzfEY31JKjfoH6q6IxEJzEBy3qzEKHYCRv+effIBV3EAIY69xvMFH7+s49IUK6iGK1BLs
	e+9UYA3ebLw5c8RtsaijJDwhVXRJY81P+mwbJyxqhnUW3uYPOPgWIdXC/cvL8kqUIi3pwgyM7ZO
	f3OcsktdhSoE1lIGBBGdg6QI47qarizH9xog4SBAUSb11kA8ALyCeTUBldWd6SC9w/mJYkn5RPN
	69aJTYhY
X-Received: by 2002:a05:6000:186c:b0:385:f465:12f8 with SMTP id ffacd0b85a97d-386453f6891mr224945f8f.47.1733749611248;
        Mon, 09 Dec 2024 05:06:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYLGzMuES8pL8UNwc6rduiHNSssmgKFMI0arqDxmQvwrHwV9r5BJKNGyDbmmGP7hHm3hITRA==
X-Received: by 2002:a05:6000:186c:b0:385:f465:12f8 with SMTP id ffacd0b85a97d-386453f6891mr224791f8f.47.1733749609723;
        Mon, 09 Dec 2024 05:06:49 -0800 (PST)
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
Subject: [PATCH v3 02/11] drivers/xen: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:24 +0100
Message-ID: <20241209130632.132074-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3gDdNv9p2cS8ouGS955YkhTnpQG_o4BuqQnhN5cId8o_1733749611
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

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
2.47.1


