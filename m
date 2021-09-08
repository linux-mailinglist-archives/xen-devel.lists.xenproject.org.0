Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1574041B1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182409.329980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6s6-0006OE-Te; Wed, 08 Sep 2021 23:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182409.329980; Wed, 08 Sep 2021 23:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6s6-0006Ka-Ps; Wed, 08 Sep 2021 23:20:50 +0000
Received: by outflank-mailman (input) for mailman id 182409;
 Wed, 08 Sep 2021 23:20:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6s5-00061E-13
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:20:49 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 667b4552-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:20:48 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-bkO3WsiWMvqQSzdibUOoCQ-1; Wed, 08 Sep 2021 19:20:47 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso23995wma.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:47 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p13sm36976wro.8.2021.09.08.16.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
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
X-Inumbo-ID: 667b4552-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWN2pZpGs6sHyN/PrFeo6PGJIp1YJY+EJRzHbkMHcxk=;
	b=eFitySEzpqjh8S+blF/SNzqVLEpUBdOl9Tl+W/tlo6SNOaMsUbPVLtr9QFRC+SKfXNh1ce
	+4MjvYeIqHgWHSLNxR21Zvm1DaZoMu/qYaFBul8PzCVbFxxXaN3/yTADnb7KInf2kDt3Mk
	StBfjU7YSg7SugwQnNyiteCvgiUVdHI=
X-MC-Unique: bkO3WsiWMvqQSzdibUOoCQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AWN2pZpGs6sHyN/PrFeo6PGJIp1YJY+EJRzHbkMHcxk=;
        b=xcGqj8lDBFIGP7CUP6lMfOGltp1vO2rKCH09ZyGWJ+B9tebSoXeLcQS1AMTLw1UEJ9
         qvp79D88CfGChEF6o/67kvIQ1EQlFkjae8v8Nqln717wm0blO8wmVFzUUrPPrAKPQZ4f
         yNUeMCgAa4Zv5TY55Pj+s9AHrsAJEa8KQlrOnMLJ/9Ib8TCcS3e3zHys6hHbBzUZhoOe
         yrP1csqmSd6i5gAWgbU+HkU7ZmfAZqB96w3lyBYKz9+gyU0x++BQXJa1Gz+ebBm1PSY2
         5HQb8HkFr9pHK4D8yutCkTYbNzXJwwX9TJ0D7ZzjuPzKpHZdzDySOie51vQ0ULfh4rSl
         twnw==
X-Gm-Message-State: AOAM532LAW26Qy2VTTn1KFe59mltfZQEqRmTkSJ6fesBngeBtVHa5Jhj
	Gn7oXTIahvWQUiJtFxt/KC1mXxH4WkHPOfhJFI6fE0MMZZd7xAt8E0y2imCSOrW7/bwVoR2SH9r
	4/Kone+40YC3hPDQe/mBWw4Wleac=
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr5746027wmq.181.1631143245828;
        Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRx5vddYT6ifvfXuEUZzDhSVwlkW5T8HDOd0oz2QEHRH1Qx3AckLgtuI1lDwOwP+2e9s6Xjw==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr5746017wmq.181.1631143245705;
        Wed, 08 Sep 2021 16:20:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 04/10] block/vvfat: Mark the driver as unsafe
Date: Thu,  9 Sep 2021 01:20:18 +0200
Message-Id: <20210908232024.2399215-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While being listed as 'supported' in MAINTAINERS, this driver
does not have many reviewers and contains various /* TODO */
unattended since various years. Not safe enough for production
environment, so have it taint the global security policy.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 34bf1e3a86e..993e40727d6 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3199,6 +3199,11 @@ static void vvfat_close(BlockDriverState *bs)
     }
 }
 
+static bool vvfat_taints_security_policy(BlockDriverState *bs)
+{
+    return true;
+}
+
 static const char *const vvfat_strong_runtime_opts[] = {
     "dir",
     "fat-type",
@@ -3219,6 +3224,7 @@ static BlockDriver bdrv_vvfat = {
     .bdrv_refresh_limits    = vvfat_refresh_limits,
     .bdrv_close             = vvfat_close,
     .bdrv_child_perm        = vvfat_child_perm,
+    .bdrv_taints_security_policy = vvfat_taints_security_policy,
 
     .bdrv_co_preadv         = vvfat_co_preadv,
     .bdrv_co_pwritev        = vvfat_co_pwritev,
-- 
2.31.1


