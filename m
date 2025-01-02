Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836039FF70D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863739.1275192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGq2-0007K0-3u; Thu, 02 Jan 2025 08:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863739.1275192; Thu, 02 Jan 2025 08:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGq1-0007GF-V4; Thu, 02 Jan 2025 08:45:53 +0000
Received: by outflank-mailman (input) for mailman id 863739;
 Thu, 02 Jan 2025 08:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANLz=T2=bounce.vates.tech=bounce-md_30504962.67765235.v1-b133c83311a14cd3872070929731beea@srs-se1.protection.inumbo.net>)
 id 1tTGpz-0004rS-V4
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:51 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f692b2ef-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:48 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fF1C1JzCfD7NC
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b133c83311a14cd3872070929731beea; Thu, 02 Jan 2025 08:45:41 +0000
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
X-Inumbo-ID: f692b2ef-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807541; x=1736068041;
	bh=QFIxqPt7/jeUPPpwBYw+2ueBPIx3z09csJHPFtv383Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0RUiMycPuccrGYEQh6/0epojJrlT9+8TcXJXNq0kLcAZXp+/4ZXOnYdFppzmha5ju
	 Gf6/c5/OJugVYnrxJQQfGiqUmZ/V7m4lVMdQzR4+3GmWLyR3qto6TH9Wcv1FXPNnP/
	 cob4hZrFNiLHKfF5F7N/hlI3bsoC5tjPRu0DKjMtX91XaXigUXNRkyIZtNbGwZonx+
	 phD6Ay1TMRnfjgQaKrizq3rkNMiqD3j1Y4fUWEDl8KVj9ZSa+TRWZJ1gXoOJ1d5/Cp
	 Y2IipbICa0c2IfWL/2bSgUSUtRdElI0LL2ba2mVgb0pdF6nWT1HEja6H6XTsnDOUc0
	 WbKyAF07GMwMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807541; x=1736068041; i=ngoc-tu.dinh@vates.tech;
	bh=QFIxqPt7/jeUPPpwBYw+2ueBPIx3z09csJHPFtv383Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UQewD+KVlhDdl1+IdAMse4OdZYUZ5geILHQ/MlXHjP83PXH8QiqU+XvdCQdxxRB6k
	 iBf6RSVtEwnaW8xDO+8ZtgAfd6zhlOvQ20ZmVu4zeTd0GxDUcDyWk5kJ0u+qDplSoo
	 1w/nW76hofiNowGgrDilqv9p1gWx1HC+4K1m3odOPiZFJPP/+e2mn0jsq2LV3OMBeK
	 Vn484RFCoD4XkMFlPv8MViv5uMvJc3E16qSDU/qUhA3xpwvGlUISCB8701r1VywA+L
	 ahCy/rnA8oHkjRzpeGY4kDyrnPcSCf6s59Xz0rv0hiGl7AZUmtneIHYBS5s0lQPH5f
	 c5qvNS8CXlL/A==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2007/10]=20x86/hvm:=20Don't=20count=20XSS=20bits=20in=20XSAVE=20size?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807540297
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-8-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b133c83311a14cd3872070929731beea?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

HVM vCPU state images are uncompressed and therefore can't contain XSS
states.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 922c9b3af6..c7b93c7d91 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1208,7 +1208,8 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
                                            save_area) + \
-                                  xstate_uncompressed_size(xcr0))
+                                  xstate_uncompressed_size(xcr0 & \
+                                                           ~X86_XSS_STATES))
 
 static int cf_check hvm_save_cpu_xsave_states(
     struct vcpu *v, hvm_domain_context_t *h)
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

