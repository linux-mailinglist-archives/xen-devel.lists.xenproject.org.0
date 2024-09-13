Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB0978270
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798227.1208365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7BG-00005E-4P; Fri, 13 Sep 2024 14:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798227.1208365; Fri, 13 Sep 2024 14:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7BG-0008UK-1j; Fri, 13 Sep 2024 14:21:50 +0000
Received: by outflank-mailman (input) for mailman id 798227;
 Fri, 13 Sep 2024 14:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Mtl=QL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sp7BE-0008UC-HH
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:21:48 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 828bd636-71db-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 16:21:47 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32971cso2752765a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 07:21:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25830f09sm869689066b.31.2024.09.13.07.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 07:21:45 -0700 (PDT)
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
X-Inumbo-ID: 828bd636-71db-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726237306; x=1726842106; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3dDe8ooYaEHtKfkuPDs8VvPZL+ZHIZyeGzsX9Nqf58=;
        b=vzV7SfCfoT9rRk4Fg8aWD04DD+JAazWMj28UB251FXLz8iC5f/FIPVVukK6Z4XWu/S
         ZoofXbnf+DiIVDYtqKETORhQJOU1QYCLlRMdxevQYmicGyZkknb1HAWCWSza4Bmhg9RH
         2uDH6RUjHiRmd9h2OZzobJ18J7DWZFHDxUBig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726237306; x=1726842106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3dDe8ooYaEHtKfkuPDs8VvPZL+ZHIZyeGzsX9Nqf58=;
        b=pn9Q9sAHAMo9UyIwlm2wR5XIhJNWJQ9ubi7YrCsNmvcv3tOOfabC/8XsoaTnt+9ezc
         WvLVf1jQxVq9wil5qhRv7TqRd9ogyrFEIoHtlAAntKoZ80R49MPWCCf3dY7t6EKPiZRT
         iauR5szcO/CYkfZ+qohmUJlpSFCwpM5qb+vfl9kMl7nAhm7krttD+NUHeAjazE0e6u5G
         pnMGxJj01FNhy2eW27CZQzFBhXdN7wpL7nu6ng/r8O8he59RPc/8/1msD6Tcn6fG8zrE
         3WGqEQXmlDO0XFLAEfDUA1jm3IePF0asefzqvR6rcL5s7/5jifx6KfGtPyPsDcO11fri
         cUcA==
X-Gm-Message-State: AOJu0YycfTm/UEXUv6iuY5nyWfa0M0qs0mSlyXPz+sdBEPNmcxoE+FVc
	Lo1OFpPve3hfLMHZ+WH/cSf/kWeHhnHfFQD6B9zNzF/rSwZJodjG/x4fFVTTdMI/e0VhIai+/I3
	I
X-Google-Smtp-Source: AGHT+IHG0t5bG02/uZT5pIqhD3CPQPPcS2h3cRK2UmPVHyv7KkxjmLzvhQYmM1vbHrukp4LHOuEEXQ==
X-Received: by 2002:a17:906:f5a9:b0:a8c:d6a3:d049 with SMTP id a640c23a62f3a-a90294fea6cmr697688966b.19.1726237305811;
        Fri, 13 Sep 2024 07:21:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/ucode: Make Intel's microcode_sanity_check() stricter
Date: Fri, 13 Sep 2024 15:21:42 +0100
Message-Id: <20240913142142.1912844-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Demi Marie Obenour <demi@invisiblethingslab.com>

The SDM states that data size must be a multiple of 4, but Xen doesn't check
this propery.

This is liable to cause a later failures, but should be checked explicitly.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/cpu/microcode/intel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 6f6957058684..bad51f64724a 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -155,10 +155,13 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
     uint32_t sum;
 
     /*
-     * Total size must be a multiple of 1024 bytes.  Data size and the header
-     * must fit within it.
+     * The SDM states:
+     * - Data size must be a multiple of 4.
+     * - Total size must be a multiple of 1024 bytes.  Data size and the
+     *   header must fit within it.
      */
     if ( (total_size & 1023) ||
+         (data_size & 3) ||
          data_size > (total_size - MC_HEADER_SIZE) )
     {
         printk(XENLOG_WARNING "microcode: Bad size\n");
-- 
2.39.2


