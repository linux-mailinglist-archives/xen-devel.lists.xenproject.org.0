Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC205542F4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 08:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353466.580394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0m-0003Tt-CX; Wed, 22 Jun 2022 06:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353466.580394; Wed, 22 Jun 2022 06:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0m-0003Nm-8g; Wed, 22 Jun 2022 06:38:48 +0000
Received: by outflank-mailman (input) for mailman id 353466;
 Wed, 22 Jun 2022 06:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3u0k-0003Ka-J4
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 06:38:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a50457-f1f5-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 08:38:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E416D1FA12;
 Wed, 22 Jun 2022 06:38:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31A45134A9;
 Wed, 22 Jun 2022 06:38:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gMq2CvK4smKNUAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 06:38:42 +0000
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
X-Inumbo-ID: f5a50457-f1f5-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655879922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QMRrUcaW7noQ1pULOfC6DTDxjpRydqT5qx5KdCmqN2s=;
	b=F2GAX4tgcaaJK09IKfBFeDbtHvOq+IkDEU7l7PrA3RhoibYo+uttdFz2t+qPZAaQOwDw3A
	fHEDcSKePj6ww5nUqqNiqcxwleIRpxn45rgsUtNEvK5o15XMISBUcJfW8fMTMeto1TiYz1
	6avqbbonITmQT2qBICWookqie0msOhY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arch@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] virtio: support requiring restricted access per device
Date: Wed, 22 Jun 2022 08:38:35 +0200
Message-Id: <20220622063838.8854-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of an all or nothing approach add support for requiring
restricted memory access per device.

Changes in V3:
- new patches 1 + 2
- basically complete rework of patch 3

Juergen Gross (3):
  virtio: replace restricted mem access flag with callback
  kernel: remove platform_has() infrastructure
  xen: don't require virtio with grants for non-PV guests

 MAINTAINERS                            |  8 --------
 arch/arm/xen/enlighten.c               |  4 +++-
 arch/s390/mm/init.c                    |  4 ++--
 arch/x86/mm/mem_encrypt_amd.c          |  4 ++--
 arch/x86/xen/enlighten_hvm.c           |  4 +++-
 arch/x86/xen/enlighten_pv.c            |  5 ++++-
 drivers/virtio/Kconfig                 |  4 ++++
 drivers/virtio/Makefile                |  1 +
 drivers/virtio/virtio.c                |  4 ++--
 drivers/virtio/virtio_anchor.c         | 18 +++++++++++++++++
 drivers/xen/Kconfig                    |  9 +++++++++
 drivers/xen/grant-dma-ops.c            | 10 ++++++++++
 include/asm-generic/Kbuild             |  1 -
 include/asm-generic/platform-feature.h |  8 --------
 include/linux/platform-feature.h       | 19 ------------------
 include/linux/virtio_anchor.h          | 19 ++++++++++++++++++
 include/xen/xen-ops.h                  |  6 ++++++
 include/xen/xen.h                      |  8 --------
 kernel/Makefile                        |  2 +-
 kernel/platform-feature.c              | 27 --------------------------
 20 files changed, 84 insertions(+), 81 deletions(-)
 create mode 100644 drivers/virtio/virtio_anchor.c
 delete mode 100644 include/asm-generic/platform-feature.h
 delete mode 100644 include/linux/platform-feature.h
 create mode 100644 include/linux/virtio_anchor.h
 delete mode 100644 kernel/platform-feature.c

-- 
2.35.3


