Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCCACEE60
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006654.1385889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aY-00029A-Gd; Thu, 05 Jun 2025 11:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006654.1385889; Thu, 05 Jun 2025 11:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aY-00027W-Cv; Thu, 05 Jun 2025 11:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1006654;
 Thu, 05 Jun 2025 11:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uN8aW-0001od-UT
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:16:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 904183ee-41fe-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 13:16:44 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso613747f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:16:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526f4c808sm2043887f8f.28.2025.06.05.04.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 04:16:43 -0700 (PDT)
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
X-Inumbo-ID: 904183ee-41fe-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749122204; x=1749727004; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um/nkv4z1T0RX+MCLdrgS/PNaKhUEklnqmf1PU4WKtE=;
        b=Bdumjplz8pwYL8jhZNoztKAqyYB5f1NNP+g4QfB1uhf0jXjCoblXOUGlq7ruVAzFrX
         wFsFYbVauzBBGhLRPPlFprob2FMvDP6VQAuXkvopZeDAsBLnxfDyM21PVjFz4iGInBnP
         5fXpubdlmSwM/0YUWiIWI6AzlMwS1JlN9MVUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122204; x=1749727004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um/nkv4z1T0RX+MCLdrgS/PNaKhUEklnqmf1PU4WKtE=;
        b=JP1Pq6977CGNNukhdTQYFUaDnV/v7znayybVT+DkauvRBtTg3z3beybHl5kjoz4/X9
         LXY4E+drxClbjRkYWUTt+WKawF5mlaO7LA5wFfWVt7xTdBxZaSiKaxFu2Ah8nlYNcM0u
         GguICxTA9lUsa07vD9eu9swPNLnSWFSDcqNfMi1A3A/naXKA1RAVeTyEhN1e7qk7S6oI
         28wfO84X4W4DCpqfrmXDsjcx80B322msB+btaH2ERrjyj2RmBSuMEp0vyWa/xHZLHJED
         1C+J4e5gsw7jwX0gSQcknY3grBE+BsQUpo4619mdYAdJcTZBrF2IcruB2/cdHKQ+P9Tg
         Kl5g==
X-Gm-Message-State: AOJu0YzLgkSytrVTnHP3XZPwiNHBHQbVrl8U+3D4jUwJoLWlHZrYkMrc
	FW1HvI1VneP3yPaGK8ugttqOefW5nAHgb1iGMWo6YusPSR2RY4c5agBcJe0faT5pKFuDuf4HX67
	+mRQ8
X-Gm-Gg: ASbGncvtwu2ezyXPW1dgbQ+QBWh1dsnfh9qpdFBEjjV/GIs10LNnrR08fonVUe5Z3gn
	Yhqj9DLgcXHSbmZli2gC8/HH1ja9t+oa9tfCwX11y9ejKwN6fSActALk3rpOUVX5HJL15T6izkR
	0V2sCdMOxP/y3AwwzhGmyQ2N3EAHv9ur6DhH04oZlDusKji/LT5vryFVIlSJP7Fg6cNKZ+ZG3YJ
	IL55BQktxe5YUWMf9TK7UkahDlxfbf2UffuGjqi9f/S8pOVoyvHEGU5tTdhgTBIzKQmqyZwuuE1
	A2MTrg4dA/dFwplRcD1Z0TiRax9DgSbqrKwsaptyxr4VAljjxDC6dAPvf/2SBWLMLHI2sXxEBlS
	sBXRKdmcaDPxgGtPWH6q6RPI3yB5ZNc2J5Vc=
X-Google-Smtp-Source: AGHT+IHXbx1ROPnuIC7JMFjjz7VrKMTObMdKBp/S6c+zhNrVde8FiJm0pu5OtqfXMn/ts1xC8RB3lA==
X-Received: by 2002:a05:6000:2384:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3a51d958744mr4428248f8f.35.1749122203934;
        Thu, 05 Jun 2025 04:16:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 3/3] xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h
Date: Thu,  5 Jun 2025 12:16:38 +0100
Message-Id: <20250605111638.2869914-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's already C outside of the ifdefary, proving that it's not included in
any assembly files.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/efi.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 160804e29444..623ed2ccdf31 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -1,9 +1,7 @@
 #ifndef __XEN_EFI_H__
 #define __XEN_EFI_H__
 
-#ifndef __ASSEMBLY__
 #include <xen/types.h>
-#endif
 
 #define EFI_INVALID_TABLE_ADDR (~0UL)
 
@@ -23,8 +21,6 @@ struct efi {
 
 extern struct efi efi;
 
-#ifndef __ASSEMBLY__
-
 union xenpf_efi_info;
 union compat_pf_efi_info;
 
@@ -53,6 +49,4 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op);
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *info);
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op);
 
-#endif /* !__ASSEMBLY__ */
-
 #endif /* __XEN_EFI_H__ */
-- 
2.39.5


