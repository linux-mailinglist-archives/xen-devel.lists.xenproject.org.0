Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713DA9C76C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967689.1357449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAP-0001tY-BM; Fri, 25 Apr 2025 11:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967689.1357449; Fri, 25 Apr 2025 11:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAP-0001qR-8I; Fri, 25 Apr 2025 11:24:25 +0000
Received: by outflank-mailman (input) for mailman id 967689;
 Fri, 25 Apr 2025 11:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8HAN-0001A7-Qn
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:24:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b2928f-21c7-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 13:24:23 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so15049285e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:24:23 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a531072csm21743005e9.18.2025.04.25.04.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:24:21 -0700 (PDT)
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
X-Inumbo-ID: d6b2928f-21c7-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745580263; x=1746185063; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v36HYmxQutvat5+vkDgo13dmyUzLDnP9Gcli+3xTA18=;
        b=mrx6vv2b/kS660y42GT0Z23ISsNlZxk1PLoYK84p04IqBn1eGu7mirUpBaxFvR6ZJz
         HFR69Eg2sxWgbEPYO8TOgxVUjXlYv3MUCXcJx7PmSVVYcZkvzDq5uQe8Fk7M3hubYp10
         w3cdUVVFkqVMKuy53D2wcadKn8YELVP7b//As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580263; x=1746185063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v36HYmxQutvat5+vkDgo13dmyUzLDnP9Gcli+3xTA18=;
        b=SYhlGdwDP/OXqzrjRIh2n6MFq8ZYmCTKrtb/lM6vhEAqrKI20mLQ48fzp3csoJZfeS
         RELxo8v8f9lbsxhzXXFpYYSyR+3p2vSzbpfSOz2CMr0mUeWq3ktWeILpWtnplasTThRn
         LpF6GdAmw0HD/tr3EoeKjd45fO+Wa6hxBQ08G7Ans812IXdA3kA1Sc311SA8/3b4dGo6
         IDad+bWtvBTeiE+vHB6CE5Ky3LktAeHN5qyNs7A8kTp7dZcSZc/t4iPXJUpz/4MUNlLQ
         dK+BYDCjkcRxSTSIaWuCs8S7jmmu5uli1mihwsOh6E9pjaXcDuPW9pVTEWuVsrnbhpJk
         r3XQ==
X-Gm-Message-State: AOJu0YwXgqStn7fbtoqX7FMaNnxx836boEEHMgqEWnTcrVcTCKhVOX/u
	mioNT1YfFF3rxcgZST+zB9zB3h/zSqMAcIiLTB092/uoACyjrenKa6kGx+kmFAw2/kPMMMFhI9x
	q
X-Gm-Gg: ASbGncvUfNnuBUq3RVemGRs9nBGRBZMf3VBRpMBVT/jhjFEom9ond37hJaCERoreENP
	V5lQlniMmie1OV+afOVbkQrghz1sFBMa8jy1pW36VO+qlIpGia4TBSna/pmw09sdzvpVyP127J3
	mpqal4fL5KYnZyXVOS81Kq3FqQWXer3BYf2O4zSEWR5q+hV1RJI0z/IzOnjWxqhO6NfVAuj5V4G
	OK9P8b3cOFx4vL5QUVrj6WkqkkV4ovtz/zTYOb70eVojSHQMJiMaEn2IZYPwnQEfBAoTztFhL+h
	JOk1hHZvRt0WnT3PzdRLop4FjNzbRmG69VApA6i6zn/RvF8u7hOBkkQZOcymjgsIjtJey1W6EiI
	yWKeUEIixNofVGA==
X-Google-Smtp-Source: AGHT+IHRAPyNcrOaqj+bbzurrRKNdUBK3cc5md8L0wzSjrPO3xVS+zDe1HZyI4mdv4p/xbr8sHyvnw==
X-Received: by 2002:a05:600c:1d9f:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-440a65e6dc3mr16451745e9.11.1745580262651;
        Fri, 25 Apr 2025 04:24:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 3/3] ppc/mm: Introduce mm-types.h
Date: Fri, 25 Apr 2025 12:24:15 +0100
Message-Id: <20250425112415.245585-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425112415.245585-1-andrew.cooper3@citrix.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shawn Anastasio <sanastasio@raptorengineering.com>

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

Possibly not for taking on it's own (might be better with the PPC
implemenation of map_pages_to_xen()).

Nevertheless, this patch alone now does trip:

  diff --git a/xen/common/vmap.c b/xen/common/vmap.c
  index d6991421f3f7..9552806dba39 100644
  --- a/xen/common/vmap.c
  +++ b/xen/common/vmap.c
  @@ -228,6 +228,8 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
       void *va = vm_alloc(nr * granularity, align, type);
       unsigned long cur = (unsigned long)va;

  +    BUILD_BUG_ON(sizeof(pte_attr_t) != 4);
  +
       for ( ; va && nr--; ++mfn, cur += PAGE_SIZE * granularity )
       {
           if ( map_pages_to_xen(cur, *mfn, granularity, flags) )

in PPC builds only.
---
 xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/ppc/include/asm/mm-types.h

diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
new file mode 100644
index 000000000000..06a3af1c6eda
--- /dev/null
+++ b/xen/arch/ppc/include/asm/mm-types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PPC_MM_TYPES_H
+#define PPC_MM_TYPES_H
+
+typedef unsigned long pte_attr_t;
+
+#endif /* PPC_MM_TYPES_H */
-- 
2.39.5


