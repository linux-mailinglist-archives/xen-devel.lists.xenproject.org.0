Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7D48FB36
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 07:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257779.443082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zII-0000n8-Q9; Sun, 16 Jan 2022 06:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257779.443082; Sun, 16 Jan 2022 06:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zII-0000gS-Fj; Sun, 16 Jan 2022 06:45:38 +0000
Received: by outflank-mailman (input) for mailman id 257779;
 Sun, 16 Jan 2022 06:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n8zIG-0008SI-4H
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 06:45:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55a9af7-7697-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 07:45:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BCE8C212BD;
 Sun, 16 Jan 2022 06:45:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8898E13350;
 Sun, 16 Jan 2022 06:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mnpkHwm/42H0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 06:45:29 +0000
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
X-Inumbo-ID: e55a9af7-7697-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642315529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fEaIPFQ9C+0YacrD1yDplQpHXBb+arhcA+WHK9zKCzQ=;
	b=Pxv+tid21+U/5LIolLklPGhe73TaxiXEua1D8g5Ii4wNEWRWRIOWLziyRRD/strMXVyu1z
	vjKNf0GKV7RR/Fg/pHzyWs8rZQVnrCJdiG6csvOcHqT1oODUw+uw5A4YUX+GOEvjsccRdM
	G4hwzqBERnmda6JTfjm9dmqWxd3Pgx4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 0/5] mini-os: remove struct file dependency on config
Date: Sun, 16 Jan 2022 07:45:22 +0100
Message-Id: <20220116064527.23519-1-jgross@suse.com>
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
array, patches 1, 2, and  4 are introducing a common framework to
access a struct file via its file descriptor, and to allocate new file
types dynamically instead of having them all pre-defined. The file type
specific operations are supplied via a function vector in order to
remove the dependency of lib/sys.c on all the various file types.

Patch 5 is preparing a possible future support of libxenstore instead
of using the Mini-OS internal variant located in lib/xs.c.

Changes in v3:
- first 14 patches already applied
- added patch 5

Changes in V2:
- added 3 more patches

Juergen Gross (5):
  introduce get_file_from_fd()
  reset file type in close() in one place only
  remove file type FTYPE_XC
  use function vectors instead of switch for file operations
  add CONFIG_LIBXS item

 Config.mk                     |  11 +-
 Makefile                      |   2 +-
 arch/x86/testbuild/all-no     |   2 +-
 arch/x86/testbuild/all-yes    |   2 +-
 arch/x86/testbuild/newxen-yes |   2 +-
 include/lib.h                 |  59 ++++--
 lib/sys.c                     | 345 ++++++++++++++++++++++++++--------
 lib/xs.c                      |   1 -
 8 files changed, 313 insertions(+), 111 deletions(-)

-- 
2.26.2


