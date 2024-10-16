Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042CA9A054E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819759.1233248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10ER-0002O4-Rt; Wed, 16 Oct 2024 09:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819759.1233248; Wed, 16 Oct 2024 09:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10ER-0002Jf-MK; Wed, 16 Oct 2024 09:22:15 +0000
Received: by outflank-mailman (input) for mailman id 819759;
 Wed, 16 Oct 2024 09:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t10EP-0001Bq-R5
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204cab70-8ba0-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:22:13 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a993a6348e0so475946166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:22:13 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b735dsm1500429a12.81.2024.10.16.02.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:22:11 -0700 (PDT)
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
X-Inumbo-ID: 204cab70-8ba0-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729070532; x=1729675332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=VYXDCk2HCNtqZlXAtA1bxlq7cu8p27aslkiwWZf8BS0nZ2du1+aTD0tbhpUk3GRsJK
         nmxOrla8hVpm31xc7wNTWfeSB5bNn9PPXdc0sjNd8B0d5mRm8llDRk70qYak0RBjEcz3
         44n+H3TKErMU1tu/li6gHErjLz8kw5lsw6KMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070532; x=1729675332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=UN8vDgMKdU5nBU/ucDpJ8KlPYX31UsWp+2YOQ0AjTNSU977CPZp8aX5sloH+I7ZNbR
         7amjRlp2CLDZKs5QrIEiEtLlqnsAJtla8HHQuaJMMqfPhfpiQtiZatXc8XpwiKwLOltK
         P5jm9w8Km3pdSaQTkam2FH0ar4owooQAQBsgsNif0CAtUBAtSMOe+mt2zF4GgKysiYfa
         MwThcXMl7/GeAgRzP5uGBAQH0KvwVWZ2Te/h7ZBYuHoVYUs34ZImcIq4OB+9rZyyZFdb
         boBo+jbYaWQW1s1gatt12bz+6d5pgM+wV0XoX1ZITPAAndLQSkhP5WXLAE3FqjDu+90D
         hc+w==
X-Gm-Message-State: AOJu0Yydoq25646soZi55UeLoe7OKCh9DT5bwwhINtd/WyYmb43BiIh9
	MjgXzBFnq2ZsGddrT2fpLKlC8VKJEpdU98wxa/YniAkUclAQ6i0HzOcrCbo7vg/1tMX+ia3E6Jg
	Y
X-Google-Smtp-Source: AGHT+IGPaXjFGGU05T4tItHMIKTuFU+ttj1/IJDwwxBlRLTFSP9/0FAys/YPdmjcNmjqw2XbKevvGw==
X-Received: by 2002:a05:6402:3510:b0:5c9:5aac:c622 with SMTP id 4fb4d7f45d1cf-5c95ac09918mr23962555a12.5.1729070531754;
        Wed, 16 Oct 2024 02:22:11 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 5/5] x86/boot: Clarify comment
Date: Wed, 16 Oct 2024 10:21:54 +0100
Message-Id: <20241016092154.1493035-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b27..e725cfb6eb 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts on top of space reserved for the trampoline and allocates downwards.
      */
     uint32_t ptr;
 } memctx;
-- 
2.34.1


