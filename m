Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8148FBAC
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257819.443178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yk-0008OO-2I; Sun, 16 Jan 2022 08:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257819.443178; Sun, 16 Jan 2022 08:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yj-0008MU-UX; Sun, 16 Jan 2022 08:33:33 +0000
Received: by outflank-mailman (input) for mailman id 257819;
 Sun, 16 Jan 2022 08:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yi-0008IP-OL
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1c0e24-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9032E1F3B2;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EFEB1346A;
 Sun, 16 Jan 2022 08:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5EhsFVrY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:30 +0000
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
X-Inumbo-ID: fc1c0e24-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JI/T0GvQlHTteR5uYoRyKUlc2h5rd/vS7Yv8hXR+F9M=;
	b=guGamLRDLCwk3pjvKnmwEaH1VX6Xn0iiqV9S2TwgA3kXYajVrpCdiFNJ8ddo23GBzSfo9y
	RdsOewsy/234pfVUnfHwgABlXnN3OrVaGjNqSVDK0le/mOsKE88vZV+kSYI5zgDGPbcRNB
	RzSk4agvSNr709PNwWGhp1oQCqyunwc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 00/12] remove device specific struct file members
Date: Sun, 16 Jan 2022 09:33:16 +0100
Message-Id: <20220116083328.26524-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a followup to the series sent recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00635

It contains the last cleanups related to struct file and can only be
applied after the Xen libraries have stopped using the related union
members:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00643

The three series applied have been tested to work with:

- xenstorepvh-stubdom
- pv-grub
- ioemu-stubdom

Changes in V3:
- comments addressed

Changes in V2:
- add many patches for using alloc_file_type() and struct file_ops

Juergen Gross (12):
  remove event channel specific struct file definitions
  remove gnttab specific member from struct file
  use alloc_file_type() and get_file_from_fd() in xs
  use alloc_file_type() and get_file_from_fd() in tpm_tis
  use alloc_file_type() and get_file_from_fd() in tpmfront
  use alloc_file_type() and get_file_from_fd() in blkfront
  use alloc_file_type() and get_file_from_fd() in netfront
  use alloc_file_type() and get_file_from_fd() in fbfront
  use file_ops and get_file_from_fd() for console
  add struct file_ops for file type socket
  add struct file_ops for FTYPE_FILE
  make files array private to sys.c

 Config.mk                     |   2 -
 arch/x86/testbuild/all-no     |   2 -
 arch/x86/testbuild/all-yes    |   2 -
 arch/x86/testbuild/newxen-yes |   2 -
 blkfront.c                    |  92 ++++++--
 console/console.c             |   2 +-
 console/xenbus.c              | 112 +++++++++
 console/xencons_ring.c        |   6 +-
 fbfront.c                     | 127 ++++++++--
 gntmap.c                      |   2 +-
 include/blkfront.h            |   5 -
 include/console.h             |   7 +-
 include/lib.h                 |  29 +--
 include/netfront.h            |   3 +-
 include/tpm_tis.h             |   6 -
 include/tpmfront.h            |   5 -
 lib/sys.c                     | 424 ++++++++--------------------------
 lib/xs.c                      |  65 ++++--
 netfront.c                    |  65 +++++-
 tpm_tis.c                     | 121 ++++++----
 tpmfront.c                    | 100 +++++---
 xenbus/xenbus.c               |   1 +
 22 files changed, 649 insertions(+), 531 deletions(-)

-- 
2.26.2


