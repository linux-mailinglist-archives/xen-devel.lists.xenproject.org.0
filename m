Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B998BC07
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808059.1219850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svbvp-0000nw-GS; Tue, 01 Oct 2024 12:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808059.1219850; Tue, 01 Oct 2024 12:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svbvp-0000ko-DE; Tue, 01 Oct 2024 12:24:45 +0000
Received: by outflank-mailman (input) for mailman id 808059;
 Tue, 01 Oct 2024 12:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svbvo-0000ki-ER
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:24:44 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a4f42b-7ff0-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:24:42 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso830994566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:24:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c70fesm700089266b.57.2024.10.01.05.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:24:40 -0700 (PDT)
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
X-Inumbo-ID: 22a4f42b-7ff0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727785481; x=1728390281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHkm+gTmN+S5hP1Q9mE4edudlBV+IDvZ/Wxl24devZo=;
        b=ugbyEaEGFXDTnyR8o+7bO1koejkUPi1y6jVcxTF7fHmUgfYIC3MsSJR3u2qjqlESnf
         R8IFNMxla3Byb70AGDjfUO+pVQZJ7mxWLyDW511zcL5urh4TpJ/qzay6Wf6URpwgjngs
         8MjZlGeQhBF/2dQ4EARrkLdwrXroTRWkoauLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727785481; x=1728390281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHkm+gTmN+S5hP1Q9mE4edudlBV+IDvZ/Wxl24devZo=;
        b=FmRK7QVnSswq0mY51VAYV51GrqzAHgxE2PzMT+kzDUYqFbQNE66OwDxMt3WmvpAj7m
         wb0ZWom7gUKO1WWEVi1CS0L93PduuoxpdYZH04+hkHDWOyUddvgfLYvrEUozphcQ9n9y
         KIj5MddKcnjyPt5s2UFZpF4pzM7za4yTmlHDWjxHcZDBrgdF1izkmzR+UiBnRc+CHIkc
         bt8ju6butepMMEvX7MXtTdJB41b/JA4yqQ6XZZW0bK087utx/ybs/wyo7NO8GnqCf1uU
         T/cCp/HEAfSNfae5Pr1v04rUHU1/6YWohexeCXSkFCNjIx/6v5usmwLpUQDb9FDziF5o
         WeLg==
X-Gm-Message-State: AOJu0Yw2CeZLPH57fLpjz4DwNP7BscyLBbKsd0vA/vUIdd5+gIW2OyDg
	OM1oE9+vl+wI5++G1e973xsKoOG/8jK2LvFZlrC974RAud34VZ0jNe5Px4M2OHo2QJQYq+BFvmk
	Tf3QFnA==
X-Google-Smtp-Source: AGHT+IFXb+nZshPjMeWW4itYiYhIxAwo6/5FdstYB+n+kXcxh8r2whiBxQZfHzyKz+GNVCW6/W4dzw==
X-Received: by 2002:a17:907:7e8c:b0:a8d:2ab2:c9a0 with SMTP id a640c23a62f3a-a93c4aae066mr1531904366b.53.1727785481370;
        Tue, 01 Oct 2024 05:24:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/2] x86/pv: Rename pv.iobmp_limit to iobmp_nr and clarify behaviour
Date: Tue,  1 Oct 2024 13:24:38 +0100
Message-Id: <20241001122438.1454218-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ever since it's introduction in commit 013351bd7ab3 ("Define new event-channel
and physdev hypercalls"), the public interface was named nr_ports while the
internal field was called iobmp_limit.

Rename the intenral field to iobmp_nr to match the public interface, and
clarify that, when nonzero, Xen will read 2 bytes.

There isn't a perfect parallel with a real TSS, but iobmp_nr being 0 is the
paravirt "no IOPB" case, and it is important that no read occurs in this case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h | 2 +-
 xen/arch/x86/physdev.c            | 2 +-
 xen/arch/x86/pv/emul-priv-op.c    | 7 ++++++-
 xen/include/public/physdev.h      | 3 +++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 811251852f79..bdcdb8de09f1 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -573,7 +573,7 @@ struct pv_vcpu
 
     /* I/O-port access bitmap. */
     XEN_GUEST_HANDLE(uint8) iobmp; /* Guest kernel vaddr of the bitmap. */
-    unsigned int iobmp_limit; /* Number of ports represented in the bitmap. */
+    unsigned int iobmp_nr;    /* Number of ports represented in the bitmap. */
 #define IOPL(val) MASK_INSR(val, X86_EFLAGS_IOPL)
     unsigned int iopl;        /* Current IOPL for this VCPU, shifted left by
                                * 12 to match the eflags register. */
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index d6dd622952a9..69fd42667c69 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -436,7 +436,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #else
         guest_from_compat_handle(curr->arch.pv.iobmp, set_iobitmap.bitmap);
 #endif
-        curr->arch.pv.iobmp_limit = set_iobitmap.nr_ports;
+        curr->arch.pv.iobmp_nr = set_iobitmap.nr_ports;
         break;
     }
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e35285d4ab69..cefa38d56138 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -167,7 +167,12 @@ static int guest_io_okay(unsigned int port, unsigned int bytes,
     if ( iopl_ok(v, regs) )
         return X86EMUL_OKAY;
 
-    if ( (port + bytes) <= v->arch.pv.iobmp_limit )
+    /*
+     * When @iobmp_nr is non-zero, Xen, like real CPUs and the TSS IOPB,
+     * always reads 2 bytes from @iobmp, which might be one byte beyond
+     * @nr_ports.
+     */
+    if ( (port + bytes) <= v->arch.pv.iobmp_nr )
     {
         const void *__user addr = v->arch.pv.iobmp.p + (port >> 3);
         uint16_t mask;
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index 45e1c18541c8..3149049a9a57 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -87,6 +87,9 @@ DEFINE_XEN_GUEST_HANDLE(physdev_set_iopl_t);
 /*
  * Set the current VCPU's I/O-port permissions bitmap.
  * @arg == pointer to physdev_set_iobitmap structure.
+ *
+ * When @nr_ports is non-zero, Xen, like real CPUs and the TSS IOPB, always
+ * reads 2 bytes from @bitmap, which might be one byte beyond @nr_ports.
  */
 #define PHYSDEVOP_set_iobitmap           7
 struct physdev_set_iobitmap {
-- 
2.39.5


