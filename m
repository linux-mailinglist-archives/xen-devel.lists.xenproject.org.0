Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627AC7D744A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623189.970786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZp-0000rC-Ab; Wed, 25 Oct 2023 19:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623189.970786; Wed, 25 Oct 2023 19:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZp-0000nC-6o; Wed, 25 Oct 2023 19:30:01 +0000
Received: by outflank-mailman (input) for mailman id 623189;
 Wed, 25 Oct 2023 19:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZo-0000YO-9i
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:00 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3020824-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:29:59 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso18816966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:29:59 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:29:58 -0700 (PDT)
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
X-Inumbo-ID: e3020824-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262199; x=1698866999; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrcsVy0ZByqiAlrS1akx4lL5x1WkgTDXRbWzt5j813o=;
        b=hVoroQ6tWMxBlKGwSdRt4kMqYqbR41L9fMbrOC3kLOVVzduVp0PFBCQafhMRs3R/y1
         Vj+zoj3WdYHl2DSk2Y79aQsceDE93GARJbUBsz/DqAuF4YIiSVLpUpvIZd3qLbyZ+2BU
         cT9TrB04ZmsCv88oBX22OKLnf6Lc5QmvFFYyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262199; x=1698866999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrcsVy0ZByqiAlrS1akx4lL5x1WkgTDXRbWzt5j813o=;
        b=In+GAR6brLj8K0LRnAsGqWb0Id+ol2toIGX0cj1ij7QH99hgPzSIdIbZHaUF/0m3n3
         kgDm22wbH2R4cnA0TXCDlVVSB+qZjTZQK8NBuYHt5t0O20kTwyzAmH0xiUBpLte0uHoA
         rFunKuZ9NKh5V5+4jjoqVpZUlgbwTIrAOLb4++6YmGs3s72wkOFPSyh8wnp2u4MJlA62
         Ib9b0BuCeH6iwHuK1nrMoRBQ6JT+FSHJRdNnhajnvqOafivP0419z5xoxZlsWpyizqaZ
         /e4xw1/Q/0aSxJsFKu9U0+9UAe2NR36jSp1S3knXqtfVDqlaMe1AV4GlDFlqa7gppm2/
         DisQ==
X-Gm-Message-State: AOJu0YxRAZGgPx57uW2usjHYsF3Yq4KEMXOfaXPxlB/UMERPCjnNYkiy
	hadaxdENcXtBvj6mOEQ7wBiaH4Xe5ezbJZzrPMuBSlNi
X-Google-Smtp-Source: AGHT+IGKTzxUPC3TG6HAPPdbQQjreKqAMCHWDhPK8X0X8xM75TxTylLa1twuiHYjeQGjKJanjBsI+Q==
X-Received: by 2002:a17:907:320a:b0:9ba:2a5:75c5 with SMTP id xg10-20020a170907320a00b009ba02a575c5mr12366802ejb.75.1698262199318;
        Wed, 25 Oct 2023 12:29:59 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 02/22] x86/msr: implement MSR_SMI_COUNT for Dom0 on Intel
Date: Wed, 25 Oct 2023 20:29:32 +0100
Message-Id: <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Dom0 should always be able to read this MSR: it is useful when
investigating performance issues in production.
Although the count is Thread scoped, in practice all cores were observed
to return the same count (perhaps due to implementation details of SMM),
so do not require the cpu to be pinned in order to read it.

This MSR exists on Intel since Nehalem.

Backport: 4.15+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h | 3 +++
 xen/arch/x86/msr.c                   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 82a81bd0a2..2853a276ca 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -641,6 +641,9 @@
 #define MSR_NHL_LBR_SELECT		0x000001c8
 #define MSR_NHL_LASTBRANCH_TOS		0x000001c9
 
+/* Nehalem and newer other MSRs */
+#define MSR_SMI_COUNT                       0x00000034
+
 /* Skylake (and newer) last-branch recording */
 #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
 #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c33dc78cd8..0bf6d263e7 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -139,6 +139,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_SMI_COUNT:
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+        if ( is_hardware_domain(d) && !rdmsr_safe(msr, *val) )
+            break;
+        return X86EMUL_UNHANDLEABLE;
+
     case MSR_P5_MC_ADDR:
     case MSR_P5_MC_TYPE:
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
-- 
2.41.0


