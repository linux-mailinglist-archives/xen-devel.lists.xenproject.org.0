Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937FAF0DCB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030597.1404377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsj7-0007aV-23; Wed, 02 Jul 2025 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030597.1404377; Wed, 02 Jul 2025 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsj6-0007Xq-TE; Wed, 02 Jul 2025 08:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1030597;
 Wed, 02 Jul 2025 08:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsb5-00082X-5A
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7444cc44-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D310421175;
 Wed,  2 Jul 2025 08:13:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F72A13A24;
 Wed,  2 Jul 2025 08:13:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KH5hJTDqZGg3SQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:36 +0000
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
X-Inumbo-ID: 7444cc44-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdGpyRgE6zFBkEZAGFiUxZVsQXRgwUjyVMbYAPLusAo=;
	b=WaR0MKyG0M0KAo1/03X7Z9/YBAj/liSQUxDFbcAcLRMtvm/Lpy9u8RY2tEgZsywKHVtM6u
	qEx8bKBeikJiQ4tkl65SALgmqw2ZqMiwm/eet8fap3dPd8pmHMfiN4dvTVU9dI01mU8FmF
	IV5yO4o5Fwd9K+4+ZgYX0kzkwVqDN/M=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdGpyRgE6zFBkEZAGFiUxZVsQXRgwUjyVMbYAPLusAo=;
	b=WaR0MKyG0M0KAo1/03X7Z9/YBAj/liSQUxDFbcAcLRMtvm/Lpy9u8RY2tEgZsywKHVtM6u
	qEx8bKBeikJiQ4tkl65SALgmqw2ZqMiwm/eet8fap3dPd8pmHMfiN4dvTVU9dI01mU8FmF
	IV5yO4o5Fwd9K+4+ZgYX0kzkwVqDN/M=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 07/19] kexec: fix physical addresses in start info data
Date: Wed,  2 Jul 2025 10:12:42 +0200
Message-ID: <20250702081254.14383-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

The physical addresses in struct hvm_start_info are pointing to the
memory where the data is being built instead of the location where it
will finally be moved to.

Fix that.

Fixes: b7994b6409a4 ("mini-os: kexec: build parameters for new kernel")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index fc58473e..d84df42c 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -233,9 +233,9 @@ int kexec_get_entry(const char *cmdline)
     memset(info, 0, sizeof(*info));
     info->magic = XEN_HVM_START_MAGIC_VALUE;
     info->version = 1;
-    info->cmdline_paddr = kexec_param_mem + sizeof(*info) +
+    info->cmdline_paddr = kexec_param_loc + sizeof(*info) +
                           e820_entries * sizeof(struct hvm_memmap_table_entry);
-    info->memmap_paddr = kexec_param_mem + sizeof(*info);
+    info->memmap_paddr = kexec_param_loc + sizeof(*info);
     info->memmap_entries = e820_entries;
 
     mmap = (struct hvm_memmap_table_entry *)(info + 1);
-- 
2.43.0


