Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFjzOC0yxWkn8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:18:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F45335D8D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264110.1555836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kbO-00076i-Ue; Thu, 26 Mar 2026 13:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264110.1555836; Thu, 26 Mar 2026 13:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kbO-00074Y-Qn; Thu, 26 Mar 2026 13:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1264110;
 Thu, 26 Mar 2026 13:18:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5kbN-00074S-2b
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:18:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kbM-004WTq-Ed
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:18:20 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c5321b-2eae-0a2a0a5409dd-0a2a4501999c-6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:18:20 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c5321c-6400-0a2a45010019-d155dd35ccbf-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:18:20 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso891306f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:18:20 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919df7dcsm8948737f8f.27.2026.03.26.06.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 06:18:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774531099; x=1775135899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4dXXIcKAOdtd7nLvTgzA0mgx+BRrOkNsGYNjYLQUv4=;
        b=EQ+PifV4S7TIKDv6PLevQeVew0snt7NBs0PY1nxMua6DAe3ML6KogcHzDyWNuHlw/d
         +x8PTdjw2R0kn/v8YDx8YSCu+lb3aFv/nIpToXNDo0SRp+ENHGIWV9xpyo7cRnQCQjNT
         oO+2YWCj9KpL7awGMODw1UWzA1IdSIt/9Xd4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531099; x=1775135899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4dXXIcKAOdtd7nLvTgzA0mgx+BRrOkNsGYNjYLQUv4=;
        b=NT+kLciGQh3lgj6ZTKikTOO0GoCY33lGpLR1c6h16mDr05Gxe/PBOwMKpR9U99jqzD
         Wdd7t5VblJ4nJVnEor2BENgRpBTZlYYOfjVkLICIrXhkzcZjhQzbNb5qPXMEiiblifHd
         THe1lSdqoeZrMIENQB8k38S0ZUjZvia3t+erOc6XSi3iXoAwTKC6/DndpetLJK/vCMK3
         A5C3Wt7ASH30TX8U6MeFcDlDm4+j9Yqv8tAUlNnp2DSb2f+rYRxbCNUSJPE7VhWt9iBy
         qnaBolglUN3PVHFNY8Y3b74m7j3F5sUukDdlvK8Av0/5lKMdKM4hvNmlfbBThIkmVLFZ
         nHTQ==
X-Gm-Message-State: AOJu0Yz4x8nKprpIQlzGbaomx4tKS60w6be6ioiSQ78j5mwxQMMYI80i
	Cb96wDun0wkzGX69wEQX3uhHzCkMjACwZrL0pfUP14n0yy+JL0z1XaKvXAFHC380H9wAyUewbSH
	DrTn2
X-Gm-Gg: ATEYQzwhUTeI3HG2iNi1BRyWUm1yzi4kyqOn8JynlKzTk+5ksxXaPOsS4+bvxR2iMub
	iLCVZynI3TgDaQJCqgPc6plmgOdLKw/ZW22HUJcytC3B1hOIYNjyLhcJ1c/mO64onPnC3IgA8aD
	OzpsnCLHdggjr0RUTTWABTQgCTeNjXRil8H/sT8xiT4U+44KaZcz034zu0HNtsafuo1O6sM5oAX
	xIrqfArweYIdPEagO6sqQhrB6FKBaN5vR3k7Eo2idArdTINxsM4keEkXX0HI/fb74stdX+MiyrW
	DzOBVajIPRmiEElYa4k3c9nb/v550PnGa0fYGUenVXVJmw3Qmdm9xzZxQo8AKPX7aiwJhbAbtnY
	fM8Gs5J2TXuIqFCwukNY4soGdSPeQM5FtLNspe16noAFkfxwYCC2oaptOcKVcKoBeZA4bJFb4dq
	Qy2WwWqoZFPLRPIqYCkCZdU2ECJUIPxMkncKgsuBdEfyLCnHF+NvJakbnzVlFfoVjzSngWn5Vwd
	RZc
X-Received: by 2002:a05:6000:4212:b0:439:c1f4:302a with SMTP id ffacd0b85a97d-43b8899543emr11418473f8f.11.1774531097586;
        Thu, 26 Mar 2026 06:18:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Configuration for Linear Address Space Separation
Date: Thu, 26 Mar 2026 13:18:15 +0000
Message-Id: <20260326131815.1139203-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774531100-8DEFADF3-8A923FD1/0/0
X-purgate-type: clean
X-purgate-size: 3288
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 56F45335D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LASS is a feature designed in the aftermath of Meltdown, which codifies the
user/kernel split in address space in order to block entire classes of
sidechanels.  Specifically, it allows the CPU to terminate any memory access
into the wrong half of the address space based on linear address alone and
without needing a pagewalk.

It is available in CPUs starting with Intel Sapphire Rapids (2023).

For now, allow LASS to be opted in to, but leave it off by default.  Some work
in the emulator is going to be needed to enable it by default.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This needs rebasing around my correction to the FRED comment.

Abdel is going to look into the emulator side of things, which is going to be
easier with this patch already in place.  I intend to get it fully supported
for 4.22.
---
 xen/arch/x86/hvm/hvm.c                      | 1 +
 xen/arch/x86/include/asm/x86-defns.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57a5..b62b058861c3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1019,6 +1019,7 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (p->feat.pku      ? X86_CR4_PKE               : 0) |
             (cet              ? X86_CR4_CET               : 0) |
             (p->feat.pks      ? X86_CR4_PKS               : 0) |
+            (p->feat.lass     ? X86_CR4_LASS              : 0) |
             0);
 }
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index edeb0b4ff95a..51b603bb1a14 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -82,6 +82,7 @@
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
+#define X86_CR4_LASS       (_AC(1, ULL) << 27) /* Linear Address Space Separation */
 #define X86_CR4_FRED       (_AC(1, ULL) << 32) /* Fast Return and Event Delivery */
 
 #define X86_CR8_VALID_MASK 0xf
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cd778586f10..c0b52e4c9ef9 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,7 +304,7 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
 XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
-XEN_CPUFEATURE(LASS,         10*32+ 6) /*   Linear Address Space Separation */
+XEN_CPUFEATURE(LASS,         10*32+ 6) /*s  Linear Address Space Separation */
 XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
 XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
-- 
2.39.5


