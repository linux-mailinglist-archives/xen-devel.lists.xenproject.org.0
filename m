Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8387EE2E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694957.1084388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHU-0006ha-FW; Mon, 18 Mar 2024 16:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694957.1084388; Mon, 18 Mar 2024 16:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHT-0006V2-DR; Mon, 18 Mar 2024 16:56:11 +0000
Received: by outflank-mailman (input) for mailman id 694957;
 Mon, 18 Mar 2024 16:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHP-0002gq-I9
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b58789-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:07 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4141156f245so7506305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:06 -0700 (PDT)
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
X-Inumbo-ID: 69b58789-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780966; x=1711385766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxXSne1viGno6ujJqAzeYSDYVejkK2lsBexcKCTd9Jg=;
        b=iuOyy86mGh/1HfkVANZ+JsVV865jsEK8Z5V0gDlncrdnzvuRLG/AmPEA5/G4PQdjMe
         EnlfoSWP1Tb8foyBVEHyqHgCl8qHzqMhItXI+JyWdvoyv794w6fM4/Vvef5/dbgxuZiA
         ySs9My/qfwyBOvzZP90UguozVeJ6gplcqt31E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780966; x=1711385766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxXSne1viGno6ujJqAzeYSDYVejkK2lsBexcKCTd9Jg=;
        b=pKAJZ5dt+Ks7ifNOufWNZHDoLD2H9zG70jEhkX/GBjkYFxBWnFn8XQevAtDWnyZcvc
         lEI0BRoB6kBwJEK76kgUlYiK2M0v6xKh3o7bIbLBi+00GY3uu69sflCBq7VE7eufgqlV
         2xFE/pE4oW2z8Hd1fY9s/xQVbx2syKJnTKQpJxjOmUzh3MWSK0kQVYpcJU0UQtloz5f7
         8n6gEcqCsE9O4VoOjrnW0Jq7HKhlXrHIuMpGHadMtSN7aifClMQxoM/6XSasy5zb/s4q
         hF8Bh4KHn9IYbyjpjYsCBaLk+LYYxELD7tRkCdxVaaO2NR9c/SACBl0YrU3bF8Ma8vrq
         nOTw==
X-Gm-Message-State: AOJu0YzjIa0aVIWEZmwBwblsbwi+tHWKW/HrQgsPlumP5fHsqHcu2EiW
	+hdCcVcmU+w7yRR5+sXHkleslMN9Z2RWbvUL6MMKV6zjV6Dz8Gud1T8T5NVHr/ZDC6KqXAEQf76
	v
X-Google-Smtp-Source: AGHT+IGts/Clq9c4Y13uCTSoDOBJYRSXE2aoOQ9n3WCapA8Q5lY/5I6/FU2eI66ePGPjgudOWqCimA==
X-Received: by 2002:a05:600c:1912:b0:414:38d:81f with SMTP id j18-20020a05600c191200b00414038d081fmr6836636wmq.29.1710780966410;
        Mon, 18 Mar 2024 09:56:06 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 18/36] ts-xen-install: remove "libc6-xen" package installation
Date: Mon, 18 Mar 2024 16:55:27 +0000
Message-Id: <20240318165545.3898-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libc6-xen packaged have been removed from Debian Bookworm.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-install b/ts-xen-install
index bf55d4e5..3a913fce 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -64,7 +64,7 @@ sub packages () {
     if ($ho->{Suite} !~ m/lenny|squeeze/) {
         target_install_packages($ho, qw(libfdt1));
     }
-    if ($ho->{Arch} eq 'i386') {
+    if ($ho->{Arch} eq 'i386' && $ho->{Suite} =~ m/wheezy|jessie|stretch|buster/) {
 	target_install_packages($ho, qw(libc6-xen));
     }
     target_install_packages($ho, @{toolstack($ho)->{ExtraPackages}})
-- 
Anthony PERARD


