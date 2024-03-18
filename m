Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A1587EE76
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695045.1084584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGUP-00070J-OJ; Mon, 18 Mar 2024 17:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695045.1084584; Mon, 18 Mar 2024 17:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGUP-0006x4-LU; Mon, 18 Mar 2024 17:09:33 +0000
Received: by outflank-mailman (input) for mailman id 695045;
 Mon, 18 Mar 2024 17:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHf-0002f9-VT
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:23 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 701ff6ff-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:17 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-514a8259ec1so720216e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:17 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:15 -0700 (PDT)
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
X-Inumbo-ID: 701ff6ff-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780977; x=1711385777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26YSZw65woreMekmmn6Dys3A1EFQ0HIUWGVRQycHsIA=;
        b=lDt3dD2YEOvV7jYoX+yOtRTa/U9GeAg230Ch6ClUKZNsNcKu93NAgoQIwUffXMAf7F
         eGx8K6DMb9TqwBqUi7S025YsDngwPorPycZtwYD0Q/OIhxRHbyhVPBa/39uYJzLisS7w
         iCdpA13Nm6+FY8V/qe+ItpKztQGDZJA8Wh49o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780977; x=1711385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26YSZw65woreMekmmn6Dys3A1EFQ0HIUWGVRQycHsIA=;
        b=IjLgjRTsq1+y4mjjbIN2GUictcxCKdIitqnXi38IVfdDMUdxG/vXluXnoWSvgceCPu
         dBqoxslNlq42mR0AFSoTbq9AQDYX6SwrV4sxUeUgeGuJLaszBiXNWyg5QEb8jvYeFUUT
         9CHI18eSmyhA+RyaftDnE5e9RezQD2PBFieqYPKkuoyIOPwNTtGH/ycYZ+aV1XK9GH04
         l3T8g/7kZIYBOIou66zuYaBdGjtAkftLbo2ow5a2SdF4JcBUIgwluvw1ZfyBrlDe5s+d
         6v8q5PbkJBgTIE5bWYq0S3kW133STwtV/AM1o2s3n94U2kZcyEJ6AUjhtwldrFvzDzEv
         ycuA==
X-Gm-Message-State: AOJu0Yz+cA6vFAhf1XxUlyN0QiFsGyinAz5yyByFwbe0lD9NoBswqhxA
	7DwVs+P5zjBj+i7elll+m3YtFJJEKKio8AE2ZWyGoTA1L5B+paAK4KHn+wNA65G9Qx8ms1gpIcE
	9
X-Google-Smtp-Source: AGHT+IHNvBn6bt5Kf5bfRGG5GOc9SND8iAJEbFJzJD9VDG2AybdY+1uUbYspTd+5fAPaNfFNoJ+wkw==
X-Received: by 2002:a19:3802:0:b0:513:9dba:f32e with SMTP id f2-20020a193802000000b005139dbaf32emr7240835lfa.20.1710780976204;
        Mon, 18 Mar 2024 09:56:16 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 30/36] bookworm: Extend guest bootloader workaround
Date: Mon, 18 Mar 2024 16:55:39 +0000
Message-Id: <20240318165545.3898-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 68f1be60..3545f3fd 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1176,7 +1176,7 @@ END
     logm("\$arch is $arch, \$suite is $suite");
     if ($xopts{PvMenuLst} &&
 	$arch =~ /^arm/ &&
-	$suite =~ /wheezy|jessie|stretch|buster|sid/ ) {
+	$suite =~ /wheezy|jessie|stretch|buster|bookworm|sid/ ) {
 
 	# Debian doesn't currently know what bootloader to install in
 	# a Xen guest on ARM. We install pv-grub-menu above which
-- 
Anthony PERARD


