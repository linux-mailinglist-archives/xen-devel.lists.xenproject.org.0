Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UPibF+shMWoXcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58A68E0F8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=siiGdRLp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339036.1600155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnl-0003kR-JF; Tue, 16 Jun 2026 10:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339036.1600155; Tue, 16 Jun 2026 10:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnl-0003iX-G1; Tue, 16 Jun 2026 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 1339036;
 Tue, 16 Jun 2026 10:13:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQnj-0003Vf-HZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:13:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQni-005R6q-AO
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:13:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121d3-5cb7-0a2a0a5109dd-0a2a450adce6-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:46 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121da-56b3-0a2a450a0019-d155802ad449-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:46 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so28236405e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:13:46 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm295160265e9.1.2026.06.16.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:13:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781604826; x=1782209626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S0H/QLubDb3sFgEIhvI4x0YN8vi9tpwyxDi8HASuUs=;
        b=siiGdRLpMsI4Syy8sMkON7gq6nvVKeCPs1m7SVDIJleK4nBrRQwxqLhs5iBRCQv9/W
         ev+fuug2XypuU5rdsgGMYEFldk4luB4sKxzQwjHMtJfREi/lQbIlNfXhZhc+FpzY+bUs
         jUFxuaR9MWL1hRGgqBd6hPBK0P4WaumrMsqGp6puT1hEvTURc9l5IxPUt96bD8gExajn
         5AbsJGx84zjt2/4v50w2O9WUbIfP8SBqGKmHt2MMILTl7Epr6xdInd2zCP9hAynlM1YK
         yet76cqPTnZNhbdKgnLnn0fjHqp6dwcU9RAfs55PYc7bNZb+pPpf1n1j2QOwBduYDBjN
         sKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604826; x=1782209626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+S0H/QLubDb3sFgEIhvI4x0YN8vi9tpwyxDi8HASuUs=;
        b=h9HOzeWsP5aAcr7vBUiuBhKx9LnSHm5fUKeBp42j1PGFl0vOfs/vMcy1xn+FxSICva
         o5+T7+AZNQj5IiuQTKpfUw5F9G/04w/tXoUN9J1Il79B50RiG44qGjXW7unJksNNyPxV
         5GRKyxCcxXoWCYKkmZrAiFmG16x4s+32HAAwpABDZwHYDI5RmZ2orAyZMP9Keu1K+Z5d
         LfwEg4akEenGUN7wULZYKopJ9b+++MzaBxqdLKtSqe/d33GespIcBM6IBtPTPBKTmqQ+
         ddE8rux7++8bYJWTCztU5s67sv7J1Gjb8PvlksGU9cRXEo/Hv275W9jDIy3aNh0ZfUcH
         0Lkg==
X-Gm-Message-State: AOJu0YwWUH5+whKmHC2HdQ8H7y9Lnb9ggx5lEHscn/CbjF0gO8A/GqED
	LhAYSIJgQLDdfDi7K/zo+sBTtCNJOF10n+aWWqhkFel/mlMFggeJuJm0NbupbNBS5QM=
X-Gm-Gg: Acq92OEUbqzKl2soN8q1GVguHlrU35dBgQVP70q0eW/CSPfBNAN1tlXr4uWZ5ecyajK
	VxIZrxrDdGD7/eCRfHqPR3PHWciX5suxbwOzYftz5r6KUlo0Wjdijd2DcODhgTZF+dq92Xe0QAf
	Nnb6nQ3DpAxjDnQLMTfb/SwZYaXD0x9iHDuSPnwXem9EBGF9up6Cx87YfzvVWadzi+e1y9XuNEb
	wuluvE7It8DGA8hRzw582dD8VTjP6DagOqpC7N3UZ1CzdxsrwhR3umMExqyAAb8eq3QtXIuSO4b
	R0uPer8AjcwQu/vqRPQ/oScBHMLr2GR+CpIOnO8tiMCGkh5VPYBzp9k/r7qnRQupbRfJmM9/yRE
	NwlL5Hz9ZY9+lbuVDsmCUrfmPPuR2E2A//A5HdquoMZWozTqQ9M6zPDn0gjLw/yp+GT7CJvDwE+
	p8mcROqgm/5QiIou5AzPAmft8jXSKGoYWdLHUbr5jC9LaivV99ZK1HBNoXXgnv0Q6Ldl0S98jUa
	jbfjASphOfaucjoClGmckK3z29yJnOTZZzGqg==
X-Received: by 2002:a05:600c:1392:b0:490:a646:9d75 with SMTP id 5b1f17b1804b1-49220091dbemr176687055e9.9.1781604825392;
        Tue, 16 Jun 2026 03:13:45 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v3 1/4] Align relevant sections to 4KB
Date: Tue, 16 Jun 2026 11:13:33 +0100
Message-ID: <20260616101336.44009-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616101336.44009-1-frediano.ziglio@citrix.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781604826-731728B7-EBA06A78/0/0
X-purgate-type: clean
X-purgate-size: 1606
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A58A68E0F8

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Required by UEFI CA memory mitigation.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Sections with different permissions must be in separate pages.
In the case of debug sections they are contiguous and have the same
permissions so it's not an issue if they are not aligned to the page.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v1:
- Change subject.

Changes since v2:
- Improved commit message and subject.
---
 xen/arch/x86/xen.lds.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..f758940674 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -162,8 +162,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
-  /* Workaround bug in binutils < 2.36 */
-  . = ALIGN(32);
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
@@ -330,6 +330,7 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
-- 
2.43.0


