Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C6A7085B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926851.1329695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H6-0004JO-0w; Tue, 25 Mar 2025 17:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926851.1329695; Tue, 25 Mar 2025 17:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H5-0004Gn-Qn; Tue, 25 Mar 2025 17:41:15 +0000
Received: by outflank-mailman (input) for mailman id 926851;
 Tue, 25 Mar 2025 17:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx8H4-00045y-Aj
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:41:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ce70f9-09a0-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:41:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so62128485e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:41:13 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fdbd0a9sm158386185e9.38.2025.03.25.10.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:41:12 -0700 (PDT)
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
X-Inumbo-ID: 58ce70f9-09a0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742924473; x=1743529273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39zuQsNX+5s9i10elnMfxeTcLe1AG54UNFOTJvkzFeQ=;
        b=jDm1GHfuQGstW/K4HYt68g2TJFwvM4PWt7EMgzQWk5w/80EVKcmtrrmfVOoglq6AUe
         FG4TVGB5qifj8lEG5J+clTrTLEOvJ95VImjk6bYUtREkPL/wo/LZxtrkzagy6Qq3tGe3
         uR6f86GpmQbadcs1w3LAX1IiWkSfc/LCYE3g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924473; x=1743529273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39zuQsNX+5s9i10elnMfxeTcLe1AG54UNFOTJvkzFeQ=;
        b=i+GI/axR/i5EPIk55+Tn0FBkls4mpEp/8qOJijwBqRttLD5td0sFT0GTMEFDh9sdGC
         v8A9FmtcZyphEkmUBJsOCrO+OcQZy9x95BU9LpM+EbFrpK02wrun2jblPSIxp16WjUrT
         gO7pVDnjsUfM7osr7dE1Gt/zAIiBeZ5tfsLgS1aZSoXkkgkG8wr1vUH9/mJ5ivfeRvwr
         jt/NPFN5abdUJQnhZCzyOINMkLxZgYOsW7xcMm8u3BAEEs8e9viA2jfhLJZBy/yQ2pPO
         HF3Sqqck37/TgVSSymqTSIQfhY4X532xH8QJQ2AkaIyPChg9hrIK+Q1mmH21K4IoJnQW
         a9OA==
X-Gm-Message-State: AOJu0YwnLYiIE2/zJmu10D0d4ZFRqwXqxwWkHcS565+HkdvTetYiskGH
	MuUn/Z44oIdN9F9op4zGQmRCiDm5DwIIK+vQxb2uwkVPQigkxHFZHSrpeIAHD2FP/lzw4avHV89
	cQbQ=
X-Gm-Gg: ASbGnctnLGjn54pwjiEl876isY4szBFllePrhdjm1Tx3p7dQ96p7ROueGlW4mUKShPz
	6AUbcEIMf/c7D3viWaA6IHbIYTBmFpUgr1r9SGjdPZ1gDSiX2AOlSRHRJy80/siAfgC4rWp7w78
	//wLm/em8RFJVMlUxQ+nEI5EAM/QOwxURAkktJNmJ98QxKLvERhvXppZE82mJo1CfPPrtnP7PRH
	Aufan8ViTTUuPz1NTS+4gKHBf2xK+sAEAIqCGaOHbTPHHbkYfxg+jQei75xKPUiJmYmS9D036H1
	HKd/26DJNGnaMNFAeFuxN2seuOFvV5lVHA/vcuhJeZSpbXIjDVwu5s5Lyi4fn62kLsIz3cMcgs9
	I3ybRb38yjFOVw57RZw==
X-Google-Smtp-Source: AGHT+IEcr5Ypu2eA71qKcEz4MS9slSJvj8G8O1faoSHHalixmW5/AiBaSDWbwNspqBwt7JbzAdaqJw==
X-Received: by 2002:a05:600c:8488:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43d6dc2e933mr38171095e9.4.1742924473028;
        Tue, 25 Mar 2025 10:41:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Subject: [PATCH 1/2] x86/hvm: Rearrange the logic in hvmemul_{read,write}_cr()
Date: Tue, 25 Mar 2025 17:41:08 +0000
Message-Id: <20250325174109.267974-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325174109.267974-1-andrew.cooper3@citrix.com>
References: <20250325174109.267974-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In hvmemul_read_cr(), make the TRACE()/X86EMUL_OKAY path common in preparation
for adding a %cr8 case.  Use a local 'val' variable instead of always
operating on a deferenced pointer.

In both, calculate curr once.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Petr Beneš <w1benny@gmail.com>

v2:
 * New
---
 xen/arch/x86/hvm/emulate.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index dbf6b5543adf..172ed55bd5e7 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2273,23 +2273,30 @@ static int cf_check hvmemul_write_io(
 
 static int cf_check hvmemul_read_cr(
     unsigned int reg,
-    unsigned long *val,
+    unsigned long *_val,
     struct x86_emulate_ctxt *ctxt)
 {
+    struct vcpu *curr = current;
+    unsigned long val;
+
     switch ( reg )
     {
     case 0:
     case 2:
     case 3:
     case 4:
-        *val = current->arch.hvm.guest_cr[reg];
-        TRACE(TRC_HVM_CR_READ64, reg, *val, *val >> 32);
-        return X86EMUL_OKAY;
-    default:
+        val = curr->arch.hvm.guest_cr[reg];
         break;
+
+    default:
+        return X86EMUL_UNHANDLEABLE;
     }
 
-    return X86EMUL_UNHANDLEABLE;
+    TRACE(TRC_HVM_CR_READ64, reg, val, val >> 32);
+
+    *_val = val;
+
+    return X86EMUL_OKAY;
 }
 
 static int cf_check hvmemul_write_cr(
@@ -2297,6 +2304,7 @@ static int cf_check hvmemul_write_cr(
     unsigned long val,
     struct x86_emulate_ctxt *ctxt)
 {
+    struct vcpu *curr = current;
     int rc;
 
     TRACE(TRC_HVM_CR_WRITE64, reg, val, val >> 32);
@@ -2307,13 +2315,13 @@ static int cf_check hvmemul_write_cr(
         break;
 
     case 2:
-        current->arch.hvm.guest_cr[2] = val;
+        curr->arch.hvm.guest_cr[2] = val;
         rc = X86EMUL_OKAY;
         break;
 
     case 3:
     {
-        bool noflush = hvm_pcid_enabled(current) && (val & X86_CR3_NOFLUSH);
+        bool noflush = hvm_pcid_enabled(curr) && (val & X86_CR3_NOFLUSH);
 
         if ( noflush )
             val &= ~X86_CR3_NOFLUSH;
-- 
2.39.5


