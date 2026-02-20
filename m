Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBjjE23WmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18D16B099
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237616.1539917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLB-0001W7-Mc; Fri, 20 Feb 2026 21:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237616.1539917; Fri, 20 Feb 2026 21:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLB-0001QX-BQ; Fri, 20 Feb 2026 21:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1237616;
 Fri, 20 Feb 2026 21:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL8-0008Ew-J7
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:10 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b54e7943-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:10 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso21378625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:10 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:08 -0800 (PST)
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
X-Inumbo-ID: b54e7943-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624029; x=1772228829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TrnZ66XZ6HFaBzMCfnoTCQeXNsoz4cCSZgGcCFs61o=;
        b=HuudOdGd40eHvHS0yy4pLmIDMIVjjBSs4APab6PAXlwE3ZTtzKjt8ramAAi+6j4hYt
         QRs1qd0O8oXNmb1p9xYPXW0zMYuXmDeKCWormUGiEVIsAH4AwwjsRP/RcAUpFWc0vMTJ
         Lkke1/iEsUQHS/0AUFXEcnAtlJpR+AzgmOfZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624029; x=1772228829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TrnZ66XZ6HFaBzMCfnoTCQeXNsoz4cCSZgGcCFs61o=;
        b=GzPbOoN37lGp8szPI6XjGt6EuoxNzVHbMNieGbQ681b/7Ey5sbnD4MwDixVGXGmu6W
         w2WQzA03wW77G9oBI0thX8mWMB1H2r1iRKB7HDewzbzZWwEDS+lSBgguF+X5xN1Ek35H
         XjC9s9Y1tYahL6E9A7Kal/veismAVfrjKAjmDFRDkPT7/TcavbXToqIxUwwYLl+BJ3lr
         uNSA6V/LKPqhgkgNnBwcRDtM7Ffi97n0WFhhkpKCJdmcVo/wKkixa3HAnrkoC2bLYrej
         kTbOR/n3AhXo+Xcgzq3qghyUYwgftOUisGFcWf8qQi8qDngmpMO/KqL1tZ6a3Re8Zlit
         ERmA==
X-Gm-Message-State: AOJu0YzBSJYknj5424beAoBxfTJMOGYrUABFQd2pzXZjcINA1LMz71YT
	zjXTuSiIiMerxAhc79LHCbn5cw5KIdLyBM3SWAjJtzJM9GzSu92m/byXt9ENiTVdUbux83tjPvy
	Gm4MKzCDy5w==
X-Gm-Gg: AZuq6aKqI4nU4GIgOwTZSiQGSfMlh1HW0xCyuq3XGo1KyMh8DwpNHnj98ofdLo7dF9W
	9Fvv/c3rsxVkGdxS0PaNprezeLR5cTAsnnQZiGp9RNPUlg1gs3Ua24nS/7SH3bJwwZUtYxufgUC
	FIbcuYZveH4Oj9GN6Di4uMw/cUlD6wZpDvHQV1iAeL5krNF3amDDqZOu8StmUpxY4VwmQ8v2s/N
	qp6KerEIxXhfpTFFDmECsGMibl53jtujQ6N+eMD5slWMns+ATYje/qNA5+ix6wJ13kj9VP0w2OE
	n9f2uDd1WD0LyTh1B/PwMfVCA/Gl7J2rOX8FQJFIXFI0xuEEqkMwZ9xeR3iE9ZPuUAMUb2yBMDS
	/B5Q31FDGVtxWth/2Av3D4wZ/DnG6Xycl2GSIaFxoRjagpwSME8dLhUNMrO0YbjUoXaMAJaU92B
	Z4o//jN9Mlxm0HO/HA0W0Lh+v9sG40e37iOlQh4EEdRrSvgScoo/J5M2l4EuPm/BGGP7cWbAA=
X-Received: by 2002:a05:600c:8b88:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483a963d64bmr14245295e9.30.1771624029103;
        Fri, 20 Feb 2026 13:47:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 09/12] x86/shadow: Rework write_atomic() call in shadow_write_entries()
Date: Fri, 20 Feb 2026 21:46:50 +0000
Message-Id: <20260220214653.3497384-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3C18D16B099
X-Rspamd-Action: no action

Eclair complains of a side effect in a sizeof() expression (R13.6).

write_atomic() only evaluates each parameter once, but rewrite the expression
to less resemble entries in an obfuscation contest.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/shadow/set.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index 8b670b6bb555..96ba2811077e 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -62,8 +62,8 @@ shadow_write_entries(void *d, const void *s, unsigned int entries, mfn_t mfn)
 
     ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
 
-    for ( ; i < entries; i++ )
-        write_atomic(&dst++->l1, src++->l1);
+    for ( ; i < entries; i++, dst++, src++ )
+        write_atomic(&dst->l1, src->l1);
 
     unmap_domain_page(map);
 }
-- 
2.39.5


