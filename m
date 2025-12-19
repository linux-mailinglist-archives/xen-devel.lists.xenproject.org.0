Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1912CD08EB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190779.1511075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccb-0007TC-KO; Fri, 19 Dec 2025 15:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190779.1511075; Fri, 19 Dec 2025 15:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccb-0007OG-G8; Fri, 19 Dec 2025 15:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1190779;
 Fri, 19 Dec 2025 15:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twhv=6Z=bounce.vates.tech=bounce-md_30504962.69457259.v1-09a0b611dd5446099d0793746429beb8@srs-se1.protection.inumbo.net>)
 id 1vWccZ-0006gp-Op
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:42:23 +0000
Received: from mail179-28.suw41.mandrillapp.com
 (mail179-28.suw41.mandrillapp.com [198.2.179.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4caa9cfe-dcf1-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 16:42:18 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-28.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsGx0phBzMQxZwl
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 15:42:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 09a0b611dd5446099d0793746429beb8; Fri, 19 Dec 2025 15:42:17 +0000
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
X-Inumbo-ID: 4caa9cfe-dcf1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766158937; x=1766428937;
	bh=EDhYIftkVJKhg5aQNHcgY2YjTEfUugXGsd0ObHTK3Xw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vDXECE+MK8Kom/1/s9ReIpPR8xqOrZ2YxsbC152JTcLTiwNR9kS5JahPQqnY3j3eQ
	 g3+l4bYaQgTRskb6Ydr9+5OA7XHxdTgwTU4ZTD3NC9psxRsgOte+XsCYB5f7jpfy6x
	 O22r3YI11ax+keBGGjY9i6d3jwt9N6c+hNNNw3nPmF+KBN2E7U3ur9rvRv0xXNVGnm
	 XbqZzQqcODCvgQfkpJDe20eBxWV/uitCL2zV5W3CQaQSi0FiIhuKHndH6Di9um558j
	 QFChuNgunmiPQF/W2ueDGRciVf4YpJ0I9pwXtOoNBFRjqQXL76YlKqSVtOXOXq4jbn
	 +GKBaT6px+PmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766158937; x=1766419437; i=teddy.astie@vates.tech;
	bh=EDhYIftkVJKhg5aQNHcgY2YjTEfUugXGsd0ObHTK3Xw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h+aH68cqw1OlH3mZrzVvHHq4s6hllU94c1MnTvuWmRFVZkT2n0nLsJz/zeQof8EqV
	 iZ1+oxTrS2kTBCRZTRWoiHMS4qXoK1LSV9HHEejG0wvxXQcPJQIXTZz4eppe3w3Wl6
	 3IUliInyN9Ru8cx4C1tqlPJ/DoHkWRsK2Z3utJSQnDF5G1p3akFshWcZR0/qP5J0cT
	 KXuSGzVStHnri8Da6n1yQ+oQvkEvHPAnQ2ZBj6D8PvXLRR92xNw4pNvrhcWOnClP2K
	 QtBBmjoH68YfxJhOMLgRe3sA8md4D4D2L2Ld3aB91iruT5qyYnO3XYFXA3273FpHVC
	 imugzjincqAMw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=201/4]=20x86/cpu-policy:=20define=20bits=20of=20leaf=206?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766158936226
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <8a4adb89e6b6152fca074f2bb9091b42af936630.1766158766.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1766158766.git.teddy.astie@vates.tech>
References: <cover.1766158766.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.09a0b611dd5446099d0793746429beb8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Jan Beulich <jbeulich@suse.com>

... as far as we presently use them in the codebase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I don't know to which extend Reviewed-by applies as I only applied Andrew's
proposal.

 xen/include/xen/lib/x86/cpu-policy.h | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f94f23e159..8772ef80e3 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,32 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            bool :1,
+                turbo:1,
+                arat:1,
+                :1,
+                :1,
+                :1,
+                :1,
+                hwp:1,
+                hwp_notification:1,
+                hwp_activity_window:1,
+                hwp_epp:1,
+                hwp_plr:1,
+                :1,
+                hdc:1,
+                :1,
+                :1,
+                hwp_peci:1,
+                :1,
+                :1,
+                hw_feedback:1;
+            uint32_t :32; /* b */
+            bool aperfmperf:1;
+            uint32_t :32; /* d */
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


