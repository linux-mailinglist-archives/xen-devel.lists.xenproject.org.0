Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBB48640E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253919.435309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPE-0007X3-Qs; Thu, 06 Jan 2022 11:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253919.435309; Thu, 06 Jan 2022 11:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPE-0007If-At; Thu, 06 Jan 2022 11:58:08 +0000
Received: by outflank-mailman (input) for mailman id 253919;
 Thu, 06 Jan 2022 11:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPA-0005UX-U7
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e25b2073-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B2E01F39A;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FF6913C0D;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8I2WAkPZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:55 +0000
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
X-Inumbo-ID: e25b2073-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xy0k3l1xwd14agj4JvTzTc/eAjXOd11zi0LH89vg72c=;
	b=nL2YWUlrAVrsTMR8+zPMRVVXeIakeDPzfRJNC2YZXyQCuDmauWD9pTn9blgxCUG4C/POqz
	uo7xm/yw1ORxfNbjEsLgjfxn7PFGFfAVOPG7/tZEkyS+OuD18HAWMSukIjTrxVAEv9jgVJ
	gGM3Me1nVO4ouW4cNltGqL4Afm6wRYo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 00/15] mini-os: remove struct file dependency from config
Date: Thu,  6 Jan 2022 12:57:26 +0100
Message-Id: <20220106115741.3219-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the layout of struct file is depending on the Mini-OS
configuration. This is especially bad as the layout is exported to
external users like the Xen libraries built for Mini-OS, and those
are being built only once for multiple stubdom configurations.

Today there is no direct problem resulting from this, as the main
difference between struct file layouts is a large union containing all
the device specific data for the different file types. The largest
union member is not configuration dependant, so the build is currently
not broken.

In order to avoid any future problems this patch series is eliminating
the configuration dependency by replacing most of the device specific
union members by a single pointer.

The two union members used by Xen libraries can't be replaced yet, as
those need to be switched to use the generic pointer first.

In order to hide the Mini-OS internal implementation of the files
array, the last patch is introducing a service function for obtaining
the pointer to struct file for a given file descriptor, which must be
used for that purpose by all Mini-OS external components.

Juergen Gross (15):
  mini-os: split struct file definition from its usage
  mini-os: makes file.read bool and move it ahead of device specific
    part
  mini-os: make offset a common struct file member for all types
  mini-os: replace multiple fd elements in struct file by common one
  mini-os: introduce a common dev pointer in struct file
  mini-os: eliminate blkfront union member in struct file
  mini-os: eliminate consfront union member in struct file
  mini-os: eliminate fbfront union member in struct file
  mini-os: eliminate kbdfront union member in struct file
  mini-os: eliminate netfront union member in struct file
  mini-os: move tpm respgot member of struct file to device specific
    data
  mini-os: eliminate tpmfront union member in struct file
  mini-os: eliminate tpmtis union member in struct file
  mini-os: eliminate xenbus union member in struct file
  mini-os: introduce get_file_from_fd()

 blkfront.c             |  15 +++---
 console/xencons_ring.c |   2 +-
 fbfront.c              |  16 +++----
 include/lib.h          |  59 ++++-------------------
 include/tpmfront.h     |   2 +
 lib/sys.c              | 103 ++++++++++++++++++++++-------------------
 lib/xs.c               |  13 +++---
 netfront.c             |   6 +--
 tpm_tis.c              |  23 ++++-----
 tpmfront.c             |  33 +++++++------
 10 files changed, 119 insertions(+), 153 deletions(-)

-- 
2.26.2


