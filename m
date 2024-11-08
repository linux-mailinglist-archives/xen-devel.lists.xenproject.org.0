Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3F9C1EED
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832603.1247891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Pim-00009b-GN; Fri, 08 Nov 2024 14:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832603.1247891; Fri, 08 Nov 2024 14:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Pim-00006y-Dd; Fri, 08 Nov 2024 14:12:20 +0000
Received: by outflank-mailman (input) for mailman id 832603;
 Fri, 08 Nov 2024 14:12:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9Pil-00006s-Ps
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:12:19 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73f4596a-9ddb-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 15:12:14 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso2454360a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:12:14 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c7c90dsm2072770a12.80.2024.11.08.06.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:12:12 -0800 (PST)
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
X-Inumbo-ID: 73f4596a-9ddb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjczZjQ1OTZhLTlkZGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDc1MTM0LjI3ODYwOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731075133; x=1731679933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOsgMR4lxE39KxzWp4Qkhc9aUsZMLXg7adtJmW72W5E=;
        b=aDSMTp7KiB1y/xy87s2j8YCe2uQhDXsrI16pTHf6cxp6TC2TBf/TWuTTOwgZiC/l0O
         0H7J4EZsWyDfFTc6iFk2v0Q/nJCDmjaiY6xyrzsspVc8viikNodpWjvH01EHNymrxWPs
         s/UiHI07soy55c1qHGAA+fqNmXVb0XnC7fRTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731075133; x=1731679933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOsgMR4lxE39KxzWp4Qkhc9aUsZMLXg7adtJmW72W5E=;
        b=aVeOKSriATvHzkLjSLGzb71SdxNTSDv+UkAUbg4JvzqRdSETdwZAteHYXpPioi+kbS
         4qMVwQqMiwMY0LEhVY8oXVGGz8nMQQ26t7FUgEx74uUqea7i1Cc4nxXn1ErKWyCMmTPB
         TZO3EGjjAUU8T+DzKAUQW3UH9iC+IDWpfmROjNsGpH7hA2Os62362/tUvBSUMQIRjq+O
         ZrTKCFn4G9Ylva5zQc+jzbcY4Zxom5ddUEUOGT7ltNUcAt8m070DuZLsGrFSBK5Sa1w8
         muevPvebBd4ZLAKOE1b+Ay+3vmz315nX1k3s+kXlqV/T7SpepCf/NWHSE2mIydo/p+QG
         lxoQ==
X-Gm-Message-State: AOJu0YzDHte7+U3w8Der8bgS9D3UNmmsRh2Du4ZHknXRm6rnUJbNzxZk
	21EQp8hhuU2ankkOLBk6M3lWQ43qjaz0ENuzRFQY96FKKIWUBPPAKyrlcx1Cfs6iA4eXJFct6JB
	W
X-Google-Smtp-Source: AGHT+IGzH+NgdZrMBNW/kiOfpbwwuMFExiH8OLqaxci+KviFg7S9bNhXt3Q5wBpx77o/zbTBtafDKw==
X-Received: by 2002:a05:6402:35cd:b0:5c9:59e6:e908 with SMTP id 4fb4d7f45d1cf-5cf0a30b0d7mr2409557a12.6.1731075133170;
        Fri, 08 Nov 2024 06:12:13 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86/boot: Fix bootinfo.h to be standalone
Date: Fri,  8 Nov 2024 14:12:10 +0000
Message-Id: <20241108141210.298063-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Work to rebase the Trenchboot patch series has encountered:

  In file included from ./arch/x86/include/asm/tpm.h:4,
                   from arch/x86/boot/../tpm.c:23:
  ./arch/x86/include/asm/bootinfo.h:88:35: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'next_boot_module_index'
     88 | static inline unsigned int __init next_boot_module_index(
        |

Fix this by including the necessary header.

Fixes: 74af2d98276d ("x86/boot: eliminate module_map")
Reported-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index cc6305630683..b9c94b370d57 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,6 +8,7 @@
 #ifndef X86_BOOTINFO_H
 #define X86_BOOTINFO_H
 
+#include <xen/init.h>
 #include <xen/multiboot.h>
 #include <xen/types.h>
 

base-commit: 75035c386eeb8bd5dbed1831dbb96a35b31521f6
-- 
2.39.5


