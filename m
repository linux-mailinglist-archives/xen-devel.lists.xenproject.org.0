Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC4AE9FB6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026454.1401645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAo-0000ly-5O; Thu, 26 Jun 2025 14:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026454.1401645; Thu, 26 Jun 2025 14:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAo-0000k6-2Y; Thu, 26 Jun 2025 14:01:54 +0000
Received: by outflank-mailman (input) for mailman id 1026454;
 Thu, 26 Jun 2025 14:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAfE=ZJ=bounce.vates.tech=bounce-md_30504962.685d52cd.v1-8d86ec1b1d5845b0bc07aaba3dcfc810@srs-se1.protection.inumbo.net>)
 id 1uUnAn-0000k0-BK
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:01:53 +0000
Received: from mail187-29.suw11.mandrillapp.com
 (mail187-29.suw11.mandrillapp.com [198.2.187.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b6b3111-5296-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:01:51 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-29.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bSgNF6ZNTz7lmc04
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 14:01:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8d86ec1b1d5845b0bc07aaba3dcfc810; Thu, 26 Jun 2025 14:01:49 +0000
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
X-Inumbo-ID: 1b6b3111-5296-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750946509; x=1751216509;
	bh=rMTOANt3p+25g116jy6kB29hJo6UBAKp08lO4/yXHjk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ku8DoKafVUJwPvr5jkqA9eiAtHEspUs3u1fwCyGASs72ClDWSsNcjb9gjqS55V2ze
	 T8MF95UHH8P0sgntuX/+L4SFyC+fCro/zlCxhNjXYCP4vZ5yeyENYbWGRRFVt0ZgRB
	 Th5gU8WxSzT/ULfx1RgpYhrbCwwir2kIt2Vgadhx7+XXAztdbSxjOIPG+vdgrOi7De
	 qcsSDs5jpdnrmLlpnynH6uUZjYLUas4ekA7unHi7U4EYvtEVIDPSoaa0VhfmkgE6VN
	 of29ewFwCK5K8kaxW783GfdNtXEoGXnV/1UNYgps7FeTnOYbFNwZtZvpzTRm4TMQAJ
	 Fy46f9XnjiQig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750946509; x=1751207009; i=teddy.astie@vates.tech;
	bh=rMTOANt3p+25g116jy6kB29hJo6UBAKp08lO4/yXHjk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uXMYOA9bSAkg5u7qo88uN8SkMXuqYba4YSrLLCiza1BXFZ5MIz+/YRa5ucuwr1SSU
	 IP4EVarwh57FLeEnOYbARD20mfBgk+MJpRi85DXVEM5vFzZf8HLTXpP+i2wxdYzhMt
	 dtmqeL9/BuVAyl4/F6iOCRfLUZ3A/rpYOBgWPvGtxI55qGJh5pf8go06Wx4a7HaJ0/
	 9sYFNPwBKj97u16RlcgN7RRIPEefJpP/j5PFoekXntMdqE9kd/2Vaxte+zoTRSIM9B
	 wWxGDHTC/VW5uydozCVWTpHZ6H3PCPWFYlmVE9iGui3gS8ToUqpPPEDcek3+8tWox2
	 BJ+i2mw3ZqxAQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=201/3]=20vmx:=20Rewrite=20vpid=5Fsync=5Fvcpu=5Fgva?=
X-Mailer: git-send-email 2.50.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750946506901
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <f92b18bd9ec6b5b83a4b8a66dea2440b65060c27.1750770621.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1750770621.git.teddy.astie@vates.tech>
References: <cover.1750770621.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8d86ec1b1d5845b0bc07aaba3dcfc810?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250626:md
Date: Thu, 26 Jun 2025 14:01:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Rewrite this function such as it doesn't rely on goto, also change the
type of "type" to match the __invvpid function call.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 29 +++++++++-----------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 56bea252cc..8559343857 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -287,10 +287,10 @@ extern uint8_t posted_intr_vector;
 #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
     (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
 
-#define INVVPID_INDIVIDUAL_ADDR                 0
-#define INVVPID_SINGLE_CONTEXT                  1
-#define INVVPID_ALL_CONTEXT                     2
-#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
+#define INVVPID_INDIVIDUAL_ADDR                 0UL
+#define INVVPID_SINGLE_CONTEXT                  1UL
+#define INVVPID_ALL_CONTEXT                     2UL
+#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3UL
 
 static always_inline void __vmptrld(u64 addr)
 {
@@ -454,25 +454,16 @@ void ept_sync_domain(struct p2m_domain *p2m);
 
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
-    int type = INVVPID_INDIVIDUAL_ADDR;
+    unsigned long type;
 
-    /*
-     * If individual address invalidation is not supported, we escalate to
-     * use single context invalidation.
-     */
+    /* Use the most precise invalidation type available. */
     if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
-        goto execute_invvpid;
-
-    type = INVVPID_SINGLE_CONTEXT;
-
-    /*
-     * If single context invalidation is not supported, we escalate to
-     * use all context invalidation.
-     */
-    if ( !cpu_has_vmx_vpid_invvpid_single_context )
+        type = INVVPID_INDIVIDUAL_ADDR;
+    else if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
+        type = INVVPID_SINGLE_CONTEXT;
+    else
         type = INVVPID_ALL_CONTEXT;
 
-execute_invvpid:
     __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
 }
 
-- 
2.50.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


