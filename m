Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C978744A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590193.922318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCL8-0008J6-2W; Thu, 24 Aug 2023 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590193.922318; Thu, 24 Aug 2023 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCL7-0008Gn-VB; Thu, 24 Aug 2023 15:33:41 +0000
Received: by outflank-mailman (input) for mailman id 590193;
 Thu, 24 Aug 2023 15:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCEE-0003YM-CC
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:34 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b10dffd-4292-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 17:26:33 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bf0b24d925so106075ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:33 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 s14-20020a170902ea0e00b001b891259eddsm7512696plg.197.2023.08.24.08.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:31 -0700 (PDT)
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
X-Inumbo-ID: 9b10dffd-4292-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890792; x=1693495592;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V/kheUwiQgxdDs0pOrHbflCy4ISDj/iSNuSbONHDx0=;
        b=lFdOlT4U+27qI6wz12JK79ajeEZpRNRip/BCuX91S//QNWgI1oClIYlBvlHYDxDI4W
         FnqWZ/wCIIrYzZqqSLvqUNXZOJQv+2zEWY718yyeDba9SoQGeBILqgV5B0i9jgSxV02Z
         4em9M7dWO32/MYXZP61ahQ0i8Rnw9dqrEIwPalUWfMxZ/t50ch8I8ZDKwhuWVz/dyQn3
         H/rbxW4FclZw1zD5qZh3riu9m2hKW/nclYrmbXNZ4C4tZBmiHe3AQ3VB4I3aCJX+QF17
         J/ccYCRhhck4KbGw4eCe5x0nN5ec28hIMR+FZCTHR99OY4mQGEDAwDQGtd3XPcmsm7Wf
         OhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890792; x=1693495592;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V/kheUwiQgxdDs0pOrHbflCy4ISDj/iSNuSbONHDx0=;
        b=IUlujP1L852giEGHlHQNvbzYEpkZyMz2Jdz0O1/cEIA3UWMzSumhl7LRTWFT+C5jo6
         XE/4Y8p6GENJBpfRgH4xvJf0eR7Lqq39+/22w9EUzOpEdJioCLZFvUMQYjMh38yD8XjV
         gKPNk9hiJxobpl087DB0082itoU35GIqS+NH17JPd1uSOws5JGpGnXxXeurABkCTZBym
         6Sse6lID0D6v8LrJdnY/VnutdIZ4VVLPErpbj206gdBjBxncLLVzhJVLqHmw54jELDMZ
         Rce34d/QHhbT59QC+wLzYmBCCTtCBH70pI6RAVtAGzVY0kXqtsZ7/Bh+A0HFSHj6+g+4
         xqZg==
X-Gm-Message-State: AOJu0YyKZ3l57uaS8UClAF6qhpXYjYALAopy50vvRctbqsE1HJoYhHFE
	kgeAUOQ24kdquQGu1hmuKz8=
X-Google-Smtp-Source: AGHT+IFJ7Ce2yddh07iVGcGII6LjPfm3vVNPicVwmjyqybG6z+3B8HzDrAYX2thWkugpHOH3dxf4kg==
X-Received: by 2002:a17:90b:1d90:b0:268:414c:ff3 with SMTP id pf16-20020a17090b1d9000b00268414c0ff3mr12472188pjb.23.1692890792247;
        Thu, 24 Aug 2023 08:26:32 -0700 (PDT)
Message-ID: <a21b30b8-7ed8-b5e3-f947-e8abb95ce28a@gmail.com>
Date: Fri, 25 Aug 2023 00:26:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 7/8] x86: Fix merging of new status bits into %dr6
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

The current logic used to update %dr6 when injecting #DB is buggy.  The
architectural behaviour is to overwrite B{0..3} (rather than accumulate) and
accumulate all other bits.

Introduce a new merge_dr6() helper, which also takes care of handing RTM
correctly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
[ jinoh: Rebase onto staging, move constants to x86-defns.h ]
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

