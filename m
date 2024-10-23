Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416139ACA08
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 14:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824591.1238743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aTD-0008Nu-Jj; Wed, 23 Oct 2024 12:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824591.1238743; Wed, 23 Oct 2024 12:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3aTD-0008Kk-G0; Wed, 23 Oct 2024 12:28:11 +0000
Received: by outflank-mailman (input) for mailman id 824591;
 Wed, 23 Oct 2024 12:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3aTB-0008KR-NI
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 12:28:09 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42c09a9b-913a-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 14:28:08 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so3183739e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 05:28:08 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91572475sm470923866b.154.2024.10.23.05.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 05:28:06 -0700 (PDT)
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
X-Inumbo-ID: 42c09a9b-913a-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729686487; x=1730291287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enwoEkHrB4PVkQyUNobQYIVu5lajkhVSiVikEltYAlI=;
        b=n5gAfo0peHssfhOOhPnV81mg6sxjCcP2yVacFIOZenyRInRXFatIYdWAjl0j4sFbkQ
         o3Eqo6bVdpX0BGVrOBvpQilie+mkgJHK13rKsx/VM9iRrJQES2yoyKNejRLifhwfDKav
         vy84Sd9Keuso3vx/Ux0ScFdkFjlPUzf3PIeeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686487; x=1730291287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enwoEkHrB4PVkQyUNobQYIVu5lajkhVSiVikEltYAlI=;
        b=FQkjNFwirpX/zLpNI9uDMvQYJNpLFEwbta6iF6MX5MgCHiVaS79BGq1AxG5AiDrP0k
         4XyUuYlB8FWNC8J3kqXpfqdrsICs8wO05hTIFfymujRu5Ctg+/gL81EP5oLQF5oCR8wp
         8bUctSM5CCDv57So8RMsI9VGu9tESlmZ64BdQGH1hia+8KulqUThEEpeEVb06FbhoNoj
         rVftwh/GJrCRrXexxc5VtWD7Is3CuuGoFuGOHBIWmG5OoXwMm020D3DZbr+TcFPfk6Ui
         lT5JnIiGuSTz+bm8FjynyNOWkNrjfXjFKhJBpH4AMfjb27kr8QuvM1lpzHeSclNejyY1
         cCQQ==
X-Gm-Message-State: AOJu0YzwUQ0eAhPmFTAgJLCmjl2L5s7CbbB3S+OaCvv20UbjANg+t2P1
	9dPziKDsJK21JukD/n91WPpF1RteSX3MTy8AthBq8xrqr1hAVKxrhpqNLh/HkW/mn0kISc59eTF
	l
X-Google-Smtp-Source: AGHT+IH6VStbYMME9i+lTuj6kH2ADIr0Y1tOOU6dod5lSJYRODU8UOipoqRRed20R2DSAoumAMOWgw==
X-Received: by 2002:a05:6512:23aa:b0:539:8cd1:848 with SMTP id 2adb3069b0e04-53b1a3bae89mr1802699e87.61.1729686487518;
        Wed, 23 Oct 2024 05:28:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Explain what microcode_set_module() does
Date: Wed, 23 Oct 2024 13:28:03 +0100
Message-Id: <20241023122803.670943-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I found this hiding in other microcode changes, and decided it was high time
it got included.
---
 xen/arch/x86/cpu/microcode/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8564e4d2c94c..dc2c064cf176 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -108,6 +108,10 @@ static bool ucode_in_nmi = true;
 /* Protected by microcode_mutex */
 static const struct microcode_patch *microcode_cache;
 
+/*
+ * Used by the EFI path only, when xen.cfg identifies an explicit microcode
+ * file.  Overrides ucode=<int>|scan on the regular command line.
+ */
 void __init microcode_set_module(unsigned int idx)
 {
     ucode_mod_idx = idx;

base-commit: be84e7fe58b51f6b6dd907a038f0ef998a1e281e
prerequisite-patch-id: ef20898eb25a7ca1ea2d7b1d676f00b91b46d5f6
prerequisite-patch-id: e0d0c0acbe4864a00451187ef7232dcaf10b2477
prerequisite-patch-id: f6010b4a6e0b43ac837aea470b3b5e5f390ee3b2
-- 
2.39.5


