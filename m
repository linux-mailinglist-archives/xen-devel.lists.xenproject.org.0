Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF5B52B8E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119698.1464986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbj-0007k9-47; Thu, 11 Sep 2025 08:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119698.1464986; Thu, 11 Sep 2025 08:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbj-0007gj-0O; Thu, 11 Sep 2025 08:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1119698;
 Thu, 11 Sep 2025 08:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUFa=3W=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uwcbh-0007Fi-MO
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:24:41 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c299c8a4-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:24:39 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b047f28a83dso83142766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:24:39 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33b4d63sm699314a12.23.2025.09.11.01.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 01:24:38 -0700 (PDT)
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
X-Inumbo-ID: c299c8a4-8ee8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757579079; x=1758183879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB+WsDeqv2sCpekU87otjg/rOz733WUlwzupkyN3uYo=;
        b=GxyytkzAZYLHgOU/J0QrE4MKIoX9Y/4nZzIB3/AJt3dDwHcg2s0mabWL2LGwA7Ze3l
         /lsbVkDxBBXMrZUAtXtZOgBtdfuU6ILzdXNWwGpbiEe/Ctp6Wz/gpshkwowGJaZs9fiX
         V1aop4FXklFtqkqhlZgl7qmyFQ+jXfMxsOmjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579079; x=1758183879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB+WsDeqv2sCpekU87otjg/rOz733WUlwzupkyN3uYo=;
        b=qZxEBn2GdZFu5SUJ3iF6XuFbNec3nCagqhFzmI/SkvHG6ZmwDTw02niT3ywGyQmAZM
         kv9OsBj9p+LfWmzw3aTPLGiCbuRCXMBBacEC6nb9cZey0E0VO9sXu/hBpPAwk5PDP2Wk
         JKsMOEvCEFrx5ME2eLXC3C48d33UB+EQqCrYqrqFb6TxDlM3owPkJwwyqDdM764swE3C
         lQZlEv8IWOJ+gZMd8G9jQ19LtokC5ymUCKWEr5i7ppDNZg1BFCtXTdvFiS7hcuIkOti7
         DHmrbwvVZumB/8Vqk/2t9aClATLZEXH0jraqodNlFMDUQJI6KgbhZvn2scPh4JCwPOMR
         224A==
X-Gm-Message-State: AOJu0YxNRZoe0q5KMi6acqaGxbVCr5Z5BKVhh9IPe4q7On1guGjLM0uk
	c42C8xvZVN/rNhraRTDkjWNCENmGUSnD8AEZoGtMeuY0bycAvCFS15SFI6qHVlDDBMD6QgAPcq/
	MQeQ1
X-Gm-Gg: ASbGncusW6NutUwDg9n0YqIj8mJ+Q/ugG4SHpyk3n4nW7TTGLL4yYPjnPSIZaG+O7hv
	c7R+Ce7ZjnBjUXn+uvjjoL9jTs2VgT/DhB02efkcwCSCzez9EJCVI194hWklgO/97aTuOwNyRYE
	0ps/fWFND2vUxCWGxao16tHysrncvgJlxOTw+Kyvg/nZrcwaPEGKRKlKyRNOkC73SiZDsswmtAt
	G4mjqBs5q7QC9AffmDZeY/Y0JnZIQqQuBc/esbL+oCEQ5hnUR1jce0otDg5X13By00zSd2Yn660
	n8xcFbGCXexDFjUgr1mGr0g7ICiK2GY/RLkhf575f6/2xgh3KIzPDPpzrHeiEAF8oO8bg8UCKNY
	mUOoZBTiqyBq2jY480KLb5r1fhQRRgc2Z+8Gz38pT7YAMfg==
X-Google-Smtp-Source: AGHT+IGaN9ZR/JxKJ7mWuLxKQ/UrcA1+M6nyqmmQC7YK/MYv/l+HoZAtQ+OWShztok74LycAI8QyaA==
X-Received: by 2002:a17:907:6e90:b0:af9:29c1:1103 with SMTP id a640c23a62f3a-b04b16e4b03mr1631561566b.55.1757579078947;
        Thu, 11 Sep 2025 01:24:38 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] efi: Fix line length in init_secure_boot_mode
Date: Thu, 11 Sep 2025 08:24:27 +0000
Message-ID: <e891b84f4814c1feff7a6bca51c89dc9c8971b02.1757519202.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757519202.git.gerald.elder-vass@cloud.com>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit cb41b4ce14a9 introduced init_secure_boot_mode but one line was
not wrapped appropriately.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/efi/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b86c83d3348c..69fc022c18ab 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -923,7 +923,8 @@ static void __init init_secure_boot_mode(void)
 
     if ( status == EFI_NOT_FOUND ||
          (status == EFI_SUCCESS &&
-          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &&
+          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS |
+                   EFI_VARIABLE_RUNTIME_ACCESS) &&
           size == 1 && data == 0) )
         /* Platform does not support Secure Boot or it's disabled. */
         efi_secure_boot = false;
-- 
2.47.3


