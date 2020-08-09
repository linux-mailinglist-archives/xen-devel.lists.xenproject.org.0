Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862A23FFAD
	for <lists+xen-devel@lfdr.de>; Sun,  9 Aug 2020 20:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4pyJ-0002ig-2m; Sun, 09 Aug 2020 18:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa34=BT=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k4pyI-0002ib-7b
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2020 18:23:02 +0000
X-Inumbo-ID: 5d882930-4d2b-4426-bd3e-6e20fc95902b
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d882930-4d2b-4426-bd3e-6e20fc95902b;
 Sun, 09 Aug 2020 18:23:01 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p25so6478539qkp.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Aug 2020 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UdJzhXUqKipeiiWy8QBA1srJWv+WaepWTdw1sLK832U=;
 b=eXls3dRI6vK/fxRZ62BINomD3eew55PTT21kF6VO97Fkby1EYA168vkHhrN5ekkAWW
 nwwIzdxHDnuEMIXmhgJy/MW8JYAhoGQDXJczCqUSHLjqV+INzCTGkMF1tOq+r38F2ASs
 eR3xYnF4XrBvm/xXOpKNZ8ba83QHAVsslqfWPg+RiENrbVDgVCIqGtk52hIGEpWGYMqi
 PQV5ZBlK4Y2+D+vOqiC8mN1C3+U/sR+nkVfxKUZFp3FvRpHtDz45H+myzw52UeNscb4t
 kQdIxLfDybp3E0uBiuoPbv3pWdUBXypL6h3pod9YAH5K12cs419OeFJlY4DGL9b5g8qc
 9YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UdJzhXUqKipeiiWy8QBA1srJWv+WaepWTdw1sLK832U=;
 b=LQTcveFIdZIOzeLXBQ7AuFe3JrkV4br6FjO7gosTDwsxcJN9AtHnyidd9lQu7B/9nK
 1KbIpwjxalM7rhLKzyuvCzVc1fVD0h1oE0GMohUj9hVz5crdCJNVvSRaE1vlWOGRR+aV
 gNIdoXoY+h0MrhNed5gZT2XHxWtSy9dN8H5G5fKzYw7tWidmqu3h8ab475HOAKdmlB3L
 0b9K7Q64xLoAIkzMqvUpmtGXgNKEnOcHSLGb7ZePK6qS48L10tDKe5zUgiCooZJnCaPW
 1cJ6251QjXkrOll+GBufgSsTXoDVwjuEbDA8alEu+hNOJJCfJFGJdDFIcN0bSyfNfkCF
 vYEg==
X-Gm-Message-State: AOAM532RUEUvuhnJ1/7OB8DgGhR0r6aVkapzxpYPzoc0idbsdcDhuuIp
 iVi8/Mo35IEUD/nino6pdk6sePPtM30=
X-Google-Smtp-Source: ABdhPJzwc0CCC8V/nQ1uPQ0Ixsaef2NvhgThpZmjAQ9hFaTWRWm35zPu2a2pQIO/hLu0OUrcfPbCLQ==
X-Received: by 2002:a37:a851:: with SMTP id r78mr22478118qke.419.1596997380598; 
 Sun, 09 Aug 2020 11:23:00 -0700 (PDT)
Received: from TestCloud1.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id l13sm13188231qth.77.2020.08.09.11.22.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Aug 2020 11:23:00 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH] rpmball: Adjust to new rpm, do not require --force
Date: Sun,  9 Aug 2020 14:22:34 -0400
Message-Id: <10c7314a9e1b89fa030d11d5ce6664e1e77179d9.1596997354.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Don Slutz <Don.Slutz@Gmail.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <Don.Slutz@Gmail.com>

Also prevent warning: directory /boot: remove failed

Before:

[root@TestCloud1 xen]# rpm -hiv dist/xen*rpm
Preparing...                          ################################# [100%]
        file /boot from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
        file /usr/bin from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
        file /usr/lib from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
        file /usr/lib64 from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
        file /usr/sbin from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
[root@TestCloud1 xen]# rpm -e xen
warning: directory /boot: remove failed: Device or resource busy

After:

[root@TestCloud1 xen]# rpm -hiv dist/xen*rpm
Preparing...                          ################################# [100%]
Updating / installing...
   1:xen-4.15-unstable                ################################# [100%]
[root@TestCloud1 xen]# rpm -e xen
[root@TestCloud1 xen]#

Signed-off-by: Don Slutz <Don.Slutz@Gmail.com>
---
 tools/misc/mkrpm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index ae40e1a..68819b2 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -62,7 +62,8 @@ rm -rf \$RPM_BUILD_ROOT
 
 %files
 %defattr(-,root,root,-)
-/*
+/*/*/*
+/boot/*
 
 %post
 EOF
-- 
1.8.3.1


