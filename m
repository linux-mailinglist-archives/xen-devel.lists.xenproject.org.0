Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2BA8226C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943829.1342453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SpQ-0002Kw-0l; Wed, 09 Apr 2025 10:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943829.1342453; Wed, 09 Apr 2025 10:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SpP-0002JM-UB; Wed, 09 Apr 2025 10:38:43 +0000
Received: by outflank-mailman (input) for mailman id 943829;
 Wed, 09 Apr 2025 10:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2SpN-0002JG-SO
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:38:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccbe57d3-152e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:38:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so69526965e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 03:38:39 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d6ebsm12405395e9.2.2025.04.09.03.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 03:38:38 -0700 (PDT)
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
X-Inumbo-ID: ccbe57d3-152e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744195119; x=1744799919; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv7B46KHAHGQKYCZQlRPVkHO2PIMzgx//aDiYZqKz08=;
        b=cKSwwO1AbHzay+w3UBT+gtnCyeMoSCBdivpnziMPE2wKAH9FGMhr1LAorb6xbBAG5h
         CvPYl9+s8ETxRh4QCZ+MV3yVDGcUg4iI3AqQocXaNOJkiSbU/Oany/zxBgfQIhf1PkvF
         S7X2CJxg78LPzN7TUT/jLPOP/wof0ZljLyx9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195119; x=1744799919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yv7B46KHAHGQKYCZQlRPVkHO2PIMzgx//aDiYZqKz08=;
        b=KU2rF/s7k81mppVKWMH54bW0ySuq/5dDMo0jpdBpfAGLubfFJfDKd7hBWOp57rG/4x
         5W6647FEOuBOMJjIb2LiPP9Zy+02bSn7AQjvXk4xcGRz65qP6yrL45d4Dk4/j35ZX1SU
         ufRiYyMJ97nMeApTFt6sCiRacz/bXpY4YRDT+3GeoT/pv1mU6Og5wT/uvbDoM6ZSZyLo
         cqSzfssXSLIBHWAL57Yj4bwEP62u4t5xJkdw2rgDI3nq/ZS5ykoyH7Jk9uWAifuUGu+3
         F0MA9jvBKvnwGTXDnebzZT7BgfGt6pWa0eLoqmyD0+WCxH+XomD0SngPJ9/qNZkZQD+i
         TsSA==
X-Gm-Message-State: AOJu0YzAXGrcLBasEjufxqTdVJaxDHt8My56dZaAdkSwa3aiZ4BigfzK
	uIfyhxok6MHxG5yW4Mfrw33/8KFzA2dLkHuQ9ekYCu4SCn1Y2T7UjG4UaCbTn6Go9r7nXpaTFQf
	Ve8s=
X-Gm-Gg: ASbGnctdyOw/MXHO48/LNX2m2GXRJHZjUPmXAExQntpfQfPDcc1c2jCaocphhexbW+m
	BrWOH+e+K3DULNPmenP6txmSj10CMLX8u7S8sXHkgNBnZ5s4xc9FvUsrNdTW+CbOSSLuC+wso++
	03cj9numObSbuEdBDyFsqWGy2iM1MO0Sjx5bC9MVxvSs1IKQI5OyJUl2LIq2rQwaxID9egmmZ8f
	jHndN5sEcugLiTQ2TNTIlQ4OB024aAuc3qmniWq4h8pvi1C3w7dJS3dsd4BF/Mp8XE4I+OlTICr
	ukZpXt4lbd3Gw8iBBqaDtPeigVW1yemOH46qmRFX+jdI/sGpQtOqWP5VdHSMmjq4qW5/xbsp6P9
	TDTWEo0K9AkRDNnvi/ElQ4nsH
X-Google-Smtp-Source: AGHT+IHSkiG5svw36Qbzz8fyTBqeoyQymCGd3ztCABLUrcBtkgl2MXJOxo0RZOILxAQ3ChjN5XdxZg==
X-Received: by 2002:a05:600c:5704:b0:43d:fa59:bced with SMTP id 5b1f17b1804b1-43f1fdc21bcmr12883405e9.32.1744195118885;
        Wed, 09 Apr 2025 03:38:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Extend warning about disabling digest check too
Date: Wed,  9 Apr 2025 11:38:36 +0100
Message-Id: <20250409103836.1986139-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was missed by accident.

Fixes: b63951467e96 ("x86/ucode: Extend AMD digest checks to cover Zen5 CPUs")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4bc490dedca7..ebd9ecbeef0f 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -516,8 +516,7 @@ static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
 {
-    if ( !opt_digest_check &&
-         boot_cpu_data.x86 >= 0x17 && boot_cpu_data.x86 <= 0x19 )
+    if ( !opt_digest_check && boot_cpu_data.x86 >= 0x17 )
     {
         printk(XENLOG_WARNING
                "Microcode patch additional digest checks disabled");

base-commit: b63951467e964bcc927f823fc943e40069fac0c9
prerequisite-patch-id: b61e58b40ec8f03baec78dd76ed47debdc4f6734
prerequisite-patch-id: 54ea7968a08b4f4d59642083357ce31215f89355
prerequisite-patch-id: 14fc34d8e2613f9c122a7b08b32698d7c55f2760
prerequisite-patch-id: 8afac5fd1570ffad810f4721007063037910724b
prerequisite-patch-id: e024feb79e9db58aa401d423bd7a4e08da155387
prerequisite-patch-id: 9ddae7943cd741f385ec443280b669e32fed4402
-- 
2.39.5


