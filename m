Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE39BB85A3
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136894.1473373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oev-0006S0-68; Fri, 03 Oct 2025 22:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136894.1473373; Fri, 03 Oct 2025 22:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oeu-0006Qg-VL; Fri, 03 Oct 2025 22:53:52 +0000
Received: by outflank-mailman (input) for mailman id 1136894;
 Fri, 03 Oct 2025 22:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oet-0004mK-Fx
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38ebc6e-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:49 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1431509f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:49 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:48 -0700 (PDT)
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
X-Inumbo-ID: d38ebc6e-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532029; x=1760136829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egy9XQtSd+4RovGW/slEPJzeLJH9pzKr20RQT1jfE7o=;
        b=WRNJem83pjebqXEDrsReTnpufgiqBqASUlGogbTOaK3T+c54DywCdZemK/+Jesmvco
         tCN9s4i3aAZi4FjKIG6Enqth0kVnWWSLCj/SxP6E1GR/SM1Ik1UdRjqDlcMfQShTksrK
         zMlRFWnZ+ZufsILkT1rfJSOBNsq6fUiCyhaZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532029; x=1760136829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egy9XQtSd+4RovGW/slEPJzeLJH9pzKr20RQT1jfE7o=;
        b=vtG14IklNPmd/KRFToKhw6Dlg0i9otYp+sTHSIPyvGw3XwGagQ4TJGF3i3BT1cGUgW
         rBfYnZ5z8qHPnfx9zigeUh4LUlIKWf3/eVOqddJAIR1a2+yEAD6zHs9KyNnBPY0FYHMt
         Yp/nsi60JXPQ9hJLD88OgnwT5smbts0tF5QQ8VwnWnoa7jTDGOq5BgqQ3Nwr2XxIaCeQ
         5pgne6UjZo/FMD5BdWdR37CNE/En0bOJ1o6TcpF34bP/sEiKQM6cGJSRiCNtppDGfs2g
         IitaKYzWIsPtwphcHs8+aeKHiEN1s7bIqMT3Tuh9iqzgajhaaAbF+tTe/GsYYJXJzj1H
         b7Tw==
X-Gm-Message-State: AOJu0YzU/Ptuyp2hJmK6hy+Xgn8vYDJdb4QdbclFBb1kteI1Sb+9bG/k
	1FR6uBuWWbHq0Iiof7gBNtNi9lpuiZtaW88+ZT2aQmvSN0nqwHO0hIapkmakWkVhyhr48Z9gEkA
	oAWhMGwsuZQ==
X-Gm-Gg: ASbGncsHT38Bm9UeT51Xy5UYGQMyEwSBNO7ylBH7VKPfJLp7APuGr2UUfgANOCcTqQd
	GGsCB7tO81usqkZgkk8jqqVdn5/MkS2MS8dIuxXFdaM/DNJncnMPoHuN9Eq2JPY+mfvpINV+s3X
	NtAnK1bLuhBrEmgGmZK5+i5F/AHqgbyyDoYET3AqolQ+cMoGbp4cgcE8QV4Wb6gmBZYlkgM++MX
	8gyr9rBf35kb/LH35ynENZDrQtWvJzYdIZjRpChtzlrX17SYUtW6riFNILcC4twCst+IOsY4s4e
	hy0KIPfLoMaU9STTCuweSTURJbgobE6kWfO57hN+KgV0wSIifF4rxLYrMeLAzG6kGQpP2h71Zju
	qzaXuYgI3bkG9PT5enUNUQtVkTweiMShtC1/i3DChNjTQJGgPbpStjg9QrALrvOUOZjfycC1Ns+
	0nw2tTpONWMWQYkPUVmWJI7jGw4NuoSXI=
X-Google-Smtp-Source: AGHT+IGtvZy7Y0lcTeWbgV03qNMHhHkYQjEPeUOIGpdUskckyAr1jrPc6VfxAO5QqrfVmrd51d5Ohw==
X-Received: by 2002:a05:6000:2c0c:b0:3ec:6259:5079 with SMTP id ffacd0b85a97d-4256713a066mr3255902f8f.11.1759532029079;
        Fri, 03 Oct 2025 15:53:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for FRED mode
Date: Fri,  3 Oct 2025 23:53:19 +0100
Message-Id: <20251003225334.2123667-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
means that switch_stack_and_jump() needs to discard one extra word when FRED
is active.

Fix a typo in the parameter name, which should be shstk_base.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
to parse as an instruction immediate.

v3:
 * Fix a typo in the parameter name.
v2:
 * Use X86_FEATURE_XEN_FRED
---
 xen/arch/x86/include/asm/current.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index c1eb27b1c4c2..62817e8476ec 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
     "rdsspd %[ssp];"                                            \
     "cmp $1, %[ssp];"                                           \
     "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
-    "mov $%c[skstk_base], %[val];"                              \
+    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
+                "mov $%c[shstk_base] + 8, %[val];",             \
+                X86_FEATURE_XEN_FRED)                           \
     "and $%c[stack_mask], %[ssp];"                              \
     "sub %[ssp], %[val];"                                       \
     "shr $3, %[val];"                                           \
@@ -188,7 +190,7 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
               [ssp] "=&r" (tmp)                                         \
             : [stk] "r" (guest_cpu_user_regs()),                        \
               [fun] constr (fn),                                        \
-              [skstk_base] "i"                                          \
+              [shstk_base] "i"                                          \
               ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
               [stack_mask] "i" (STACK_SIZE - 1),                        \
               _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
-- 
2.39.5


