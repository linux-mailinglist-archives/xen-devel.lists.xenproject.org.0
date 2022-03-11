Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511D4D5FA9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288916.490087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbU-0004AJ-OD; Fri, 11 Mar 2022 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288916.490087; Fri, 11 Mar 2022 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbU-00047g-IV; Fri, 11 Mar 2022 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 288916;
 Fri, 11 Mar 2022 10:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nScbT-00047V-92
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:34:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6746525-a126-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 11:34:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79D72210FB;
 Fri, 11 Mar 2022 10:34:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A827013A85;
 Fri, 11 Mar 2022 10:34:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Kh3tJ7glK2LxdQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:34:32 +0000
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
X-Inumbo-ID: d6746525-a126-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646994873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wxQGvXlNGe5HCBbR63oBE/kK35uYM5cAEXtsbUcwkZQ=;
	b=iNIvX7qiHCHs8as2v0+a/C6Wf9AM41VW8O+o2xwFxi1cw2QRDGGMgZ/U+wVya50NqXLinC
	i0LxZhXeNa6Kvoq6FYdE1Rn7t/eAOn4geBVM9tpVaCf3Bq2EMzIQrENQGGyoxOfZbZapRr
	hZujw3UMlrZhO11g0/T3KzHa4Umc+Jk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] xen/grant-table: do some cleanup
Date: Fri, 11 Mar 2022 11:34:27 +0100
Message-Id: <20220311103429.12845-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup grant table code by removing unused functionality.

Juergen Gross (2):
  xen/grant-table: remove gnttab_*transfer*() functions
  xen/grant-table: remove readonly parameter from functions

 drivers/block/xen-blkfront.c                |   8 +-
 drivers/char/tpm/xen-tpmfront.c             |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |   2 +-
 drivers/input/misc/xen-kbdfront.c           |   4 +-
 drivers/net/xen-netfront.c                  |  13 +-
 drivers/pci/xen-pcifront.c                  |   2 +-
 drivers/scsi/xen-scsifront.c                |   4 +-
 drivers/usb/host/xen-hcd.c                  |   4 +-
 drivers/xen/gntalloc.c                      |   2 +-
 drivers/xen/gntdev-dmabuf.c                 |   2 +-
 drivers/xen/grant-table.c                   | 151 +++-----------------
 drivers/xen/pvcalls-front.c                 |   6 +-
 drivers/xen/xen-front-pgdir-shbuf.c         |   3 +-
 include/xen/grant_table.h                   |  13 +-
 net/9p/trans_xen.c                          |   8 +-
 sound/xen/xen_snd_front_evtchnl.c           |   2 +-
 16 files changed, 50 insertions(+), 176 deletions(-)

-- 
2.34.1


