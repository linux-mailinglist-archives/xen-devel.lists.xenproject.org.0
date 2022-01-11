Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1E48B004
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255775.438460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbZ-00042h-AG; Tue, 11 Jan 2022 14:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255775.438460; Tue, 11 Jan 2022 14:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbZ-0003qo-0M; Tue, 11 Jan 2022 14:58:33 +0000
Received: by outflank-mailman (input) for mailman id 255775;
 Tue, 11 Jan 2022 14:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IbW-0002Oa-D8
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea732db9-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04412212C3;
 Tue, 11 Jan 2022 14:58:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE0BC13DDD;
 Tue, 11 Jan 2022 14:58:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7Q0EMQub3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:19 +0000
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
X-Inumbo-ID: ea732db9-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z0tDS/aCIk9/03puqNfGz+4Is8FvtxuzfJRiRCv9vJ4=;
	b=fLKxX0ckKc31+m9WJlAtkqCR1c/JuWOIieT+T52JOxFls53jvYaVskuhoh5cOdCmxnUfj1
	ns2ZrKYrQPeYWUREbvBzqFoR1zMObREdwKJpAm1dkjHslL5a0z+SqUvL8er6We2vzD01Jx
	APT0NDVjDftv1WZBDRc2C/K+YLDq/n0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 00/18] mini-os: remove struct file dependency on config
Date: Tue, 11 Jan 2022 15:57:59 +0100
Message-Id: <20220111145817.22170-1-jgross@suse.com>
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
array, patches 15-17 are introducing a common framework to access a
struct file via its file descriptor, and to allocate new file types
dynamically instead of having them all pre-defined. The file type
specific operations are supplied via a function vector in order to
remove the dependency of lib/sys.c on all the various file types.

Changes in V2:
- added 3 more patches

Juergen Gross (18):
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
  mini-os: reset file type in close() in one place only
  mini-os: use function vectors instead of switch for file operations
  mini-os: remove file type FTYPE_XC

 Config.mk                     |   1 -
 arch/x86/testbuild/all-no     |   1 -
 arch/x86/testbuild/all-yes    |   1 -
 arch/x86/testbuild/newxen-yes |   1 -
 blkfront.c                    |  15 +-
 console/xencons_ring.c        |   2 +-
 fbfront.c                     |  16 +-
 include/lib.h                 | 123 ++++++------
 include/tpmfront.h            |   2 +
 lib/sys.c                     | 363 +++++++++++++++++++++++-----------
 lib/xs.c                      |  14 +-
 netfront.c                    |   6 +-
 tpm_tis.c                     |  23 +--
 tpmfront.c                    |  33 ++--
 14 files changed, 352 insertions(+), 249 deletions(-)

-- 
2.26.2


