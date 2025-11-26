Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30418C89FD8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172613.1497727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTc-0006FR-1Y; Wed, 26 Nov 2025 13:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172613.1497727; Wed, 26 Nov 2025 13:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTb-0006DT-VE; Wed, 26 Nov 2025 13:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1172613;
 Wed, 26 Nov 2025 13:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOFTa-0005zB-Ln
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:22:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40835eb-caca-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:22:27 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so40073905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:22:27 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052b3f5fsm42042275e9.4.2025.11.26.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:26 -0800 (PST)
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
X-Inumbo-ID: f40835eb-caca-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764163347; x=1764768147; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHNzrMLtWiPI7NZUI+e8M2VwxxtJXgHm6FrkJxV/SxI=;
        b=KPOg8gtw5mADdEdsZD7yldZspRraetOV1tV4n8By9lFoJ1iQj8EQfjullrtUTnKq18
         MdDRP17YUGKNLI+R23KNt14G4/Z5L6DyJMRP8/t0e/ovJOYEPgQ7Pb4nolH8Dk7vsb4U
         M/zvJc6Xpkiwrzu4+MWeqxtjqwsYNBNA65hU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163347; x=1764768147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHNzrMLtWiPI7NZUI+e8M2VwxxtJXgHm6FrkJxV/SxI=;
        b=Ar5XggeHWN32BvdBSw8rStTqsA+p5pGU7p0q/4OiNKVFpzU4Xpks8OE/LlaP2MktkB
         Zm9DI9nejBapYLIWYQS6Apl4M6wDPa0iO9GMu+cYzapGn6knANuh6OtbAUht59y0wHXT
         uRDptwo2qWXFOxiaMBBhfjvaWmoCEclhSrqJk4gem3ycuqqFakvFfaeEb9Oc0UbSpQJt
         aGBSearFinymS00w8b2Rbfy2grJJvLsgfFurTtjaPd9rjVCE/yB7HFmW0PZFExTdKFA9
         mkbck0Sen4Al0B9XYjqlHnAQeo/LTCO2MbSvnoJAMDKeODtPTmeCVHOn5Bdbxzwnb1yZ
         yHhA==
X-Gm-Message-State: AOJu0Yw8ZBcs8JbXFIPk3DiHL48fgggQdfAUiGRl1ZZ2uPV6k840cdMD
	NgGfpWLTfzXhuzEXtQMK81xNCXPF00wRiiSx4RyJqQHId3mng4CIVMDId0zRk8YemQNdE50JzSB
	OuwBD
X-Gm-Gg: ASbGncvBnv4b3iH+mRJez9rmivXFIdxxITG4q6e10ERmm7Tl3GHn1sof7uVAHLfLpyr
	83huxoHs7a9t9r45SrREKYtvRLr6LVA/ZSUbpXYQ31PQSJ/ZrsBesH+cDA//cmLQc3XwnBsQXJy
	lx28PZ+wtKopJRY0cAkbVHtMdrOKsngROdMc+8R8oN8WBqmIXXu5TR3084sZnDZKHjSIAOjxykl
	8Rm4ZrGnvKZLcmG5DIbLsCBpt349qs+aXRKBvhBZefNd03d89s77NVbAWxqWOt8zjh9D+x8zkrw
	XwghkffCPfAaeTO/WTUDzRHz1feZgfVSiRQvGUJzUsJea4Gb3FhoQ3pUyl/q0XfWo3J5KjCQbkb
	9Z90mDzMbGaIBTnX/VtsqIm/CgQGHgHnMMEXrdK/iutQ7jnwfqZwWO4uVM9REN7836P87nYRQP0
	36rfyK8yjH6Z2T2/CsiakO//1aHkq5Yo8a7Y9MIIDCBewhAYjmCRU/7vi5T4R2jA==
X-Google-Smtp-Source: AGHT+IFf1ACZv/czxzG6Om45+F+INuHE9HD1BnwebEHtMg49eN1f8LlP0axHxtvrXi04WG6wdJMkPw==
X-Received: by 2002:a05:600c:4583:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47904b2bcd7mr70595215e9.34.1764163346841;
        Wed, 26 Nov 2025 05:22:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
Date: Wed, 26 Nov 2025 13:22:18 +0000
Message-Id: <20251126132220.881028-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126132220.881028-1-andrew.cooper3@citrix.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When re-scanning features, forced caps are taken into account but unforced
such as this are not.  This causes BTC_NO to go missing, and for the system to
appear to have lost features.

The practical consequence of this observation is that all after-the-fact
adjustments to CPUID must be forced.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 9b02e1ba675c..8f468aaf0921 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1225,8 +1225,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		 * Branch Type Confusion, but predate the allocation of the
 		 * BTC_NO bit.  Fill it back in if we're not virtualised.
 		 */
-		if (!cpu_has_hypervisor && !cpu_has(c, X86_FEATURE_BTC_NO))
-			__set_bit(X86_FEATURE_BTC_NO, c->x86_capability);
+		if (c == &boot_cpu_data && !cpu_has_hypervisor &&
+		    !cpu_has(c, X86_FEATURE_BTC_NO))
+			setup_force_cpu_cap(X86_FEATURE_BTC_NO);
 		break;
 	}
 
-- 
2.39.5


