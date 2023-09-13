Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE079E6FB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601225.937187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOCY-0002nJ-8a; Wed, 13 Sep 2023 11:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601225.937187; Wed, 13 Sep 2023 11:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOCY-0002kg-4h; Wed, 13 Sep 2023 11:38:34 +0000
Received: by outflank-mailman (input) for mailman id 601225;
 Wed, 13 Sep 2023 11:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qgOCW-0002ka-Fe
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 11:38:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10607691-522a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 13:38:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B28341F385;
 Wed, 13 Sep 2023 11:38:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36BE613582;
 Wed, 13 Sep 2023 11:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L4D9CzafAWVVCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 13 Sep 2023 11:38:30 +0000
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
X-Inumbo-ID: 10607691-522a-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1694605110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uJxCMUIT09a7qNSpE55xAHMI/oO/Stvr6RHMZiPfub0=;
	b=sUXrGqZZOoVIQv+OGxhDBecrjHjH49ZzQmiR8HgriyCUNOyvY51cp4MNfw9H1W6dCN5PWU
	nlskKpBvJv3CbZBLqFWxt7NaFEeKD7XRZUMlyWluXouJQXkXs4bbOOzvEQlLkhJAKeb+KB
	zwEY9BZ/BObVZJyxnDHCZXPPTtSlHnI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-trace-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 0/3] xen: cleanup and fix lazy mode handling
Date: Wed, 13 Sep 2023 13:38:25 +0200
Message-Id: <20230913113828.18421-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is cleaning up Xen lazy mode handling by removing
unused stuff and moving purely Xen-specific code away from general
kernel code.

The last patch is fixing a regression which was introduced in the
6.6 merge window.

Juergen Gross (3):
  arm/xen: remove lazy mode related definitions
  x86/xen: move paravirt lazy code
  x86/xen: allow nesting of same lazy mode

 arch/x86/include/asm/paravirt_types.h | 15 ------
 arch/x86/include/asm/xen/hypervisor.h | 37 +++++++++++++++
 arch/x86/kernel/paravirt.c            | 67 ---------------------------
 arch/x86/xen/enlighten_pv.c           | 40 +++++++++++++---
 arch/x86/xen/mmu_pv.c                 | 55 ++++++++++++++--------
 arch/x86/xen/multicalls.h             |  4 +-
 include/trace/events/xen.h            | 12 ++---
 include/xen/arm/hypervisor.h          | 12 -----
 8 files changed, 114 insertions(+), 128 deletions(-)

-- 
2.35.3


