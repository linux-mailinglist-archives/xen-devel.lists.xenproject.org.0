Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF15550EC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 18:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354195.581251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wP-0002OJ-GS; Wed, 22 Jun 2022 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354195.581251; Wed, 22 Jun 2022 16:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42wP-0002LV-DO; Wed, 22 Jun 2022 16:10:53 +0000
Received: by outflank-mailman (input) for mailman id 354195;
 Wed, 22 Jun 2022 16:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o42wO-0002LP-O0
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 16:10:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f09c1f-f245-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 18:10:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66ACA21B8F;
 Wed, 22 Jun 2022 16:10:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1187E134A9;
 Wed, 22 Jun 2022 16:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FVLyAgs/s2JzCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 16:10:51 +0000
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
X-Inumbo-ID: e2f09c1f-f245-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655914251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dLNCSuzgjE1irfejW+XQU6PJClEFaQlN1EssbDqEWZE=;
	b=ddEJwwo53MebTNELEsUYrQtqkyRVDUa9qirmRSQ4fMI0zQojNEw4VWpDeZecZb11hNRvVz
	szP8D2+RV5mAugoe6drgBCliA41Ra1zyUftEEF/LYW/i4DzLfS4ALbuxif7BKRZDyEAV/S
	QNKJCamoAb+V8Y0uQ/67w9VaTL3WuBU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 0/2] x86: fix brk area initialization
Date: Wed, 22 Jun 2022 18:10:46 +0200
Message-Id: <20220622161048.4483-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brk area needs to be zeroed initially, like the .bss section.

Juergen Gross (2):
  x86/xen: use clear_bss() for Xen PV guests
  x86: fix setup of brk area

 arch/x86/include/asm/setup.h |  3 +++
 arch/x86/kernel/head64.c     |  4 +++-
 arch/x86/xen/enlighten_pv.c  |  8 ++++++--
 arch/x86/xen/xen-head.S      | 10 +---------
 4 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.35.3


