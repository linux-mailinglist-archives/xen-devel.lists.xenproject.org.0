Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FA9E95B5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851185.1265298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTT-0000Qp-NW; Mon, 09 Dec 2024 13:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851185.1265298; Mon, 09 Dec 2024 13:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTT-0000Of-Kq; Mon, 09 Dec 2024 13:06:55 +0000
Received: by outflank-mailman (input) for mailman id 851185;
 Mon, 09 Dec 2024 13:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTR-0000OS-Oy
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:06:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73207570-b62e-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 14:06:49 +0100 (CET)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-zJCvk5qUMeeQ4JH2xZ03sA-1; Mon, 09 Dec 2024 08:06:47 -0500
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e03f54d0so1754215f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:06:46 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:06:44 -0800 (PST)
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
X-Inumbo-ID: 73207570-b62e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ChZary8egFvw+XcfiLo4meSQA+SNlXlrlIPLWf6ynjo=;
	b=Nqop0jlJFPhx6vkmKGN5yOYfeNtJ8/q0KzbGiNl07YmdqpjzBVJoJ1YLko0cXo1i4f4QbD
	R2YqpWz8GbSRZ+lTburA5sjezTdr/kBwoTTgMhRf9LTG/OKC9OXkcdbPq7KVT21VxEy8c9
	ZZvj8+W1ZxGZ4CE4Er/SB1tflYdMfWk=
X-MC-Unique: zJCvk5qUMeeQ4JH2xZ03sA-1
X-Mimecast-MFC-AGG-ID: zJCvk5qUMeeQ4JH2xZ03sA
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749606; x=1734354406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChZary8egFvw+XcfiLo4meSQA+SNlXlrlIPLWf6ynjo=;
        b=I5FiUIMJ0NjpS31/q33YzlXnCVZdDzi/08PmLkp8XYaLUiBxXbIbJwzRGzVNEjeGkX
         5HSwcNIJDQfMlz24t4+cf2Z9olQz63Qoed9hzd4e+daYlhUUJU+zgtjyBACzRvEC1E1h
         o8ukYrKUGd+oFWy4VXjfWJfpzw+z7oWUSfWCDR+aiiC13s+aNKsCZRm5M6nGSPZmrYSa
         6gkMz+yZ3tM+gjS6a5bd8u1fetg+CAcjSOXtLO3qTOOohYD4gNjd2sMIfh5PF/g0zh/4
         ua6wZsux2Ny3QWRyE2Cbw6U21eOKhgErbVqPC6/M0JreAiNn2gHNJ++HgklMD663rwN3
         0Mqw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyilzTC/9gdLzL4GzPUjUd6IJdUbR3XTUy7evV4dLsI2FYzpie+gNgSYDQf45l83lJdIowPpdqA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfG1W6eGjn5tI3rHS3s3PS4CHJ1rapxLf4hBfr8ajEalQQqK8S
	TxqQAq6nWdhBXvqqtnlHjv5cskIJKljw146IYa2zQk062xED3Gvad/tzNj8b3UQTNTc0MkNJiq8
	05HFiSJrgduJDwd77A7aRrvnsfi/4sOa52YxGkKbzJ/u3QfKg5aNEahe+IRyiB8br
X-Gm-Gg: ASbGncuEPcsUA2lGKlgfIL8kxatDIBJlq9bP4oMoaPTGpxsLnXp+0jixTzBS6MMne2f
	aLY+PI1hQb4i5iPUWZiRfzFv5ig9t4keZjideTVpCwoIvUiVxo/6+GgOcf0NLW+VgzahiXIT+35
	uFsuHNWU4JfXh7fPJL4GI1U1Qh9K2usc+wK6Uer4xwdC1BhIrecCVX8tqF5IUgwmNrCmjyDAXCO
	8xZ2G+uFqkmCeboFR8/G2TtEw79NriwdwXnkAEmNRxzUgwBYb6tPYC/O61iZVqe2EMl1HHCoR98
	evDQ6BSA
