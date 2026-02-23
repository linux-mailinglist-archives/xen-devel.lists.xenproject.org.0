Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJyAOfGJnGlWJQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 18:10:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C317A673
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 18:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239280.1540720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuZQg-0005QL-Sm; Mon, 23 Feb 2026 17:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239280.1540720; Mon, 23 Feb 2026 17:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuZQg-0005Ne-Om; Mon, 23 Feb 2026 17:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1239280;
 Mon, 23 Feb 2026 17:09:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpp4=A3=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vuZQe-0005NY-VU
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 17:09:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 590e3ee4-10da-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 18:09:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so26708015e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 09:09:01 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31f0330sm241787025e9.9.2026.02.23.09.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:08:58 -0800 (PST)
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
X-Inumbo-ID: 590e3ee4-10da-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771866540; x=1772471340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9goABibW6F5ClxCUwPd0b9Zafr4H2ZAyBuwnOzWKO0=;
        b=jYEU1sZAXBiVsQiXp08RaBmgqaSsM0TSQUDmCqMs1x3a3IS+ui5Y+BFMQtUQWzcnew
         qikIr5xQ73pOQOBbt9yIT6L5W7EjTFh16tUGqXffqOFZYz9F4M6veqPzzJJuoeYiPhaT
         QNmIQKUwEOAktIruxCFVUJeqoLhH7feQlrRsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866540; x=1772471340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9goABibW6F5ClxCUwPd0b9Zafr4H2ZAyBuwnOzWKO0=;
        b=mnUzkvd8QfwUNIIxI55xaGVrFZnatIJLninf1/HuB0A6C9iwPrETkRt+UqHKDTXoB8
         7C5Yq7wY+g3uEqaRqN5W8uJP8hRTdkmkGxzSW66akvfmErSuAjtZnIzS/2TkSjEOOrTU
         rEA8X5JX1G+ZXC38oxy60WpIEhrF2KTPH2xKpdj74dyfzxyQr/M5VoXbDhmTqRXX88jn
         EWXKrU7LTrwsKKHANCkTlpkCSZJbu8kq4k+nOOztzdSK/k+aUicO+TLTVMMo41Mh5DBf
         T/yIXV6MPMj0/ovLQkkRV58L6zFGPwHJ4wZEN8NsODuVLvdZDHt9HG4AUcRukhZ78Bm0
         u7rw==
X-Gm-Message-State: AOJu0YwuKLad8I/e51X6hnXZJ0NoA7PW4Oq8D+JYRDxhaMzVx61lJJKu
	zOMzHWpLmAD0Da+J5dqjD3XMKgDZCuPSAtEOjNj3bkB7g2pGpXJq1mRfKt4yyR/l8sHCdt+HnUa
	TGySn
X-Gm-Gg: AZuq6aL7wfWFvNJHIopoRa6cGO/RwR6fMG4rOgnUxwQ1KmzpYQKnvny1OF7CtA4De1x
	7YNnVnX0rs9RNHplV6vpAU2wwdUGEvl9+WrtuDLv6p4ESJU5haj4d1Sv9EVpkMD2yNIqltlJJ2t
	tTeo9JyYuYDksCZx4hQIMnhyVYSN/kf19tBe7sumY7zR3BQZMKPUcXRm3tmwTta9CapEBR/H3cf
	VybsKhwXMDOxc6qM8z1AGE9pbtS5/dEDEKuLysSPw9LzZCzQc1ON+xnmD53wv8mrdoR7VocJqcf
	sArTs5h7ow2mLUMAZemRO4KGaR/qQf4VnirgO1p5MwHHO4AcT9sh9p5zcEJLl51PvDy0bKVw0MD
	fZlUYqEm26aLfst2wo3zPoWDkTee9T80Srh+ndeUoNrfGH7dJdbJi4dpUy33uQQQQcmiQcSdcPD
	7w9z8hNBMsYnnggG8EVHRE9qqFK2lVZ9AEGYvaFsyOGEwnk9nJWaMEC5NWY/b4ySszU0+XrVc=
X-Received: by 2002:a05:600c:8b44:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-483a95eabccmr153125545e9.27.1771866539380;
        Mon, 23 Feb 2026 09:08:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/emul: Remove fallback path from SWAPGS
Date: Mon, 23 Feb 2026 17:08:56 +0000
Message-Id: <20260223170856.3594016-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 171C317A673
X-Rspamd-Action: no action

In real hardware, accesses to the registers cannot fail.  The error paths are
just an artefact of the hook functions needing to return something.

The best effort unwind is also something that doesn't exist in real hardware,
and complicates following the logic.

Instead, use an ASSERT_UNREACHABLE() with a fallback of injecting #DF.
Hitting this path is an error in Xen.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Tested using LKGS's extention of the test emulator for SWAPGS.
---
 xen/arch/x86/x86_emulate/0f01.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index 6c10979dd650..760f5f865913 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -192,18 +192,21 @@ int x86emul_0f01(struct x86_emulate_state *s,
         if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
                                      ctxt)) != X86EMUL_OKAY ||
              (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
-                                 ctxt)) != X86EMUL_OKAY ||
-             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
-                                  ctxt, false)) != X86EMUL_OKAY )
+                                 ctxt)) != X86EMUL_OKAY )
             goto done;
-        sreg.base = msr_val;
-        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
-                                      ctxt)) != X86EMUL_OKAY )
+        if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                  ctxt, false)) != X86EMUL_OKAY ||
+             (sreg.base = msr_val,
+              (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                       ctxt)) != X86EMUL_OKAY) )
         {
-            /* Best effort unwind (i.e. no real error checking). */
-            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
-                                ctxt, false) == X86EMUL_EXCEPTION )
-                x86_emul_reset_event(ctxt);
+            /*
+             * In real hardware, access to the registers cannot fail.  It is
+             * an error in Xen if the writes fail given that both MSRs have
+             * equivalent checks.
+             */
+            ASSERT_UNREACHABLE();
+            generate_exception(X86_EXC_DF);
             goto done;
         }
         break;
-- 
2.39.5


