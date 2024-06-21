Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387A912F0A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745568.1152716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKj-0006FU-4j; Fri, 21 Jun 2024 20:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745568.1152716; Fri, 21 Jun 2024 20:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKj-0006CH-0Y; Fri, 21 Jun 2024 20:58:09 +0000
Received: by outflank-mailman (input) for mailman id 745568;
 Fri, 21 Jun 2024 20:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKlKh-0005sX-4d
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:58:07 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e44aba-3010-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 22:58:05 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d1012e52fso2824908a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:58:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042d509sm1440011a12.43.2024.06.21.13.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:58:04 -0700 (PDT)
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
X-Inumbo-ID: f4e44aba-3010-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719003485; x=1719608285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2mJFKp0tzriHW0QjBAnMPOnFKVP/CBMSZnxZwykoKk=;
        b=uDbTKnDaxM9u7N8MNzOKHnnK5RT3+WGPicwdkXstY3AdUr1N9+Q2lq6xeDYf14V+OW
         3aJIRJ3pf9TQUdaZPpVFBRqFTvoymOS5vmuov9i1xOlVsoMXbGe/OkmPgnT+HrcyfDnL
         w+67mHRFkLok+iZUNfyxjSX9LZc2f8mko3Z98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003485; x=1719608285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2mJFKp0tzriHW0QjBAnMPOnFKVP/CBMSZnxZwykoKk=;
        b=mhkdFbN9NiXYHFsROuz9GdGEE5YWdqpzrx1u1i78mFHtyCsJ+deFcB3fwI8WIdD7uH
         72q+61Y/9+WeI2O6wUVG9N51nm3+REICC8NHfhRuK6m0c2deOqQ4RK+K20mW0GWuZJbr
         iczMYtJQZnf+kXPPeTkoZqg3IOsTjz8vcb3UrHwgXMmRHECTUZnSofB+RRSauIYTRZxU
         hrXgvnhcwpY8rKtPd3WWxqqJB1wLr6XgxFJWoznWy4t+qayLmnOS5aHV/y76Hj299l1E
         7qrvH4OzoUAIRbv9Rds5Tf5Px0InX2Zb8GRy1zSuZ4Kf4CnUhC+KpzeMUf0w3meWHMXK
         xfcQ==
X-Gm-Message-State: AOJu0Yy+YukvQJETRALvRtrqbKOIVDNS6ETVzGoRARTtWFT4XlzehQ+g
	Wfnk6FqL11XdCgjkGJ+OJqPiblb3+bIvKR1ZaC3+Af7i5p6T9oVLoi/8btOkzQkW63+zqHhGf0B
	c8/w=
X-Google-Smtp-Source: AGHT+IFXHPD0wWta+oxEYQcmgEfPdVSHm0Vxn7VWpzd99ufMFqO8UaVmn6TUdSvAMxiUnh9lEus+8w==
X-Received: by 2002:a50:d50a:0:b0:57d:2716:838c with SMTP id 4fb4d7f45d1cf-57d27168510mr3030952a12.37.1719003485207;
        Fri, 21 Jun 2024 13:58:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be unsigned long
Date: Fri, 21 Jun 2024 21:58:00 +0100
Message-Id: <20240621205800.329230-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621205800.329230-1-andrew.cooper3@citrix.com>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, the non-compat declaration and definition of do_multicall()
differing types for the nr_calls parameter.

This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
first 128bit architecture (RISC-V looks as if it might get there first).

Worse, the type chosen here has a side effect of truncating the guest
parameter, because Xen still doesn't have a clean hypercall ABI definition.

Switch uniformly to using unsigned long.

This addresses the MISRA violation, and while it is a guest-visible ABI
change, it's only in the corner case where the guest kernel passed a
bogus-but-correct-when-truncated value.  I can't find any any users of
mutilcall which pass a bad size to begin with, so this should have no
practical effect on guests.

In fact, this brings the behaviour of multicalls more in line with the header
description of how it behaves.

With this fix, Xen is now fully clean to Rule 8.3, so mark it so.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I know this isn't going to be universally liked, but we need to do something,
and this is my very strong vote for the least bad way out of the current mess.
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 xen/common/multicall.c                        | 4 ++--
 xen/include/hypercall-defs.c                  | 4 ++--
 xen/include/public/xen.h                      | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index b829655ca0bc..3d06a1aad410 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -45,6 +45,7 @@ MC3R1.R7.2||
 MC3R1.R7.4||
 MC3R1.R8.1||
 MC3R1.R8.2||
+MC3R1.R8.3||
 MC3R1.R8.5||
 MC3R1.R8.6||
 MC3R1.R8.8||
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 1f0cc4cb267c..ce394c5efcfe 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -34,11 +34,11 @@ static void trace_multicall_call(multicall_entry_t *call)
 }
 
 ret_t do_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, uint32_t nr_calls)
+    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, unsigned long nr_calls)
 {
     struct vcpu *curr = current;
     struct mc_state *mcs = &curr->mc_state;
-    uint32_t         i;
+    unsigned long    i;
     int              rc = 0;
     enum mc_disposition disp = mc_continue;
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 47c093acc84d..7720a29ade0b 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -135,7 +135,7 @@ xenoprof_op(int op, void *arg)
 #ifdef CONFIG_COMPAT
 prefix: compat
 set_timer_op(uint32_t lo, uint32_t hi)
-multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
+multicall(multicall_entry_compat_t *call_list, unsigned long nr_calls)
 memory_op(unsigned int cmd, void *arg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
@@ -172,7 +172,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
 vm_assist(unsigned int cmd, unsigned int type)
 event_channel_op(int cmd, void *arg)
 mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
-multicall(multicall_entry_t *call_list, unsigned int nr_calls)
+multicall(multicall_entry_t *call_list, unsigned long nr_calls)
 #ifdef CONFIG_PV
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 stack_switch(unsigned long ss, unsigned long esp)
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b47d48d0e2d6..e051f989a5ca 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -623,7 +623,7 @@ DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
- * `                      uint32_t nr_calls);
+ * `                      unsigned long nr_calls);
  *
  * NB. The fields are logically the natural register size for this
  * architecture. In cases where xen_ulong_t is larger than this then
-- 
2.39.2


