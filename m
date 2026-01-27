Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM8oGUiSeGmxrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:24:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B192BBF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214195.1524565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgEn-0006Gu-Vw; Tue, 27 Jan 2026 10:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214195.1524565; Tue, 27 Jan 2026 10:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgEn-0006Dn-TP; Tue, 27 Jan 2026 10:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1214195;
 Tue, 27 Jan 2026 10:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkgEm-0006Df-9h
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:23:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480b1597-fb6a-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 11:23:54 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47edffe5540so62432885e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 02:23:54 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bfb59asm48076315e9.7.2026.01.27.02.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 02:23:52 -0800 (PST)
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
X-Inumbo-ID: 480b1597-fb6a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769509433; x=1770114233; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EyqDzI0V7oMUtLHM/UiWRdLKUFBWys8yFg5YHHHO60=;
        b=tIGU5v9PP1i4Vxp0h/t+QIbhGSPGYboK7rs4aVu0U8XkcmJzuqV8Jj6ZP4Rkrn27De
         ZY5NLQS+dNxvzvRsXI8OJyQ9z7KDp23zCoxDp83UCLCc17OlqAQ9a1aifjgbYdMuGu4q
         hNsLy1ZV4N8954JUKKLBPrxf3uesE6gw15xiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509433; x=1770114233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EyqDzI0V7oMUtLHM/UiWRdLKUFBWys8yFg5YHHHO60=;
        b=JFJH5J8QU3MM9CYIU6Vw2Ydj+dAqghYhVISr1UR+W0tdmUYYkKitb4rzW31Zgqic9m
         QhsQfVbI5HSJYXvXOh8fxmou68oq5Z0AMl6JYoF1fFNtOO+4VHw5HOaKZoaMEE63WO3Q
         xDKtqKXKsfKKLnU7JIVKmYvFuzYevPkacJ+Qdy25dD+EXyakd4WmXw5bvRjSF/1bGwAy
         iwsm/8kW2nCpYsvIJ5LjxMEj5gorDggH82+FbC3SxY7xwwgUX7g78t7Aq2SZUUvdFHM4
         k2wAan4KG2l7C0Hx7NYk7UuqoaYfp3ZKzv2eMSrGKY4l7zzQXoc7qLI+j8tN3OaoXQ01
         AxLA==
X-Gm-Message-State: AOJu0YxkyTyQRDyWZ/cru2fMi7LPlXYEU1HcUZU9jMVeiF+i+3ItDfK4
	rKGz5OpHFTemeDGPTpF+gnaaSlhMVnehLrnDUfSgfEL1PL0Ni9nCqvy2dFWcJOCcr351ALDlJ0b
	yayWn
X-Gm-Gg: AZuq6aJiTnQHKXZZDx9+pGXnLxa8vEEpL3JnWule6g2n6pEDwMhHJY12oP2zKfBatIc
	SnAvjMB30zWaSXLDUTq6j7xzuU3b21rZ6XaIvGOACqgYprgTfRdPKQerrP15Tw/rbLMX9iiy1C0
	vUMwFZ0OeBFGP/3oB/t4G+vyquAZjKgUHtR0+wb9hoaY4Wr95SSmAXfAVN45bBmbn8koq7vu70p
	pVbRFBtgf9pRZQOn1qJrJ/g1/VyjDR1cgEgkmlz0QP1+VJPsemjx8yrMqXOuwWZW0Ah/TVMinZ1
	v5N597SSQBxm3zcNIZyfcPWDMX4aPC8LzQfD4mBDa8gNpcuvRoQUZ1p2Spx/xFJ48b56XymDHDQ
	fcjzqKd+V3M2rjBYGZubUieSBpGFT14vfTtDz9mJHNExkGWY18HtgMd+OoNRfdkUt7MxJeKO8wQ
	nqG7A1mwRDp4yCYA0SgleW5AamWJzMst5Zn6WMU+igtDdyMMSFYp4WmVESOaY=
X-Received: by 2002:a05:600c:450b:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-48069c21c40mr17104315e9.16.1769509433340;
        Tue, 27 Jan 2026 02:23:53 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cmpxchg: Add safety for bad sizes
Date: Tue, 27 Jan 2026 10:23:51 +0000
Message-Id: <20260127102351.2215346-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 115B192BBF
X-Rspamd-Action: no action

All other architectures helpers have safey against passing a bad size, but the
x86 forms did not.  For __xchg(), use DCE against a function which doesn't
exist.

For hvmemul_cmpxchg() this doesn't work as the size is a parameter rather than
known at compile time.  Use BUG() to detect runtime malfunctions.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

bloat-o-meter reports:

  Function                                     old     new   delta
  hvmemul_cmpxchg                             1116    1092     -24

which is surely down to the hidden __builtin_unreachable() causing some
codepaths to be omitted.
---
 xen/arch/x86/include/asm/system.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 6c2800d8158d..1074786a9d23 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -36,6 +36,8 @@ static inline void clwb(const void *p)
 
 #include <asm/x86_64/system.h>
 
+extern unsigned long __bad_xchg_size(void);
+
 /*
  * Note: no "lock" prefix even on SMP: xchg always implies lock anyway
  * Note 2: xchg has side effect, so that attribute volatile is necessary,
@@ -66,6 +68,8 @@ static always_inline unsigned long __xchg(
                        : [x] "+r" (x), [ptr] "+m" (*(volatile uint64_t *)ptr)
                        :: "memory" );
         break;
+    default:
+        __bad_xchg_size();
     }
     return x;
 }
@@ -106,6 +110,8 @@ static always_inline unsigned long __cmpxchg(
                        : [new] "r" (new), "a" (old)
                        : "memory" );
         return prev;
+    default:
+        BUG();
     }
     return old;
 }
@@ -137,6 +143,8 @@ static always_inline unsigned long cmpxchg_local_(
                        : "=a" (prev), [ptr] "+m" (*(uint64_t *)ptr)
                        : [new] "r" (new), "a" (old) );
         break;
+    default:
+        BUG();
     }
 
     return prev;
-- 
2.39.5


