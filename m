Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEEEC80D3E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 14:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171082.1496095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWrG-0000oZ-0z; Mon, 24 Nov 2025 13:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171082.1496095; Mon, 24 Nov 2025 13:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWrF-0000ke-Ts; Mon, 24 Nov 2025 13:43:57 +0000
Received: by outflank-mailman (input) for mailman id 1171082;
 Mon, 24 Nov 2025 13:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+WF=6A=bounce.vates.tech=bounce-md_30504962.69246114.v1-996e3febf77541058d7a8895e834a16e@srs-se1.protection.inumbo.net>)
 id 1vNWrE-0000kX-IX
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 13:43:56 +0000
Received: from mail136-9.atl41.mandrillapp.com
 (mail136-9.atl41.mandrillapp.com [198.2.136.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b875cb6-c93b-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 14:43:50 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-9.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4dFRqm6YJxzHXYgd9
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 13:43:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 996e3febf77541058d7a8895e834a16e; Mon, 24 Nov 2025 13:43:48 +0000
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
X-Inumbo-ID: 9b875cb6-c93b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763991828; x=1764261828;
	bh=tgHAZmk0TqxSfJ22MEtgYW7nyHYSd/spYYd3Txp8mGc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=V1Yv7mgmp+iLihaK79ev2IqvpaIVvoFMcIMint+Ok2IJraj3taBLtiWWBgKGxkZAd
	 YUz59xu32zb9cuxxGaDeoqXIAmsrpnmz8sso9mCXCutbbynOUOh8O88PQS2eMtmbRE
	 NEFvvPEfT0pTK/4hkmgdEcyF/YdZ4ILGGNxG0J5ZAGHlzQBrBUhij5rEwoVrGfnz1c
	 rHishlfvFMowfMYM+ahxIF0FhJLZls9tXIG0C7GcaLdIeWoo1oFDCDRgM+b3281eHV
	 nA3dGIeBNajFQcj8soq1+aEg9GIFFdZHAKw6qhI014mqnG1zLEfYDdWBWTnlPac21U
	 d7ZgJufDTnZjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763991828; x=1764252328; i=ngoc-tu.dinh@vates.tech;
	bh=tgHAZmk0TqxSfJ22MEtgYW7nyHYSd/spYYd3Txp8mGc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=XhZ7/VJkYyfkY1B5pGhPSYHZjPbR837VPetl1QdeplnIpWiG/JPDjn0Tz4DTjEe3/
	 0pGbaTndZo9L4Hwhnh/wWVK/ilEhOBgKBQ76tRIthhLH/pR1AHr4Usb4axH/GKcYRa
	 EzcrAEbMTaYB5SHaWSpiX3UNslQcMrzqhq0/E7P7kQ+vYkVXP0nmKT4OmHKTl9b6xL
	 zoDh8DDE2Wgx8K8yoIzgorRm5iGcYCcgEWh1T6LiZ8Y/1qg2qZtZMILE0mxm4t+Uib
	 QUKkCfFs0M4huiw3eT04tuJZyQjT5H0kdPrrHneY91fvYvmclomWrXStRdAcHa61Z5
	 QgcC451MA6Dcw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/vhpet:=20Fix=20sanitization=20of=20legacy=20IRQ=20route?=
X-Mailer: git-send-email 2.51.2.windows.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763991827489
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20251124134344.456-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.996e3febf77541058d7a8895e834a16e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251124:md
Date: Mon, 24 Nov 2025 13:43:48 +0000
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

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/hvm/hpet.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index f0e5f877f4..fb2f4f94aa 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -48,6 +48,8 @@
 #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
 #define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
 #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
+#define timer_is_legacy(h, n) \
+    (((n) <= 1) && ((h)->hpet.config & HPET_CFG_LEGACY))
 
 #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
 
@@ -244,7 +246,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
          (timer_level(h, tn) && test_bit(tn, &h->hpet.isr)) )
         return;
 
-    if ( !timer_int_route_valid(h, tn) )
+    if ( !timer_is_legacy(h, tn) && !timer_int_route_valid(h, tn) )
     {
         ASSERT_UNREACHABLE();
         return;
@@ -275,7 +277,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
             ? (uint32_t)diff : 0;
 
     destroy_periodic_time(&h->pt[tn]);
-    if ( (tn <= 1) && (h->hpet.config & HPET_CFG_LEGACY) )
+    if ( timer_is_legacy(h, tn) )
     {
         /* if LegacyReplacementRoute bit is set, HPET specification requires
            timer0 be routed to IRQ0 in NON-APIC or IRQ2 in the I/O APIC,
@@ -323,7 +325,7 @@ static inline uint64_t hpet_fixup_reg(
 
 static void timer_sanitize_int_route(HPETState *h, unsigned int tn)
 {
-    if ( timer_int_route_valid(h, tn) )
+    if ( timer_is_legacy(h, tn) || timer_int_route_valid(h, tn) )
         return;
 
     timer_config(h, tn) &= ~HPET_TN_ROUTE;
@@ -379,6 +381,9 @@ static int cf_check hpet_write(
         h->hpet.config = hpet_fixup_reg(new_val, old_val,
                                         HPET_CFG_ENABLE | HPET_CFG_LEGACY);
 
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


