Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F0634003
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447227.703246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5E-0001G0-Kr; Tue, 22 Nov 2022 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447227.703246; Tue, 22 Nov 2022 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5E-00019x-Du; Tue, 22 Nov 2022 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 447227;
 Tue, 22 Nov 2022 15:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV5C-0000Pt-He
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49559a23-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:07 +0100 (CET)
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
X-Inumbo-ID: 49559a23-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7gWfaxpMRzjVNfVa6VAf16WPp08zyiDdBqzCCJVKn/c=;
  b=XBic0HkmTYoyl+rrSKQVwmYvkvdILCdQwegw/sd+dQVqmZC+BQ+I/VBX
   r021Dql6KvFm9ocYiNKHXRj6MErD8PpjfnBHHGy0988KJci9kkqr5ec4a
   hLU1TFoivED2+NCpH4cwuQEs5rjXOyeTTNW7TFTeQYGtTuipjxhH6UOZ8
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85360552
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:C1j3r6iJJLRle6uVytR2BSxrX161MhAKZh0ujC45NGQN5FlHY01je
 htvC2nXOauOMWTxLox2OtmzpElTuJfWmoA2SFQ+qyBgRiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QWEzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQgCjFTMCqswNuq2ZzicLh2qsB+Hcb0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbF/
 Tyeojmjav0cHO6t5Aja016OuuzgmjLed8FMDpG6/9c/1TV/wURMUUZLBDNXu8KRhkegVvpFJ
 kcT+y5oqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUq/9+nKlxz1ADQMAzY4NDUoSVY07Ma29enfkSnzosZf/L+d14OrSGmgm
 Gnb/UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBvazt3MX02wIHInXY323FFr7KVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiX7NfIqPd3rVZp1pUQFKTgCfqmEBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9EuYLGB0kWmwvueHwM5076jerFPSfPEd/o8jKmN4gE0U9Nmy2Nm
 /43CidA40w3vDHWCsUPzbMuEA==
IronPort-HdrOrdr: A9a23:MGh4ja6DI60Kw1nAhgPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpN
 5dmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85360552"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 8/8] tools/oxenstored/syslog: Avoid potential NULL dereference
Date: Tue, 22 Nov 2022 15:20:43 +0000
Message-ID: <20221122152043.8518-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

strdup() may return NULL.  Check for this before passing to syslog().

Drop const from c_msg.  It is bogus, as demonstrated by the need to cast to
void * in order to free the memory.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/xenstored/syslog_stubs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
index 875d48ad57eb..e16c3a9491d0 100644
--- a/tools/ocaml/xenstored/syslog_stubs.c
+++ b/tools/ocaml/xenstored/syslog_stubs.c
@@ -14,6 +14,7 @@
 
 #include <syslog.h>
 #include <string.h>
+#include <caml/fail.h>
 #include <caml/mlvalues.h>
 #include <caml/memory.h>
 #include <caml/alloc.h>
@@ -35,14 +36,16 @@ static int __syslog_facility_table[] = {
 value stub_syslog(value facility, value level, value msg)
 {
 	CAMLparam3(facility, level, msg);
-	const char *c_msg = strdup(String_val(msg));
+	char *c_msg = strdup(String_val(msg));
 	int c_facility = __syslog_facility_table[Int_val(facility)]
 	               | __syslog_level_table[Int_val(level)];
 
+	if ( !c_msg )
+		caml_raise_out_of_memory();
 	caml_enter_blocking_section();
 	syslog(c_facility, "%s", c_msg);
 	caml_leave_blocking_section();
 
-	free((void*)c_msg);
+	free(c_msg);
 	CAMLreturn(Val_unit);
 }
-- 
2.11.0


