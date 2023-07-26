Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14D7638C5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570502.892331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfID-0006rC-Rb; Wed, 26 Jul 2023 14:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570502.892331; Wed, 26 Jul 2023 14:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfID-0006oL-OC; Wed, 26 Jul 2023 14:15:09 +0000
Received: by outflank-mailman (input) for mailman id 570502;
 Wed, 26 Jul 2023 14:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDiv=DM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1qOfIC-0006oF-Ui
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:15:08 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d30c8a82-2bbe-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 16:15:08 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so10762717e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 07:15:08 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.167])
 by smtp.gmail.com with ESMTPSA id
 gs18-20020a170906f19200b00993150e5325sm9645290ejb.60.2023.07.26.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:15:06 -0700 (PDT)
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
X-Inumbo-ID: d30c8a82-2bbe-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690380907; x=1690985707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzJIWLVJPizuccfU5mglOf7x8qeqp2QJuoUd5Jf7Ia4=;
        b=pRwNnJjRl8VHxEMRy0nveMAxJPsnQ/LqbF3f57keiEnpXhToWHK6v6mmPhqnw1hs3u
         BV3Z1TVR9fWWAWI2D7U0RciuldsSg8vRNpFDb5ccf3EMKVF4Kb68t/ty36sRDgo7lBZX
         F8W3fT2FhAsKLJvlJguiquzpIHX7K+DR75chO+AnXupGhQpBR7vd1GqjEPrV0udL+t7N
         y/31bx8EZuEfqBJO5XXZhmgG5HYAyUDmAL8r4u9dnAuTZTj5FcTkCJjF5Pmkrdffq3gM
         Kxdv6HXnb0N2CumkPsMpWaSUgbDr8qjV/qMvoq7gcHimMCb7W9vZo8M5KABqXfZ2TmoH
         PaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690380907; x=1690985707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzJIWLVJPizuccfU5mglOf7x8qeqp2QJuoUd5Jf7Ia4=;
        b=E7bO6ovnCDred1ogXzJOSftk7mwGNVp4llJ1II0WVh/m3NnoQwZAMXtDb7KcNqU/Q0
         a81YaHwDuPnrsbHd+rGTRhOEci8F+yCIIP47Yt70T7lk39T7yZF3eUvrFgr4bGvdf7wp
         czrq1+UxXoMB6WW8c76PfQb94KZdWMHG1zQDsLyL80zdM9oMq0XRaIGvc35Nn8ECfSX6
         R1kE35+US4l2Ip4QIF6vhUounm1eHiGN31fy6Lm2F9Bk/KBkGlv9fO9JE7OdDrCCczwG
         GyuWk4BxEIeAHZH52qfgKNie0XGPP5Z2h+ZSb70BMuvINxGjkhS+cUycAm7S9UuCqDgH
         HuHw==
X-Gm-Message-State: ABy/qLYAGT4IMilIXhc6bZjlnz+hgy7d1HNaziNpcvB8cy3rt12X7x8j
	vZpWfgqZuOnD7MSD1jyOqIXz4PqGh5U=
X-Google-Smtp-Source: APBJJlEcqF/4JN44dZj18obkrwfVl5r4SG7cpXYozv3jkL1cxEA3Tpvwk4gFFyob6Oj1TUSqWDKbZg==
X-Received: by 2002:a19:5042:0:b0:4fd:c8dc:2f55 with SMTP id z2-20020a195042000000b004fdc8dc2f55mr1750874lfj.66.1690380906857;
        Wed, 26 Jul 2023 07:15:06 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] libxl: Add missing libxl__virtio_devtype to device_type_tbl array
Date: Wed, 26 Jul 2023 17:14:59 +0300
Message-Id: <20230726141459.985463-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Without it being present it won't be possible to use some
libxl__device_type's callbacks for virtio devices as the common code
can only invoke these callbacks (by dereferencing a pointer) for valid
libxl__device_type's elements when iterating over device_type_tbl[].

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libs/light/libxl_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 393c535579..c91059d713 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1887,6 +1887,7 @@ const libxl__device_type *device_type_tbl[] = {
     &libxl__dtdev_devtype,
     &libxl__vdispl_devtype,
     &libxl__vsnd_devtype,
+    &libxl__virtio_devtype,
     NULL
 };
 
-- 
2.34.1


