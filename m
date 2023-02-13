Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44A693FDA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494205.764194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURh-00056K-U6; Mon, 13 Feb 2023 08:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494205.764194; Mon, 13 Feb 2023 08:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURh-00053m-RC; Mon, 13 Feb 2023 08:44:21 +0000
Received: by outflank-mailman (input) for mailman id 494205;
 Mon, 13 Feb 2023 08:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRURf-00053b-SJ
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:44:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b9f786-ab7a-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 09:44:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C5A367B09;
 Mon, 13 Feb 2023 08:44:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF8141391B;
 Mon, 13 Feb 2023 08:44:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aBtHMV/46WMoRAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:44:15 +0000
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
X-Inumbo-ID: 98b9f786-ab7a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676277856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2TpvI14vjytLk+fJ6jQ6L4mTK2f8+asinqiPiJO4Cp8=;
	b=dF9Q7GVGtTjlVr5s7SWi6e7UVCaS3Pz8GB7geRxBSHm6ACnbQhmVy5seqA4Yu/+XSOtFuW
	goRiQVr8m40NdjQQ5hM/oPsJvLjCbQ1L+01XdSvYc/ub8XfNgFqedc776kPf5GV//AA5vc
	Dbnqt0/9PP2oO906XoBY1Z5jNZKxzXY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/7] Mini-OS: add minimal 9pfs support
Date: Mon, 13 Feb 2023 09:44:05 +0100
Message-Id: <20230213084412.21065-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is adding minimal support to use 9pfs in Mini-OS. It is
adding a PV 9pfs frontend and the ability to open, close, read and
write files.

The series has been tested with qemu as 9pfs backend in a PVH Mini-OS
guest (I've used a slightly modified Xenstore-stubdom for that purpose
in order to reuse the build runes).

This series is meant to setup the stage for adding file based logging
support to Xenstore-stubdom and later to add live update support (being
able to save the LU data stream in a dom0 file makes this a _lot_
easier).

In order to keep Mini-OS's license I have only used the protocol docs
available on the internet [1] and then verified those with the qemu 9pfs
backend implementation (especially for supporting the 9P2000.u variant,
as qemu doesn't support the basic 9P2000 protocol).

The needed fixed values of the protocol have been taken from [2].

[1]: http://ericvh.github.io/9p-rfc/rfc9p2000.html
[2]: https://github.com/0intro/libixp

Changes in V2:
- addressed comments by Samuel Thibault

Changes in V3:
- addressed comments by Samuel Thibault and Andrew Cooper

Juergen Gross (7):
  Mini-OS: xenbus: add support for reading node from directory
  Mini-OS: add concept of mount points
  Mini-OS: add support for runtime mounts
  Mini-OS: add 9pfs frontend
  Mini-OS: add 9pfs transport layer
  Mini-OS: add open and close handling to the 9pfs frontend
  Mini-OS: add read and write support to 9pfsfront

 9pfront.c                     | 1300 +++++++++++++++++++++++++++++++++
 Config.mk                     |    1 +
 Makefile                      |    1 +
 arch/x86/testbuild/all-no     |    1 +
 arch/x86/testbuild/all-yes    |    1 +
 arch/x86/testbuild/newxen-yes |    1 +
 include/9pfront.h             |    7 +
 include/lib.h                 |   14 +
 include/xenbus.h              |    6 +
 lib/sys.c                     |  123 +++-
 xenbus.c                      |   40 +-
 11 files changed, 1473 insertions(+), 22 deletions(-)
 create mode 100644 9pfront.c
 create mode 100644 include/9pfront.h

-- 
2.35.3


