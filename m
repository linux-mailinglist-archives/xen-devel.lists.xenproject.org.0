Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF044126E8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 21:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191145.341065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSOzJ-0008Ag-3z; Mon, 20 Sep 2021 19:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191145.341065; Mon, 20 Sep 2021 19:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSOzJ-00087g-03; Mon, 20 Sep 2021 19:30:01 +0000
Received: by outflank-mailman (input) for mailman id 191145;
 Mon, 20 Sep 2021 19:29:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSOzH-00087a-7b
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 19:29:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23a86384-1a49-11ec-b881-12813bfff9fa;
 Mon, 20 Sep 2021 19:29:58 +0000 (UTC)
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
X-Inumbo-ID: 23a86384-1a49-11ec-b881-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632166197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+TlaTCIqGu8j0bYpxe1cgsh+qhECUrKtrVKQp6Z2N0o=;
  b=QZkOXM4NAEHLBw7r9wuHZ7UveyJWhxI/2im/B11QFiiJbupRZFavtBdC
   SXrew94f6MjmhYJxlScM/6Ofr7GU5qbOAyUYnsGCymck4wqeNpqsf8mDx
   R/smI3Iwpte9JDfaHCbA6h1jmRTmFL0eWOOqHh5hR2SaVoSGaghVHwPV1
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5c/xeiQ5NPwPiOWQO4WXo1wfogul/PN0wI86yPDPZyqgwApt3jFFtRbrwhPA8EjMPz6J3W1ZCU
 y8wSlQ2rgHRvGfaP8S6NVqfSPMo227cNmMKLFHY2fJeRQZocgPPaO0yyPqmvQMlLL/JWtqhqay
 AWdysyG/X9pL+ALbNnCYZsazWhF7qgMZkJXlLFpwi6Pgkq5kVazQWy195yEitjI9ARZ4+aNIit
 Y2PziFeENV3Yw8H/2CKegugLlmIPRLoT2gBNQnyDV0uYBhBiX0UUAa0H6BefWWUgwDyCkwwast
 PekvgmkSNoZDtE+rEQXESWLB
X-SBRS: 5.1
X-MesageID: 52750854
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4lRU1K2taxFwZqDMgPbD5Qx2kn2cJEfYwER7XKvMYLTBsI5bp2dTm
 DAYDWuGOvvYNGSgc4wlPd6z9EgDscXQnNZqG1NlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbZh2eaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpd11l
 pJc9qaKWyA4OYLzm8U9VBl4DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t3J8TRaaDO
 6L1bxI/XBHSTgdqeW48BYkajMalg3THQh5h/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SWB2mKhgKnIhyyTcIAPELy18NZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiH+bvDYMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTRUJSVVC8prZmpMUnxXgcdVCMKm1rsKgTFkc3
 Au2QDgCa6Q71JBQjvXgrAGf2VpAtbCSEVVkvVy/snaNq1ojPd/7PdTABU3zsK4YRLt1WGVtq
 5TtdyK21+kIEZjFvyiEWuxl8FqBtqvdbWG0bbKCGfAcG9WRF5yLJts4DNJWfh4B3iM4ldjBO
 hS7hO+pzMUPVEZGlIcuC25LNyjP8UQHPY+/Ps04k/IUOsQhHON51Hg2OCZ8IFwBYGBzyPpia
 P93gO6HDGoACLQP8dZFb75GitcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris+pQLKbbcclQ5cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAxMwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:czrrI62UQLhBOomIE6s/pQqjBLYkLtp133Aq2lEZdPRUGvb4qy
 nOpoVi6faaskdzZJhNo7+90ey7MBfhHP1OkPAs1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YHT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="52750854"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2.1 13/12] xen/trace: Introduce new API
Date: Mon, 20 Sep 2021 20:29:39 +0100
Message-ID: <20210920192939.16483-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This will be used to clean up mess of macros which exists throughout the
codebase.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

v2.1:
 * New
---
 xen/include/xen/trace.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 055883287e8c..72c20550f6a6 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -74,6 +74,30 @@ static inline void __trace_hypercall(uint32_t event, unsigned long op,
                                      const xen_ulong_t *args) {}
 #endif /* CONFIG_TRACEBUFFER */
 
+/*
+ * Create a trace record, packaging up to 7 additional parameters into a
+ * uint32_t array.
+ */
+#define TRACE_INTERNAL(_e, _c, ...)                                     \
+    do {                                                                \
+        if ( unlikely(tb_init_done) )                                   \
+        {                                                               \
+            uint32_t _d[] = { __VA_ARGS__ };                            \
+            BUILD_BUG_ON(ARRAY_SIZE(_d) > TRACE_EXTRA_MAX);             \
+            __trace_var(_e, _c, sizeof(_d), sizeof(_d) ? _d : NULL);    \
+        }                                                               \
+    } while ( 0 )
+
+/* Split a uint64_t into two adjacent uint32_t's for a trace record. */
+#define TRACE_PARAM64(p)    (uint32_t)(p), ((p) >> 32)
+
+/* Create a trace record with time included. */
+#define TRACE_TIME(_e, ...) TRACE_INTERNAL(_e, true,  ##__VA_ARGS__)
+
+/* Create a trace record with no time included. */
+#define TRACE(_e, ...)      TRACE_INTERNAL(_e, false, ##__VA_ARGS__)
+
+
 /* Convenience macros for calling the trace function. */
 #define TRACE_0D(_e)                            \
     do {                                        \
-- 
2.11.0


