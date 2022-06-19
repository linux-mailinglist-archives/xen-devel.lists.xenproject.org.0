Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DECD55090A
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 08:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352046.578797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2onv-0005Av-7b; Sun, 19 Jun 2022 06:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352046.578797; Sun, 19 Jun 2022 06:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2onv-00056A-2Z; Sun, 19 Jun 2022 06:53:03 +0000
Received: by outflank-mailman (input) for mailman id 352046;
 Sun, 19 Jun 2022 06:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2ont-0004F8-AM
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 06:53:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72844e11-ef9c-11ec-b725-ed86ccbb4733;
 Sun, 19 Jun 2022 08:52:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E2FD1F8F9;
 Sun, 19 Jun 2022 06:52:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E378913427;
 Sun, 19 Jun 2022 06:52:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1echNsbHrmJzXgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Jun 2022 06:52:54 +0000
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
X-Inumbo-ID: 72844e11-ef9c-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655621575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4/VBdIlOf0fGkH80DrK+kifFIKli7auGQ8C3iCy/sOs=;
	b=c8BMbjPEFETnXHanJPJbi3acpIGjTIKia2MlnxWPPyqgCIc0Fdz8nER8mBrCn4cTemVsZv
	jAb7Lw1Wbug31VxVKq0ubuPyt3OE63p+MWqYDMklWNBabkKo0Ia+RMRA+h+ufGaHT07nEq
	J+fDDoXHsdbVnROv5wp6tsTyQKQOxkg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/4] mini-os: some memory map updates for PVH
Date: Sun, 19 Jun 2022 08:52:49 +0200
Message-Id: <20220619065253.19503-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some memory map related changes/fixes for PVH mode:

- Prefer the memory map delivered via start-info over the one obtained
  from the hypervisor. This is a prerequisite for Xenstore-stubdom
  live-update with rising the memory limit.

- Fix a bug related to ballooning in PVH mode: PVH Xenstore-stubdom
  can't read its target memory size from Xenstore, as this introduces
  a chicken-and-egg problem. The memory size read from the hypervisor
  OTOH includes additional "special" pages marked as reserved in the
  memory map. Those pages need to be subtracted from the read size.

- Fix a bug in ballooning code in PVH mode when using memory beyond
  a RAM hole in the memory map

Changes in V2:
- added patch 4
- addressed comment regarding patch 3

Juergen Gross (4):
  mini-os: take newest version of arch-x86/hvm/start_info.h
  mini-os: prefer memory map via start_info for PVH
  mini-os: fix number of pages for PVH
  mini-os: fix bug in ballooning on PVH

 arch/x86/mm.c                         | 23 ++++----
 balloon.c                             | 18 ++----
 e820.c                                | 83 ++++++++++++++++++++++++---
 include/e820.h                        |  6 ++
 include/x86/arch_mm.h                 |  2 +
 include/xen/arch-x86/hvm/start_info.h | 63 +++++++++++++++++++-
 6 files changed, 163 insertions(+), 32 deletions(-)

-- 
2.35.3


