Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7066B7C7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478337.741478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYD-0007gM-8d; Mon, 16 Jan 2023 07:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478337.741478; Mon, 16 Jan 2023 07:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYD-0007e2-4V; Mon, 16 Jan 2023 07:05:01 +0000
Received: by outflank-mailman (input) for mailman id 478337;
 Mon, 16 Jan 2023 07:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJYB-00077f-JL
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:04:59 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 169c8c69-956c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:04:58 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id vw16so2677358ejc.12
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:04:58 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:04:57 -0800 (PST)
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
X-Inumbo-ID: 169c8c69-956c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O7AGGT5LTOYunZyjJAtUCNbg1rumh26m/rUSOWP+V8=;
        b=gnM2zjMwI7vjjXcR91Diixg4uJGE8qmSsFEfsKbwwi6+E2kDsroPHUbkT2WaxxsabD
         Tbidyx9PPeoClqRjDP27m/p8My0YU7dKan3BpKj2uQ9B4aJDM6q5yLWiYm7DG0MEphs4
         SDROHxYu3s7hrjwGO2VQLG8H5VJEK0KGT437bcUPVmMrl8aj/2wRFWLiXCttsBHolqpD
         /Tdq0VuhCBrLgprdHm3/s/kjsT3/jaQHRGVVKQEEldb0BtJqf+xxdY9nFDoQRV/cdier
         AlkKUaFuHNBeFYwTeCbowm0DDoL5oP707cfJAPAFHl+mplYSpBDv7glfdXIyo1XadSiU
         RAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O7AGGT5LTOYunZyjJAtUCNbg1rumh26m/rUSOWP+V8=;
        b=7S6d+JPBO1QUHb4blDIlPswuH9l0JwpeR8LuH6K1Ww9jbbHFqr+GeWmLcNeX77QP4B
         ima42rQ1ECjTc8fmV4Hxwpqo/x+g4wUJgiuyV05wwNm7+SuYo6NC757lb9phl9+YnUtN
         oN2tR8D4oeOXbeatUahySggkIRV9w4xXfRfER0mI8oz/KicLR/e7LLF4Q0KqOJEbc5Hz
         Ft14um3KDVhH7iNE2XmTuwvt35zXG/uDmvZ1EV4rJk7BoTQ2EMgZNTtTOi4yUSGMS3MY
         GW/xcqyab9HynnP4md5YfztS2PJcu+bc7JDiwjzMAJjLI9XFizPJ0QZcZnE82YcR1wfn
         j0pA==
X-Gm-Message-State: AFqh2kpb3R516uz3xJZ0A3KAKB8759y4Hcfd40d5JCwcky7GFG5zCauB
	vCKfPTtIxF2IW2ncqS4k220ikEx9e9o=
X-Google-Smtp-Source: AMrXdXsY8LEvyZQR6oxAA9fjTrWKYEuTodFSVjB2DHBN0suWBigssqmyj0d1Y0tw44Rtk8L47jiHhQ==
X-Received: by 2002:a17:906:bc44:b0:870:95b6:94a4 with SMTP id s4-20020a170906bc4400b0087095b694a4mr2595244ejv.48.1673852698028;
        Sun, 15 Jan 2023 23:04:58 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/8] x86/iommu: snoop control is allowed only by Intel VT-d
Date: Mon, 16 Jan 2023 09:04:26 +0200
Message-Id: <20230116070431.905594-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD-Vi driver forces coherent accesses by hardwiring the FC bit to 1.
Therefore, given that iommu_snoop is used only when the iommu is enabled,
when Xen is configured with only the AMD iommu enabled, iommu_snoop can be
reduced to a #define to true.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch
    This patch depends on Jan's patch "x86/shadow: sanitize iommu_snoop usage"
    to ensure that iommu_snoop is used only when the iommu is enabled

 xen/include/xen/iommu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..626731941b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -74,7 +74,12 @@ extern enum __packed iommu_intremap {
    iommu_intremap_restricted,
    iommu_intremap_full,
 } iommu_intremap;
-extern bool iommu_igfx, iommu_qinval, iommu_snoop;
+extern bool iommu_igfx, iommu_qinval;
+#ifdef CONFIG_INTEL_IOMMU
+extern bool iommu_snoop;
+#else
+# define iommu_snoop true
+#endif /* CONFIG_INTEL_IOMMU */
 #else
 # define iommu_intremap false
 # define iommu_snoop false
-- 
2.37.2


