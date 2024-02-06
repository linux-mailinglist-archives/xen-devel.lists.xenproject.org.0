Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88184C0DB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 00:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677170.1053579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXUnR-0004v1-QX; Tue, 06 Feb 2024 23:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677170.1053579; Tue, 06 Feb 2024 23:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXUnR-0004rq-Mq; Tue, 06 Feb 2024 23:24:09 +0000
Received: by outflank-mailman (input) for mailman id 677170;
 Tue, 06 Feb 2024 23:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HdcV=JP=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rXUnP-0004rk-Ta
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 23:24:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2592b93-c546-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 00:24:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fe79f1aaaso9578405e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 15:24:06 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b0040fdd8f5e18sm141232wmo.34.2024.02.06.15.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 15:24:04 -0800 (PST)
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
X-Inumbo-ID: d2592b93-c546-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707261845; x=1707866645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6GrdyKlPKPAQWNWWj73dIKliIETF37U+jzX0SwkFgA=;
        b=cfE2orHZER5I88vhMC9O8M1q2dNk4FCqnjLl66AjUpyrBC9tNgdZiBPlUO8m/YNx+E
         //iQaDmvx5M+oyzG8CYxtCV/8FHiu4/hBBzWFsxLT+haDCwojRvJUDRMHqZP/3f/m0jg
         aNq3ySgqPNeXo/ZHyXsUYa5jXBDhepvd47nnOTJwyscp9xoax93idZjUbu2v2hzN4PpG
         bNW+H3uaHU9mKWJFadd55B8gJg65/EWlaOAP2oLRihMBqNT+Y57gVsThd22k63E7IiBr
         AF4kkIPJe5jHuzdBKQ3aRvjkToFU2gD1boS6aBFF/+Qe7wlupmH6NQK9dKRjBClDErVl
         Yq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707261845; x=1707866645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6GrdyKlPKPAQWNWWj73dIKliIETF37U+jzX0SwkFgA=;
        b=lL0/yHzo18nXy81U1XInKOyntsAYfIx13gvsYG2ECOGSgprvRrlRxIUl1sJbH+lv8a
         fbIquNH0DapusT1C8MZ1HFa5Fpz+O+epn/AkVGqOwlVBxkE2Si7v7glmQPc7/mzI4rwT
         jrGwi4W3hbvMFc5ZTpzDrqAIOxEGO8btrHLz61Svq3WYbfG5u+PEUQKzEGZbOMFXD5Vf
         PzDj7eRh2AUR0m9IgdkQftViLia6d1toH/V9B8diHcSO79OfT4EGD1QSR85uIAhA3Vj+
         ssgsWFcPHkTJdO32yETUaflundiokAl7NGA8fCCAUWoKpTzEhv3HAWD8C8hLG6zr2G+J
         liEA==
X-Gm-Message-State: AOJu0Yz0yYUJ895uCIXGiuMb8b7if6O7X6h/eH1m+WdPSvXRXrU0t2VV
	PqFiZYYt+csS7tPvsf+o1ShbglK9uT3R0axoOE/hn7QXDQ7Lo9yiKw6CGSJweFg=
X-Google-Smtp-Source: AGHT+IHeNVevjJhKLYZ1yKwczXrLnghYa+VOCn61kzuIVv7hmeEabAytsZM90X2UbXQD+1eZ+2Dkpw==
X-Received: by 2002:a05:600c:1e17:b0:40e:f9d4:2b03 with SMTP id ay23-20020a05600c1e1700b0040ef9d42b03mr3086733wmb.12.1707261844645;
        Tue, 06 Feb 2024 15:24:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvNQw6yFq4HAIAm+SxKYNcD4i9fE1JlWnLfdZOy6GSqX/mgz/K865dczsrvWxVUpx7XTzkO36eZpelSFZmvOutnhULn7j+1/qJW/IVCgTEXFx/hweO7G9cUzXMbLlw7l3JWjM9p+UJqys3q6s5fNuRKRFzqg6yZZj9
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Date: Tue,  6 Feb 2024 23:23:45 +0000
Message-Id: <2bb71b2ba88e6eb6177c27dd65f2af608a634ac2.1707261567.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

It's located in libxl_domain_build_info, not libxl_domain_create_info.
---
 tools/include/libxl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 907aa0a330..14f69823e0 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -519,7 +519,7 @@
 #define LIBXL_HAVE_PHYSINFO_CAP_VMTRACE 1
 
 /*
- * LIBXL_HAVE_VMTRACE_BUF_KB indicates that libxl_domain_create_info has a
+ * LIBXL_HAVE_VMTRACE_BUF_KB indicates that libxl_domain_build_info has a
  * vmtrace_buf_kb parameter, which allows to enable pre-allocation of
  * processor tracing buffers of given size.
  */
-- 
2.34.1


