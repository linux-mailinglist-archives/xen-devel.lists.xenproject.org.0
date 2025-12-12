Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBACB9EA9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185898.1507855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVB-0004sv-QN; Fri, 12 Dec 2025 22:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185898.1507855; Fri, 12 Dec 2025 22:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVB-0004pn-Lc; Fri, 12 Dec 2025 22:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1185898;
 Fri, 12 Dec 2025 22:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBV9-0004Ar-T6
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c994d10b-d7a8-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 23:20:38 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so944756f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:38 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:37 -0800 (PST)
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
X-Inumbo-ID: c994d10b-d7a8-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578038; x=1766182838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyZGG1ygUMUNjDL5OLP0NhL/jpu/4gZZc2fwoRc5MXU=;
        b=u1mps+EnvP7auSoNtrTmBX76G4QcGPBLsxbSDde9BQC3JJ3kxBiHxUHGFQVoZ1c3m9
         rU8XkZj5/mHHzyjuALzcsBHp2z3/43pFSmq/Po3I+dJD59FsTEuwfCRwXTf5ZhiIBFL5
         Flm5jNW3ES5C9LExzBizYK0YZgQfON/0W2L8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578038; x=1766182838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OyZGG1ygUMUNjDL5OLP0NhL/jpu/4gZZc2fwoRc5MXU=;
        b=LL3tPG1453s2cvJI1/UFRKNN6n2u41Zv71JrBeDXtg8iUGqNJwQ3lsdDjTCDewpA4z
         cRCJD9cPj6DXvza4SF3ITz9pNjGU5ej2ezn/Gzq1iW2KGoQhEoOylS1FmQXwE1a6rO4C
         Qj0TtAClKsb9tWtZeZBoWWTy4hBD29LE3CNgZN+hm3Hb0uK8/WBHdkXdqz2Psh6CG3+o
         yiRBDT5kagr8PScTYmdVtgetyyKcozac12nFuZOU0Oto+q44n+hiR46CklmrOU/zCmPz
         k7JQYBrikExVX8/EFIY5m08m3Y9KVFoq/c8aQeNUHtF7yhnmc7BjCv0qpwUsCPzcCXAL
         mMdQ==
X-Gm-Message-State: AOJu0Yx8YWZgBozPSwi+JTdGdquzRn7c1oekFHyIGc3mgY0c24bMBPoy
	cjA6YmAkZiRrP1z1GteMk2XCFPOgAQ/FlxZYnwwLkOoImgYSDl8MHsn3vlh5YTnmagW70+eEev4
	M9C+/
X-Gm-Gg: AY/fxX7CHElMNz04rhxsllb6t3uQLsJXHLGeMsNK4SKCme8jqoRzLLVpu2P9micfyda
	7g5Cw/EBZXeltH5pMANKQKKPJb6QApqYZRP+/FX7Yxgg/PW7557X9uQ6lM4kevrVG+ndrlveaCi
	LM0/Eev9vrH7rUBYhPqN6cFuK2TzpnQOshh0xJzCifh0cBeJw8SOJTU3rJgDbpydvu8oYuzYPaS
	N3atoIYHh/64gcoq6koo3cejxtFb7NVIYT4PFDBLQp2H0wpTxYXJpKu4sOCpCZ542vnqN5p/UnI
	Yri+mdWnACCBMtE5obsgnjRMWdrA/+GKqxfCDvGPH7UZJa7I5vojopQ954y41/BP3Xtmt+aqDbU
	i7Z2P61ZxpMJlbPZTtB9xwSB4jW7YZq9Py07kWD1tikwuvFQIrMHNYEbzXoLN+rSyFyQq8zuHoj
	huTNgWn9WzQ+z99hC8YTy50jMFGlNmhnMab6d2Tnm23wqNL6KLgSM9yx2ddD0J9g==
X-Google-Smtp-Source: AGHT+IEZaNzPYFn3TDq7ikgSgUJ4bznYDpM+vmENe+1Wa9S5DEc+y3RDl3/Lc8P+ud530mgQw3Zj+Q==
X-Received: by 2002:a5d:64c3:0:b0:429:eb80:11f5 with SMTP id ffacd0b85a97d-42fab27d472mr7902693f8f.26.1765578037746;
        Fri, 12 Dec 2025 14:20:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 4/5] x86: Address MIRSA R8.4 (declaration visibility) issues
Date: Fri, 12 Dec 2025 22:20:31 +0000
Message-Id: <20251212222032.2640580-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

set_guest_*_trapbounce() are only called from assembly so gain asmlinkage to
identify them.

xen_msr_s_cet_value() is called by assembly and C, so asmlinkage isn't
appropriate.  Make the declaration unconditional, which silences the
complaint.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/pv/traps.c | 4 ++--
 xen/arch/x86/setup.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index c3c0976c440f..26a468108a77 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -99,7 +99,7 @@ void pv_inject_event(const struct x86_event *event)
  * Called from asm to set up the MCE trapbounce info.
  * Returns false no callback is set up, else true.
  */
-bool set_guest_machinecheck_trapbounce(void)
+bool asmlinkage set_guest_machinecheck_trapbounce(void)
 {
     struct vcpu *curr = current;
     struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
@@ -114,7 +114,7 @@ bool set_guest_machinecheck_trapbounce(void)
  * Called from asm to set up the NMI trapbounce info.
  * Returns false if no callback is set up, else true.
  */
-bool set_guest_nmi_trapbounce(void)
+bool asmlinkage set_guest_nmi_trapbounce(void)
 {
     struct vcpu *curr = current;
     struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 44da5efa1d20..27c63d1d97c9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -877,6 +877,8 @@ static void noreturn init_done(void)
     startup_cpu_idle_loop();
 }
 
+unsigned int xen_msr_s_cet_value(void); /* To avoid ifdefary, and placate MISRA */
+
 #if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
 /*
  * Used by AP and S3 asm code to calcualte the appropriate MSR_S_CET setting.
@@ -888,8 +890,6 @@ unsigned int xen_msr_s_cet_value(void)
     return ((cpu_has_xen_shstk ? CET_SHSTK_EN | CET_WRSS_EN : 0) |
             (cpu_has_xen_ibt   ? CET_ENDBR_EN : 0));
 }
-#else
-unsigned int xen_msr_s_cet_value(void); /* To avoid ifdefary */
 #endif
 
 /* Reinitalise all state referring to the old virtual address of the stack. */
-- 
2.39.5


