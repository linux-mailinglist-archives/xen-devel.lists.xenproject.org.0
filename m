Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E8BB85A8
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136902.1473413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of1-0007hY-1e; Fri, 03 Oct 2025 22:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136902.1473413; Fri, 03 Oct 2025 22:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of0-0007dV-RK; Fri, 03 Oct 2025 22:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1136902;
 Fri, 03 Oct 2025 22:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oey-0004mK-I2
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d68d6d9a-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:55 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1550895f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:54 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:53 -0700 (PDT)
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
X-Inumbo-ID: d68d6d9a-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532034; x=1760136834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9xT2e+qZfb6j1FUuBgKvZ3n+Jc6Wgtnci0H5fcXpnk=;
        b=d/u7IctkIlWXySaM6mwf/iYi+EEgyZkPLYWtp9ecOxhcF9SE8CwZEAI37XHioYa35G
         s38fY0Oz2H6jxXpN6B7nOL3LVFB41HrKBPbe0NdAoHT79dH4JhVEyVJWBUmlBrrDsSon
         Vd28zFpoMfANKhLs/kaiW13eyDYQtaSHlgsfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532034; x=1760136834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9xT2e+qZfb6j1FUuBgKvZ3n+Jc6Wgtnci0H5fcXpnk=;
        b=CMRgFCjCNr2G/fw8NWO1FyoVP9Jk8aIMLNCSpUwqLmTivXeIrQZ7vA45pzSM4Fdra1
         zYbwqRAA6ibBcuUdFxqvoAQlssb+fBW81ALPofwW47UbnoM0YNftQ6WzxsEXGUFr+hac
         akH5bUZrUA9w18VlPaas/pSgqLGi5opCYuhWhG5e/1IyNVuTl3jcl2fbyAyIWodABq2v
         kmZFlnlJLK4u9BeBx3c8L4uU1EOg4FEJFdqvasFpLDDgKeot/xNkcg8MdghOGWN9b4qa
         EVCtXipmUaSQ9uJ5e/lT263EQoFkyOeNkAgVQE6A58kWbU/ZhhX9xK8rLJbf9H7ptEvY
         2/oA==
X-Gm-Message-State: AOJu0YwnX28bZfLRXlaM89WYDHlqWjtMrx8W1aH/g0ojuC9a5f7UTsh5
	YKZWWC3GU8RcEQD9P46yNxIKTQMemuRdVxUDdYWMcxRpWZY3+c0bDkDCbxspYVeMdJhwrOWZG7n
	p02k9IhfUjw==
X-Gm-Gg: ASbGncs0eJzgktQeAEOAWfzLXJA9uo7ngTXie9tU1SnHw3X/HfdI2C3Og+PvfGfOmWG
	+/RpwJUw33mXuWsytRbHDsfrZlJyG9FQ4cbEiMX7uyQNdPsbBgX6gHO2fdeRR1cG9SaikVBLHq6
	fbzs49TGrAS0hREexnEooC8YKr/BvVmIc07sWJgf7vSuuzZG+v9Ye3aB4Y6FQ2lSO/2TiX+Stzf
	ADBTaeYWGaQBdNJwPbRufLnoBAFAkK0Wrp2QM1YdHXMAwYhBdCvPbVhTDTcFD8xD2gDRahe2iE4
	WXWGvg+kf+6sgc2SNymRdCgDUCD4eus4fg1Dz6dNZP+OQjYmcZLkt2zAZ0aCDiVykaImXG+uwwO
	lysyG9aAX6fFZGxLTRNUHoA7oPRWKY1sj+b0vAcoP68WtS9Q4Ps5aov/sIjvptynbdG5HzubrLp
	5SwewwCxNoGThoAdnaHChA
X-Google-Smtp-Source: AGHT+IGi4Mtp7sUIenwEW+G9jtr4Ezc1L39uJjX80DcyCAfWrdG2uCI/4ZVImOc792lTjwRvYtIy5g==
X-Received: by 2002:a05:6000:3113:b0:3ec:2ef7:2134 with SMTP id ffacd0b85a97d-4256714bb4dmr2598203f8f.18.1759532034126;
        Fri, 03 Oct 2025 15:53:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 11/22] x86/fsgsbase: Make gskern accesses safe under FRED
Date: Fri,  3 Oct 2025 23:53:23 +0100
Message-Id: <20251003225334.2123667-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, the SWAPGS instructions is disallowed.  Therefore we must use the
MSR path instead.

read_registers() is in the show_registers() path, so this allows Xen to render
it's current state without suffering #UD (and recursing until the stack guard
page is hit).

All hardware with FRED is expected to have some kind of non-serialising access
to these registers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Broken out of subsequent patch.  Rebased over MSR cleanup.
---
 xen/arch/x86/include/asm/fsgsbase.h | 8 ++++++--
 xen/arch/x86/traps.c                | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
index 24862a6bfea7..5faa3a324332 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -79,7 +79,9 @@ static inline unsigned long read_gs_base(void)
 
 static inline unsigned long read_gs_shadow(void)
 {
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         return __rdgs_shadow();
     else
         return rdmsr(MSR_SHADOW_GS_BASE);
@@ -103,7 +105,9 @@ static inline void write_gs_base(unsigned long base)
 
 static inline void write_gs_shadow(unsigned long base)
 {
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
         __wrgs_shadow(base);
     else
         wrmsrns(MSR_SHADOW_GS_BASE, base);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d42973660db0..2e3efe45edf4 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -118,7 +118,7 @@ static void read_registers(struct extra_state *state)
     state->cr3 = read_cr3();
     state->cr4 = read_cr4();
 
-    if ( state->cr4 & X86_CR4_FSGSBASE )
+    if ( !(state->cr4 & X86_CR4_FRED) && (state->cr4 & X86_CR4_FSGSBASE) )
     {
         state->fsb = __rdfsbase();
         state->gsb = __rdgsbase();
-- 
2.39.5


