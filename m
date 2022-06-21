Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B127C552BC2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 09:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352997.579883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEI-0001ZD-Ut; Tue, 21 Jun 2022 07:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352997.579883; Tue, 21 Jun 2022 07:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEI-0001Us-QE; Tue, 21 Jun 2022 07:23:18 +0000
Received: by outflank-mailman (input) for mailman id 352997;
 Tue, 21 Jun 2022 07:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3YEI-0001Tv-0r
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 07:23:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 043a01cd-f133-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 09:23:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7F11FDD0;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5A5C13638;
 Tue, 21 Jun 2022 07:23:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oPDsMuNxsWLDYwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Jun 2022 07:23:15 +0000
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
X-Inumbo-ID: 043a01cd-f133-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655796196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=r8IJi4G0dpuEL3/1eath/8IW/jxqJG8WThQocwvM6XY=;
	b=JbgVOS9Dda7Ko5UNhr3J2zWh2GDx6L1G91NAkHiWRYhsp3Nk6arhiDa+7Wve+E5W7n3Xwm
	DymTMv4BPlA24vH+ZdirA/FbVmmqBhKKZYqSor33oTbcrJGJLla5S6XTtQOf3lIQivU+oc
	7a0w2McbX8/6S7fxWk+vaWUNqTwJgw0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/4] mini-os: some memory map updates for PVH
Date: Tue, 21 Jun 2022 09:23:10 +0200
Message-Id: <20220621072314.16382-1-jgross@suse.com>
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

Changes in V3:
- minor comment for patch 3 addressed

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


