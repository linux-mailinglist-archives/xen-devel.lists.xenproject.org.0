Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996DC48B085
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255861.438702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Iot-0002J2-2q; Tue, 11 Jan 2022 15:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255861.438702; Tue, 11 Jan 2022 15:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ios-0002G9-Vs; Tue, 11 Jan 2022 15:12:18 +0000
Received: by outflank-mailman (input) for mailman id 255861;
 Tue, 11 Jan 2022 15:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ios-0002Fv-5d
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3b7a4b-72f0-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 16:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F24DF21112;
 Tue, 11 Jan 2022 15:12:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2C5213DDD;
 Tue, 11 Jan 2022 15:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5WmrLVCe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:16 +0000
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
X-Inumbo-ID: dd3b7a4b-72f0-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yeuY0drNiNl4kEQVrhTlT4kDcZq8w1z+MQQqf9GMpmM=;
	b=aZXWA9BgLmZAj/I3kveShb3xBHXKBZTmT8tlcHIuxZgosZeeNQD/U7coIYjgU9ijBW3BPJ
	ceKc1dfnGddUgVQlh0CgJgHwOzFGjSSKR2sFCOk+LU+4uQ++zGrU9igsMJKrPeSgyv8JO5
	8f1Vp5XOHuz9HqXSB1Sh/O0CibyJFYI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 00/12] mini-os: remove device specific struct file members
Date: Tue, 11 Jan 2022 16:12:03 +0100
Message-Id: <20220111151215.22955-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a followup to the series sent recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00347

It contains the last cleanups related to struct file and can only be
applied after the Xen libraries have stopped using the related union
members:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00355

The three series applied have been tested to work with:

- xenstorepvh-stubdom
- pv-grub
- ioemu-stubdom

Changes in V2:
- add many patches for using alloc_file_type() and struct file_ops

Juergen Gross (12):
  mini-os: remove event channel specific struct file definitions
  mini-os: remove gnttab specific member from struct file
  mini-os: use alloc_file_type() and get_file_from_fd() in xs
  mini-os: use alloc_file_type() and get_file_from_fd() in tpm_tis
  mini-os: use alloc_file_type() and get_file_from_fd() in tpmfront
  mini-os: use alloc_file_type() and get_file_from_fd() in blkfront
  mini-os: use get_file_from_fd() in netfront
  mini-os: use alloc_file_type() and get_file_from_fd() in fbfront
  mini-os: use file_ops and get_file_from_fd() for console
  mini-os: add struct file_ops for file type socket
  mini-os: add struct file_ops for FTYPE_FILE
  mini-os: make files array private to sys.c

 Config.mk                     |   2 -
 arch/x86/testbuild/all-no     |   2 -
 arch/x86/testbuild/all-yes    |   2 -
 arch/x86/testbuild/newxen-yes |   2 -
 blkfront.c                    |  92 ++++++--
 console/xenbus.c              | 125 ++++++++++
 console/xencons_ring.c        |   6 +-
 fbfront.c                     | 125 ++++++++--
 gntmap.c                      |   2 +-
 include/blkfront.h            |   5 -
 include/console.h             |   5 +
 include/lib.h                 |  27 +--
 include/tpm_tis.h             |   6 -
 include/tpmfront.h            |   5 -
 lib/sys.c                     | 429 ++++++++--------------------------
 lib/xs.c                      |  64 +++--
 netfront.c                    |  64 ++++-
 tpm_tis.c                     | 120 ++++++----
 tpmfront.c                    | 100 +++++---
 xenbus/xenbus.c               |   1 +
 20 files changed, 664 insertions(+), 520 deletions(-)

-- 
2.26.2


