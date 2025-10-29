Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9DC1BE18
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152912.1483428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aM-0007Rk-TU; Wed, 29 Oct 2025 15:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152912.1483428; Wed, 29 Oct 2025 15:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aM-0007Pf-QI; Wed, 29 Oct 2025 15:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1152912;
 Wed, 29 Oct 2025 15:59:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3QF=5G=bounce.vates.tech=bounce-md_30504962.690239e5.v1-344e163403e9441abe4e703cf9431443@srs-se1.protection.inumbo.net>)
 id 1vE8aK-0006vP-Tz
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:59:40 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43079a3b-b4e0-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:59:34 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cxX4P0dq6zGltNRS
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 15:59:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 344e163403e9441abe4e703cf9431443; Wed, 29 Oct 2025 15:59:33 +0000
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
X-Inumbo-ID: 43079a3b-b4e0-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761753573; x=1762023573;
	bh=oGq48Kw6VxX6AL0YA0EWRlGqPbZliOr3BfqoqvKzxGc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sio+zkBzT4XEA5JYMxmp65necqoDGQBINbbMWguzrRvSUogUv6XNnVPpG8qoaSvK8
	 ZeZpYAqSe07i64cncFs14L4+h7h3Zc9uSmL4Mkwk8bGYf94ZNTgKjGf3qMU0z48hBq
	 69f3iBoYRc0N+cKO3E5ix2sBDmseb9StowJ+K3RfGBYIDXc5HOQm9FvTTkRVa3M9rD
	 ocaMmizRn55whmxL2pkeo2EW5b/77y+7SU1L9i1FN9PJdp7bSOQF5ck717MGfBWCZ4
	 fqtNg5qWILCzPtBrJdikNiroIDlnMopVsh91K2qZIdf1MyZ31KbMNKoOE2HHoi0MMU
	 /V0nRMNQ+TIYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761753573; x=1762014073; i=teddy.astie@vates.tech;
	bh=oGq48Kw6VxX6AL0YA0EWRlGqPbZliOr3BfqoqvKzxGc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wq61IGggjodLyuUK6fB9GTAzThoQPe33aX9iTz8k9RtYGnPcP14J0gdYVo7qbI8W1
	 PHZdqpw/lvmvbJLaiJg4C1qla3dwP+xKoo/1+HY8+dSKVW+l6Toy+9iWDEMe3sbf2z
	 jI0tqfz2GuSJfFzYc/REdn+pGr0EB+m99ubr6vFUqy3cjtMjsgCHQz02oMA4Gf+q7G
	 w8JoY5WUIxjL2o2T83nDFWy44UJJB4B4Gq9U6Uh6OAsEmwU78X8gdj9zSU+31wx1MW
	 MPXxOzOlrAUiDVDycNHPLqiR/1t73ICw8UaI0flsFMj0k2MXS3LlEcVuaI/HK7XuNi
	 srneeElP4pEkw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=20v2=201/3]=20x86/cpu-policy:=20Infrastructure=20for=20CPUID=20leaf=200x6?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761753572108
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <3ad34c3e1de444798dcfe0e673375f28f1a654ec.1761752801.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761752801.git.teddy.astie@vates.tech>
References: <cover.1761752801.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.344e163403e9441abe4e703cf9431443?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251029:md
Date: Wed, 29 Oct 2025 15:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Jan Beulich <jbeulich@suse.com>

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2: introduced

 xen/include/xen/lib/x86/cpu-policy.h | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f94f23e159..c721c986cc 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,32 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            struct {
+                uint32_t /* a */
+                    dts:1,
+                    turbo:1,
+                    arat:1,
+                    :4,
+                    hwp:1,
+                    hwp_notification:1,
+                    hwp_activity_window:1,
+                    hwp_epp:1,
+                    hwp_plr:1,
+                    :1,
+                    hdc:1,
+                    :2,
+                    hwp_peci:1,
+                    :2,
+                    hw_feedback:1,
+                    :12;
+                uint32_t /* b */:32;
+                uint32_t /* c */ aperfmperf:1, 
+                    :31;
+                uint32_t /* d */:32;
+            } pm;
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


