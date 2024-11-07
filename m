Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ABC9C0590
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 13:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831766.1247145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vv-0003lT-SC; Thu, 07 Nov 2024 12:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831766.1247145; Thu, 07 Nov 2024 12:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vv-0003jo-OZ; Thu, 07 Nov 2024 12:21:27 +0000
Received: by outflank-mailman (input) for mailman id 831766;
 Thu, 07 Nov 2024 12:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t91Vu-0003Uc-8N
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 12:21:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc17699-9d02-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 13:21:24 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9ee097a478so39568066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 04:21:24 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5c91esm727688a12.4.2024.11.07.04.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 04:21:22 -0800 (PST)
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
X-Inumbo-ID: cdc17699-9d02-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNkYzE3Njk5LTlkMDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgyMDg0LjA4NzUzOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730982083; x=1731586883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhkaHQoFIRa55JOrJcaTnvyo182cpXRAkClX9uwWjpI=;
        b=sO82k5t5Q6dEIqdNrAUES0PJxkdj5oCkKdoq+GZElFsTYIjdjyXjW+6ONieJ12Qcuh
         gFc7xGMRhhRh7dzqKC+z4wsj94V7xUlY/8hOkSfMhXMlBCq2Q/ygWST+1LRS5YXR1Qmh
         c1MmweaBw8GZRH94LOhcHkjy9PMFSlX8Bx9Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982083; x=1731586883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhkaHQoFIRa55JOrJcaTnvyo182cpXRAkClX9uwWjpI=;
        b=pm4GiG+qeObyx5U0QNQ28ePF8BlR6D03pCta05ItCreKSikHPzejjzcPY+iQ2gZb2l
         F/SQ5aZPRb0u5KYLAUGJrPEtvHnx7fwZjaTFul/m9QDbDsWlcxmxlYVX5dAzrM4Edp2m
         PrvOiErm+Hh27Y/P/TZBtj527cGTXIbG+lq4nXVlsQU6HrD/DETwdWITLQ1wUC2szVZh
         5KA4lfjpRrKuN+40a0Y+hi+O3ptWnkhnMS8S2VmHO63bZYMcLLNa9j+mZUaHqvuPgS/q
         RnpfQIpzvK+iIsDQaltI9ip6AAhfP7SMa0sFCkBLY+LqGRBK7jqbkbCzCJz8zYSCyM7V
         bTxQ==
X-Gm-Message-State: AOJu0YxkCgBkyc3lXBb/5UjXE/D06Yr/SII6nY9nZsz+gQmWAIDVtAdm
	p49xaukRrSlTsm3DZR2PHiWDH9xKy49YJYqt8zHKsPNTZBjSCtVkgTkznhHQ8gkXC5nQ4XtpDqZ
	l
X-Google-Smtp-Source: AGHT+IFYCiJbEL/d67ECmyal5RqaBxk7eAqjmISW2oKfrekMRSrrUF/GI3CDJgtpBs1SzNPvU+rF9Q==
X-Received: by 2002:a05:6402:d05:b0:5c9:5745:de9a with SMTP id 4fb4d7f45d1cf-5ceb926152emr19520279a12.9.1730982082892;
        Thu, 07 Nov 2024 04:21:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/ucode: Remove the collect_cpu_info() call from parse_blob()
Date: Thu,  7 Nov 2024 12:21:17 +0000
Message-Id: <20241107122117.4073266-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the tangle of logic starting to come under control, it is now plain to
see that parse_blob()'s side effect of re-gathering the signature/revision is
pointless.

The cpu_request_microcode() hooks need the signature only.  The BSP gathers
this in early_microcode_init(), the APs and S3 in microcode_update_cpu().  For
good measure, the apply_microcode() hooks also keep the revision correct as
load attempts are made.

This finally gets us down to a single call per CPU on boot / S3 resume, and no
calls during late-load hypercalls.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.

Just before posting, I've realised that cpu_request_microcode() does actually
use the current CPU revision, and it's buggy, and it's the cause of `xen-ucode
--force` not working as expected.

I'm tempted to do another series cleaning that up in isolation, such that this
patch becomes true in this form.

---
 xen/arch/x86/cpu/microcode/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fd4b08b45388..5897ec54032a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -189,8 +189,6 @@ static struct patch_with_flags nmi_patch =
  */
 static struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
-- 
2.39.5


