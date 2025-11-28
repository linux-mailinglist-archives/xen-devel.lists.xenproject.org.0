Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F195C9226C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174843.1499787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyfw-0003oB-QN; Fri, 28 Nov 2025 13:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174843.1499787; Fri, 28 Nov 2025 13:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyfw-0003lv-Ln; Fri, 28 Nov 2025 13:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1174843;
 Fri, 28 Nov 2025 13:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vOyfv-0003lT-H8
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:38:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8d07c0-cc5f-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 14:38:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 954205BD6E;
 Fri, 28 Nov 2025 13:38:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 682D83EA63;
 Fri, 28 Nov 2025 13:38:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4rzcF8KlKWkCLgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 28 Nov 2025 13:38:10 +0000
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
X-Inumbo-ID: 7b8d07c0-cc5f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764337090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmOWmOaXjUYefxxHhYfjGdU9/uWVMkzSMEAj+6XFJlo=;
	b=R4a4Dxzz8+/qNkCD2WRzLaFXjSHQ+CqaCW55QmnXFJ+OD5xsgYGhvfZy9HZbJ7ovkMxkGk
	WGfAXV3AbQKyABmoink77IVS3RGcHgemcz+L96DjNqgvaegb1JnoTGTI9LJporh8aV/+Tl
	aEGbOtteJhWkv+LZ/apuAaoxdDObsjI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=R4a4Dxzz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764337090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmOWmOaXjUYefxxHhYfjGdU9/uWVMkzSMEAj+6XFJlo=;
	b=R4a4Dxzz8+/qNkCD2WRzLaFXjSHQ+CqaCW55QmnXFJ+OD5xsgYGhvfZy9HZbJ7ovkMxkGk
	WGfAXV3AbQKyABmoink77IVS3RGcHgemcz+L96DjNqgvaegb1JnoTGTI9LJporh8aV/+Tl
	aEGbOtteJhWkv+LZ/apuAaoxdDObsjI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH] x86: have .note.Xen segment contents before other .note.* ones
Date: Fri, 28 Nov 2025 14:38:07 +0100
Message-ID: <20251128133807.9206-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 954205BD6E

Today the linker script of Mini-OS specifies to merge all .note*
sections into a single section .note:

 .note : {
          *(.note)
          *(.note.*)
  }

It seems as if ld will use the attributes of the first .note* segment
found during the linking process for the final .note segment.

Somewhere between binutils 2.43 and 2.45 something changed resulting in
.note.GNU-stack being the first .note* segment found. Unfortunately
this segment has unusual attributes: it has PROGBITS instead of NOTE as
type, resulting in the Xen ELF parsing to no longer look into it for
finding the Xen ELF-notes. This in turn will result in failure while
trying to parse the binary, which will let domain creation fail.

In order to avoid this issue, enhance the linker script to merge
.note.Xen before other .note.* segments, resulting in the final .note
segment to still have the NOTE type.

Fixes: 6d1cc81d049f ("x86: switch to use elfnote")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/minios-x86.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/minios-x86.lds.S b/arch/x86/minios-x86.lds.S
index 8c6e0a60..6367b4b2 100644
--- a/arch/x86/minios-x86.lds.S
+++ b/arch/x86/minios-x86.lds.S
@@ -33,6 +33,7 @@ SECTIONS
 
         .note : {
                 *(.note)
+                *(.note.Xen)
                 *(.note.*)
         }
 
-- 
2.51.0


