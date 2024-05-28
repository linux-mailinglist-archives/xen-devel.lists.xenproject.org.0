Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204A8D206B
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731216.1136606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sByo5-0003nc-8i; Tue, 28 May 2024 15:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731216.1136606; Tue, 28 May 2024 15:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sByo5-0003m4-64; Tue, 28 May 2024 15:32:09 +0000
Received: by outflank-mailman (input) for mailman id 731216;
 Tue, 28 May 2024 15:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sByo2-0003hj-U6
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:32:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 708e402e-1d07-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 17:32:06 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57822392a0dso1278570a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:32:06 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579d65934ddsm2736883a12.38.2024.05.28.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:32:05 -0700 (PDT)
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
X-Inumbo-ID: 708e402e-1d07-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716910325; x=1717515125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xHve6PL7KT+Q9OZMD1lypR2DI/5gusYMZC8r2FNE2M=;
        b=JgVZuKd0ok1aaNVOYUjJQwDTg1arhOQZLRCmu1NqSAytLTzzoGsc6dw9VAtass9B8a
         G36U/JSgETyOfB4OC9TKj8DIFUr5Zax0A1AkDojK+fUVKqFByC/69NI0yXaZ+q1uKUUg
         HZmjG37ZVC1ldnBns31qUnie4jxE2QnMiPtTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910325; x=1717515125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xHve6PL7KT+Q9OZMD1lypR2DI/5gusYMZC8r2FNE2M=;
        b=SCOzdkDfOGWfRi8sfvS9ZcjgTqzxQqWQBI0aZ9Lm6HM2/v9T+5Hp2AeuA6uwOiIwXD
         p+IF1Ox4nHPPBY5ma3vlR8W3uHWA81XKJi0O5E4ngYuBqGm7UfZpEWEPoF9v96LeSMMl
         XjpyChNHz97lfYFJl99PYpTzYp/JNKzJWX0VnBTn/msmxaCMaT0vvkivwEEYQCqpKAmr
         9SUIz8Ti+6PVQzqJVl4WjMQxlwpAd4zOMDDpzef/2lhKkVt4Ton0gNfvH35dkV3MzZTB
         UE8tMtpXwZiTcDDNCRNkQBvvFZGd5jvt5ru/emOE0U/BfnoDY8jQ/p71NCm6koB2ztTw
         fmtg==
X-Gm-Message-State: AOJu0Yzd8jycxXGUDptCdEFVSntc+MyZcd+J9wDdn6WwS7r9Nra501Iu
	A7uJA28p9SKI9UJBMRM2dD84bgqdRoOGlUSO5wwAZFGqAfbNyq4DdBnpQpFqI4So3d/JOe1mish
	bx4U=
X-Google-Smtp-Source: AGHT+IHp1sX/p4lLI2vNr7/D5sa+edVHYvSRUcQ1KYFoLpit8HagOdhaxu0d/2yF3P3upXxQfBMMEA==
X-Received: by 2002:a50:9f8f:0:b0:579:d23d:c6d8 with SMTP id 4fb4d7f45d1cf-579d9ff4d77mr3044829a12.18.1716910325439;
        Tue, 28 May 2024 08:32:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/svm: Rework VMCB_ACCESSORS() to use a plain type name
Date: Tue, 28 May 2024 16:32:04 +0100
Message-Id: <20240528153204.1350919-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This avoids having a function call in a typeof() expression.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 0396d10b90ba..28f715e37692 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -630,7 +630,7 @@ vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
 }
 
 #define VMCB_ACCESSORS(name, cleanbit) \
-        VMCB_ACCESSORS_(name, typeof(alloc_vmcb()->_ ## name), cleanbit)
+    VMCB_ACCESSORS_(name, typeof(((struct vmcb_struct){})._ ## name), cleanbit)
 
 VMCB_ACCESSORS(cr_intercepts, intercepts)
 VMCB_ACCESSORS(dr_intercepts, intercepts)

base-commit: 2d93f78bfe25f695d8ffb61d110da9df293ed71b
prerequisite-patch-id: 4f38737ad5ea15b0341664ee1c6b96d0d00b6700
-- 
2.30.2


