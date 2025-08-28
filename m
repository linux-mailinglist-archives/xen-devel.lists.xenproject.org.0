Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E284FB3A3A5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099157.1453089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHI-0007CT-09; Thu, 28 Aug 2025 15:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099157.1453089; Thu, 28 Aug 2025 15:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHH-00074x-Pq; Thu, 28 Aug 2025 15:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1099157;
 Thu, 28 Aug 2025 15:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCB-0003MD-7Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:47 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79d61b1e-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:05:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3c6743a10e3so571431f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:46 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:45 -0700 (PDT)
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
X-Inumbo-ID: 79d61b1e-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393546; x=1756998346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyoRKmd85lnptHe4KkVk9SzU0cCZF0BFObgSAUexGuc=;
        b=nRFWgBW9wZRysTPUVFb6XPMSUMrpM2uFH6RUjp4o8RaN0yopA7JOqE7xMvFM66rq0U
         3NnxjB47YOBpB/MpXSLAYQA5FHYWMPIxpiwCBtu1FNyDe+s2GJjNZB0XuQ2ZyU36H1X8
         Y4KZe5u3Z8WNf/6P+8GkOWZb6mf1zwLpNpFIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393546; x=1756998346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyoRKmd85lnptHe4KkVk9SzU0cCZF0BFObgSAUexGuc=;
        b=J+umaYijWECLcUC9cOSef5CWDns/Sh9gPF6gItv3eFvS0rLyqeB0+sDCQLC/2lp34C
         2gRm97fqR944o4nTs+3a2iHS0v6EIQvMHr9QyAQh+PzwYmDWH1DqnAd/bafzGbduFr3L
         R9D8tMw9K52+AXrzlVcADyLE3kMSmiOtaX+xvpeOVu82DF8Wp5y+aKqaVDl1rB2cCT6m
         i5Z4S5sq6NmxClk7bLm/26eegrCCZElIPL2l9UemXgo6Nyj8ZVQXHrE6aT8r1rZ11rMh
         PF7q51+k3CCZXocep/QKGhdFMpZ7chJsdVokNxplPU0588CwnuvQdMrOV6Bw5ZesvPCw
         lkyg==
X-Gm-Message-State: AOJu0YwWChoyq1J11kjWucS0yjJTBThZs3Lj19xKRfUYKccPZkwvEmfY
	QXPtBGh+QYHeBZ5aTytrH5z/klUr1VLyV9cyKkPkgQ8WxA/Wv5lBGqT5PRP2Bg0pqh1LazeMR74
	VRcW7
X-Gm-Gg: ASbGncspW8CksPvDy02xbzVlWVOhLWiH7jGlClVH39e8BR7yFZ5vq/rSJzxY9B8JxwK
	DDY3iO0wJj7eQbBj8dBRCLpnpDDAi9BzrGrLHPioVoSuST0/WetVxwXAK2pC+ekH9ujpTMzW+DX
	n1CT/ljueKzV9OOoTREak+bNJtD3qxJlFFQBkv5Y/UV6THaxTbxZNMfUt1oMWNDYvlhLaLMgWG5
	A41YUb3e3IGVH5iaN1evFMZ3m4z89S4sbTe/5Zu2E5x4YlbqVE4c30Mek8kiBJ81yhO6NRxSgGF
	J65/xb9wtFSMQDxQJZW6lDH4SYwidmK6wS2BZ6ew9gvKVXz+NQJ6adJxxwAXtN3l+Ip4rFNMjbb
	ADEDsOYRm4BJliXDoYpAX76TX6jPS7zXcesOx2F7cPYmdXmUeue6i77JkeaaBZKPjxHs+ANmoPs
	zPQH2GHWwHSOAl95qv1b8sdg==
X-Google-Smtp-Source: AGHT+IFnwmBxsqBYVYVLE7cVnGwKmyAM64jmOocrbPJsDrYMVP8sWXOmeLFkWvIym0QdfvkcIZEViQ==
X-Received: by 2002:a05:6000:2892:b0:3ce:a06e:f248 with SMTP id ffacd0b85a97d-3cea06ef646mr1200453f8f.17.1756393545770;
        Thu, 28 Aug 2025 08:05:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 05/23] x86/S3: Switch to using RSTORSSP to recover SSP on resume
Date: Thu, 28 Aug 2025 16:03:51 +0100
Message-Id: <20250828150409.901315-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, SETSSBSY is disallowed, and we want to be setting up FRED prior to
setting up shadow stacks.  Luckily, RSTORSSP will also work in this case.

This involves a new type of shadow stack token, the Restore Token, which is
distinguished from the Supervisor Token by pointing to the adjacent slot on
the shadow stack rather than pointing at itself.

In the short term, this logic still needs to load MSR_PL0_SSP.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/wakeup_prot.S | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 0f02ea7b4b9a..fceb4ca353f7 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -90,7 +90,7 @@ LABEL(s3_resume)
         mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
-        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+        /* WARNING! CALL/RET now fatal (iff SHSTK) until RSTORSSP loads SSP */
 
 #if defined(CONFIG_XEN_SHSTK)
         test    $CET_SHSTK_EN, %al
@@ -98,32 +98,31 @@ LABEL(s3_resume)
 
         /*
          * Restoring SSP is a little complicated, because we are intercepting
-         * an in-use shadow stack.  Write a temporary token under the stack,
-         * so SETSSBSY will successfully load a value useful for us, then
-         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
+         * an in-use shadow stack.  Write a Restore Token under the stack, and
+         * use RSTORSSP to load it.  RSTORSSP converts the token to a
+         * Previous-SSP Token, which we discard.
          */
         mov     saved_ssp(%rip), %rdi
 
-        /* Construct the temporary supervisor token under SSP. */
-        sub     $8, %rdi
-
-        /* Load it into MSR_PL0_SSP. */
+        /* Calculate MSR_PL0_SSP from SSP. */
         mov     $MSR_PL0_SSP, %ecx
         mov     %rdi, %rdx
         shr     $32, %rdx
         mov     %edi, %eax
-        wrmsr
-
-        /* Write the temporary token onto the shadow stack, and activate it. */
-        wrssq   %rdi, (%rdi)
-        setssbsy
-
-        /* Reset MSR_PL0_SSP back to its normal value. */
         and     $~(STACK_SIZE - 1), %eax
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
         wrmsr
 
-        /* Pop the temporary token off the stack. */
+        /*
+         * A Restore Token's value is &token + 8 + 64BIT (bit 0).
+         * We want to put this on the shstk at SSP - 8.
+         */
+        lea     1(%rdi), %rax
+        sub     $8, %rdi
+        wrssq   %rax, (%rdi)
+        rstorssp (%rdi)
+
+        /* Discard the Previous-SSP Token from the shstk. */
         mov     $2, %eax
         incsspd %eax
 #endif /* CONFIG_XEN_SHSTK */
-- 
2.39.5


