Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9E89FFF8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703547.1099229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructv-0002qR-4W; Wed, 10 Apr 2024 18:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703547.1099229; Wed, 10 Apr 2024 18:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructu-0002kv-Ue; Wed, 10 Apr 2024 18:42:26 +0000
Received: by outflank-mailman (input) for mailman id 703547;
 Wed, 10 Apr 2024 18:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ructt-0002iK-Ph
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:42:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 122a496e-f76a-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 20:42:23 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so8389024e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 11:42:23 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b00a4e1a9e1ab4sm7228404ejb.157.2024.04.10.11.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 11:42:22 -0700 (PDT)
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
X-Inumbo-ID: 122a496e-f76a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712774543; x=1713379343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukDAjmcMpf650PdUhUxZlNvZY089aJWuIQPAP0FBqkA=;
        b=s7kUJhfHxwmHk+Y5ecvys////TIrzyO14lA7bpavZp2T8PC/CGRv/cxOPjGioXxA8r
         OyehLb5mOmOnbRuAEo5DRMHxH5lU8HG3bEyP0AdUq9XztO/AHxD9mWLEArnUBy12jhff
         Tgn5DA69Pur/epPiKcBPVNdPM0j2nO1+wf10k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774543; x=1713379343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukDAjmcMpf650PdUhUxZlNvZY089aJWuIQPAP0FBqkA=;
        b=ASXQ7UBSXKELtbp82gTEGtxnjU7ttRz0DXBjmXlXDjHbcX+sjAn3rV7apv4kqx8fx4
         NDsjyMDU0iXByW4/EhYBU44pRoWxT9cF5A20Zb0JyVQ9sUC2Ac5SBtXjUq7jNuYUzU0m
         mFEgYMoj0cJbp5sTBjHOe48JBn0bUylogk+x8XAxzujvpU+kY/abOed+W3jLK98ytCQB
         +9+k9BlETpwJx33eCX4gRpnZeqQN55FQX+Y+wNa9D7GnoBmn3YGK/xFITV/N3ghcSeEr
         LGRQXwUJZOfQ0A50e3HNBGM7frAim8Elljdld5R/A1dMBzBDPMSRWuoxKKSoytcsVug8
         QD/w==
X-Gm-Message-State: AOJu0Yyo9IOgS0VhgsAuj6pia+sM+MxjD2obRMeNcfgJLebYtGMumYMX
	5M4UFkd0ZAFZyQUZizpgeCHrzT9oehbrRWqi2zs+gcCiHaU7QC6sTCrWyFg81IzpCi1vesHtwv1
	H7Lg=
X-Google-Smtp-Source: AGHT+IGDaH/9QknP6CAoXXWRXtTwYi3Gfw6NQpu6oJ7f3XDm1pyEE9CcWbhZL6WN8tVegXQD46jt7g==
X-Received: by 2002:ac2:5df9:0:b0:516:afb5:6a71 with SMTP id z25-20020ac25df9000000b00516afb56a71mr2372510lfq.67.1712774542977;
        Wed, 10 Apr 2024 11:42:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH v2 2/4] xen/virtual-region: Rework how bugframe linkage works
Date: Wed, 10 Apr 2024 19:42:15 +0100
Message-Id: <20240410184217.1482366-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The start/stop1/etc linkage scheme predates struct virtual_region, and as
setup_virtual_regions() shows, it's awkward to express in the new scheme.

Change the linker to provide explicit start/stop symbols for each bugframe
type, and change virtual_region to have a stop pointer rather than a count.

This marginly simplifies both do_bug_frame()s and prepare_payload(), but it
massively simplifies setup_virtual_regions() by allowing the compiler to
initialise the .frame[] array at build time.

