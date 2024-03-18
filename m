Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8787EE21
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694949.1084322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHJ-0004Xn-RP; Mon, 18 Mar 2024 16:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694949.1084322; Mon, 18 Mar 2024 16:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHJ-0004Rc-Km; Mon, 18 Mar 2024 16:56:01 +0000
Received: by outflank-mailman (input) for mailman id 694949;
 Mon, 18 Mar 2024 16:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHH-0002gq-5j
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:59 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ba9c06-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:55:58 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so5801653e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:57 -0700 (PDT)
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
X-Inumbo-ID: 64ba9c06-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780958; x=1711385758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+3r6fYzaXB3N/0rnw9Q6VwH4rxmenmG4TwlfD9Xy8Y=;
        b=Q6EO40YoRoSjpW7nAvt7U5MVyD80Rj+W+7bGB8X3c2psbCFmVcHGVOhm2P7tJrqtfC
         fZzM9VD6PvEwo2nwmzMKpm8yJPX2yqzptwOaAQHVO5nz4HTpV/itbJRucPep9Wa/YHpx
         yhkif0uYucWv9JDjJp7CXqhnfsZfenCJcq7rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780958; x=1711385758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+3r6fYzaXB3N/0rnw9Q6VwH4rxmenmG4TwlfD9Xy8Y=;
        b=XHb6PTvcL+t6ynPLzF7ixAdgY2JcV4Gm2DFmTRr7BKmb1YrynhKfWLohl0V6eRAaWZ
         HffL440n2cTgPrjtB1xrio6EWn7AK4tNneEGuY5iBcFqUzk+bzIPAdVXoOODPGj5ou1G
         FlANnyEnjpTarln/XQmOskxEcBPT/zGDjR0WMsOOlf06/v0X9BwdSu+kE4uNBfuP0Gp5
         JfSKgBsIiqf1hgwEvf++m1er7/0Lu/CvsDlDN6qrXEmwUdz/CMRhcEdpx9Y7jao5sVb5
         PmHK1gUwk/XiNWV2Pl+VkxwytaO1whKi5ZSo7tp7yh6s4zYcq4C8GPvr8aBISoGqxIOn
         6vdQ==
X-Gm-Message-State: AOJu0YyS0G3DSJ7BBdrUUJOWu3k5KZp3ldT0DfL+aOw3GlCZwl+IXpf4
	1PAeXzVTMzTEYOFDiZHHe//7GE/myMXpT3ARczwBr++OBMsWizev86tYqvYZVG0Wf1dRwMbNpCv
	N
X-Google-Smtp-Source: AGHT+IG1aAUVttrMa2HZLGh7dogu1uNzjjZjmygv0wIoIGvDALRczq05npI7tR7zVopl9a66vng+NQ==
X-Received: by 2002:a05:6512:3b4:b0:513:5a38:f545 with SMTP id v20-20020a05651203b400b005135a38f545mr7392334lfp.62.1710780957661;
        Mon, 18 Mar 2024 09:55:57 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 08/36] preseed_create: Use new "d-i grub-installer/update-nvram" for UEFI installation
Date: Mon, 18 Mar 2024 16:55:17 +0000
Message-Id: <20240318165545.3898-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of "grub-installer/no-nvram" proposed in Debian bug #789798,
we have "grub-installer/update-nvram". Make use of it, and remove
workaround.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 9b30a375..7d6f9778 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1550,13 +1550,17 @@ d-i partman-auto/expert_recipe string					\\
 			lv_name{ dummy }				\\
 		.
 
+# Prevent grub-install from making a new Debian boot entry, so
+# we always reboot from the network.
+d-i grub-installer/update-nvram boolean false
 END
 
-    if (get_host_property($ho, "firmware") eq "uefi") {
-	die unless $ho->{Suite} =~ m/jessie|stretch|buster/;
+    if (get_host_property($ho, "firmware") eq "uefi" &&
+	$ho->{Suite} =~ m/jessie|stretch|buster/) {
 	# Prevent grub-install from making a new Debian boot entry, so
 	# we always reboot from the network. Debian bug #789798 proposes a
-	# properly preseedable solution to this.
+	# properly preseedable solution to this. Implemented with
+	# "grub-installer/update-nvram".
 	preseed_hook_installscript($ho, $sfx,
 		'/usr/lib/base-installer.d/',
 		'osstest-disable-grub-nvram', <<'END');
-- 
Anthony PERARD


