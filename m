Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKOOOGRcwWlZSgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 16:29:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860672F65C1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 16:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259411.1552720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4hDI-0003Io-SY; Mon, 23 Mar 2026 15:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259411.1552720; Mon, 23 Mar 2026 15:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4hDI-0003H1-PR; Mon, 23 Mar 2026 15:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1259411;
 Mon, 23 Mar 2026 15:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kwl=BX=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w4hDH-0003Gv-UA
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 15:29:07 +0000
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0446a469-26cd-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 16:29:00 +0100 (CET)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso3164019f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 08:29:00 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703343sm31418114f8f.19.2026.03.23.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 08:28:58 -0700 (PDT)
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
X-Inumbo-ID: 0446a469-26cd-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774279740; x=1774884540; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1BC1fDycJ7EDwbafdpHNSpai0vT5U7s/IgYviOpDy4=;
        b=kB8BSlYS/Fq1FSyfvuRcj4rnhG4z3ngy4YTdgbGN5V6ziErExYjANQBcq9Dm2sEh94
         mi996FeTTuQdfvri7i1heoUL5Gfub6To7PJZWmfn9Do3oYl9VXjDJz9PJSaex+IMMPlu
         1L2wsRiGCb+5OfEXiIAVLMQYOGr1nlwf3f+zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279740; x=1774884540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1BC1fDycJ7EDwbafdpHNSpai0vT5U7s/IgYviOpDy4=;
        b=QCSZMvmo2OLku3DdNK0gF1G7bG440/pWB9D56DItw6qBvznR4U9+UrjkhEFJe6zI4G
         T6pW0hXu1d6H7aIER7REc6uLHFayHy3G7PjH0j5kC52WlxlOMO18E0+YNhm26D+SfrIq
         7BAitm40uJJyaoCdnIDWNHqZujudL5X77DIXGqIaYFgD6IefBCpnY68F4aqew40NiS4u
         1oICx72o75Zi6dSdHW8gUWoFVj+G/owtAyXf4osVWdqxaGW5OgLVsUK6smf8PfTDBKRo
         GJv/ibd1Vfam7SQLvRpGRFDmYz1E2YXBjO5gb3YOMbBGRCmBS6DeAWy+JzsNiiXkABBh
         Y1Kw==
X-Gm-Message-State: AOJu0YwiI478EdQ+LHoVkTyqlQbuKjC7IYmYKCp1dVoud1SggZOmMPYe
	hr4wODQ8WstnG4VeIoZRZrKTnu+ib7mmpPxafYlCrZm+b2FcxozILAqrLaDuiB4gv7qR2RDEvof
	yRt1C
X-Gm-Gg: ATEYQzxdOd38sYwc/C39gmlUvNRYGWvHQheWrGOhtaIMknfovSlHJdlXLCK3DhJKNbk
	o9l7UPm09cDyVfPesDnEp+diwMQvDOeYxCRkHwVZU0DGq5sswFeR/vNKgJcaMc1TgbljYDrvOgl
	14/BFmaDRJA55iV9yw0QYedWm3ix4fW4iVf5E947bufJnD1mU9c9xRyxoexVgz7nI0gr+4OuDig
	4Lw2xutobOb3splbqDIPq4WhzmXayOZ4b6ny1V0kl7dIYt7AvaxRLfbVBeZNhaH4sebukiw1VjH
	7WA2LMRMjswE/t3rTfvs0mJ0St6uryL+01Ir6maDKzC3JE9e6eXgyUEfa7wT1WCTkcEHfDCE0E1
	ch5Uyh3rF7IwypjvaFDnbjEfhpnAL1WuqgxaFypG3zU4J6AKiOXyabvHpSbMkalJeFIKeQpMzET
	zIWpPuzY9wiwzDTJf6FeNvgsvy2y4bqR+ON000V1GlhvJLbeWi2da27Y6KrMdKODTd2Sn36jGV7
	Bgo
X-Received: by 2002:a05:6000:2a09:b0:43b:425b:ec3f with SMTP id ffacd0b85a97d-43b80526465mr20426f8f.4.1774279738916;
        Mon, 23 Mar 2026 08:28:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/public: Delete duplicate VCGF constants
Date: Mon, 23 Mar 2026 15:28:56 +0000
Message-Id: <20260323152856.966730-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 860672F65C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Having two spellings of the constants makes following the code unnecessarily
difficult.  Reduce it to one spelling.

This is an API change in the public headers, but one for the better.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c                    | 2 +-
 xen/include/public/arch-x86/xen-x86_64.h | 1 -
 xen/include/public/arch-x86/xen.h        | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4664264b2f5d..9ba2774762cc 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1246,7 +1246,7 @@ int arch_set_info_guest(
          is_pv_64bit_domain(d) )
         v->arch.flags &= ~TF_kernel_mode;
 
-    if ( flags & VGCF_I387_VALID )
+    if ( flags & VGCF_i387_valid )
         vcpu_setup_fpu(v, &c.nat->fpu_ctxt);
     else
         vcpu_reset_fpu(v);
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 75f121be0e14..9f33d80d3135 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -103,7 +103,6 @@
 /* Guest exited in SYSCALL context? Return to guest with SYSRET? */
 #define _VGCF_in_syscall 8
 #define VGCF_in_syscall  (1<<_VGCF_in_syscall)
-#define VGCF_IN_SYSCALL  VGCF_in_syscall
 
 #ifndef __ASSEMBLER__
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index a7bf046ee006..4693e47d204c 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -160,8 +160,6 @@ typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */
 struct vcpu_guest_context {
     /* FPU registers come first so they can be aligned for FXSAVE/FXRSTOR. */
     struct { char x[512]; } fpu_ctxt;       /* User-level FPU registers     */
-#define VGCF_I387_VALID                (1<<0)
-#define VGCF_IN_KERNEL                 (1<<2)
 #define _VGCF_i387_valid               0
 #define VGCF_i387_valid                (1<<_VGCF_i387_valid)
 #define _VGCF_in_kernel                2
-- 
2.39.5


