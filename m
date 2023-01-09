Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D166296C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473731.734465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEtmA-0004my-QR; Mon, 09 Jan 2023 15:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473731.734465; Mon, 09 Jan 2023 15:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEtmA-0004lE-NY; Mon, 09 Jan 2023 15:09:26 +0000
Received: by outflank-mailman (input) for mailman id 473731;
 Mon, 09 Jan 2023 15:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CfuE=5G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pEtm9-0004l8-R5
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:09:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a20b14f-902f-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 16:09:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF9EF34300;
 Mon,  9 Jan 2023 15:09:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 788C2134AD;
 Mon,  9 Jan 2023 15:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id diIQHCMuvGORRQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 09 Jan 2023 15:09:23 +0000
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
X-Inumbo-ID: 9a20b14f-902f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673276963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bvld8zPnYDTnQIG1YqFCYb/KZpQyo3ITt9siNGCo5AU=;
	b=vFJ4c9PD8hUN1mARIMwxWF3d/NZ/pc8pC3MQlSRQRs0Sikg/ojs58lhAE4+cVRT9SEL5Lt
	UqCOuBfA+OZ0KtIVPDjs94DZnYPv5X6A8k7wQ1G8tbRh3i+f1FV1MsMlcHcXUyFptlc1T+
	M4AJqrOad/ZUJ+3AhGSlF0oacbYL6LM=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/mm: fix poking_init() for Xen PV guests
Date: Mon,  9 Jan 2023 16:09:22 +0100
Message-Id: <20230109150922.10578-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3f4c8211d982 ("x86/mm: Use mm_alloc() in poking_init()") broke
the kernel for running as Xen PV guest.

It seems as if the new address space is never activated before being
used, resulting in Xen rejecting to accept the new CR3 value (the PGD
isn't pinned).

Fix that by adding the now missing call of paravirt_arch_dup_mmap() to
poking_init(). That call was previously done by dup_mm()->dup_mmap() and
it is a NOP for all cases but for Xen PV, where it is just doing the
pinning of the PGD.

Fixes: 3f4c8211d982 ("x86/mm: Use mm_alloc() in poking_init()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index d3987359d441..5f8ba537d9d3 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -804,6 +804,9 @@ void __init poking_init(void)
 	poking_mm = mm_alloc();
 	BUG_ON(!poking_mm);
 
+	/* Xen PV guests need the PGD to be pinned. */
+	paravirt_arch_dup_mmap(NULL, poking_mm);
+
 	/*
 	 * Randomize the poking address, but make sure that the following page
 	 * will be mapped at the same PMD. We need 2 pages, so find space for 3,
-- 
2.35.3


