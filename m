Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F008902BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698957.1091280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprPF-0002NG-Gl; Thu, 28 Mar 2024 15:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698957.1091280; Thu, 28 Mar 2024 15:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprPF-0002M0-Cc; Thu, 28 Mar 2024 15:11:05 +0000
Received: by outflank-mailman (input) for mailman id 698957;
 Thu, 28 Mar 2024 15:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprPD-0001mV-3O
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:11:03 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63cdc1a3-ed15-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:11:02 +0100 (CET)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-43107ccd7b9so5577561cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:11:02 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cr7-20020a05622a428700b004313f54aaa9sm696300qtb.5.2024.03.28.08.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:11:00 -0700 (PDT)
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
X-Inumbo-ID: 63cdc1a3-ed15-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638661; x=1712243461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2qmXAF7kH+Xo7dcYPNWV07zKXcD5akVAYdTNUPm5Ak=;
        b=bNoRIdajri1wVAtu80pzggb6o6axyqxWdnp5Bsa62pAuNgE8SvMNaWbtgjX00lXnI5
         JcXm3jwPTPuJOdlxjmvFNw3H6JYkg9B1rAgNPISh5hKvZHUMa+0bO4x5GP+Us0RVmfXb
         a3tDWxrWiG55E38ofCUADCL9vBvt++XjBZBOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638661; x=1712243461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2qmXAF7kH+Xo7dcYPNWV07zKXcD5akVAYdTNUPm5Ak=;
        b=WLq9Shx+wr41UPL8YlP+FSeMYrpbIu1ozKHIp1KSBpAyAFpyceuwLySs6SghtaXYua
         J3JC7CFne5wHVA6oNl4hTwowF3SvfEllllwpHSWbrXiu99gK67JXJbXlDb9Z7vafBaiE
         Lp04YlAyPnXk3AeAJVYudDMGYeKy/sUeqNlmcicIifWFnGqMqdGJeWWnuQnSB5nX2J+8
         sGhu1bSd5yIcGd1Cy31EpSmNRDKk9LrylF/YgIgzET5XZVMdvHWpo0tsE9GGBYQEd5N3
         aebN0+V/bMTE5stGVhPXJmboj7pHgRjR5+mFICtTkV0spwb622kz/2iftm8SG9KxJjMf
         bltQ==
X-Gm-Message-State: AOJu0YyepdaONKwYikXJMHD1REyWMuKQUmMi37BoVvCOU0J7Qh6I2boQ
	jxy1LP0otEu3WLki2zJ94JHlQW2aTYo2+d+mYvZbvrTReazfbJW4d21Qzu4IkQ==
X-Google-Smtp-Source: AGHT+IHRgh7LeGuGdwNldABcb1tIrGf4GrwtRM68IhGmhRZqpwgzTkw0Gpe38tSy6CDtLxe8+DQwvA==
X-Received: by 2002:ac8:5c8c:0:b0:430:e2cb:9a54 with SMTP id r12-20020ac85c8c000000b00430e2cb9a54mr3266954qta.12.1711638661506;
        Thu, 28 Mar 2024 08:11:01 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Daniel Kiper <dkiper@net-space.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] efi: Allow loading multiboot modules without verification
Date: Thu, 28 Mar 2024 15:13:02 +0000
Message-ID: <20240328151302.1451158-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328151302.1451158-1-ross.lagerwall@citrix.com>
References: <20240328151302.1451158-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GRUB doesn't do anything with multiboot modules except loading them and
passing a pointer to the multiboot kernel. Therefore GRUB itself doesn't
need to verify the module. Multiboot modules may contain code that needs
to be verified. If this is the case, the expectation is that the
multiboot kernel verifies the modules. For example, with Xen, the first
multiboot module contains the dom0 kernel binary and Xen verifies it
before starting it.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 grub-core/kern/efi/sb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
index 8d3e413608bb..f76290d65e9f 100644
--- a/grub-core/kern/efi/sb.c
+++ b/grub-core/kern/efi/sb.c
@@ -171,6 +171,7 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
     case GRUB_FILE_TYPE_LOADENV:
     case GRUB_FILE_TYPE_SAVEENV:
     case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
+    case GRUB_FILE_TYPE_MULTIBOOT_MODULE:
       *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
       return GRUB_ERR_NONE;
 
-- 
2.43.0


