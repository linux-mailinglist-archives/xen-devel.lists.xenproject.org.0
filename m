Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070A97A09A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 13:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799445.1209429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAMz-00025m-T1; Mon, 16 Sep 2024 11:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799445.1209429; Mon, 16 Sep 2024 11:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqAMz-00024E-PA; Mon, 16 Sep 2024 11:58:17 +0000
Received: by outflank-mailman (input) for mailman id 799445;
 Mon, 16 Sep 2024 11:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1kI=QO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sqAMy-000245-KM
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 11:58:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a7762e-7422-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 13:58:15 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3d209db94so5415251a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 04:58:15 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89e2asm2500130a12.73.2024.09.16.04.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 04:58:13 -0700 (PDT)
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
X-Inumbo-ID: f4a7762e-7422-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726487894; x=1727092694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgli94T5IvKHrvjdJOUG8o91INAl/rQ7Yqo8UEG2KRo=;
        b=ppKhakFkYB3u1hrFkjOXmeFehOvg+TdMGmZcTJArVCENMD+WGpaDB4uJJ2w2hZqUnN
         zr1Jqq1Oxj8fleGUJixH26cPT6fEEenq+IQKk6R/20QmuyuK6p4iotypwmGeuCv61YMf
         Ko/uqOcM40sSjBWbNmIZx08zCOPZmpNLavNQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487894; x=1727092694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wgli94T5IvKHrvjdJOUG8o91INAl/rQ7Yqo8UEG2KRo=;
        b=nEv0/YI973IDhfhi6CEobWaZy77c5IWtKciCYzgoZwSMC/ePQc5QOvvqmUIw5n2Hyy
         pKkH2yUuJP4Va+rynS1U0NQd+t6sVCedfAXqsdG7wUUWtbGM9lRhc3WX6v2t7yBLFcC3
         eNlReJxRt32+HUzaWf3cdTf+OeQor10VVMR8p1lfIRiKBx7XpBiHoxb1gN82PykspzOZ
         ktYWI7X75f+lYiCiEB+r8SyggwswqCoIK1X/w+mEhp60haBchmB1FsOvGj9jH+vzSndc
         ezVlXKqk/bnf5dp4sUMfUrbDOzQ8bDI2LH3TqBD6XHSOGhFOlwJvUEDlCbRZzh9CSolD
         KsHg==
X-Gm-Message-State: AOJu0YwyliRM3uJWXU2oPUmYs2jbNQF9Oi4/gBRtH9lZYa14EjJ+0NiW
	8QjMFTMSFgb5obkUR5cyWrAHPwGNPCLD2pIgWh1CFcjN8qUYERkZwKOUxcOTcikcdymJMHV/flm
	b
X-Google-Smtp-Source: AGHT+IEiYNbxJR2X7/ijr6rofODyq0phRo8bDyjb7Jc3KymtlRi/GrwhzXz42ovCHoFOjxPwnCFBvQ==
X-Received: by 2002:a05:6402:5114:b0:5c4:233a:4d3 with SMTP id 4fb4d7f45d1cf-5c4233a07f9mr8886419a12.5.1726487893695;
        Mon, 16 Sep 2024 04:58:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] x86/boot: Drop stale comment about zeroing the stack
Date: Mon, 16 Sep 2024 12:58:11 +0100
Message-Id: <20240916115811.2076392-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This used to be true, but was altered by commit 37786b23b027 ("x86/cet: Remove
writeable mapping of the BSPs shadow stack") which moved cpu0_stack into
.init.bss.stack_aligned.

Fixes: 37786b23b027 ("x86/cet: Remove writeable mapping of the BSPs shadow stack")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 12bbb97f33d4..cfc5a7b47d29 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -652,11 +652,7 @@ trampoline_setup:
         cmpb    $0, sym_esi(efi_platform)
         jnz     1f
 
-        /*
-         * Initialise the BSS.
-         *
-         * !!! WARNING - also zeroes the current stack !!!
-         */
+        /* Initialise the BSS. */
         lea     sym_esi(__bss_start), %edi
         lea     sym_esi(__bss_end), %ecx
         sub     %edi,%ecx

base-commit: a8bf14f6f331d4f428010b4277b67c33f561ed19
-- 
2.39.2


