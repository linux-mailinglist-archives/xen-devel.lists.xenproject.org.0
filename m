Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6IWYAxnLS2p1aQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:34:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F193A712A7D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=crnPhurb;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355439.1610215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKx-000126-Am; Mon, 06 Jul 2026 15:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355439.1610215; Mon, 06 Jul 2026 15:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKx-0000xa-7h; Mon, 06 Jul 2026 15:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1355439;
 Mon, 06 Jul 2026 15:34:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wglKw-0000we-Bh
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglKv-000YCn-3d
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:34:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcaea-5cb7-0a2a0a5109dd-0a2a450a95fe-22
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:21 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcafc-e40e-0a2a450a0019-d1558032bcd6-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:21 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so22101625e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:34:20 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63bfba1sm433726505e9.15.2026.07.06.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:34:19 -0700 (PDT)
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
        d=citrix.com; s=google; t=1783352060; x=1783956860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHcjQ1xCF4fLVyfPs91K9Nneq4AcxnJkrKeQtPWGRmI=;
        b=crnPhurb8VFajf9bDQFa9skywLv6bvYlNkRf2aLdPfvWLCojTxsF0JKCqN9Y+c2QKX
         xfMI5CopS/ZEtHtNYkyMnNbFbdAkPM9Xs8ivnqsZ5xUVpbqXQFZM2D+UxwZ2zeTSvhIm
         rZoQ/ZYGWhbgEIIqN9EPMsFye2zsHWXdj5ULc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352060; x=1783956860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PHcjQ1xCF4fLVyfPs91K9Nneq4AcxnJkrKeQtPWGRmI=;
        b=fCN7KT2DRkSzJujQRQhouwQAdVX7vjA2ES0ydXvRPKWZU6jU0FiJ1yImwSN/LtvUXW
         HatvPCT8WXRM0nKO/POHNyThNVBdbuj9R1oeGDkNKumuqt2MK9DWLUDiBHyvpjDe17Ug
         4Gaod67UbRC7agHkSlDFOpNQJB2C9rbMVXac/6WtJOzRDJt3BsN+AuhE/qBR4H6k0mph
         uc29LiOt1/FDYovDe1ypNK5zEA7Ku3SnBTD4eqhquXRjSMEMI9Glm1e8izxsztQiJbtt
         6elZ6Xqg8qXrve6Pb+/KVswu8DGmAuKYw6510gzM5n4WGPio2RW6rW/v5TnYIU8IbVeq
         uzxQ==
X-Gm-Message-State: AOJu0Yz2efzilR2UcGeFImVJDlPVUFFZSlmMg68hNXVxYB1mndlleLqN
	AAErB5P6nN+CuKj+PbKqycFzkMca937h86UUDGALPtEve3LAFXzwMp3KcSJ38rFhokoLC+ip2dO
	8WbQX
X-Gm-Gg: AfdE7cm5FLjFmvDVWinV1Rb0ZkMiJEe1B107qPaMNEzQyqQnN/tR0Vsr4pg0ZzJooP9
	u9AVWiuglBJekOJDWyR1Uk9emCV5llQADXUCSQa0meFWUol90bPsIEitH1IDjw0LMpGlrsZLbtp
	AjnC8pr3chmPFqyp4AN5qZKbPZSWBFDrQ9rMQc9HJHsqdDfUQ8pHo5D+CV1Hlh+8mHWbIHSXx4m
	/Pxic8qBYlFgXlgxFe5UKd2IBpZFD1pJyImw/Kwb+3GJlMmg6WvW2NbTLB01kH6krCKqJ0eNgil
	ImbOdqDq6V8emxI1TuLzrA+UP8ydCXiMamKBDQfHqYe20EdkjdVFcpvw8P+xcKq8ZB9FnWU/M7j
	+CbQIF6S2XD+yYYK4ShoChWcvLtY/m9vf3WAwvOa8sl+csK3dgqvmf65RJ7kZcp5GCnzOR+gn5d
	x1+oain8oMf5Qt0RI8xC8SvbHBWsFtacFk48bn3NeSppjJQZqJuYzhbfJBIChRK/Y=
X-Received: by 2002:a05:600c:4e8e:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-493df0377e0mr11774875e9.3.1783352059809;
        Mon, 06 Jul 2026 08:34:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/3] x86/hvm: Use PUSH_AND_CLEAR_GPRS in preference to SAVE_ALL
Date: Mon,  6 Jul 2026 16:34:13 +0100
Message-Id: <20260706153415.1264750-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783352061-D5129DDE-772D8F18/0/0
X-purgate-type: clean
X-purgate-size: 1790
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:email,citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim];
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
X-Rspamd-Queue-Id: F193A712A7D

SAVE_ALL hides a CLD instruction which is not needed anywhere here.

 * VMX VMExit always clears flags.  VMX VMentry failure never switched away
   from the host flags, so they're still good.
 * SVM VMRUN always saves and restores the host flags.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Bloat-o-meter reports:
  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-168 (-168)
  Function                                     old     new   delta
  svm_asm_do_resume                            416     360     -56
  vmx_asm_vmexit_handler                       576     464    -112
---
 xen/arch/x86/hvm/svm/entry.S | 2 +-
 xen/arch/x86/hvm/vmx/entry.S | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index b6ea699bb9c0..d9613a2a8fed 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -89,7 +89,7 @@ __UNLIKELY_END(nsvm_hap)
 
         vmrun
 
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         GET_CURRENT(bx)
 
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index c34f5a1ee0af..cebc70064048 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -22,7 +22,7 @@
 #include <asm/page.h>
 
 FUNC(vmx_asm_vmexit_handler)
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         mov  %cr2,%rax
         GET_CURRENT(bx)
@@ -157,7 +157,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_vmentry_fail:
         sti
-        SAVE_ALL
+        PUSH_AND_CLEAR_GPRS
 
         /*
          * SPEC_CTRL_ENTRY notes
-- 
2.39.5


