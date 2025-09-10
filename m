Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE08B52437
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 00:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118862.1464526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDm-0001yq-Q9; Wed, 10 Sep 2025 22:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118862.1464526; Wed, 10 Sep 2025 22:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDm-0001wg-KN; Wed, 10 Sep 2025 22:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1118862;
 Wed, 10 Sep 2025 22:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwTDl-0001V7-2r
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 22:23:21 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c102a923-8e94-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 00:23:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso537105e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 15:23:19 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01ba9601sm2452195e9.23.2025.09.10.15.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 15:23:18 -0700 (PDT)
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
X-Inumbo-ID: c102a923-8e94-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757542999; x=1758147799; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be6iKna05Jm3M6YBcH7sSksx9f/N4umOF44zDD8ok3Q=;
        b=kb6PcxXuEs07xUpRD3TaEfa+2GU6L+WsovhpcWX+mZ9hvsvft2IcKLGmYOFUqKzAOa
         W3yMcvD3OIzYNv9Ha24PjHA2bq7wES5BC+whH7ArvHrHh7IQuyl4o060u653Xp7OmXyM
         TEMNBGwAprXYyBtNkwOgwuuJzJf/OBRBiO4NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757542999; x=1758147799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be6iKna05Jm3M6YBcH7sSksx9f/N4umOF44zDD8ok3Q=;
        b=Ek0tWgwCyclQpBkZswL4wvsfM8qIr9OWVOA9R+WNEpmdR4HfEDlAleBknuqKytHWWR
         DkkfMxWiNs+jcxxfpPKsdPc/sJEOVDtUVzuVbvunux69NkmlQ4YC0RxmGxnZOi7Q70ft
         4NYHt7mdOlKze40yENSn8JfdNN/VQdp+lF/HoclreevP5ywnjPbYbK34ylTpAHQgVREQ
         u4Z+IBx5NZ/rvB2HGdW5o9+HOwn/ouVBCednFhd9/HjDHR100p3Un93nIUmDkDr1Uusw
         tWHQvm/NrEcavZ4QIMa8zH5lCiKZraZX9wd15s3o8cnS5HwMHseqqm4/ziKnEKHJOtx2
         Wp+Q==
X-Gm-Message-State: AOJu0Yy9NhH5tG+57z95B3+flB+IR3XhZ38bVcIKJVF61qUzwUZLu3CU
	XhGUce6jCQhc0OSAe7GhfpQ3aiczSTlevkAv9hiG376qgFxM2m2lxOyWEbz9Ffil6DRiAPWss2i
	puTFe
X-Gm-Gg: ASbGncvfaogfA1NJm1pFO1LKw6brIdFurtkGQ0cxxx5InpUn6HU2xqWh2pPb2b+6ZvZ
	KRUdweCsfbqPNSx+AL+LGjOLVlNGsjEYaz9m4gfmH0JtVqqkFwCeMWU3YOaqXfPlIgqSnmrQZ7E
	M2qwDICqV3+FRcxLp4YTzUuS13kmsH1chiLhU/Y3KcxKX8ft8yNWpmutnoEXmCwtp8xzNelRgpM
	qXQubVi7fsItUzJPYX5oZNBCytzxtHIIjUGYWMW/cou4D9cuJrqWPZmj3wbz4S/Aq0LP1Bqi4vU
	0hNB+rpN1j837WSaTdJN1YwwDe/l6jqofkfLkY1yI8Lalf5Yayv4w0evlAfcKQVfzTkw9FipZWm
	oR2NaGniBa+BHY3ILyHJ50y4apE1z4YWx4ijX/t97IxOl5IiB1NiII0PuA2MqiGFLuDM+WfPJE3
	MKUHLLol/JLQE=
X-Google-Smtp-Source: AGHT+IGMDJKbOmww8BMqXwVLHBklHv2GzHyGwx53WGJ6C77VFn6KmUcRjq7Gpd0R2KmIH5+jdOZZxQ==
X-Received: by 2002:a05:600c:4ed2:b0:45d:f7e4:bf61 with SMTP id 5b1f17b1804b1-45dfe9e81d3mr8822055e9.4.1757542999038;
        Wed, 10 Sep 2025 15:23:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 3/3] CHANGELOG: Notes about distro changes in CI
Date: Wed, 10 Sep 2025 23:23:13 +0100
Message-Id: <20250910222313.1858941-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
References: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also state the RISC-V baseline now it's been set, as it's the reason why
RISC-V Bullseye got dropped.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * New
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7bd96ac09d14..ca1b43b940d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+   - For RISC-V, GCC 12.2 and Binutils 2.39
+ - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
+   to the baseline change.
  - Linux based device model stubdomains are now fully supported.
 
  - On x86:
-- 
2.39.5


