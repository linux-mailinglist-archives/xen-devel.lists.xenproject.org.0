Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C8508B9F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309347.525491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBxw-0003nE-PQ; Wed, 20 Apr 2022 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309347.525491; Wed, 20 Apr 2022 15:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBxw-0003lF-Ls; Wed, 20 Apr 2022 15:10:00 +0000
Received: by outflank-mailman (input) for mailman id 309347;
 Wed, 20 Apr 2022 15:09:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBxv-0003l4-Tg
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:09:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f191d712-c0bb-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:09:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B4A1210E4;
 Wed, 20 Apr 2022 15:09:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96AE513AD5;
 Wed, 20 Apr 2022 15:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAKAI0UiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:57 +0000
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
X-Inumbo-ID: f191d712-c0bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E9Za1fy7SJZVuU3gsJHYcUnfUQspR3rknfU8bXQql9Y=;
	b=s7o4aJsXllglxjEicM+le/pE5Q4+nZsQh1+qkc+l1wMXB8I5KM8EXHpK9vVJQBopp4olwE
	/0eL2tvJFzr8/5F+QMy5ysfmCp4A5ramqeRsMJKSZCtFDWgeFHKh6l0oEFDWWCNJk0EhzP
	yXIHNy0QuiJkmeTPgRibcNpvjDS2yuo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-integrity@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 00/18] xen: simplify frontend side ring setup
Date: Wed, 20 Apr 2022 17:09:24 +0200
Message-Id: <20220420150942.31235-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many Xen PV frontends share similar code for setting up a ring page
(allocating and granting access for the backend) and for tearing it
down.

Create new service functions doing all needed steps in one go.

This requires all frontends to use a common value for an invalid
grant reference in order to make the functions idempotent.

Juergen Gross (18):
  xen/blkfront: switch blkfront to use INVALID_GRANT_REF
  xen/netfront: switch netfront to use INVALID_GRANT_REF
  xen/scsifront: remove unused GRANT_INVALID_REF definition
  xen/usb: switch xen-hcd to use INVALID_GRANT_REF
  xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
  xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
  xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
  xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
  xen/xenbus: add xenbus_setup_ring() service function
  xen/blkfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/netfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/tpmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/drmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/sndfront: use xenbus_setup_ring() and xenbus_teardown_ring()
  xen/xenbus: eliminate xenbus_grant_ring()

 drivers/block/xen-blkfront.c                | 54 ++++----------
 drivers/char/tpm/xen-tpmfront.c             | 18 +----
 drivers/gpu/drm/xen/xen_drm_front.h         |  9 ---
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 40 +++-------
 drivers/net/xen-netfront.c                  | 77 ++++++--------------
 drivers/pci/xen-pcifront.c                  | 19 +----
 drivers/scsi/xen-scsifront.c                | 30 ++------
 drivers/usb/host/xen-hcd.c                  | 59 ++++-----------
 drivers/xen/gntdev-dmabuf.c                 | 13 +---
 drivers/xen/xen-front-pgdir-shbuf.c         | 17 +----
 drivers/xen/xenbus/xenbus_client.c          | 81 ++++++++++++++++-----
 include/xen/xenbus.h                        |  4 +-
 sound/xen/xen_snd_front_evtchnl.c           | 41 +++--------
 sound/xen/xen_snd_front_evtchnl.h           |  9 ---
 14 files changed, 156 insertions(+), 315 deletions(-)

-- 
2.34.1


