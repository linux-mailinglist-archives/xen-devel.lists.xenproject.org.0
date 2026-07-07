Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8pPuOFlYTWqsygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 21:49:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A871F639
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 21:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=lMZ0bh4C;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356516.1611105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whBnN-00050m-4C; Tue, 07 Jul 2026 19:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356516.1611105; Tue, 07 Jul 2026 19:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whBnN-0004yZ-1Y; Tue, 07 Jul 2026 19:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1356516;
 Tue, 07 Jul 2026 19:49:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1whBnK-0004yS-VU
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 19:49:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whBnI-00Eakh-Oh
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 21:49:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4d583f-bab6-0a2a0a5309dd-0a2a450491aa-4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 21:49:24 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4d5844-a01d-0a2a45040019-d155802da845-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 21:49:24 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so12089805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 12:49:24 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f4e3afsm88611485e9.7.2026.07.07.12.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 12:49:23 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783453764; x=1784058564; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNAZh+YVrrF3CVOLHqSmEARVfm8tjKj1UJEXvh4756w=;
        b=lMZ0bh4CQjWdQGnVZBvGlweWtHArQMUzGAlFcZ+srslrUELPG2prPF9lrYKcOZzuxT
         A8JxrNxw0PXxL+/LXLrXp3cD8NAHWjuU3NUkzA8oNUZH0S4sCI8JpX7ZXQ3732gdk32r
         u2q+ju8X5u208HIxpc2TnLmwfmzQUrDnwGIPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453764; x=1784058564;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNAZh+YVrrF3CVOLHqSmEARVfm8tjKj1UJEXvh4756w=;
        b=MOBPU8bq2KhuhcPI/MuyW5ToTC/qP75k/vq/TPQsMaV9ezcQLdeDb4sBYGeWrL8cSw
         MeRGdPZAwoqpavb5oqOJITYOFzNmhRCOM8mv3Kd7dGDVfL2irERs0YBqbt5JUL+ZA8K4
         tChS0XD3bpEsPlWabcucjyrRYW8Wxyfqswf9Wksq9O1Cxh0Si+Rwlw5wMQM6t/2xbCdr
         h2qSbXhIfzvb2K8Lz6LszeMoRrwialnGPHQnOL5rkEchMJK+NuSzgjWfQufNra+j8W97
         Z1j56LED+wMRnIjMcoyDkK5Zeh93HgdBJr7jbIiQFGlPhXRMXqQzJb4pETMcCJj69rvh
         Jbjw==
X-Gm-Message-State: AOJu0YwXIUWks+7nnkASpSWN9ZUG+DsG8j3nqP4XIMSDhiVtKHxww3pn
	VFGSGNex4Sgq/geqmi0hEQaAEFXqN28eNnviKvJKdWzHy8hgF9JRxR0Z85Hn3xy7cvnwyv20vhO
	hZaC6faQ=
X-Gm-Gg: AfdE7cmvWvnEfVrv5DaPHTwCxMa8sgH/YGkK0nrd2Nsh7MPeD/Z3oLQfAyMNEVp8vln
	qA+FkB2arUJI4lOCbUtNptWxmFyZ3ClGea/QNfEsrYSnOQwWTH5aFI1purALR6ydhREFdGWyNVC
	Ebka7SvavJP9pBOx9HCMkoqbrtdL32Pt1Gs7mnszfczt5Ms34sQJ1ffkvlF/UEAxwKKKONAX0Ih
	QJ9YRdl48rNYiqmZJQI0wJakT+WMLRPjmOnZTxnHb4ZxClRbbiN7vXqj6csJgh26Q0qPx1nB60U
	mM+DmQHMzgzj5UgkaZX5U0QUXw3v6SQBopZb/SkD5ms248w0Xnr3K/nJTwWRYfqSJKxfWfZ8mcW
	7DAHFahqD65Li/gduhLGhcHIPu98xMBVPPTkp75VhjkfRi9eLDXu8oAJ5HVqWgh5Ti4K+po4IfF
	15+Untuz7NnA/hdFh+Uz+njcT3m9zU7hapu1xmOw4yLqIP2zxeJTMNRtrW3iqbINk=
X-Received: by 2002:a05:600c:6990:b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-493e17dda4dmr42962095e9.2.1783453763929;
        Tue, 07 Jul 2026 12:49:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
Date: Tue,  7 Jul 2026 20:49:21 +0100
Message-Id: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783453764-ADD341CC-F93BA89E/0/0
X-purgate-type: clean
X-purgate-size: 1470
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2A871F639

The APM description of the AltMovCR8 feature bit is:

  "LOCK MOV CR0 means MOV CR8"

Adjust the decode logic to behave like this.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

v3:
 * Change yet again.  A contact with information on the matter confirmed that
   it is a special case for Reg = 0, and not a general modifier to all Reg
   values.
---
 xen/arch/x86/x86_emulate/decode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 2c13356c4d17..57f6baffb066 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -780,12 +780,12 @@ decode_twobyte(struct x86_emulate_state *s,
         break;
 
     case 0x20: case 0x22: /* mov to/from cr */
-        if ( s->lock_prefix && vcpu_has_cr8_legacy() )
+        if ( s->lock_prefix && vcpu_has_cr8_legacy() && s->modrm_reg == 0 )
         {
-            s->modrm_reg += 8;
+            s->modrm_reg = 8;
             s->lock_prefix = false;
         }
-        /* fall through */
+        fallthrough;
     case 0x21: case 0x23: /* mov to/from dr */
         ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
         generate_exception_if(s->lock_prefix, X86_EXC_UD);
-- 
2.39.5


