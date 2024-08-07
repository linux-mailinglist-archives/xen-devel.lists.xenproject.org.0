Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5D94A8F4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773500.1183946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1x-0005Me-Io; Wed, 07 Aug 2024 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773500.1183946; Wed, 07 Aug 2024 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh1x-0005HQ-E0; Wed, 07 Aug 2024 13:48:45 +0000
Received: by outflank-mailman (input) for mailman id 773500;
 Wed, 07 Aug 2024 13:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1v-0005AD-It
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c193147c-54c3-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 15:48:41 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso2854813a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:41 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:40 -0700 (PDT)
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
X-Inumbo-ID: c193147c-54c3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038521; x=1723643321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7eodO/9HzqH08fbvCI7vy2Uyw8SnwXrkAc77uD4d2A=;
        b=eBmFeBDkNd87aJhO+ZE7x/ImfPfj+wxGn0b6RqJRAry5eqGWjMu2VUkh3mniOF1LUY
         8kJfDYYZkcDYt+MEkFIgHLYwdSVQlsQga4mP3d/xyAiQMoAPUJysjYgxXKw96el3Wxy/
         GEmzKfZkfRwpLxhevcFbs85MkQwB77S3BpB7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038521; x=1723643321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7eodO/9HzqH08fbvCI7vy2Uyw8SnwXrkAc77uD4d2A=;
        b=Z/JNdUw//WdfpfZ1FMEzStTe2l3w2u/IHPrhWSFpk00EdoS/c5qQHpcsmvR7dR5+D/
         C4dSPxIyitib2C8Bn07m9I4L924HopFlXXPXzRkyUuQ9FDd/HyOKLjTDBUx6t8URqPGD
         omodKRDHbPyX183YMItTs3E2JR63diKKgu2f1OY2fGA+kcU5PCIsf3fIRMMO+3T1ZHzZ
         ahVx73ytZ76Sq4kbMQsSCupIrklq08P7MnxHN0mYM6XJ/qAxx7+ZguPmr8afRGtWHCjy
         5XJ4hESuJfK//08o2ltT6/TkqVzz9cPLxy/Z4xuCSycAPuRPPRaLaY57YuGQWL+ghNTN
         QSnw==
X-Gm-Message-State: AOJu0Ywkf6nM/fM8uHMTgUZwJzAKD1RYO2D0dprDUcwSk5Mz1qeX7jLk
	dr+NwXnhu8lcWM53IJtongKm/79S0hkU7OWu38JCLXTiSxa+++hYLBP0qvmHi0X7g/Vmu6XMXOl
	4
X-Google-Smtp-Source: AGHT+IHfPjkr6YvB77y4L8XA3v+BcfW12X55BGLdGL+x8IdxKIMhcYOiZjiZPba6g4zjb1J6DD+tUA==
X-Received: by 2002:a05:6402:2032:b0:5a3:a4d7:caf5 with SMTP id 4fb4d7f45d1cf-5b7f5dc13cemr11942212a12.36.1723038520673;
        Wed, 07 Aug 2024 06:48:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86: Put trampoline in .init.data section
Date: Wed,  7 Aug 2024 14:48:15 +0100
Message-ID: <20240807134819.8987-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change allows to put the trampoline in a separate, not executable
section. The trampoline contains a mix of code and data (data which
is modified from C code during early start so must be writable).
This is in preparation for W^X patch in order to satisfy UEFI CA
memory mitigation requirements.
At the moment .init.text and .init.data in EFI mode are put together
so they will be in the same final section as before this patch.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494..f027ff45fd 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -870,6 +870,8 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+        .section .init.data, "aw", @progbits
+        .align 4
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-- 
2.45.2


