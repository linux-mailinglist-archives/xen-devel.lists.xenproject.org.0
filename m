Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A848A5D1B2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909357.1316357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts75v-0007rk-0n; Tue, 11 Mar 2025 21:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909357.1316357; Tue, 11 Mar 2025 21:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts75u-0007pF-UT; Tue, 11 Mar 2025 21:24:58 +0000
Received: by outflank-mailman (input) for mailman id 909357;
 Tue, 11 Mar 2025 21:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts75t-0007nP-2G
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:24:57 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44339e8e-febf-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:24:51 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so1967364f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:24:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfbab43sm19535870f8f.15.2025.03.11.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:24:49 -0700 (PDT)
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
X-Inumbo-ID: 44339e8e-febf-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741728290; x=1742333090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIHmErc3c4KBAtf3kltB/P0RGxmjlu5jaxrqf95hKCA=;
        b=LZfTeRPIey7FBpwWymb3hcwdyGdAi5udk+nweQu5165or7bd4kQygj0k1qgcR/LgLh
         r0DlTCkRdlwnQ9Gi0W9T0Zdewrt2kdnhYfRmBxVWG1HRJTCGXeU5UVCgF3uDxucqeGel
         KuXMtIyc924EGW/0g8VN8Lk/8QVBZbVyb4zmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741728290; x=1742333090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIHmErc3c4KBAtf3kltB/P0RGxmjlu5jaxrqf95hKCA=;
        b=CPkyi3w/eyuLtJwOJc0fwIXVWLsme2QvGeoeFEkt9SovXVJGPIHBFyp9vVByYSHYTF
         Z802IUueqk/RP5MVbgT+tNCtm5dK0ZTpQYlW3fJTU30WglOk1M8M5WgreUBEI7bPFln/
         P+2fiWuvEcuZYLY3cQ93pPeKyVEtr4JtD8swLZBVGj1Z2wG3hMXJ42V76ZZVaenzaFpD
         zSkwW4/gdjRw0GmGrSj5rl7JRVc2bKdcutCOydwHiTHu8HZv7tpV89CqhRubhQlGAbaI
         wnokGZuknySF/v/S9fTT1XySi4wszTCvddT3ODCsVF9X7cma/4JR03Q8JNRj2162Jz6C
         QKNg==
X-Gm-Message-State: AOJu0Yy6IJdZzATuCQkCEZdRloLIRURifwm0UMEatQQ8ri3n2mJN15Q+
	5ggStyLEzPFEk9CRCZQNho4khAoP1e2jlvldkjhX3pemQZ8lko6hlQ0BPpiZvlCKAd2rN5x26Uu
	L
X-Gm-Gg: ASbGncv9m3C9Ujgq6WaGiLJlm8flbKaPOtj7Cg4qsQTl3BZpBxfJnKP9x4frMn7+15B
	rFAJE931+OKWt5WsUkN8qAtYxZTINTkWni4et3pPrBhfZobTYLcfXhL4yXXiJJu+KMYeK14hOuk
	3VIyRBdYiDCZPKsZhrib7VM1xdQ36fcFdFnOYUT0ISAmQ20JdyVj5523ZuOjWhKBgl3WMxEyQbo
	sOHjdRj9GNU6zVXV3mY+JQN6G9ThZSdhQ/g8ReMyTP1ScZ7SLHrZ3suQDd4XgRgKDupbxhyYRe2
	MnCBO+VTIIErTsBIuzQbuglBWLdV0HLwpySVC5INbo1hX+aOr2AhTnUq64z6rr1xKoJnuAiMgWg
	lwn4iE5VCtKLEKgItUJtOca15
X-Google-Smtp-Source: AGHT+IFKi3WBOzgKMUqZcX6VWWplSfCssaTjv2oJAjhkUWwhFOTAUFOfx8tNUL4tftcL7/da2CWOuw==
X-Received: by 2002:a05:6000:1a87:b0:391:2391:2f79 with SMTP id ffacd0b85a97d-39132d98a8emr17431181f8f.43.1741728290101;
        Tue, 11 Mar 2025 14:24:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
Date: Tue, 11 Mar 2025 21:22:48 +0000
Message-Id: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When PV is enabled, entry_int80 needs to be DPL3, not DPL0.

This causes the XSA-259 PoC to fail with:

  --- Xen Test Framework ---
  Environment: PV 64bit (Long mode 4 levels)
  XSA-259 PoC
  Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
  Test result: ERROR

(Clearly I have a bug in XTF's rendering of the error code too.)

Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/x86/include/asm/gen-idt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/gen-idt.h b/xen/arch/x86/include/asm/gen-idt.h
index 9c8810edf9d7..d1da73248c1c 100644
--- a/xen/arch/x86/include/asm/gen-idt.h
+++ b/xen/arch/x86/include/asm/gen-idt.h
@@ -77,7 +77,7 @@ GEN16(6);
 GEN16(7);
 
 #ifdef CONFIG_PV
-GEN(0x80, entry_int80,      DPL0, manual);
+GEN(0x80, entry_int80,      DPL3, manual);
 #else
 GEN(0x80, entry_0x80,       DPL0, autogen);
 #endif
-- 
2.39.5


