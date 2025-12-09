Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293CCB0B23
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182035.1504976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Ml-0005eK-Pn; Tue, 09 Dec 2025 17:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182035.1504976; Tue, 09 Dec 2025 17:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Ml-0005cN-N2; Tue, 09 Dec 2025 17:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1182035;
 Tue, 09 Dec 2025 17:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0St=6P=bounce.vates.tech=bounce-md_30504962.69385a0b.v1-1005dcf71bf14d459bc070e2aa73c258@srs-se1.protection.inumbo.net>)
 id 1vT1Mk-0005c7-AC
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:19:10 +0000
Received: from mail187-28.suw11.mandrillapp.com
 (mail187-28.suw11.mandrillapp.com [198.2.187.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b7099d3-d523-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 18:19:08 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-28.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dQlvH0WMTzMQxgGn
 for <xen-devel@lists.xenproject.org>; Tue,  9 Dec 2025 17:19:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1005dcf71bf14d459bc070e2aa73c258; Tue, 09 Dec 2025 17:19:07 +0000
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
X-Inumbo-ID: 2b7099d3-d523-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765300747; x=1765570747;
	bh=zb7G5zIrK8ZCQZTkyb087CIMe6mjbmKnl+xgf9D+q6E=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G89TV/4FcDCDatAVS6dkUS+8RvWPXiw3Wmb8RlhcEFEm390eQXyGlsOysrsbc83Oq
	 6fRnmahPqykuxYerWemjO5nSmbgTb9Ul9Zx2qgaOQQyaTFLn5iQCKj9QIn9P8ew9CB
	 rNFFAZ8BA3XyEN3jxLIjOPXpffoNrW6NR38y/GZF20D645zlFS4JTJIF0hPl/xf+Iv
	 aJXkFgp7eE2kISfX3ubHlfYax09vrhT4KY35Cc7uJBDZa5xHHtNckozWp3Ohz3/9TF
	 8S97UktcLP+E4nGahwyoyQoWarzzboZ0c1hMG/SufYavuf+k9HJ0RfjbEXj4YdEmD8
	 D98BrmCrpl7pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765300747; x=1765561247; i=teddy.astie@vates.tech;
	bh=zb7G5zIrK8ZCQZTkyb087CIMe6mjbmKnl+xgf9D+q6E=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gQg0wgiVVTh53uodaTza/Uf2EnvQVbuGtBHczxZ8RcYbxOHi3A8io2z4ArQEBxJsr
	 6Pnxa05jUXMvDOK/lwgoV/eAvyKOG+p8pCA9g/5/aiNCNFMFwC8ilmVTCn28gXLBVL
	 cdpo1GwQhw2GwG4Yzz6ttzm0KS/lMFgLM0SldTq9Rxne6g15EwbqcfYFvI+Mb8jg4f
	 ydvDngw1Ear5OABu41Ppx4eY57NieV7VHBfa8ShXNhauG9u66ZhLH3dovEhCXGMOCm
	 XHAYP/GXoPJmfhU+xYtbuin/Pqlks+UDoQJZ3IHpekNK8bsp2+HmWvnlbgvDuC+Rpr
	 bxwuLlEi/Y1Qw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=201/3]=20x86/cpu-policy:=20Infrastructure=20for=20CPUID=20leaf=200x6?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765300746124
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <dc2b4786a56811481de07bd5e97bbf1f0baeb0e9.1765300623.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1765300623.git.teddy.astie@vates.tech>
References: <cover.1765300623.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1005dcf71bf14d459bc070e2aa73c258?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251209:md
Date: Tue, 09 Dec 2025 17:19:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Jan Beulich <jbeulich@suse.com>

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
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