X-Received: by 2002:a5d:5886:0:b0:385:f114:15d6 with SMTP id ffacd0b85a97d-3862b355e4bmr9451332f8f.13.1733749605786;
        Mon, 09 Dec 2024 05:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3aZqcp+qWXyKCP+s6A/eeOG43m5kb4cM7P1FP5MJVsW/bqky4A5d7q1L7C7R7quzo+4CpVg==
X-Received: by 2002:a5d:5886:0:b0:385:f114:15d6 with SMTP id ffacd0b85a97d-3862b355e4bmr9451253f8f.13.1733749605217;
        Mon, 09 Dec 2024 05:06:45 -0800 (PST)
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
Subject: [PATCH v3 00/11] Remove implicit devres from pci_intx()
Date: Mon,  9 Dec 2024 14:06:22 +0100
Message-ID: <20241209130632.132074-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qGP5dz2wQ5-wtETXDfYFgoBJZpKHWFvqjN-9k2mxuCU_1733749606
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

@Driver-Maintainers: Your driver might be touched by patch "Remove
devres from pci_intx()". You might want to take a look.

Changes in v3:
  - Add Thomas' RB.

Changes in v2:
  - Drop pci_intx() deprecation patch.
  - ata: Add RB from Sergey and Niklas.
  - wifi: Add AB by Kalle.
  - Drop INTx deprecation patch
  - Drop ALSA / hda_intel patch because pci_intx() was removed from
    there in the meantime.

Changes since the RFC [1]:
  - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
  - Add Acked-by's already given.
  - Export pcim_intx() as a GPL function. (Alex)
  - Drop patch for rts5280, since this driver will be removed quite
    soon. (Philipp Hortmann, Greg)
  - Use early-return in pci_intx_unmanaged() and pci_intx(). (Andy)

Hi all,

this series removes a problematic feature from pci_intx(). That function
sometimes implicitly uses devres for automatic cleanup. We should get
rid of this implicit behavior.

To do so, a pci_intx() version that is always-managed, and one that is
never-managed are provided. Then, all pci_intx() users are ported to the
version they need. Afterwards, pci_intx() can be cleaned up and the
users of the never-managed version be ported back to pci_intx().

This way we'd get this PCI API consistent again.

Patch "Remove devres from pci_intx()" obviously reverts the previous
patches that made drivers use pci_intx_unmanaged(). But this way it's
easier to review and approve. It also makes sure that each checked out
commit should provide correct behavior, not just the entire series as a
whole.

Merge plan for this is to enter through the PCI tree.

[1] https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.com/


Regards,
P.

Philipp Stanner (11):
  PCI: Prepare removing devres from pci_intx()
  drivers/xen: Use never-managed version of pci_intx()
  net/ethernet: Use never-managed version of pci_intx()
  net/ntb: Use never-managed version of pci_intx()
  misc: Use never-managed version of pci_intx()
  vfio/pci: Use never-managed version of pci_intx()
  PCI: MSI: Use never-managed version of pci_intx()
  ata: Use always-managed version of pci_intx()
  wifi: qtnfmac: use always-managed version of pcim_intx()
  HID: amd_sfh: Use always-managed version of pcim_intx()
  Remove devres from pci_intx()

 drivers/ata/ahci.c                            |  2 +-
 drivers/ata/ata_piix.c                        |  2 +-
 drivers/ata/pata_rdc.c                        |  2 +-
 drivers/ata/sata_sil24.c                      |  2 +-
 drivers/ata/sata_sis.c                        |  2 +-
 drivers/ata/sata_uli.c                        |  2 +-
 drivers/ata/sata_vsc.c                        |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
 drivers/pci/devres.c                          | 24 +++----------------
 drivers/pci/pci.c                             | 16 +++----------
 include/linux/pci.h                           |  1 +
 13 files changed, 18 insertions(+), 45 deletions(-)

-- 
2.47.1


