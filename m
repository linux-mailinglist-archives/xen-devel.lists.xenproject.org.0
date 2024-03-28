Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E224188FFE0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 14:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698926.1091179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rppaH-0008BG-PI; Thu, 28 Mar 2024 13:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698926.1091179; Thu, 28 Mar 2024 13:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rppaH-000894-MT; Thu, 28 Mar 2024 13:14:21 +0000
Received: by outflank-mailman (input) for mailman id 698926;
 Thu, 28 Mar 2024 13:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Cl4=LC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rppaF-00088w-NM
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 13:14:19 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1574b679-ed05-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 14:14:18 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so128689766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 06:14:18 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b00a46647b6496sm737996ejb.155.2024.03.28.06.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 06:14:16 -0700 (PDT)
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
X-Inumbo-ID: 1574b679-ed05-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711631657; x=1712236457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMGPBplkiRRXX5wdqwy6Zf3RtmWugqW2pBxFxW/uVRM=;
        b=QyK0G9C1NlD4HGhuBHbLcua5NzUMvkqK0f4jdsKcYvvGY6gM8jf362nq73pIdPcepe
         C/WuEwQLEu5O3wVB9gpbhG4saKiGUefHmUBXBH/xRMRCjaCIQZs5SjTOuq8D7qr9eb2+
         GTLTPPxMzlnG6NHKlsdHYfRohB4MfhX1js7kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711631657; x=1712236457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMGPBplkiRRXX5wdqwy6Zf3RtmWugqW2pBxFxW/uVRM=;
        b=pLPC2QdgNrKZFOUuZ1yEGCwUTCSDiyy71YgaRXKcBm6Z/NtNpEF0ge4f3uZlS/ndi3
         Hu9+YNj83JT8Z2MqxaU2MPu4KpOwTQP+ZTlETLis7ygw+7o6krwi1CwdfKUuK++NUMlY
         V/ULqBcKl0vJZQdrVjAFJOFowdNxWcYof31dNdU9ZMylgceld48UpKuJW8Lili2orEKa
         2i96f48OahfAFHcQel25R62pPe9+bwm/SwXwCUlurqyAya1A0icpWfAt/KfhznoVPeUV
         q9xJHl1t6ADIfvAn8WMMhoGZYzzDl8aqhsn+kPMgcAKU7QLdZszTa2rQd0zNmyu0MC3O
         fEPA==
X-Gm-Message-State: AOJu0YxV/oT0k17SUXhbF5ri+3M8Co6bLRqEZYBEsgUzbH4Ci7W++dtI
	u3FxOs0AkwHlRRCETt+RZWJ/6htmCUNakzyUEpCuQWZjABRH04li0Ya3LFE8CHpt0kZfTK0+Vth
	9iYI=
X-Google-Smtp-Source: AGHT+IHey4juqVYw6x5bk9kv+U7qVNzw/VocNImchBSzp2EIByOqn3RvZMKO2fqSsmlIYe9G0qt7kg==
X-Received: by 2002:a17:906:da02:b0:a47:4c82:edb2 with SMTP id fi2-20020a170906da0200b00a474c82edb2mr1620090ejb.5.1711631657549;
        Thu, 28 Mar 2024 06:14:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/spec-ctrl: Move __read_mostly data into __ro_after_init
Date: Thu, 28 Mar 2024 13:14:15 +0000
Message-Id: <20240328131415.1734382-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These variables predate the introduction of __ro_after_init, but all qualify.
Update them to be consistent with the rest of the file.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/spec_ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0b670c3ca753..6a889db70c52 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -49,18 +49,18 @@ bool __ro_after_init opt_ssbd;
 static int8_t __initdata opt_psfd = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
-int8_t __read_mostly opt_eager_fpu = -1;
-int8_t __read_mostly opt_l1d_flush = -1;
+int8_t __ro_after_init opt_eager_fpu = -1;
+int8_t __ro_after_init opt_l1d_flush = -1;
 static bool __initdata opt_branch_harden =
     IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
 static bool __initdata opt_lock_harden;
 
 bool __initdata bsp_delay_spec_ctrl;
-uint8_t __read_mostly default_xen_spec_ctrl;
-uint8_t __read_mostly default_spec_ctrl_flags;
+uint8_t __ro_after_init default_xen_spec_ctrl;
+uint8_t __ro_after_init default_spec_ctrl_flags;
 
-paddr_t __read_mostly l1tf_addr_mask, __read_mostly l1tf_safe_maddr;
-bool __read_mostly cpu_has_bug_l1tf;
+paddr_t __ro_after_init l1tf_addr_mask, __ro_after_init l1tf_safe_maddr;
+bool __ro_after_init cpu_has_bug_l1tf;
 static unsigned int __initdata l1d_maxphysaddr;
 
 static bool __initdata cpu_has_bug_msbds_only; /* => minimal HT impact. */
@@ -316,8 +316,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
 }
 custom_param("spec-ctrl", parse_spec_ctrl);
 
-int8_t __read_mostly opt_xpti_hwdom = -1;
-int8_t __read_mostly opt_xpti_domu = -1;
+int8_t __ro_after_init opt_xpti_hwdom = -1;
+int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
@@ -381,8 +381,8 @@ static int __init cf_check parse_xpti(const char *s)
 }
 custom_param("xpti", parse_xpti);
 
-int8_t __read_mostly opt_pv_l1tf_hwdom = -1;
-int8_t __read_mostly opt_pv_l1tf_domu = -1;
+int8_t __ro_after_init opt_pv_l1tf_hwdom = -1;
+int8_t __ro_after_init opt_pv_l1tf_domu = -1;
 
 static int __init cf_check parse_pv_l1tf(const char *s)
 {

base-commit: 3c9e76cd875e12c88cfc8f0b2770c525da8d6894
-- 
2.30.2


