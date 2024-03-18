Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB187EE1D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694948.1084317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHJ-0004RY-Aw; Mon, 18 Mar 2024 16:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694948.1084317; Mon, 18 Mar 2024 16:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHJ-0004N9-64; Mon, 18 Mar 2024 16:56:01 +0000
Received: by outflank-mailman (input) for mailman id 694948;
 Mon, 18 Mar 2024 16:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHG-0002f9-QX
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e3279b-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41409fd8b6bso14346895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:56 -0700 (PDT)
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
X-Inumbo-ID: 63e3279b-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780956; x=1711385756; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d1DO2DCVrdoG6T/ipv00ftRwAovDdK3fxHjf8zrTD8=;
        b=ejJI6tXevR/XiucRqH1xDSToXE9OHjoM9wnj9AoM4/iiuDtp3HGGYjfv+aUITzcfOX
         maiEH4okgG4spaI0fOJBWMj2FayBrX6JYnCxqCNgZ7kv0jSxguCn+Jvs5oKw/nRO+iNk
         wN1GD6t8mDRKq/70lh1Xiu1cDT/K3IuwsQNX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780956; x=1711385756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7d1DO2DCVrdoG6T/ipv00ftRwAovDdK3fxHjf8zrTD8=;
        b=Ugd8orX4ktR5QMIEv7+xlvzEY+UF3yfvaXppyqmuBgSsUthAzFFIG9qPwD4TYRTyBO
         FGW4gU922ha9trFuB4Q5uh/xU6QbPhDuqnfZOvIBYn3t2wOCnb7aD+IoGm//XlelifU/
         /AmxTupLISFLfWgXbpbY7BBinpuMVM5joJPwBMSk1svSca4owZUEp28fnqz7DAe4RmHz
         3cKxpKfd53ar6uvm7X1VfNbc4m2724AOwiy4YYWpYBDxlEBvp4Cg86zeHoBhhQMK51Na
         6VmdkiatT37qpAJkxkHhFH+AMTtVBWPpEvxdU0G2Jp5GlrSKoYWqEXDFb4stW5wCf5ms
         gYYQ==
X-Gm-Message-State: AOJu0YwBY0im651PZrUfFk80h10X+ZEcIPzDKEXt7RlAd1YBvstG1CER
	xVU0/INCL3eN+QqsfN6Yqhu+tUkaolQL+u00I1D9C4PErXqguGxKOnv2FPkNBpF8a4ON4/c0NAo
	G
X-Google-Smtp-Source: AGHT+IF9t9oDq5fjX710cgeERIrlw3KN0gLpL5ONKh1iYfqw9lmCcZ7Kxt8nVO4plWvZdHTwWJBAHg==
X-Received: by 2002:a05:600c:3514:b0:414:102f:27b8 with SMTP id h20-20020a05600c351400b00414102f27b8mr2074437wmq.32.1710780956701;
        Mon, 18 Mar 2024 09:55:56 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 07/36] ts-host-install: Restart ntp service
Date: Mon, 18 Mar 2024 16:55:16 +0000
Message-Id: <20240318165545.3898-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, the change to the config file isn't taken into account
until the next reboot.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-host-install | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ts-host-install b/ts-host-install
index 00277485..43ed9285 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -152,10 +152,12 @@ END
     my $ntpserver = get_target_property($ho, 'NtpServer');
     if ($ntpserver) {
         my $ntpconf_path;
+        my $ntp_service;
         if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
             $ntpconf_path = '/etc/ntp.conf';
         } else {
             $ntpconf_path = '/etc/ntpsec/ntp.conf';
+            $ntp_service = 'ntpsec';
         }
 	target_editfile_root($ho, $ntpconf_path, sub {
 	    my $done= 0;
@@ -173,6 +175,9 @@ END
 	    }
 	    $done or die;
 	});
+	if ($ntp_service) {
+	    target_cmd_root($ho, "service $ntp_service restart");
+	}
     }
 
     host_install_postboot_complete($ho);
-- 
Anthony PERARD


