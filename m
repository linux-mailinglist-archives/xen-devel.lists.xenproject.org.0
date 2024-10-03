Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC898F5B1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809697.1222271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7H-00022s-SS; Thu, 03 Oct 2024 17:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809697.1222271; Thu, 03 Oct 2024 17:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7G-0001oY-Qz; Thu, 03 Oct 2024 17:59:54 +0000
Received: by outflank-mailman (input) for mailman id 809697;
 Thu, 03 Oct 2024 17:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ7C-0006hm-41
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:50 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 486bdf4a-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:49 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5398e33155fso1645286e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:49 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:48 -0700 (PDT)
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
X-Inumbo-ID: 486bdf4a-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978389; x=1728583189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=bHy4dmPcoelWEoBOhVS3z0HTSCJgNdM9Wez4ZGPf3ESUpXW4GsZy/VCpriGVykUIqr
         m8qROKHLl/Mv3ibPPbhjhkUIpi51zv13n6R0CEI0kLINfVOmvbEZc2+9UNAazCBfalkI
         pDa354AuyFx7I1vWrqHBD5K4pnke5KtwW2SnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978389; x=1728583189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=H4rMEhAXrKp7Rod0B0vKAndPAwtyhPygPwebCGXdI0ZEbb8t+hiUPwSbKKhDSy+00F
         +3G5REUqsILaNQlybzfiWah6J6gd1OStNZ7WStj0yMQgPhsC3wbKA8t0erZP0ZngRtg2
         kKf/pMnWiG5Mm+3BhW+qN/tYMunehnHUkuvKAMtteJtEsxS/1/duh4nMMeYRccDzNCPm
         T41Ta0ox26BhB5mufIH3fuTk+HfUIhgHAz+a896KRG+9v2IVvNNht3ruV2Sh/KBT1212
         o88teTJ3FkxgjC/BIBS6m70rGX9+atYOdLomUn9nnkcDQY+UvSdWjTp/pGQ5KQCZFevG
         SMtQ==
X-Gm-Message-State: AOJu0Yw6wBGH+hgbGr1oWLe7CIWlivfs04SD5PWDscHKNbtvwp923H7F
	4slAYhxso1iO262VGUeQXEoTl+r1qzx3DYXYz9uR0UMiRqVTzh142yVnYPi9jnTDFgkilyvGqTt
	2
X-Google-Smtp-Source: AGHT+IEgc2dbr0BSMP1x4NGiykCn0GUjJ112SZ2c55Eodt+6JL/QgAWOels2q9CWW4SeZrWvLiN0TQ==
X-Received: by 2002:a05:6512:3b24:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-539ab9e1953mr129311e87.38.1727978388874;
        Thu, 03 Oct 2024 10:59:48 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 18/19] xen: Update header guards - VPCI
Date: Thu,  3 Oct 2024 18:59:18 +0100
Message-Id: <20241003175919.472774-19-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to VPCI.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/vpci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc27..d2d2905447 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_VPCI_H_
-#define _XEN_VPCI_H_
+#ifndef XEN__VPCI_H
+#define XEN__VPCI_H
 
 #ifdef CONFIG_HAS_VPCI
 
-- 
2.34.1


