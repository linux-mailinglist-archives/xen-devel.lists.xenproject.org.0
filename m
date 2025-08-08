Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DEDB1EF6E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075017.1437453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcb-0005vw-1u; Fri, 08 Aug 2025 20:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075017.1437453; Fri, 08 Aug 2025 20:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTca-0005tc-TH; Fri, 08 Aug 2025 20:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1075017;
 Fri, 08 Aug 2025 20:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcZ-0005tJ-8i
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86dfa4cb-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so17066065e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:21 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:19 -0700 (PDT)
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
X-Inumbo-ID: 86dfa4cb-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684600; x=1755289400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H7WNQDzd5coV9BflfHCTzf9vlWwg8AwlAqm3G08bnQ=;
        b=madKix2vVa20HxRrrLSBG3Q9AYjwXFOyUL5BooaPEJcXx9K7GparuWqTEFLpgbG3Px
         Ct2gS+W4TDJjsxROH6CsSnYEtBozQbM+ICztduMapP/ZV1F455bip/4Kg7H5+TpbYRx6
         dEFcqofiF0lRw8+xDLjTuqsc70opWEhwn3TMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684600; x=1755289400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H7WNQDzd5coV9BflfHCTzf9vlWwg8AwlAqm3G08bnQ=;
        b=xL5gwTQbbnBptFWgSbtV6HSTO0RfEZPNGJtFBGXT1GvhBCqomqn+S1Jy4iIg3BErhE
         xGnyox4IHhEInzXMIDtUS/76Q8NtjT+w5uwQPMqihrWXlP7d4iALAQqFoeSWCQAht2aI
         jHVJfgYFHmf3TbhDKrQTPZbtgK/K9dPZsEcgYy/4gGpKjzsfd0caeW/YsDA2Ut5T4AfA
         mAu3QHD9MLI26nn54Zi4J1I/Dtrygn2y6HBvJHP7Efi6kzMS+BmKjeyCd105fe5vG5Ae
         bs6xAxp4Zvyg3BiWNVC5/VDF86OhxZOqyUbXugc5BM7MtWeTC9yRer6p40Ahgz+XMBu2
         TAnw==
X-Gm-Message-State: AOJu0YxZqmSj2XGNB6Bq5GVvAsvIppUaPZ5MxxgNjAIs9Ffd006coMfM
	J7DSxbONdTN6OG/1E2EszDFkY+0P4olBN4gqNuZT88Dh9j/xieBQ2OWjwBVweyOxhZtZqkOAaEN
	szhYV9pQ=
X-Gm-Gg: ASbGnctgYT2NhoJyxt5rPoD+xBb47X580+AII+AS7+sx0qzNYDZX+yjZdulTINPZrrf
	Skqyb0zw5mj/kPaMMKAd1OzNd71dumoTZew8jc2JDx4AodEfkZQ/buNUGTg2pFiIsKvtTbWjd+d
	7kAkbuAMVgURtWmEuT57Q8Ed0mtZ9veGQQI5SZQcgKsjcgHD+o8IqtNF0t4nf7QAEKid4LLnxPr
	XCkS/V3FZztuPq7AqOiFT4NZdaJraX8ViaxOS9K+xajgWPQss6j3FBw6UMCPKzbhj5ohV1h8dNE
	JWUkDLyEy56hxpIMrHs5yd0tPWVJ8zKq+4Q8h8TwdNW76Qkh7HdxG7aYr+PAfMilPfweuOj0uom
	+cTmts6MkYv9/4cJegtkasPZuz7nSnb5XCYuW9L11rKYtLFHIqry+Wt+yegmQPZkXqcidESqkJ2
	Hi
X-Google-Smtp-Source: AGHT+IH6yG/YuCvIOBCxqVl+zkEoGEh5lVQi4A1hkpcjzwyoBm/xu52KU+29D/n5OkKNzCyeruYPKQ==
X-Received: by 2002:a05:600c:1d01:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-459f4f9bd34mr45225575e9.17.1754684600251;
        Fri, 08 Aug 2025 13:23:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 01/22] x86/msr: Rename MSR_INTERRUPT_SSP_TABLE to MSR_ISST
Date: Fri,  8 Aug 2025 21:22:53 +0100
Message-Id: <20250808202314.1045968-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The name AMD chose is rather more concise.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c            | 2 +-
 xen/arch/x86/include/asm/msr-index.h | 2 +-
 xen/arch/x86/msr.c                   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 97bdda1d4a25..f6ec5c9df522 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -933,7 +933,7 @@ void load_system_tables(void)
 			wrss(df_ssp,  _p(df_ssp));
 		}
 
-		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
+		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
 	}
 
 	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2e7e2aff9a33..428d993ee89b 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -157,7 +157,7 @@
 #define MSR_PL1_SSP                         0x000006a5
 #define MSR_PL2_SSP                         0x000006a6
 #define MSR_PL3_SSP                         0x000006a7
-#define MSR_INTERRUPT_SSP_TABLE             0x000006a8
+#define MSR_ISST                            0x000006a8
 
 #define MSR_PKRS                            0x000006e1
 
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 2cd46b6c8afa..1bf117cbd80f 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -138,7 +138,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
     case MSR_U_CET:
     case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
+    case MSR_PL0_SSP ... MSR_ISST:
     case MSR_AMD64_LWP_CFG:
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
@@ -442,7 +442,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
     case MSR_U_CET:
     case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
+    case MSR_PL0_SSP ... MSR_ISST:
     case MSR_AMD64_LWP_CFG:
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
-- 
2.39.5


