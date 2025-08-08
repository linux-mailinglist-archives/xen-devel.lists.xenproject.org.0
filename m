Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB75B1EF6A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075020.1437480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcc-0006Rh-RQ; Fri, 08 Aug 2025 20:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075020.1437480; Fri, 08 Aug 2025 20:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcc-0006Nx-MD; Fri, 08 Aug 2025 20:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1075020;
 Fri, 08 Aug 2025 20:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTca-0005tJ-TQ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d7868a-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:22 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so1485084f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:22 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:21 -0700 (PDT)
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
X-Inumbo-ID: 87d7868a-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684602; x=1755289402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcfZyu/epGsYTIYAnbjH73oe/DBgcrJShKfH8bNACvc=;
        b=erMwqvgwleJE/KA79ONKK54Wx1n5jSIDDs3+Yg2Azt89wEHy2aW3j6lhZrdmpGoIX7
         9htf5141quVFZkothIeOUeAjjvGxSt8+2fY03zOXSzAx1qj7DrF7mHRLd6hkWIwliWcD
         HKGHOIDbvgRisG8H0oKI49d7vdxYX4s8JSKQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684602; x=1755289402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcfZyu/epGsYTIYAnbjH73oe/DBgcrJShKfH8bNACvc=;
        b=H4kdYm46h44Kn9+HY65djuLsVhTF+/XCMZhnbgbpepESGGBf8Z5vBBNrfN5JxgH/ft
         C5QNls8GaNBySfwouarDmsMt3xqedjIJLMUV7v8aEvHPoVsWQ5G40wJI1a4ekIrKCrdi
         ZBx2ATS+RMeHD8jdGDdg2zBCX9+54VsMg1KjRIAVvP1V+yiQBiIfHl5v/11pOQ7N3c+d
         NDbKy7EGv7FdoxOhQUC9pPLuQ3ljIVCQKTRzBV7YK+dle0ruG+eMS7WS9HubLT7JE3SR
         86yRw/20mVZa42xjbPrMdkZ6Bkmbjq4Y63prKwG6JnpdhODsavE/m/rYlN2dflaI+XS7
         x0Xw==
X-Gm-Message-State: AOJu0Yw+dWpf3Pl9ddobv/Sek52G6CY6iDJtf4WzyGyP5TpLPV5i6e9X
	y2WKBKFMmZkaSaB5vNB6hk2FjxnPmMs2sRqF3OAY4PHUMn1TbkO9OXHpVEIqhUOcMhxUxYw33Kx
	/xWeUdsE=
X-Gm-Gg: ASbGnctg8bh8E9tOmhiGWp/57o4PF7o0WYCj6ewJqcYWGhQjFRbujeytYPwyUX6c5Jh
	Xhhf8t9xJOA9627z4EJbJquPfz/HOSdLRWEQaE5CsgPPtTCAnSReTGLMdd+UQpPxu+l8NEwC4eK
	S0qDvMkxgbTcvEVaL0HLMEww6FmlBZ3Y6c2L8sycs8i+lAyLS9GtuR9PfcjDxIEPy/V4KBIb/Ym
	XGT44/Iiyx+/umTmsG+Y31EH3FHGe7OY6XYum/2FT5N9YWOMhKCxY0RA7lzGH5A51KeGauIqRA6
	9bppLacotEwSWBc5l3JAL5cTqNK/U/UWy2RsHzsnm5XPzRBz4eIQc0RZ0NctLgX5xcbI4l/3NUS
	vnZDQ30YAHisrjeCoqtxd0FbsMIoMkqsDIKqmrf5X7wBdFYmGdsXZrpV7FuWXDh1XS3sg1Nf5Y+
	Q6
X-Google-Smtp-Source: AGHT+IGV4Rh+tboonqUGllTTt1cR6ll0dm4fTrORfg6GmZFbQ/bDDdOWU0N8EyrhS+VU3dkuxbGbYQ==
X-Received: by 2002:a05:6000:18a9:b0:3b8:4da3:cace with SMTP id ffacd0b85a97d-3b900b5027amr3277977f8f.29.1754684601767;
        Fri, 08 Aug 2025 13:23:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/22] x86/traps: Drop incorrect BUILD_BUG_ON() and comment in load_system_tables()
Date: Fri,  8 Aug 2025 21:22:55 +0100
Message-Id: <20250808202314.1045968-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was added erroneously by me.

Hardware task switching does demand a TSS of at least 0x67 bytes, but that's
not relevant in 64bit, and not relevant for Xen since commit
5d1181a5ea5e ("xen: Remove x86_32 build target.") in 2012.

We already load a 0-length TSS in early_traps_init() demonstrating that it's
possible.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index f6ec5c9df522..cdc41248d4e9 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -936,8 +936,6 @@ void load_system_tables(void)
 		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
 	}
 
-	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
-
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
 			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
 	if ( IS_ENABLED(CONFIG_PV32) )
-- 
2.39.5


