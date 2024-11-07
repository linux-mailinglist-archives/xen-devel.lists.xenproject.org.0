Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C909C097E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831883.1247284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93zQ-0005Ce-5q; Thu, 07 Nov 2024 15:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831883.1247284; Thu, 07 Nov 2024 15:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93zQ-00058D-22; Thu, 07 Nov 2024 15:00:04 +0000
Received: by outflank-mailman (input) for mailman id 831883;
 Thu, 07 Nov 2024 15:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t93zO-0004op-OY
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:00:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f528c49f-9d18-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 15:59:59 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9ed49ec0f1so181310466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 06:59:59 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a995sm104931766b.61.2024.11.07.06.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 06:59:57 -0800 (PST)
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
X-Inumbo-ID: f528c49f-9d18-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY1MjhjNDlmLTlkMTgtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkxNTk5LjI0OTE4LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730991598; x=1731596398; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWudKZrT5r7ZSn6U4xo51gIARID7PZJcRRFdJ5MGAUc=;
        b=IusyHBpR7pkVMp/GtIQR6VJaX/PBTvJYrSpYXgHrIgCwrEr44Wgq/CwwCy8o7lkZzI
         ZwbzfZ16DzVu9i3b+dwBc2QaitwL11Zw8xZXYWWRv/RTbDOYh2GyYJObEARrkvYsa4e/
         GO6Rn17azamXg0kUGO0vWEgMdC6h24SddO1Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991598; x=1731596398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWudKZrT5r7ZSn6U4xo51gIARID7PZJcRRFdJ5MGAUc=;
        b=M/hH9BjRt4lSBnaSraHZdDwHhy5nfpKU6LLDp9MJE9yo3l36dASYQ6lHtxnLijcM/5
         xarXQYODD4l0+x3Cus8gZX9eldq5klk4GtV+vFNpuf81RYGq32KtSnpE9E5AUR7iXhpT
         EaJbbGn3LhKT/LJVH+GSOOthb+FCyzD9E/kU1jdlgCz1gKVUMKLbI1p8/JK7yitVMAm6
         23zWLVyZ6xhxcY6HrxOkX/J9+kuHDhaznCwlJmsjFDYwqgM552V17aNOMkJM2EA5Aj1a
         FOt2684Vugldntmb721JvUyNvsTrtZ3l+2t2eOlP4nTEu6NBjJkK6KUyy7DwKKA1poUc
         sFbQ==
X-Gm-Message-State: AOJu0YzvlAYnJHnVIg37keeDT91FbX3b3+7FRj7b924r3/kd+e9n4F+L
	HyjKmN0gJDcfKUVpINQO4sbC/cfBhxHFkYh35L+vOQze7BmisryBqKptQs5eo3Y3wvwqpfYrqGD
	h
X-Google-Smtp-Source: AGHT+IGklpQsEOfcEOlt9KJ2CJFqMxK3g3wcXmlS1Hqp7PEGQv1QogbpZ0L8+gEZ9ycNzhjI0eQbpA==
X-Received: by 2002:a17:907:c26:b0:a9d:e1d1:bf95 with SMTP id a640c23a62f3a-a9eeaef5d00mr28148866b.25.1730991598311;
        Thu, 07 Nov 2024 06:59:58 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/x86: prevent addition of .note.gnu.property if livepatch is enabled
Date: Thu,  7 Nov 2024 15:59:52 +0100
Message-ID: <20241107145952.73403-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GNU assembly that supports such feature will unconditionally add a
.note.gnu.property section to object files.  The content of that section can
change depending on the generated instructions.  The current logic in
livepatch-build-tools doesn't know how to deal with such section changing
as a result of applying a patch and rebuilding.

Since .note.gnu.property is not consumed by the Xen build, suppress its
addition when livepatch support is enabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/arch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 1460ecf30b9a..1ded012d9f5b 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -26,6 +26,12 @@ $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
+# Disable the addition of a .note.gnu.property section to object files when
+# livepatch support is enabled.  The contents of that section can change
+# depending on the instructions used, and livepatch-build-tools doesn't know
+# how to deal with such changes.
+$(call cc-option-add,CFLAGS-$(CONFIG_LIVEPATCH),CC,-Wa$$(comma)-mx86-used-note=no)
+
 # Check to see whether the assmbler supports the .nop directive.
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
-- 
2.46.0


