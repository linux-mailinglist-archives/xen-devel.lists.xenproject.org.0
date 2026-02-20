Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFHjI2/WmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748916B0C4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237611.1539872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL7-0000WV-90; Fri, 20 Feb 2026 21:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237611.1539872; Fri, 20 Feb 2026 21:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL7-0000T3-5r; Fri, 20 Feb 2026 21:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1237611;
 Fri, 20 Feb 2026 21:47:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL5-0008Ew-Bg
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b309dc2b-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48371119eacso24629185e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:06 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:04 -0800 (PST)
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
X-Inumbo-ID: b309dc2b-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624025; x=1772228825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7fA2pJ5wU91qVSnLRts4j2C2n/06cd+/6bA5bE+4M0=;
        b=P+n+Jw261ki3egld4sClFtEsttya0CKtnHY0fjtiQDUcqumvNYTw7kstErSWq9lOTL
         TALtfUpfIu3dOenbls9IFLPu9TOHtXbwLKPemXmvcoR4TMrvmCFTqVxao+d9ONSJr18q
         ZHozBulh3BnPltcJxS/fGhlalKyxpiPC/Bw/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624025; x=1772228825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7fA2pJ5wU91qVSnLRts4j2C2n/06cd+/6bA5bE+4M0=;
        b=OaB0e5ePqL2N7McG+sfJComQ59HIxmb8x6OXZWucT1grfs97HEAzx9aBf8JaiMANmf
         6ySmiYTdyGMHnaF3k3yFWWEVfQgY7s5RjWUy3L2q7X9H8PxrPpsBFg6Ytxbs9o75ZZnu
         s+GoeRlOasmrM8FIY0Y6+r0q7fXdgcHrYgha5B8IJ/418G+pRhMyfI/VbWZ8Pls9sHbr
         zs+x4B2bU8ill1swSb/yYUIBr4VRPIRfnj5W0sE+1/GXnrvUGUV6Iw0KyJ9b/IV8rD/F
         uo78fmoy8pM/RVPqdS2yymqq821ZCfEJ5SVckLdr34koPwpsfSkffD3TQLHy9NecCg8q
         mSyQ==
X-Gm-Message-State: AOJu0YyJdqi6wIXM+LRnvXhIsPsvwbn2cR0ZHJUTVo6fNZlFKzJfStuc
	x27OP9osicnYDBt/TZpM5RODQqqYMk9aZVX+BxGbAQF1vzce9NebObVT4+lqzqWRCT7nZwZohmA
	ZvFUVA+1D8g==
X-Gm-Gg: AZuq6aLhvuAi5xMtiorQK/45A2MlTdhwnbLt2m8NvpDsaaqjWIbHxVXWETEwMn9qnsC
	mCEd96jRHs6UK65bAaXtdS/IzYUIrDEydfCUBgzljKpLbiYFJVk3zZLo9MrzZgqtkEoILNCX4FG
	L9GOc8lSPZ8FsAg0AfKHUc5UfS4u31nK2nyxa0TGhwYoptZdYwvreQ5mr5CbgTLTxfDeCsKZVdk
	2UKqLGkfMd9c/3px8Ftn+kVE2HYbzZvU5xCiiNKm+bapFeD17evvnB/kMH1rc7tAnso+STxAlOT
	IFQnOBLNj0RLYS/MIggAu4tQl5cHrrORwkv5pYOVKVjQ5pjsyzHqTnXotpHnufaVxHE8lm40FMT
	pBN5zmZ/lEpucyZhlyH2Uh93HXvYO1cGV5HYfLULt0stY8Td+GuTrdi6hJufLEy3zan9mPyFZxR
	/RJ5Qqe5+6hnJ2nVOAPGIBID1yjbKuZf66yaq3IkEnklci0/mUy2q1mjvUV4p/jnitbAAagnQ=
X-Received: by 2002:a05:600c:c4a5:b0:483:a2ce:f461 with SMTP id 5b1f17b1804b1-483a95eb453mr15945185e9.4.1771624025257;
        Fri, 20 Feb 2026 13:47:05 -0800 (PST)
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
Subject: [PATCH 03/12] xen/argo: Fix MISRA violations around function parameters
Date: Fri, 20 Feb 2026 21:46:44 +0000
Message-Id: <20260220214653.3497384-4-andrew.cooper3@citrix.com>
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4748916B0C4
X-Rspamd-Action: no action

For the ARM build only, Eclair reports a R8.4 violation because do_argo_op()
cannot see its declaration.  This means that x86 is picking hypercall-defs.h
up transitively while ARM is not.  Include xen/hypercall.h explicitly.

Eclair also reports a R8.3 violation because of arg3 and arg4 differing in
name with a raw_ prefix.  Because hypercall-defs.h generates both do_argo_op()
and compat_argo_op() from a single description, it's not possible to simply
rename to raw_ in the declaration, as that would force doing the same rename
in compat_argo_op().

In do_argo_op(), drop the split parameter handling, and perform the 32bit
range check via an explicit cast.  While adjusting the surrounding logic, drop
unnecessary casts to void * for already pointer arguments in argo_printk().

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
 xen/common/argo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 029a82825ba8..28626e00a8cb 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -21,6 +21,7 @@
 #include <xen/errno.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/param.h>
@@ -2084,18 +2085,17 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
 
 long
 do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
-           XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long raw_arg3,
-           unsigned long raw_arg4)
+           XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
+           unsigned long arg4)
 {
     struct domain *currd = current->domain;
     long rc;
-    unsigned int arg3 = raw_arg3, arg4 = raw_arg4;
 
     argo_dprintk("->do_argo_op(%u,%p,%p,%lu,0x%lx)\n", cmd,
-                 (void *)arg1.p, (void *)arg2.p, raw_arg3, raw_arg4);
+                 arg1.p, arg2.p, arg3, arg4);
 
     /* Reject numeric hypercall args outside 32-bit range */
-    if ( (arg3 != raw_arg3) || (arg4 != raw_arg4) )
+    if ( (arg3 != (uint32_t)arg3) || (arg4 != (uint32_t)arg4) )
         return -EINVAL;
 
     if ( unlikely(!opt_argo) )
@@ -2248,7 +2248,7 @@ compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
         return rc;
 
     argo_dprintk("->compat_argo_op(%u,%p,%p,%lu,0x%lx)\n", cmd,
-                 (void *)arg1.p, (void *)arg2.p, arg3, arg4);
+                 arg1.p, arg2.p, arg3, arg4);
 
     send_addr_hnd = guest_handle_cast(arg1, xen_argo_send_addr_t);
     /* arg2: iovs, arg3: niov, arg4: message_type */
-- 
2.39.5


