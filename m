Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C921638402
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 07:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448071.704904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oySGb-00063H-Qg; Fri, 25 Nov 2022 06:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448071.704904; Fri, 25 Nov 2022 06:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oySGb-00060E-Nj; Fri, 25 Nov 2022 06:32:53 +0000
Received: by outflank-mailman (input) for mailman id 448071;
 Fri, 25 Nov 2022 06:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lMay=3Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oySGb-000608-3r
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 06:32:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc4e32b2-6c8a-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 07:32:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D2DD61FD6A;
 Fri, 25 Nov 2022 06:32:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DC2B13A08;
 Fri, 25 Nov 2022 06:32:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fllnGZJhgGMicgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Nov 2022 06:32:50 +0000
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
X-Inumbo-ID: fc4e32b2-6c8a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669357970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fZrAaP9FxcQcpFDkMAFfQgOSXJ+0iWC8i07BQBQ2SXo=;
	b=qAMYWpJANmBzfUWnws2e+o51bVKp5OfZVCLdN1sqq6oUe7plzRkRxFH7v1ti+YPOfKqDij
	DeqpeP5zWgrZ+zlIuvzVqn/rGFayVzBoQ8uHZB36Zy2RxspaDt63/0Ry37qukLJfQslZGt
	m/vD0GB7HhzRyhYNuyATnQ0xKCggbNQ=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 0/2] x86/xen: don't return from xen_pv_play_dead()
Date: Fri, 25 Nov 2022 07:32:46 +0100
Message-Id: <20221125063248.30256-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All play_dead() functions but xen_pv_play_dead() don't return to the
caller.

Adapt xen_pv_play_dead() to behave like the other play_dead() variants.

Juergen Gross (2):
  x86/xen: don't let xen_pv_play_dead() return
  x86/xen: mark xen_pv_play_dead() as __noreturn

 arch/x86/xen/smp.h      |  2 ++
 arch/x86/xen/smp_pv.c   | 17 ++++-------------
 arch/x86/xen/xen-head.S |  7 +++++++
 tools/objtool/check.c   |  1 +
 4 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.35.3


