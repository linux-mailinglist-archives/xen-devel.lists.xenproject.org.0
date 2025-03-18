Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04FBA67B28
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919669.1324069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaw2-0002li-1X; Tue, 18 Mar 2025 17:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919669.1324069; Tue, 18 Mar 2025 17:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaw1-0002ik-V0; Tue, 18 Mar 2025 17:41:01 +0000
Received: by outflank-mailman (input) for mailman id 919669;
 Tue, 18 Mar 2025 17:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarq-0005mN-Ax
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:42 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cabb536-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:40 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2240b4de12bso19139585ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bbe8f9sm97045265ad.175.2025.03.18.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:38 -0700 (PDT)
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
X-Inumbo-ID: 8cabb536-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319399; x=1742924199; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEL7HWOclcVrzRnpzMMvw5ftkL6OMCSWHDm4UrTJlco=;
        b=s2ALeU5Oh9J2AJcu4LqEOMmq1tdMKJw7Jfl5g8D+r5hRsusB/22GmtCDO1cvgKh+uS
         iQn2NI8qVBTk0mE9Xw4srjsjlLPOxvxRR9RsZod9A4ul9/Nlp2o3qpXWDJTz667bNF2N
         wC6GIAsPgzZIX4vs9H7xXRqo7JV3WAt4aS5wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319399; x=1742924199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEL7HWOclcVrzRnpzMMvw5ftkL6OMCSWHDm4UrTJlco=;
        b=AbeXq7aC12GrO84K8AMMW2xdPUZDQfc/NIJPwEldqBrOoNNNcfvaX1aVZIf0dap/3k
         WUNQYjwfk9sUUvLIj5S9IXu6ce0RtKD9UO7XjHnlf4hBVgzXpkLnKmPGzt7uC1brOnsd
         xP7ljj1+TaCozG6ihOIr4aJcyFM6Pf6MFCjD/ILePfzt5IS4STn5C4rxuPf8Agxp93H/
         BI2tiPH9udRKXFgG8ZHbVpTglIz/e9cSWYo3SUKKhYXnqO6YXWoAD5XiDLFAkfvkeflc
         N3giMnfXPKebHCCT7lRL/3/0FzxSym2ZRIQM0SxM+4RxCR4sSQyBCNiAXDh7uT109rCo
         long==
X-Gm-Message-State: AOJu0YzhGwMo13Cq5FEK+Ej/Iis5R8eeWt9ZCR3WCoGjS3GZGwfwXjW1
	5VXftLpcIMlM0PrORSgHQuEP/9fjCxIqLB/sOmhmhC7FfYMvABcbTarBqjCkM53j3/rAarjYieH
	G
X-Gm-Gg: ASbGnct6Uev3K39M4w/Zm2Czv+54gAcWZXrDHy0miRuI+MnBW7wCfN9JAuxxmTnUab9
	GdH4vdkR5W3UCgnGtoGkseUUxrQgWtoTfxGs45aRC3NMRJRVRLu5Oq1zVH8voie6YI8eXeT6+EN
	frlrivv928hTgo+rv/NCrA1CsNkJe2JuoaF+Ma0ITYro6fVexLU6dZag3TniSDyOucstP9J84YB
	PS8nCLOVdptPcvAjG6725ZSiOdXt3u5+luifaomYJAuuuzOXC3S3TTCo7NAqGUwcUnEh762ilb2
	N+9PGtEc0Wg1ja8tNCQEW4pgXqlYkVwQWbQwm29iNjArsSDf9A==
X-Google-Smtp-Source: AGHT+IGryaJt5eLOMVWZv5Q3OSb2wjTN14Pj/IJVXnvKMDc/TIBlHrZQ+wNIJ8Ghb3x14UCD0UuT0Q==
X-Received: by 2002:a17:903:2793:b0:224:255b:c92e with SMTP id d9443c01a7336-225e0a62f23mr155212305ad.3.1742319398887;
        Tue, 18 Mar 2025 10:36:38 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/7] xen/build: warn about RWX load segments
Date: Tue, 18 Mar 2025 18:35:47 +0100
Message-ID: <20250318173547.59475-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After having removed the -N option from the linker script invocation, and
also having removed the merging of the .init.text and .init.data sections
on x86, there should be no remaining RWX load segments.  Do not silence the
GNU LD warning.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 58fafab33d6f..989285df276e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -415,8 +415,6 @@ AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
-LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
-
 CFLAGS += $(CFLAGS-y)
 # allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
 CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
-- 
2.48.1


