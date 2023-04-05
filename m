Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31076D7120
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 02:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518193.804465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqlg-000311-E2; Wed, 05 Apr 2023 00:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518193.804465; Wed, 05 Apr 2023 00:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqlg-0002xo-BM; Wed, 05 Apr 2023 00:12:52 +0000
Received: by outflank-mailman (input) for mailman id 518193;
 Wed, 05 Apr 2023 00:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enMU=74=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjqle-0002xi-ID
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 00:12:50 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e26084-d346-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 02:12:47 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id le6so32869820plb.12
 for <xen-devel@lists.xen.org>; Tue, 04 Apr 2023 17:12:47 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 jn22-20020a170903051600b0019a95baaaa6sm8852381plb.222.2023.04.04.17.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 17:12:42 -0700 (PDT)
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
X-Inumbo-ID: 97e26084-d346-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680653566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWw80btV/vkY8XMbURM92c6D4GYeLA/5q3xU6Aoi0EQ=;
        b=vR5dx0yJebVkrvv+aB71InjcvrW6v9q0rNb2PTlKa4lWPnr4/+1CT8KntvSHFQKpCM
         siaDKPZwRnkot4U8RUR7yYpA9CR+79a+NByNqKCtWM8XTMRw7aQ+4NXSgLSHbK0ZGE50
         QPgCl4tZtf45W8+N9nUlXaG6eFFXj8MPsvunicqk18zheXGfYpoV+f5uKDHDy00GGHhZ
         Ouz/Q5yQrF5BC8YUFzktg3F9hE3rKvbZtGqxMOZ1cLD7mQPziXcKw6Tv6t2hTlB5FJZM
         O4zNi823xfywpse/OuLgtWfVK9WPUeINoe/ziK2zK2CAr/UlvgUI5QTAqYf2Fm32YanH
         mMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680653566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWw80btV/vkY8XMbURM92c6D4GYeLA/5q3xU6Aoi0EQ=;
        b=4108WNwuCYfF/epZqox5Xyu1aP5matl6SCPcbeJ4v0m/Sk0M8D5G9Anj0IYiiVcfJB
         IQQOUmzuSSwDf1Sfh9mUqm4Ch8Azve8JDb15w2pcK4sCIZZjeZ+yvvj85L5gJ78IkXrH
         /qwZNByua02iD2cxqRUWgSMfxSLTtLjlE+RMm8B5Q+YGR/ZQ0nfurnpfweEs+CKDZRuq
         Zz/dpTukqwgZONRGTThXENQ2mIzyfrSQseVG93zLgxrvERGXCcgA1X08IOa145aeRuZt
         RrslJGIjcwuWktnzSaEMvn5KJheyFWRnMURRZkO3tFA7v8gbWxP5lPumwJSI718Zwrw3
         WiBA==
X-Gm-Message-State: AAQBX9cpEsa513P8xGij+CB1pcKHbPofYvTwKwoB/nVXG0O2U84J7fMf
	sCj7Jl5oZwWXtzM8oDZoF3quT7pP6CG/3u2fQOQ=
X-Google-Smtp-Source: AKy350bnELvarxqhwrfDobQ4HgHVzxA23wxmz2u35PJ8qLOp7TTqjYlqBLgYLfiN6mn/KoxMHgp9gg==
X-Received: by 2002:a17:90a:1902:b0:240:5c43:7766 with SMTP id 2-20020a17090a190200b002405c437766mr4844628pjg.4.1680653566069;
        Tue, 04 Apr 2023 17:12:46 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH V2 1/2] docs: Allow generic virtio device types to contain device-id
Date: Wed,  5 Apr 2023 05:42:35 +0530
Message-Id: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For generic virtio devices, where we don't need to add compatible or
other special DT properties, the type field is set to "virtio,device".

But this misses the case where the user sets the type with a valid
virtio device id as well, like "virtio,device26" for file system device.

Update documentation to support that as well.

Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2: New patch.

 docs/man/xl.cfg.5.pod.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..ea20eac0ba32 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1608,8 +1608,9 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is
 
 L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
 
-For generic virtio devices, where we don't need to set special or compatible
-properties in the Device Tree, the type field must be set to "virtio,device".
+For other generic virtio devices, where we don't need to set special or
+compatible properties in the Device Tree, the type field must be set to
+"virtio,device" or "virtio,device<N>", where "N" is the virtio device id.
 
 =item B<transport=STRING>
 
-- 
2.31.1.272.g89b43f80a514


