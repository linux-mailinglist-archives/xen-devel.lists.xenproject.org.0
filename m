Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GUFNHDWmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40A16B0DA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237620.1539947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLE-0002Ke-Ku; Fri, 20 Feb 2026 21:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237620.1539947; Fri, 20 Feb 2026 21:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLE-0002DJ-9P; Fri, 20 Feb 2026 21:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1237620;
 Fri, 20 Feb 2026 21:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYLB-0008IG-LP
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6834de7-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:12 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso33419825e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:12 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:10 -0800 (PST)
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
X-Inumbo-ID: b6834de7-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624031; x=1772228831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wazStv22+sAAkXhUXk9SZLE13GE7UuEeUTF8Qgk68Bw=;
        b=sRmJDvz7AA8KjQEgnW8scWIUHxFwE1hulQAg37MKray+hg2erxodWMFHLuF/ZShj1u
         WaVRCrzpQdDjMxLCBAGp3eZrI6Iq5/sEVFbc6zZbqnvLRlCbxnQ08fwv75m75ITtuFvx
         j8KYZkbC8UqeXdb6mbVKaYTrOCjrCoFYdxb34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624031; x=1772228831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wazStv22+sAAkXhUXk9SZLE13GE7UuEeUTF8Qgk68Bw=;
        b=mCWhEbyq1JmmYgVe5Zkw3COkR5h/u07AtjBkdb+fhkWX+xeqpTBAZqUN6U5Vybx2fG
         HqevFpvtbqhcONko4ixOttxiMXLFjXh/cwIH7pc9gfW7Xn11RTzAEpt7OdcFmFesCJrD
         b7uWdwnOTU7lw5J2PwjVSNefGSnS7Xk/IznTIF2jePKnhLgYoTlrmkRBvYzNNXXZLEtu
         RFEXZ0uNAPOxDXSUgpMNNmO5O12/IoREAhr9hILVnMnRddAxTzAdRP/Fi+MJoJsAhg4S
         1hHTbCYRT9MH8lz0SH9+DhUIW0T+LK9ImtsA0qql60HBMkMyywH5aiGZ5/4UR/Kp91R2
         yOQg==
X-Gm-Message-State: AOJu0YzGiC18ynmA17YwOIjN+NAPLwrn45/jf/MVdJxEogiy5OGtyFls
	ubX06YSYkBpvY+8SRQ5s14aZukAeB0FuuAXGWhbwHrcRwv54L/AT9HVJBxmr5OOBqRlnMTqTiue
	lnUrs5gO/5Q==
X-Gm-Gg: AZuq6aIxtFHHoliPmnnNbF6QT02HQcyzOQFw3u49bGAw0ZZbSSdgNPcCr7kIR8rgkGY
	OvcHxm8bh26Zg0DodwP2BT3YVS6o/U5cg8I8TlNgAIDmNApplVME8aFAgFbP7h7Vt/sE9nG7WQd
	N7XYNtAhCXJNirj3PJzjOy+wiEMdvGDfJMNhb5pTn5dzNkCJu69T6JvIBNgkZp/wYYgc2pm0E/A
	5axwb8yNLBt//txlN+mfyO71lhH2+/XqTVXDxv1mryGYDfrDBtdhmQVLambtB3CIi4fxteo1uaT
	EKdwAaWpij3BKf/HDyBMrsJdvCEKRa4wIZR1xXUyCWCZ3MQGjt4En8gc7vZqFqUKdLPVHfvyR1r
	21aJMkOMltXql01KFUzSubedYF0MyR6S+brNmTdd5SlbIegskTVWHNmqcy81LUnSHXvdg1JT0oD
	DXuKpPJKVYN/YvwyqxQMpdTJ4qSDZEfyW9k/DyQwRhNSyJOZRL7UAvumbBrJ+uj9eehqDjaJ0=
X-Received: by 2002:a05:600c:1f08:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483a94c996fmr16228945e9.11.1771624031099;
        Fri, 20 Feb 2026 13:47:11 -0800 (PST)
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
Subject: [PATCH 12/12] xen/vmac: Delete STDINT block in vmac.h
Date: Fri, 20 Feb 2026 21:46:53 +0000
Message-Id: <20260220214653.3497384-13-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: CB40A16B0DA
X-Rspamd-Action: no action

Eclair complains that _MSC_VER is undefined (a Rule 20.9 violation).

This could be fixed by inserting an "&& defined(_MSC_VER)" clause, but the
whole block is entirely useless (it comments out the include of stdint) and
the top of vmac.c pulls in xen/types.h specifically.

Simply delete the block.

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
 xen/include/crypto/vmac.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/xen/include/crypto/vmac.h b/xen/include/crypto/vmac.h
index 7574c4a3f328..43fd288ae3bd 100644
--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -35,29 +35,6 @@
 #define hz (400e6)   mips
 */
 
-/* --------------------------------------------------------------------------
- * This implementation uses uint32_t and uint64_t as names for unsigned 32-
- * and 64-bit integer types. These are defined in C99 stdint.h. The
- * following may need adaptation if you are not running a C99 or
- * Microsoft C environment.
- * ----------------------------------------------------------------------- */
-#define VMAC_USE_STDINT 1  /* Set to zero if system has no stdint.h        */
- 
-#if VMAC_USE_STDINT && !_MSC_VER /* Try stdint.h if non-Microsoft          */
-#ifdef  __cplusplus
-#define __STDC_CONSTANT_MACROS
-#endif
-//#include <stdint.h>
-#elif (_MSC_VER)                  /* Microsoft C does not have stdint.h    */
-typedef unsigned __int32 uint32_t;
-typedef unsigned __int64 uint64_t;
-#define UINT64_C(v) v ## UI64
-#else                             /* Guess sensibly - may need adaptation  */
-typedef unsigned int uint32_t;
-typedef unsigned long long uint64_t;
-#define UINT64_C(v) v ## ULL
-#endif
-
 /* --------------------------------------------------------------------------
  * This implementation supports two free AES implementations: OpenSSL's and
  * Paulo Barreto's. To use OpenSSL's, you will need to include the OpenSSL
-- 
2.39.5


