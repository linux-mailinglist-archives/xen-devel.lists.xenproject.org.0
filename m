Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9E87EE26
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694950.1084327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHK-0004eq-9n; Mon, 18 Mar 2024 16:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694950.1084327; Mon, 18 Mar 2024 16:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHK-0004YS-2v; Mon, 18 Mar 2024 16:56:02 +0000
Received: by outflank-mailman (input) for mailman id 694950;
 Mon, 18 Mar 2024 16:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHI-0002gq-5s
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64fec057-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:55:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso6571435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:59 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:58 -0700 (PDT)
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
X-Inumbo-ID: 64fec057-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780958; x=1711385758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grbljEezuAm5ddIqYTUtOOXKigH5i2pAC4iRghVwmV8=;
        b=uFtFhacI1Tirk2+ueChZwlsWpbCfd8EAwBzCp065BpQYj7Zri/Fodo8L1byVGBQCPa
         vucCJRMcu9+M0skDeP6U+D2cJo5DTM9Boh2USyXDjtg6J9yasbG0SQy6b7r4+hWEf8dF
         NnC1d0v7uZHaoYlPiP0l3qauuxoMi4wJtEryA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780958; x=1711385758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grbljEezuAm5ddIqYTUtOOXKigH5i2pAC4iRghVwmV8=;
        b=rMLcIKIs9t6SGhjkSZjCiexoJY0lagmDYw4s+ip4po/5WteMeXYYi5zH+pC9fPd/yP
         m07z8YT7AtTCxE3En+0pGCGkkrErTeoI7lIPfSWqq7Oi6P7I1oEY0OCrhXKoZFjV+vS1
         9ajfnkUR739qEmBuC5oNDSNUSI/9CKXQ0QWCatKxyCLQaHKIh1VNWHZjpJHQjQlNi1Ur
         5qPjkZEusoJLCMWOrYVxVwHfxiUbWsNl94o8zQlXMECGJinoKn/ZyM1bhbRk8raWNDho
         b5LUZ+vkEMM3eJMuVskP6KlZNdOuMrAGtPQymVACEDm1RPjMXKjA25zuZ/MJ8nSGJDq7
         zwSg==
X-Gm-Message-State: AOJu0Yx6L0F9EjKcabJmer3mQUwjoylY+5c0reMf3ktm4KhZKT4w9n1c
	IunjZ75XN7GItb9WFlQRL/Kp2ctNSXmTNWnhd5SRYl0nESuUOFoHWaE0Bh7+57v/kN1ilt7h4lZ
	3
X-Google-Smtp-Source: AGHT+IFcgQCr2cM6JQpN9LZSX9YsTNRBfrJdElRzDqs5E9G5lzKWHqiz3bxuJX78jdQgzxXOg7YuBg==
X-Received: by 2002:a05:600c:4fd1:b0:413:f276:778b with SMTP id o17-20020a05600c4fd100b00413f276778bmr9778329wmq.23.1710780958404;
        Mon, 18 Mar 2024 09:55:58 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 09/36] preseed_create: osstest-erase-other-disks: workaround creating /dev/sdXD files
Date: Mon, 18 Mar 2024 16:55:18 +0000
Message-Id: <20240318165545.3898-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometime, it can happen that the erase-other-disks script fails and
indicate that /dev/sda1 isn't a block device anymore. This happened
when /dev/sda was erased before /dev/sda1. So to avoid this, we will
zero the partitions of ${disk} first, and hopefully the error won't
happen again.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 7d6f9778..36c05551 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1305,7 +1305,7 @@ for sd in sd hd; do
     udevadm settle
     log "\${sd} devices present after: `echo /dev/\${sd}*`"
 done
-for dev in ${disk}*; do
+for dev in ${disk}?* ${disk}*; do
     zero
 done
 echo ===
-- 
Anthony PERARD


