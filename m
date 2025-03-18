Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41FA67DC9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 21:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919835.1324188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tudGq-0007Ms-V7; Tue, 18 Mar 2025 20:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919835.1324188; Tue, 18 Mar 2025 20:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tudGq-0007L8-SM; Tue, 18 Mar 2025 20:10:40 +0000
Received: by outflank-mailman (input) for mailman id 919835;
 Tue, 18 Mar 2025 20:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tudGp-0007ED-J9
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 20:10:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e30501f-0435-11f0-9abc-95dc52dad729;
 Tue, 18 Mar 2025 21:10:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so3956648f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 13:10:37 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8e43244sm19461285f8f.60.2025.03.18.13.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 13:10:35 -0700 (PDT)
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
X-Inumbo-ID: 0e30501f-0435-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742328636; x=1742933436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFR6Lx+8uzZeDNvYQXJ4wfVsC/h5Eercmey8e2APULw=;
        b=VweKSMPz741jk/q6Vo7YqgbERbuBQPLyzr7UeQu62gy05MufVgLhtNVOXl7xjfpkD/
         vdrfvsi8SS2FL1kmuN5xrR1Sw3xUPPuKpxtVJwayfbzmckhMj7TZ9PXbBS3vjKk4LaJc
         t9pPXeGYgqvXUn9w9Hs8pVDCDA2QdSOJXOdF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742328636; x=1742933436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFR6Lx+8uzZeDNvYQXJ4wfVsC/h5Eercmey8e2APULw=;
        b=WApJvaG4lJYQxg5Vi7Htk9efg2s25cJP3rpH9aQUfJVV3n6afIJk7vNW+yKMwC68wC
         1DTO1/K155brZwS/ynJXBpvNnRlZmoLyCY67/w3ABIKwG9fxjvmhWkP7La+4vN3QQ8Us
         F8p5rIXJb36t4cn3gy5k+8M2AC9eRcg/tBrs027vqHYGroRmZpF44Bthz/QnR/k4cacH
         ELeR9eqzQB7jWdPcAgeAgwzd4uiG7XMSMLARlWL4LC9fqaTO0K+P2sj0S960NZRtNPGU
         jJblnutsNEpY3tLMbnAphZBAaaEZslZWEHtdu6SEV/dDgsjft+KswmyqxnyydsWvTjyI
         1rKQ==
X-Gm-Message-State: AOJu0YxQbSQzih8grWV5+Ndi4qFJ1VoUxyFGdvi/1l2Yw93bzlhndTQC
	kYBVBoW0gbAoLsXWLXwtnwXe25Rj1bafCm6HAIUQ/SyAhSja4rz38emDKXf2XLRCdlXPeoDcVHP
	w
X-Gm-Gg: ASbGncs6YqFJt5qpppAR70IKqggHMxN2H+W/FmT+Ik4lNLR8L+L6ceL8IvI+NDjBRVc
	ZAkKu4+Zj+GUczE0C2TuEJSiy64pmone1dRklixdUX0XrpIefVehEf3toJgpaNqnx4oOdyXUAPv
	uJ4t0j6SCZ2qmXYRpstsJ1NFdrIBXn8uOjsEczify5RGEQuJLFuXJCPuWo5sZfejYzN/wd1g6/M
	eMS9BbMYc3P+IRP1UuakkiMOmjLUKLXfy0t0C9MXDQmngCYwQXTgKonAcueJLVuZIcrTw/4sA7P
	r/gm7Af4anPGzcjkMyF/rXM/FJMlfNM3OWBzWYdtrtq9U8Sit2AhcRogFVtqxmEsaPEDObpJ6vN
	99J3n0O95mH5JtpUJtw==
X-Google-Smtp-Source: AGHT+IF3xt8IgQaRZ0eJiLa7QP9lzQSYg8i0Euh7oY75H4PisSLSn7Q07w2IUMdrivXI907/5rRMSg==
X-Received: by 2002:a05:6000:1ac8:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39973b356e1mr73456f8f.52.1742328635827;
        Tue, 18 Mar 2025 13:10:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Untangle the trampoline copying/entry logic
Date: Tue, 18 Mar 2025 20:10:33 +0000
Message-Id: <20250318201033.60634-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318173547.59475-5-roger.pau@citrix.com>
References: <20250318173547.59475-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LRET is detached from the PUSHes which set it up, and this is about to get
worse with the changes to trampoline relocation.  For the sake of one variable
read, the complexity is not worth it.

Reorder the logic to copy the trampoline into place, then switch stack and
enter the trampoline.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Roger: I'd like this to be a prerequisite to your "[PATCH 4/7] x86/boot: apply
trampoline relocations at destination position" to avoid the movement of
reloc_trampoline32() making things worse.
---
 xen/arch/x86/boot/head.S | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 59a2b5005cf6..4082d7c6c0a0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -697,19 +697,20 @@ trampoline_setup:
         call    cmdline_parse_early
 
 1:
-        /* Switch to low-memory stack which lives at the end of trampoline region. */
-        mov     sym_esi(trampoline_phys), %edi
-        lea     TRAMPOLINE_SIZE(%edi), %esp
-        lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
-        pushl   $BOOT_CS32
-        push    %eax
-
         /* Copy bootstrap trampoline to low memory, below 1MB. */
         lea     sym_esi(trampoline_start), %esi
+        mov     sym_esi(trampoline_phys), %edi
         mov     $((trampoline_end - trampoline_start) / 4),%ecx
         rep movsl
 
-        /* Jump into the relocated trampoline. */
+        /* Switch to low-memory stack which lives at the end of trampoline. */
+        mov     sym_esi(trampoline_phys), %edi
+        lea     TRAMPOLINE_SIZE(%edi), %esp
+
+        /* Enter the trampoline at trampoline_boot_cpu_entry(). */
+        lea     trampoline_boot_cpu_entry - trampoline_start(%edi), %eax
+        pushl   $BOOT_CS32
+        push    %eax
         lret
 
 ENTRY(trampoline_start)
-- 
2.39.5


