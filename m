Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E58AAC64
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708909.1108111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6J-0002u2-FN; Fri, 19 Apr 2024 10:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708909.1108111; Fri, 19 Apr 2024 10:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6J-0002rn-8r; Fri, 19 Apr 2024 10:04:11 +0000
Received: by outflank-mailman (input) for mailman id 708909;
 Fri, 19 Apr 2024 10:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxl6H-0002MX-SA
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:04:09 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 297a4e20-fe34-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:04:09 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6eb86aeeb2cso1021548a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:04:09 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 a8-20020a05620a124800b0078f28a08785sm265765qkl.88.2024.04.19.03.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:04:06 -0700 (PDT)
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
X-Inumbo-ID: 297a4e20-fe34-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713521047; x=1714125847; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5kH8Om+131aQ6l7YhoG07i/m9A16YqFxu4+5E8EjzA=;
        b=Tuv1lFVgUUNC55M1L+U8Adgf6CbVIk9nUDcky6mtaEHqaeBd1UBBeI5vFdmJvnhjpO
         Tm7w/+9XMfXGTehYgzYcmgNa+82qnJWf1H1/scKfd5zV7iFHdia9benCYQJ1/85hxpzS
         jMRLEgEj0ZrbqbY987YKHLVYVIvKg+L9wjHzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521047; x=1714125847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5kH8Om+131aQ6l7YhoG07i/m9A16YqFxu4+5E8EjzA=;
        b=rkXJYiQkXuN86PRg1wfX2PLfSNAM6/PkH1wZb/lhQnTAQhKboH/crGbLiGrg2vczLK
         rO6oggiO4e52lSn6l1NBfQmyOEpxNeaRZ6seg7qnYCimvwMgPvhdRZLZj69yUAY7a2E7
         6kvMK8tiyQk3o3mDvXGQo4l6KnRIBJ4yOckUKIHbnYuzv/Khfshfb1yuUpOLx2jDGkiH
         ApeJOGT2kGbs+nnINT0uQQG433JgtvUPcblFP/ceKKw96vuAsgogcI1CT7Wa60sChRka
         t1F7he+WzqwBoqf3bfrNw46byUKv4im4/ViJrRXsziBXePPTgjnV1Dczi0l/WLxTFl0p
         f4NQ==
X-Gm-Message-State: AOJu0Yzxf+G9v89shFBSSBSml5ltfCWI1DZSjldO343Q35BsPLkLBykW
	srS+W3Y+gWrgU8Rf/3WLXFhE8TRoNRErQBRV6G71WPz6/KZHgarvDdj/TrDql+snsMEUaPjDgkc
	8
X-Google-Smtp-Source: AGHT+IHIqQ+mDPN5RImm6mlw6ZtoIwpNtH0j0ljEo2EdwPFYoDQgHaxEYWaya6PemXrsZORkOrFW+A==
X-Received: by 2002:a05:6830:4413:b0:6eb:7e60:6028 with SMTP id q19-20020a056830441300b006eb7e606028mr1967521otv.30.1713521047293;
        Fri, 19 Apr 2024 03:04:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong to init sections
Date: Fri, 19 Apr 2024 12:02:17 +0200
Message-ID: <20240419100217.12072-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419100217.12072-1-roger.pau@citrix.com>
References: <20240419100217.12072-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Livepatch payloads containing symbols that belong to init sections can only
lead to page faults later on, as by the time the livepatch is loaded init
sections have already been freed.

Refuse to resolve such symbols and return an error instead.

Note such resolutions are only relevant for symbols that point to undefined
sections (SHN_UNDEF), as that implies the symbol is not in the current payload
and hence must either be a Xen or a different livepatch payload symbol.

Do not allow to resolve symbols that point to __init_begin, as that address is
also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
resolutions against it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix off-by-one in range checking.
---
 xen/common/livepatch_elf.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..a67101eadc02 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -4,6 +4,7 @@
 
 #include <xen/errno.h>
 #include <xen/lib.h>
+#include <xen/sections.h>
 #include <xen/symbols.h>
 #include <xen/livepatch_elf.h>
 #include <xen/livepatch.h>
@@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                     break;
                 }
             }
+
+            /*
+             * Ensure not an init symbol.  Only applicable to Xen symbols, as
+             * livepatch payloads don't have init sections or equivalent.
+             */
+            else if ( st_value >= (uintptr_t)&__init_begin &&
+                      st_value < (uintptr_t)&__init_end )
+            {
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s: symbol %s is in init section, not resolving\n",
+                       elf->name, elf->sym[i].name);
+                rc = -ENXIO;
+                break;
+            }
+
             dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
                     elf->name, elf->sym[i].name, st_value);
             break;
-- 
2.44.0


