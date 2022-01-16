Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8208748FB9C
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257806.443138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005L4-AM; Sun, 16 Jan 2022 08:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257806.443138; Sun, 16 Jan 2022 08:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005IE-2n; Sun, 16 Jan 2022 08:24:02 +0000
Received: by outflank-mailman (input) for mailman id 257806;
 Sun, 16 Jan 2022 08:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90pU-00052M-CZ
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:24:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d69428-76a5-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:23:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C520A1F383;
 Sun, 16 Jan 2022 08:23:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C1971346A;
 Sun, 16 Jan 2022 08:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d0ZYIB3W42FLEwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:23:57 +0000
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
X-Inumbo-ID: a6d69428-76a5-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642321437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UZjgG0VV4Gjd8M/uhWkr3YjhV+ebrB2BQXUDO8e1bEU=;
	b=KUZNAKEeuIZ7M59wWVsHEyokodf+b5CAeInISr2N6eleqDSSEoaveHShqP+yuAgyYaqHDf
	iLsxNobAh60tzHK0o62hTt/xhoqN2XNrdXbUPVaEWmZklzqyJby9njR9w/pRPdA5iky4tC
	/eBhyCvshgiSQj0pVUmdJWe5qn+TBK8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 0/3] tools/libs: decouple more from mini-os
Date: Sun, 16 Jan 2022 09:23:43 +0100
Message-Id: <20220116082346.26194-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series removes some hard coupling of the Xen build with some
Mini-OS internals, especially the struct file layout and the internal
organization of the file handling.

This series depends on the Mini-OS series posted recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00635

The main idea is to no longer have Xen library specific structures
inside struct file, or to let struct file layout depend on the
configuration of Mini-OS.

All Xen libraries needing a hook in struct file should use the now
available generic dev pointer and allocate the needed data dynamically.

Additionally Xen libraries should get the pointer of struct file via
the new get_file_from_fd() function instead of accessing directly the
files[] array, which might go away in future (e.g. in order to support
dynamic allocation of struct file as needed).

Via using alloc_file_type() the libs provide a function vector in
order to enable Mini-OS to remove the dedicated callbacks into the
libs via known function names and replacing them to use the new
vector.

Changes in V3:
- comments addressed

Changes in V2:
- comments addressed
- add using alloc_file_type()
- new patch 3

Juergen Gross (3):
  tools/libs/evtchn: decouple more from mini-os
  tools/libs/gnttab: decouple more from mini-os
  tools/libs/ctrl: remove file related handling

 tools/libs/ctrl/xc_minios.c |   9 ---
 tools/libs/evtchn/minios.c  | 143 ++++++++++++++++++++++++------------
 tools/libs/gnttab/minios.c  |  67 +++++++++++++----
 3 files changed, 148 insertions(+), 71 deletions(-)

-- 
2.26.2


