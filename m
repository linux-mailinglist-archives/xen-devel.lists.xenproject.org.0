Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931F55040F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 12:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351764.578511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2W0B-0004Vw-7I; Sat, 18 Jun 2022 10:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351764.578511; Sat, 18 Jun 2022 10:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2W0B-0004Te-41; Sat, 18 Jun 2022 10:48:27 +0000
Received: by outflank-mailman (input) for mailman id 351764;
 Sat, 18 Jun 2022 10:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2W09-00049A-0J
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 10:48:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a73de96-eef4-11ec-b725-ed86ccbb4733;
 Sat, 18 Jun 2022 12:48:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA8D81F99B;
 Sat, 18 Jun 2022 10:48:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B00241348B;
 Sat, 18 Jun 2022 10:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4ZpmKXKtrWIXKAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 18 Jun 2022 10:48:18 +0000
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
X-Inumbo-ID: 2a73de96-eef4-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655549298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RInIqIonFLW15r0nOyuZItE2ii5IHR7IInXm5oJr6O0=;
	b=nBEPrLOR64DhcXkRffIHR5xzxr3hXwZdB7FIRtYxv+0g2L7x92RESUSUMG1QwoFxZ3WXbm
	xClM03iUTwX439VTp/VyJfEg0mxw46341i7CkZZFnlRPGHXdPoNfGqa7TJYDWsLMti7L09
	TrOyd0he9ZBFY1LP+s3gIxzcfpriY+s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] mini-os: some memory map updates for PVH
Date: Sat, 18 Jun 2022 12:48:13 +0200
Message-Id: <20220618104816.11527-1-jgross@suse.com>
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

Juergen Gross (3):
  mini-os: take newest version of arch-x86/hvm/start_info.h
  mini-os: prefer memory map via start_info for PVH
  mini-os: fix number of pages for PVH

 arch/x86/mm.c                         | 10 ++++-
 balloon.c                             |  2 +-
 e820.c                                | 53 +++++++++++++++++++---
 include/e820.h                        |  5 +++
 include/x86/arch_mm.h                 |  2 +
 include/xen/arch-x86/hvm/start_info.h | 63 ++++++++++++++++++++++++++-
 6 files changed, 125 insertions(+), 10 deletions(-)

-- 
2.35.3


