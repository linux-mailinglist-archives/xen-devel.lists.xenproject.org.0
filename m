Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB8437230
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 08:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214750.373481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMW-0005xj-Ed; Fri, 22 Oct 2021 06:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214750.373481; Fri, 22 Oct 2021 06:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMW-0005uq-B3; Fri, 22 Oct 2021 06:49:08 +0000
Received: by outflank-mailman (input) for mailman id 214750;
 Fri, 22 Oct 2021 06:49:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5cR=PK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mdoMU-0005ue-Ir
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 06:49:06 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2a407ff-7f6a-4be6-ab1b-09ebb5566a99;
 Fri, 22 Oct 2021 06:49:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D2452197F;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A09513AAD;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jpEMBeBecmEIEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Oct 2021 06:49:04 +0000
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
X-Inumbo-ID: e2a407ff-7f6a-4be6-ab1b-09ebb5566a99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634885344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vdb5nLtyp5tIbT7/OLrVEaSBnq6naUGZA07AQT86v2c=;
	b=PMNO7u+JK4lsjHIAmHQ/NYSH6PSDWxW5oi4qSzEsVw9p0v6RgIf1dw5L1M0yxZnnPmUE42
	bEdzMHkjaPHjMsStRKaaW/VG+AFY5hngJA838Yw55Zrc0gCY9ILGst8rEWSnr+azo7IRtQ
	wVKKkBy8OqPGObfHmn8PuQkefgkgXAA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Juergen Gross <jgross@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
Date: Fri, 22 Oct 2021 08:47:55 +0200
Message-Id: <20211022064800.14978-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the non-essential pv devices are hard coded in the xenbus driver
and this list is lacking multiple entries.

This series reworks the detection logic of non-essential devices by
adding a flag for that purpose to struct xenbus_driver.

Juergen Gross (5):
  xen: add "not_essential" flag to struct xenbus_driver
  xen: flag xen_drm_front to be not essential for system boot
  xen: flag hvc_xen to be not essential for system boot
  xen: flag pvcalls-front to be not essential for system boot
  xen: flag xen_snd_front to be not essential for system boot

 drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
 drivers/input/misc/xen-kbdfront.c          |  1 +
 drivers/tty/hvc/hvc_xen.c                  |  1 +
 drivers/video/fbdev/xen-fbfront.c          |  1 +
 drivers/xen/pvcalls-front.c                |  1 +
 drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
 include/xen/xenbus.h                       |  1 +
 sound/xen/xen_snd_front.c                  |  1 +
 8 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.26.2


