Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4488B14D2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711654.1111817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRe-0005Jx-AF; Wed, 24 Apr 2024 20:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711654.1111817; Wed, 24 Apr 2024 20:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRe-0005HY-3P; Wed, 24 Apr 2024 20:42:22 +0000
Received: by outflank-mailman (input) for mailman id 711654;
 Wed, 24 Apr 2024 20:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRc-0004VD-Ef
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:20 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251980cc-027b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 22:42:19 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e78970853so2487386a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:19 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:18 -0700 (PDT)
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
X-Inumbo-ID: 251980cc-027b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991339; x=1714596139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5idciq4z6LmfOUeSzwtHh7qUWkne+GPf19nH7mQTjs=;
        b=g3VHQisNx417pAwj31P4qqfA4Acl5zqT5MZI48Y6LsE9QCs8YI/mLDunLl10GQoSZN
         eoaloQ7fUfEMoa+OFVXIGUX4WAQEQmJHz+AQxBTkdJYV8BAxdFYjLUGbOnLbgu62YXr6
         iqpcqH9+OxT2BuU6dYtnASn1dx0f9BVFbgFPTebYckCO9hwyPE/Ba5rvo5AGuzRJul14
         ZIovrZMdnvzJoEKwoJEPSGGp6KDDvdPHmuWJN3e9N/FvXUNWOGz4F262UanF7tgvetBS
         r1RlbGkfmtgeiwgN1AhFHnK5DEXpEbDHhxGfssmjNvT6zVv8Nwo48cNALsN+ZoE1R8fV
         GYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991339; x=1714596139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5idciq4z6LmfOUeSzwtHh7qUWkne+GPf19nH7mQTjs=;
        b=Mz6/dbHwpseCLzfM4f7Ca+5SqN0HWAs/iNe4lsOnFrIPzsgQp8AULYZjwkW+Y5YOJ3
         0plW6lhqnYhewolaKbyIR3HZ61kDPbSCfZtQvKXyX2R/VQ1zRTTJkrm+rTy/EKAz5+94
         868THtOtgECdbISyWsQgH1FJ2REQjJzbf1yKjIL2Y/bEeUqGYKLsxevgkviP2tGhfOho
         TkEsp7FbRiVfkXq6xcnLIO13a+avFfJyD9AHCRFA2yq8iEV1yt8yQem76H0a39ECKLEa
         kJFrRmRT9owWoQE5z4TGDZfNZPsI2eEWOA0r5ywiki7jA0mR/xdnbkoFgywja4B7Rfj/
         QJbQ==
X-Gm-Message-State: AOJu0YxFaRqld/54x06FYierzbvQV1/QOXg6nWj3W3NuGMCSlAySRgMr
	5cwJfTdJs1bgp+Sq3CpzRlQ9WsIcl+cETAqKjUG11iqJby2pzGDwVNvhnF/l
X-Google-Smtp-Source: AGHT+IGc5OS3C3WX6mjQ3IlpqklHm9dcEPH3m3Ih0O36UTGDKHDOCX4seUN5412zu60YzRbTWD88Cg==
X-Received: by 2002:a17:906:3716:b0:a55:43e5:3372 with SMTP id d22-20020a170906371600b00a5543e53372mr728923ejc.20.1713991339014;
        Wed, 24 Apr 2024 13:42:19 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 5/7] docs/man: Add max_altp2m parameter to the xl.cfg manual
Date: Wed, 24 Apr 2024 20:42:03 +0000
Message-Id: <4d631207d60c8c6e80348d0e1fa368b3270b9c9e.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the max_altp2m
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..2d4ea35736 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2039,6 +2039,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
 B<Note>: While the option "altp2mhvm" is deprecated, legacy applications for
 x86 systems will continue to work using it.
 
+=item B<max_altp2m=NUMBER>
+
+Specifies the maximum number of alternate-p2m views available to the guest.
+This setting is crucial in domain introspection scenarios that require
+multiple physical-to-machine (p2m) memory mappings to be established
+simultaneously.
+
+Enabling multiple p2m views may increase memory usage. It is advisable to
+review and adjust the B<shadow_memory> setting as necessary to accommodate
+the additional memory requirements.
+
+B<Note>: This option is ignored if B<altp2m> is disabled. The default value
+is 10.
+
 =item B<nestedhvm=BOOLEAN>
 
 Enable or disables guest access to hardware virtualisation features,
-- 
2.34.1


