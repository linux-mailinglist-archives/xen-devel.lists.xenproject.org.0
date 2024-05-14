Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4618C4D8D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721209.1124425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nIh-000346-Jb; Tue, 14 May 2024 08:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721209.1124425; Tue, 14 May 2024 08:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nIh-00031r-GR; Tue, 14 May 2024 08:14:19 +0000
Received: by outflank-mailman (input) for mailman id 721209;
 Tue, 14 May 2024 08:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p490=MR=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s6nIf-00031l-Kz
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:14:18 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4826853-11c9-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:14:16 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.vpn.solinno.co.uk [172.19.84.10])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 9BE738006E;
 Tue, 14 May 2024 09:14:15 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id A839A20189; Tue, 14 May 2024 09:14:14 +0100 (BST)
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
X-Inumbo-ID: f4826853-11c9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715674455;
	bh=w1u90DsNaHSjyLaNrDcHOwtXTjvNeyUuUYKrG7Ev38M=;
	h=From:To:Cc:Subject:Date:From;
	b=BMkDFvsMH4xBk09gyB7SCtCwXsJ7ONM3Rn3sFhQ3Yak9AkHN6/+yR17Tt6zKaVD/A
	 /kBOj/KuGJ6HHA+62y1H/pRoVO4/12QZ5Pk7RSrUx0JgNLYXEz6PTxTNWeiXzz9u9l
	 n16u/APhAEFAauZvhbZv6+ghdSqWIqhdxljhA7sI=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH] tools/xentop: fix cpu% sort order
Date: Tue, 14 May 2024 09:13:44 +0100
Message-Id: <20240514081344.4499-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although using integer comparison to compare doubles kind of
works, it's annoying to see domains slightly out of order when
sorting by cpu%.

Add a compare_dbl() function and update compare_cpu_pct() to
call it.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/xentop/xentop.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 545bd5e96d..99199caec9 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -85,6 +85,7 @@ static void set_delay(const char *value);
 static void set_prompt(const char *new_prompt, void (*func)(const char *));
 static int handle_key(int);
 static int compare(unsigned long long, unsigned long long);
+static int compare_dbl(double, double);
 static int compare_domains(xenstat_domain **, xenstat_domain **);
 static unsigned long long tot_net_bytes( xenstat_domain *, int);
 static bool tot_vbd_reqs(xenstat_domain *, int, unsigned long long *);
@@ -422,6 +423,16 @@ static int compare(unsigned long long i1, unsigned long long i2)
 	return 0;
 }
 
+/* Compares two double precision numbers, returning -1,0,1 for <,=,> */
+static int compare_dbl(double d1, double d2)
+{
+	if(d1 < d2)
+		return -1;
+	if(d1 > d2)
+		return 1;
+	return 0;
+}
+
 /* Comparison function for use with qsort.  Compares two domains using the
  * current sort field. */
 static int compare_domains(xenstat_domain **domain1, xenstat_domain **domain2)
@@ -523,7 +534,7 @@ static double get_cpu_pct(xenstat_domain *domain)
 
 static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain *domain2)
 {
-	return -compare(get_cpu_pct(domain1), get_cpu_pct(domain2));
+	return -compare_dbl(get_cpu_pct(domain1), get_cpu_pct(domain2));
 }
 
 /* Prints cpu percentage statistic */
-- 
2.39.2


