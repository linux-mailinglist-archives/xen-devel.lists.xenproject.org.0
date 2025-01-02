Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50269FF70E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863737.1275169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpz-0006c1-Gs; Thu, 02 Jan 2025 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863737.1275169; Thu, 02 Jan 2025 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpz-0006W9-89; Thu, 02 Jan 2025 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 863737;
 Thu, 02 Jan 2025 08:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCcj=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-18bc4adf6c0c4943a835c5bc80ce84cb@srs-se1.protection.inumbo.net>)
 id 1tTGpx-0004rS-UK
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:49 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5908fed-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:46 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fD5n5HzCf9M37
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 18bc4adf6c0c4943a835c5bc80ce84cb; Thu, 02 Jan 2025 08:45:40 +0000
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
X-Inumbo-ID: f5908fed-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807540; x=1736068040;
	bh=mzhXuh0ndyjVjpzrrKA3CLzzrom7CZG1ilSX478/eBg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oDCE65nLyW+4kZGft2uh059FpwIwEueCaNkKPOqR4qKgZ9asIUVyLSu9WliVX/lFt
	 HjW7vUdQvjKPQ+Z5vsIT+NDkW3B5f4NuFGyaZn7ebPHat+5nJY9k3j4OcCDBeT8Hf5
	 SuzhFE6e0ZBcTcjCt6nvUoSIRhlKXHU/gBLgd69GiYaQTg7DdMk0rjrtn9mhNww5J/
	 i8T6DkNcuzuie6/zz8hj0LRvcf+SurMdLTj7slyVyXsZeGFyRJnYDJi4Svu0qy8ekQ
	 HCztn4N6idpPsqlKxpb34fOVZAZN9aWPKRf1nbBNNt4IPi8joto40BELFQ3eNQjxw+
	 HrWVGMELfkFzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807540; x=1736068040; i=ngoc-tu.dinh@vates.tech;
	bh=mzhXuh0ndyjVjpzrrKA3CLzzrom7CZG1ilSX478/eBg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O+r6NcYohpfHx1h+H0YjkdzcWSY9atwvPggh+iuatsHlmcnivPBokfNhI88D02J7C
	 avhzxVYyQM7mFbxrG1Tax4w2HEdM63sEWtui4MOwGev9O2POXZFC0gzfG1vevkNgI4
	 D5odIRyCKRLqNb8ZHiCkzr6UFykXnhdo7mlog4CJgBXGBB1GbaCWuHCGEGw/Z9FlwC
	 o8+gAo9DIHkq1QDWKRwJH1tbkKTwRY9Ef0IRs8fbg8RPuA78jTIRH83e6dlm9W4Sz4
	 ZVgScCgL+8YNyam/yi7Bslp9G4jjgjym9OWSpUWh/8Cdr0pq9Wsf+hgnMzt5Jcr947
	 91P/BmnQ1CICA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2005/10]=20x86:=20Keep=20a=20copy=20of=20XSAVE=20area=20size?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807539875
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-6-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.18bc4adf6c0c4943a835c5bc80ce84cb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/include/asm/domain.h | 1 +
 xen/arch/x86/xstate.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd7..d3f2695c20 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -638,6 +638,7 @@ struct arch_vcpu
      * #NM handler, we XRSTOR the states we XSAVE-ed;
      */
     struct xsave_struct *xsave_area;
+    unsigned int xsave_area_size;
     uint64_t xcr0;
     /* Accumulated eXtended features mask for using XSAVE/XRESTORE by Xen
      * itself, as we can never know whether guest OS depends on content
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index af9e345a7a..baae8e1a13 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -550,6 +550,7 @@ int xstate_alloc_save_area(struct vcpu *v)
     save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
 
     v->arch.xsave_area = save_area;
+    v->arch.xsave_area_size = size;
     v->arch.xcr0 = 0;
     v->arch.xcr0_accum = 0;
 
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

