Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CE8A7057
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 17:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707043.1104522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwl7C-00083P-IZ; Tue, 16 Apr 2024 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707043.1104522; Tue, 16 Apr 2024 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwl7C-00080k-FU; Tue, 16 Apr 2024 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 707043;
 Tue, 16 Apr 2024 15:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYTd=LV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwl7A-00080e-S4
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 15:52:56 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 632d799c-fc09-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 17:52:54 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so9368927a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 08:52:54 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h18-20020a17090619d200b00a51a80028e8sm6981194ejd.65.2024.04.16.08.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:52:53 -0700 (PDT)
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
X-Inumbo-ID: 632d799c-fc09-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713282773; x=1713887573; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTZ3ofxgQk2khebAzIJ5NPGSB5//IH1aQzj3b8mNbYY=;
        b=XKFVUmLSoVnep8UVAeMVTDOFN1q1P1Ph9BLrmD4wcl3tJn3Pn1tX/tWknWAtOYybAb
         RrqEaSIVdiBe0ADXvf5C3osry62qmfRk2zHqK955aVka8poMfxASn28ObI0odByyLg5E
         FqiWen6AdThacFXdYK9iSiBH4EQ6z9Fg2anuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282773; x=1713887573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTZ3ofxgQk2khebAzIJ5NPGSB5//IH1aQzj3b8mNbYY=;
        b=hvOjGNTtyXiXQo6q6+OUDHPZF8Lq7UQGsGUUTO1bEtm/VKRZm2NerbkYhjZeujHG0F
         3EUrLcq8TgnKHgtxpTn0iXfMXeHFCsg6ZmXZI9Y7XajNR8pLufUR3GPLL7u0HfKQpcBl
         GCdV3ie/Qdl/xJq8aAOT93QQhtOftVlOWwMLkoudw5QYFZpTYCsujQaggzzQWBRXjuAO
         IYipfXZ0XDx7nU1TlwW6sUhwI3ktsrDAmXLmIJ4dbKpjnyD3VFL+Rs2p9cb5uHadqm3R
         3lpbNGir+Z8lz2dLINyvCKy1mRsjvjVjfsZzyYB5cViTI1reaxptxWkaDlOhGzI/wP3n
         jvfg==
X-Gm-Message-State: AOJu0YzI7b+e0cqp8HroqqecYkfIKDtRgwVxd3E9keSoAGQGFB6+EPHN
	voO/pi1ZYbuqYdHPMvGPPpZJ/kxIR15xxWKiznk1k7q9Ac9yzkyXcB8XUSn1cFB4SLnuy22gjkv
	weNc=
X-Google-Smtp-Source: AGHT+IGNgk+5XVnOI6OTX15irTSJPumVj1YKmN6OzDkw3xy9MduKhy02OQC0lH0zVuQJ5B+wknhceA==
X-Received: by 2002:a17:906:b892:b0:a51:8672:66e4 with SMTP id hb18-20020a170906b89200b00a51867266e4mr2793159ejb.22.1713282773338;
        Tue, 16 Apr 2024 08:52:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/efi: Rewrite DOS/PE magic checking without memcmp()
Date: Tue, 16 Apr 2024 16:52:51 +0100
Message-Id: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Misra Rule 21.16 doesn't like the use of memcmp() between a string literal and
a UINT8 array.  Rewrite using plain compares.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/efi/pe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
index a84992df9afe..ef8a2543e0a1 100644
--- a/xen/common/efi/pe.c
+++ b/xen/common/efi/pe.c
@@ -111,7 +111,8 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
     UINTN offset, i;
 
     if ( image_size < sizeof(*dos) ||
-         memcmp(dos->Magic, "MZ", 2) != 0 )
+         dos->Magic[0] != 'M' ||
+         dos->Magic[1] != 'Z' )
         return NULL;
 
     offset = dos->ExeHeader;
@@ -119,7 +120,10 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
 
     offset += sizeof(*pe);
     if ( image_size < offset ||
-         memcmp(pe->Magic, "PE\0\0", 4) != 0 )
+         pe->Magic[0] != 'P' ||
+         pe->Magic[1] != 'E' ||
+         pe->Magic[2] != '\0' ||
+         pe->Magic[3] != '\0' )
         return NULL;
 
     if ( pe->FileHeader.Machine != PE_HEADER_MACHINE )

base-commit: c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
-- 
2.30.2