virtual_region.c is the only user of the linker symbols, and this is unlikely
to change given the purpose of struct virtual_region, so move their externs
out of bug.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/traps.c             |  5 ++--
 xen/common/bug.c                 |  5 ++--
 xen/common/livepatch.c           |  7 +++--
 xen/common/virtual_region.c      | 45 ++++++++++++++------------------
 xen/include/xen/bug.h            |  6 -----
 xen/include/xen/virtual_region.h |  3 +--
 xen/include/xen/xen.lds.h        |  8 +++++-
 7 files changed, 35 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9cffe7f79005..a8039087c805 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1226,10 +1226,9 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
         for ( id = 0; id < BUGFRAME_NR; id++ )
         {
             const struct bug_frame *b;
-            unsigned int i;
 
-            for ( i = 0, b = region->frame[id].bugs;
-                  i < region->frame[id].n_bugs; b++, i++ )
+            for ( b = region->frame[id].start;
+                  b < region->frame[id].stop; b++ )
             {
                 if ( ((vaddr_t)bug_loc(b)) == pc )
                 {
diff --git a/xen/common/bug.c b/xen/common/bug.c
index c43e7c439735..b7c5d8fd4d4a 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -25,10 +25,9 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
     for ( id = 0; id < BUGFRAME_NR; id++ )
     {
         const struct bug_frame *b;
-        size_t i;
 
-        for ( i = 0, b = region->frame[id].bugs;
-              i < region->frame[id].n_bugs; b++, i++ )
+        for ( b = region->frame[id].start;
+              b < region->frame[id].stop; b++ )
         {
             if ( bug_loc(b) == pc )
             {
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index cabfb6391117..351a3e0b9a60 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -804,12 +804,11 @@ static int prepare_payload(struct payload *payload,
         if ( !sec )
             continue;
 
-        if ( !section_ok(elf, sec, sizeof(*region->frame[i].bugs)) )
+        if ( !section_ok(elf, sec, sizeof(*region->frame[i].start)) )
             return -EINVAL;
 
-        region->frame[i].bugs = sec->load_addr;
-        region->frame[i].n_bugs = sec->sec->sh_size /
-                                  sizeof(*region->frame[i].bugs);
+        region->frame[i].start = sec->load_addr;
+        region->frame[i].stop  = sec->load_addr + sec->sec->sh_size;
     }
 
     sec = livepatch_elf_sec_by_name(elf, ".altinstructions");
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 142f21e18153..7d8bdeb61282 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -9,12 +9,25 @@
 #include <xen/spinlock.h>
 #include <xen/virtual_region.h>
 
+extern const struct bug_frame
+    __start_bug_frames_0[], __stop_bug_frames_0[],
+    __start_bug_frames_1[], __stop_bug_frames_1[],
+    __start_bug_frames_2[], __stop_bug_frames_2[],
+    __start_bug_frames_3[], __stop_bug_frames_3[];
+
 static struct virtual_region core = {
     .list = LIST_HEAD_INIT(core.list),
     .text_start = _stext,
     .text_end = _etext,
     .rodata_start = _srodata,
     .rodata_end = _erodata,
+
+    .frame = {
+        { __start_bug_frames_0, __stop_bug_frames_0 },
+        { __start_bug_frames_1, __stop_bug_frames_1 },
+        { __start_bug_frames_2, __stop_bug_frames_2 },
+        { __start_bug_frames_3, __stop_bug_frames_3 },
+    },
 };
 
 /* Becomes irrelevant when __init sections are cleared. */
@@ -22,6 +35,13 @@ static struct virtual_region core_init __initdata = {
     .list = LIST_HEAD_INIT(core_init.list),
     .text_start = _sinittext,
     .text_end = _einittext,
+
+    .frame = {
+        { __start_bug_frames_0, __stop_bug_frames_0 },
+        { __start_bug_frames_1, __stop_bug_frames_1 },
+        { __start_bug_frames_2, __stop_bug_frames_2 },
+        { __start_bug_frames_3, __stop_bug_frames_3 },
+    },
 };
 
 /*
@@ -133,31 +153,6 @@ void __init unregister_init_virtual_region(void)
 void __init setup_virtual_regions(const struct exception_table_entry *start,
                                   const struct exception_table_entry *end)
 {
-    size_t sz;
-    unsigned int i;
-    static const struct bug_frame *const __initconstrel bug_frames[] = {
-        __start_bug_frames,
-        __stop_bug_frames_0,
-        __stop_bug_frames_1,
-        __stop_bug_frames_2,
-        __stop_bug_frames_3,
-        NULL
-    };
-
-    for ( i = 1; bug_frames[i]; i++ )
-    {
-        const struct bug_frame *s;
-
-        s = bug_frames[i - 1];
-        sz = bug_frames[i] - s;
-
-        core.frame[i - 1].n_bugs = sz;
-        core.frame[i - 1].bugs = s;
-
-        core_init.frame[i - 1].n_bugs = sz;
-        core_init.frame[i - 1].bugs = s;
-    }
-
     core_init.ex = core.ex = start;
     core_init.ex_end = core.ex_end = end;
 
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 77fe1e1ba840..99814c4bef36 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -155,12 +155,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* CONFIG_GENERIC_BUG_FRAME */
 
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_BUG_H__ */
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index dcdc95ba494c..c8a90e3ef26d 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -29,8 +29,7 @@ struct virtual_region
     symbols_lookup_t *symbols_lookup;
 
     struct {
-        const struct bug_frame *bugs; /* The pointer to array of bug frames. */
-        size_t n_bugs;          /* The number of them. */
+        const struct bug_frame *start, *stop; /* Pointers to array of bug frames. */
     } frame[BUGFRAME_NR];
 
     const struct exception_table_entry *ex;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 7ab7aa567872..a17810bb286f 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -115,13 +115,19 @@
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
 #define BUGFRAMES                               \
-    __start_bug_frames = .;                     \
+    __start_bug_frames_0 = .;                   \
     *(.bug_frames.0)                            \
     __stop_bug_frames_0 = .;                    \
+                                                \
+    __start_bug_frames_1 = .;                   \
     *(.bug_frames.1)                            \
     __stop_bug_frames_1 = .;                    \
+                                                \
+    __start_bug_frames_2 = .;                   \
     *(.bug_frames.2)                            \
     __stop_bug_frames_2 = .;                    \
+                                                \
+    __start_bug_frames_3 = .;                   \
     *(.bug_frames.3)                            \
     __stop_bug_frames_3 = .;
 
-- 
2.30.2


