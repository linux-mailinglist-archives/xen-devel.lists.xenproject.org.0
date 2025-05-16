Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E553AB98E1
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986621.1372183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-0000Bb-Vf; Fri, 16 May 2025 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986621.1372183; Fri, 16 May 2025 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-00007Y-P3; Fri, 16 May 2025 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 986621;
 Fri, 16 May 2025 09:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMju=YA=bounce.vates.tech=bounce-md_30504962.682705fa.v1-f0ae509aaf1c4bf3846e2e2ff59eca25@srs-se1.protection.inumbo.net>)
 id 1uFrPw-0007iv-Ca
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:48 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 962df48f-3238-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:31:46 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKQ4409zMQxdhF
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f0ae509aaf1c4bf3846e2e2ff59eca25; Fri, 16 May 2025 09:31:38 +0000
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
X-Inumbo-ID: 962df48f-3238-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387898; x=1747657898;
	bh=iMtHB+smiJdOQ9laMMAKQ5QBEFSycIXeep/kGpJ45n8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uoRmOpPM/u6zliOBEwflrIMPb6kr6kvAPf6jiQBWy6u4KRRuEWFnUqK3wy4JL+HuR
	 WMbr3/iBZDaJ6sApqvWfI3T+GcFWB5DRWsiv19IzRHmpBqFiF+V+PlF+cfEMSvShZa
	 Ty1CfuIK2W1ePpdNVVbXEp+a5qmzUxZmNFUerRvQPI71NjHcDZL49rbou8l7k16w3I
	 N/faXzuTwSE6JgEqGWLphz0hLry6sAg6nOQJm8onJIX60wJJg/2jELwBif4j0mjZ0f
	 C6GPd7siFqMI+CArNR2IegMp6bmyWvAem6V5mcbXg4kIqecoKI1WzoNQ3ePPwTMUsH
	 C6hSBrAWW0+Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387898; x=1747648398; i=teddy.astie@vates.tech;
	bh=iMtHB+smiJdOQ9laMMAKQ5QBEFSycIXeep/kGpJ45n8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BE8kb2VeB4bxMGNM7bH0/vjoAH5LhtRH1WJuogcWVAjSVVMgaKl8AuWi2JAs/2rkw
	 Rtoy7yDvPbLwduHgfecCp3UsLHrV0P2bXbN1bJ/DSyf255UHEGzwtLaoAfSzExrRIV
	 fyYSZoUN5y28egsMZwOKAGtcc84qw7IK8FhA47mJHARefJUEc9HX+DA5tIReYkPD0M
	 TQIoTad1XhRpzDU/Z4YrJQv4vNVItlDGkACeAfUiZysctBJbMDto8taGO3E5YUUzlB
	 KCYw8Lqr+JxL/Mye7xXfl8sAykMpVmEWQQrYwmcVBa99Lt7ERkLQe1q0HNTVzKD2PS
	 Wb6K9oZLpwK1g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2006/16]=20vmx:=20Introduce=20vcpu=20single=20context=20VPID=20invalidation?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387897605
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <85727bf1e1df2feeba2af34aa3c7c951982121d6.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f0ae509aaf1c4bf3846e2e2ff59eca25?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce vpid_sync_vcpu_context to do a single-context invalidation
on the vpid attached to the vcpu as a alternative to per-gva and all-context
invlidations.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This will be used on Intel platforms for the ASID management rework.
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index d85b52b9d5..a55a31b42d 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -451,6 +451,27 @@ static inline void ept_sync_all(void)
 
 void ept_sync_domain(struct p2m_domain *p2m);
 
+static inline void vpid_sync_vcpu_context(struct vcpu *v)
+{
+    int type = INVVPID_SINGLE_CONTEXT;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
+        goto execute_invvpid;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    type = INVVPID_ALL_CONTEXT;
+
+execute_invvpid:
+    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+}
+
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
     int type = INVVPID_INDIVIDUAL_ADDR;
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


