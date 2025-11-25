Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C42C8609D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172122.1497224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwHk-0006Rg-NS; Tue, 25 Nov 2025 16:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172122.1497224; Tue, 25 Nov 2025 16:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwHk-0006Oo-KB; Tue, 25 Nov 2025 16:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1172122;
 Tue, 25 Nov 2025 16:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEo6=6B=bounce.vates.tech=bounce-md_30504962.6925dee6.v1-d3611c1901914d6385b9c5e00a3e27e9@srs-se1.protection.inumbo.net>)
 id 1vNwHj-0006Oc-KA
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 16:52:59 +0000
Received: from mail136-9.atl41.mandrillapp.com
 (mail136-9.atl41.mandrillapp.com [198.2.136.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e7aad4-ca1f-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 17:52:57 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-9.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4dG7zW0cjjzHXZ3v7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 16:52:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d3611c1901914d6385b9c5e00a3e27e9; Tue, 25 Nov 2025 16:52:54 +0000
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
X-Inumbo-ID: 30e7aad4-ca1f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764089575; x=1764359575;
	bh=jT0m9BdfMX/m41lcrVIqNyfEiJvXRG9zC+LDUTDZaPk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tIjCPORLfRDPBx8bKrpxsNJy+IS1VcwdywLkDL29pGgIxilWPeJ7jbK7hKwPlBncM
	 2OKMqDXDcPWSfLFxV5tU0mLfMSUsRsTnKNrf83co8EtywUqto3pp+yFCs1OZdiwMPJ
	 KPtMzM3VOLJWbIQJx74J/St4s2bRCNmaWv8TRl8yDWyZn61YspYszyb15rjJUUQKOP
	 1o+np8mX0O5IVsNBIlf8qiU8+62dWE0YaHorOV55n7wBEdIJHR6f5EwB0eoPcRfC1D
	 trakrC5hpixseRHcGGqYFIgnkEAq2FFz8/0SBgGo072qkqbqhtIulNSQfenYLZjzz1
	 KH2e2Iqtsv6uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764089575; x=1764350075; i=ngoc-tu.dinh@vates.tech;
	bh=jT0m9BdfMX/m41lcrVIqNyfEiJvXRG9zC+LDUTDZaPk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=VUXD3MPkRjqg91m15162dpHU/WyVZxuQ4STzn9rZZ5rL6sl5KD6DRrh1gDWUmxtX3
	 KtVs2fi9lwFR0AIhUs8dee/X2jCW9WSOnaUIPUBlJrzrZOE2v5IpwhpUTIt0q/tkO9
	 cHBPTQQLWjjWRTEO8XtAtSCJeLomDsxtgVtQU3oXNl70UKG6+KTdp0dhpLMFeFkXdQ
	 7R6IoRWUy2sZy5bmpfe1RyvNolNbJ9Hxmwfd4QXN5ecXyla+ZNYeoMcXPLoUdG9bCM
	 zMpOrDCmeSn7bhUeRNcxXjQbgV7qJbTkb+p+mxemr2fQ6xVSX4lhfSZBkwzfI6rKDd
	 FQI92DxOOQecg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20x86/vhpet:=20Fix=20sanitization=20of=20legacy=20IRQ=20route?=
X-Mailer: git-send-email 2.51.2.windows.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764089574060
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20251125165252.1491-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d3611c1901914d6385b9c5e00a3e27e9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251125:md
Date: Tue, 25 Nov 2025 16:52:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

When setting a timer's config register, timer_sanitize_int_route will
always reset the IRQ route value to what's valid corresponding to the
!HPET_CFG_LEGACY case. This is applied even if the HPET is set to
HPET_CFG_LEGACY.

When some operating systems (e.g. Windows) try to write to a timer
config, they will verify and rewrite the register if the values don't
match what they expect. This causes an unnecessary write to HPET_Tn_CFG.

Note, the HPET specification states that for the Tn_INT_ROUTE_CNF field:

"If the value is not supported by this prarticular timer, then the value
read back will not match what is written. [...] If the LegacyReplacement
Route bit is set, then Timers 0 and 1 will have a different routing, and
this bit field has no effect for those two timers."

Therefore, Xen should not reset timer_int_route if legacy mode is
enabled, regardless of what's in there.

Fixes: ec40d3fe2147 ("x86/vhpet: check that the set interrupt route is valid")
Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
v2:
* Add timer_is_legacy check to timer_int_route_valid.
* Add comment to the timer_sanitize_int_route call in hpet_write(HPET_CFG).
---
 xen/arch/x86/hvm/hpet.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index f0e5f877f4..e317ec1f5f 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -48,6 +48,8 @@
 #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
 #define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
 #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
+#define timer_is_legacy(h, n) \
+    (((n) <= 1) && ((h)->hpet.config & HPET_CFG_LEGACY))
 
 #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
 
@@ -55,7 +57,8 @@
     MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
 
 #define timer_int_route_valid(h, n) \
-    ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n))
+    (timer_is_legacy(h, n) || \
+     ((1u << timer_int_route(h, n)) & timer_int_route_cap(h, n)))
 
 static inline uint64_t hpet_read_maincounter(HPETState *h, uint64_t guest_time)
 {
@@ -275,7 +278,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
             ? (uint32_t)diff : 0;
 
     destroy_periodic_time(&h->pt[tn]);
-    if ( (tn <= 1) && (h->hpet.config & HPET_CFG_LEGACY) )
+    if ( timer_is_legacy(h, tn) )
     {
         /* if LegacyReplacementRoute bit is set, HPET specification requires
            timer0 be routed to IRQ0 in NON-APIC or IRQ2 in the I/O APIC,
@@ -379,6 +382,14 @@ static int cf_check hpet_write(
         h->hpet.config = hpet_fixup_reg(new_val, old_val,
                                         HPET_CFG_ENABLE | HPET_CFG_LEGACY);
 
+        /*
+         * The first 2 channels' interrupt route values only matter when
+         * HPET_CFG_LEGACY is disabled. However, for simplicity's sake, always
+         * resanitize all channels anyway.
+         */
+        for ( i = 0; i < HPET_TIMER_NUM; i++ )
+            timer_sanitize_int_route(h, i);
+
         if ( !(old_val & HPET_CFG_ENABLE) && (new_val & HPET_CFG_ENABLE) )
         {
             /* Enable main counter and interrupt generation. */
-- 
2.43.0



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


