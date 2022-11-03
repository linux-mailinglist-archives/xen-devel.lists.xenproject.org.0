Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC7617BB3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436347.690395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWg-0003Ey-4N; Thu, 03 Nov 2022 11:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436347.690395; Thu, 03 Nov 2022 11:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWg-0003Cz-1F; Thu, 03 Nov 2022 11:36:50 +0000
Received: by outflank-mailman (input) for mailman id 436347;
 Thu, 03 Nov 2022 11:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqYWe-0003Ct-Cd
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:36:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc1e893f-5b6b-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:36:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B6971F88C;
 Thu,  3 Nov 2022 11:36:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A806913480;
 Thu,  3 Nov 2022 11:36:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zT6jJ8ynY2PoHgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Nov 2022 11:36:44 +0000
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
X-Inumbo-ID: cc1e893f-5b6b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667475405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2jqME7F+qdUftTzWR72PDDjTzwv0qCQjs1xhw+ZdsU=;
	b=lMyg6ETc97azzoW47K210vpzsQEyM8fTV4c+5WVVzcj+0lcLDHxabMpcsuQMWDFQvtAZN4
	0hHPII4l8tRuDyGpgjP5TscidSmhQjiCJvhdysgX8my9WIWoEW2vGXjt+IpIi1/24B0r9O
	Dk7aO6PBwgzOCy9oygMAKvYkeLf/lvk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Pu Wen <puwen@hygon.cn>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 0/4] Switch X86_FEATURE_XENPV to cpu_feature_enabled() use
Date: Thu,  3 Nov 2022 12:36:32 +0100
Message-Id: <20221103113636.25543-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make especially kernels without CONFIG_XEN_PV more efficient by
using cpu_feature_enabled(X86_FEATURE_XENPV) instead of boot_cpu_has()
and friends.

Juergen Gross (4):
  x86: add X86_FEATURE_XENPV to disabled-features.h
  x86: remove unneeded 64-bit dependency in arch_enter_from_user_mode()
  x86: drop 32-bit Xen PV guest code in update_task_stack()
  x86: switch to cpu_feature_enabled() for X86_FEATURE_XENPV

 arch/x86/include/asm/disabled-features.h | 8 +++++++-
 arch/x86/include/asm/entry-common.h      | 4 ++--
 arch/x86/include/asm/switch_to.h         | 7 ++-----
 arch/x86/kernel/cpu/amd.c                | 2 +-
 arch/x86/kernel/cpu/bugs.c               | 2 +-
 arch/x86/kernel/cpu/hygon.c              | 2 +-
 arch/x86/kernel/process_64.c             | 4 ++--
 arch/x86/kernel/topology.c               | 2 +-
 arch/x86/mm/cpu_entry_area.c             | 2 +-
 9 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.35.3