v1 -> v2: [S-o-b fixes.]
---
 xen/arch/x86/hvm/svm/svm.c           |  3 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |  3 ++-
 xen/arch/x86/include/asm/debugreg.h  | 20 +++++++++++++++++++-
 xen/arch/x86/include/asm/x86-defns.h |  6 ++++++
 xen/arch/x86/pv/traps.c              |  3 ++-
 5 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 7bb572e72b..c92b2d7f86 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1338,7 +1338,8 @@ static void cf_check svm_inject_event(const struct x86_event *event)
          * Item 2 is done by hardware when injecting a #DB exception.
          */
         __restore_debug_registers(vmcb, curr);
-        vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | _event.pending_dbg);
+        vmcb_set_dr6(vmcb, merge_dr6(vmcb_get_dr6(vmcb), _event.pending_dbg,
+                                     curr->domain->arch.cpuid->feat.rtm));
 
         /* fall through */
     case X86_EXC_BP:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b35278992a..377f33d632 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2030,7 +2030,8 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
          * All actions are left up to the hypervisor to perform.
          */
         __restore_debug_registers(curr);
-        write_debugreg(6, read_debugreg(6) | event->pending_dbg);
+        write_debugreg(6, merge_dr6(read_debugreg(6), event->pending_dbg,
+                                    curr->domain->arch.cpuid->feat.rtm));
 
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
              !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index f83b1b96ec..5fdd25d238 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -22,7 +22,6 @@
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-#define DR_STATUS_RESERVED_ONE  0xffff0ff0UL /* Reserved, read as one */
 
 /* Now define a bunch of things for manipulating the control register.
    The top two bytes of the control register consist of 4 fields of 4
@@ -89,6 +88,25 @@ static inline unsigned long adjust_dr6_rsvd(unsigned long dr6, bool rtm)
     return dr6;
 }
 
+static inline unsigned long merge_dr6(unsigned long dr6, unsigned long new,
+                                      bool rtm)
+{
+    /* Flip dr6 to have positive polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    /* Sanity check that only known values are passed in. */
+    ASSERT(!(dr6 & ~X86_DR6_KNOWN_MASK));
+    ASSERT(!(new & ~X86_DR6_KNOWN_MASK));
+
+    /* Breakpoints 0-3 overridden.  BD, BS, BT and RTM accumulate. */
+    dr6 = (dr6 & ~X86_DR6_BP_MASK) | new;
+
+    /* Flip dr6 back to having default polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    return adjust_dr6_rsvd(dr6, rtm);
+}
+
 static inline unsigned long adjust_dr7_rsvd(unsigned long dr7, bool rtm)
 {
     dr7 |= X86_DR7_MBS;
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index b13ca680c2..6d76d5dcc5 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -118,6 +118,12 @@
 #define X86_DR6_MBS_BASE        (0xfffe0ff0UL)  /* Reserved, read as one   */
 #define X86_DR6_MBS_NO_RTM      (X86_DR6_RTM)   /* - if RTM unavailable    */
 
+#define X86_DR6_BP_MASK                                 \
+    (X86_DR6_B0 | X86_DR6_B1 | X86_DR6_B2 | X86_DR6_B3)
+
+#define X86_DR6_KNOWN_MASK                                              \
+    (X86_DR6_BP_MASK | X86_DR6_BD | X86_DR6_BS | X86_DR6_BT | X86_DR6_RTM)
+
 #define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
 
 /*
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 4f5641a47c..65b41e6115 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -66,7 +66,8 @@ void pv_inject_event(const struct x86_event *event)
         break;
 
     case X86_EXC_DB:
-        curr->arch.dr6 |= event->pending_dbg;
+        curr->arch.dr6 = merge_dr6(curr->arch.dr6, event->pending_dbg,
+                                   curr->domain->arch.cpuid->feat.rtm);
         /* Fallthrough */
 
     default:
-- 
2.41.0


