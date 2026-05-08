Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EATMGl8P/mm2mQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 18:29:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E844F9757
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 18:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304027.1577229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLO3r-0002Rz-0p; Fri, 08 May 2026 16:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304027.1577229; Fri, 08 May 2026 16:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLO3q-0002Pl-UL; Fri, 08 May 2026 16:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1304027;
 Fri, 08 May 2026 16:28:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wLO3p-0002Nd-9M
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:28:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLO3o-007knQ-Ma
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 18:28:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe0eed-e002-0a2a0a5209dd-0a2a45028ab8-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 18:28:20 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe0f24-af86-0a2a45020019-d155802ba5a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 18:28:20 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so14953325e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 09:28:20 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6d8d69a0sm3326705e9.2.2026.05.08.09.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 09:28:19 -0700 (PDT)
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
        d=citrix.com; s=google; t=1778257700; x=1778862500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4odYMv7FIvcLkk0IlEKAOlg7gcBezyvcr5ysKnJqIv4=;
        b=ecKbahM6HNSuoQOl8Pn7Flk2XdJuy89NHow85Bnlrv3uVLJmtouynq/7+UimfzNEEw
         L5uCp5vqOOHdz4uaE5Rt2YvWI2ELTdUFu2A6qnxbNX0GWydfzFUDyZAf0C/w87EgTc+b
         1B2yeFz2T5o9+yMwuYraTtz4BQSuwxH+lHsB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257700; x=1778862500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4odYMv7FIvcLkk0IlEKAOlg7gcBezyvcr5ysKnJqIv4=;
        b=IQSW7PgcuwYHX6pebuLeIMLJGQ5IBr73W3eRZ3RpnVk1GIKkEABCqvEZoe9WLrGTkk
         MaIzPy0YpGJ5xb7UeMaaaKn2FK+ULEf/RxFFLZC96CnXQQM32aY9/TOehvtYkBPdTOfQ
         x4UdsElDOaLHqBOsr356s7Vj8oi368gdsN7bn51ovPtUl+CbYV5uk6HdKveIzt6DpMcQ
         ytFQZZZbVpwW96ye4VN7k/cqgrx8Aqz455Om6Ad6INlt0QlqC75CqcvMz1l6x2nDVCEF
         Ok7ZHtYCRIrH5TOIxdne6lPGSzR6ibqftMAu3OktpqfhFLetV83GlWyn2UQK3DSzskVS
         w12A==
X-Gm-Message-State: AOJu0YzRvuGB2H+qDeI45WMu0AC6wlv6cv2yglDaUk6R2iPMF4xbR4mw
	dc5cdXzeI8oYejWG9fQ4UI7XOug6ucuiKzvgX62+L2plaH9aPCIuXc6z0VwANRJge/cfNGZpcMf
	skQj2ScQ=
X-Gm-Gg: AeBDievFfq94Ip6oINC5OYOlT9kbG+pDzNNlEKR+vKb7CaJ2wA0Y8gIXOSyQW/WdnAC
	uyVasPbBfEmgzOzb2kD8VrgoFeQ8hCvCiaESliPl3+AhzIJUUZHZLDnhWJEA7Nht7LjXb6FUa20
	Gg9ZsvcQTpjYhIPipJ6CF6LXgBz8FstBQdHgbds6gZzA4akmBxoNwa/8uMZkCBeyXj1A5mQhQXF
	dY/MM7hK7VDzsa0mXukavKEW9UczikJfgvZfdhPfyl+7sebmODFB6iTg+8DiVV4ZGFbt8+mhRsB
	VP5rL14d85vm3gf6HQnmaqDieMp371LGlx6kXv/DFSYPHnP1OGyerX2rNtApDpjs6dNuamOhrQq
	x6SXpnVEXeSSytbWCG1gSl2WIwrILRBeRQNmpo0pFsQArYo8cWf0WF1UM1TnCyG5q6Z/un1xAue
	AQqygoCIC7Vm5aEu0oRQ4JunG3MeG8XSyZ/JNmg1ncziEimT4hulIi0Kdr/TlwTD16wULSetY4b
	JR3CGL0/ZJBmyU=
X-Received: by 2002:a05:600c:32af:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48e5dfcd722mr75823715e9.1.1778257699651;
        Fri, 08 May 2026 09:28:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Michael Young <m.a.young@durham.ac.uk>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] tools/libxl: Fix libxl_nocpuid.c build with json-c
Date: Fri,  8 May 2026 17:28:15 +0100
Message-Id: <20260508162815.1617203-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778257700-8256B161-C917A6F4/0/0
X-purgate-type: clean
X-purgate-size: 1692
X-Rspamd-Queue-Id: 02E844F9757
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:m.a.young@durham.ac.uk,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,citrix.com:dkim,durham.ac.uk:email,suse.com:email,gitlab.com:url];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

libxl_nocpuid.c needs the same treatment as libxl_cpuid.c

Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Michael Young <m.a.young@durham.ac.uk>
CC: Stefano Stabellini <sstabellini@kernel.org>

Discovered while trying to complete the ARM CI cleanup.

This supercedes
https://lore.kernel.org/xen-devel/94ffdeb1-6826-4c3a-a9c1-3ccc8b129a61@durham.ac.uk/T/#u
using Anthony's suggested approach.

Failed run:
  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14282279751

Succeeding run (same container):
  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14282714527
---
 tools/libs/light/libxl_nocpuid.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index 0630959e760c..ce334633b376 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -40,11 +40,21 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, libxl_cpuid_policy_list *pl)
+{
+    *jso_r = NULL;
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
                                 libxl_cpuid_policy_list *pcpuid)
 {
     return 0;
 }
+#endif
 
 int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         const libxl__json_object *o,
-- 
2.39.5


