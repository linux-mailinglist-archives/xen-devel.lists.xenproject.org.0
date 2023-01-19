Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20367353F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480911.745569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwf-0000Wt-Tc; Thu, 19 Jan 2023 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480911.745569; Thu, 19 Jan 2023 10:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwf-0000TX-Qg; Thu, 19 Jan 2023 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 480911;
 Thu, 19 Jan 2023 10:14:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7itS=5Q=amazon.com=prvs=3763fc082=mstrasun@srs-se1.protection.inumbo.net>)
 id 1pIRw6-0007Sb-Sz
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:14:22 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0985ffd9-97e2-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 11:14:21 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:14:17 +0000
Received: from EX13D45EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com (Postfix)
 with ESMTPS id AFD1B83352
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 10:14:15 +0000 (UTC)
Received: from EX19D039EUA004.ant.amazon.com (10.252.50.95) by
 EX13D45EUA003.ant.amazon.com (10.43.165.71) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 19 Jan 2023 10:14:13 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D039EUA004.ant.amazon.com (10.252.50.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.7;
 Thu, 19 Jan 2023 10:14:13 +0000
Received: from dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com
 (172.19.92.214) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.45 via Frontend Transport; Thu, 19 Jan 2023 10:14:12
 +0000
Received: by dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com (Postfix,
 from userid 17415739)
 id 8126F21426; Thu, 19 Jan 2023 10:14:12 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0985ffd9-97e2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674123262; x=1705659262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4hf1x7Xe4bXRLb6h+Ksi8ZE8+Xk4HBnSsvCu7j+CUQ4=;
  b=nUKTLNs6VsJLVg0yLiH7j7Q9MHx6dzSiqZmmGoJxY8FxPds9AhAFBV4l
   qRSCRlKVGoO8rDABdOJf74K5UZ+prgZBd1rZ3uymNR3ZsRG+MWIwhDVTU
   TC7NmyI6qGtoLWWE+HVn6VS8L+I/3l+bLLOCr7QnWrJkPg9B+l1wjY+Xf
   s=;
X-IronPort-AV: E=Sophos;i="5.97,228,1669075200"; 
   d="scan'208";a="172738134"
From: Mihails Strasuns <mstrasun@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <mstrasun@amazon.com>, Michael Kurth <mku@amazon.com>
Subject: [PATCH v1 1/4] common.h: Flush stdout before writing to stderr
Date: Thu, 19 Jan 2023 10:13:02 +0000
Message-ID: <2e89973f61bbd6e6ebb423ec6fe7a025d5404235.1673623880.git.mstrasun@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673623880.git.mstrasun@amazon.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Flush existing debug messages before writing an error to stderr.  stderr
is usually unbuffered and stdout is usually buffered. This results in
odd looking output when an error occurs and both stderr/stdout are
printed on the same console/file. More precisely, the error message is
printed in the middle of previously emitted debug messages.

Signed-off-by: Michael Kurth <mku@amazon.com>
---
 common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common.h b/common.h
index 02c9b7b..9a9da79 100644
--- a/common.h
+++ b/common.h
@@ -10,6 +10,7 @@ extern char *childobj;
 
 #define DIFF_FATAL(format, ...) \
 ({ \
+	fflush(stdout); \
 	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
 	error(2, 0, "unreconcilable difference"); \
 })
-- 
2.38.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




