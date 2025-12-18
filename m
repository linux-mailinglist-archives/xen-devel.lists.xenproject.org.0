Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD59ECCCF7B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190026.1510724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHng-0003Ml-G0; Thu, 18 Dec 2025 17:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190026.1510724; Thu, 18 Dec 2025 17:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHng-0003I0-CK; Thu, 18 Dec 2025 17:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1190026;
 Thu, 18 Dec 2025 17:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHne-0002iW-LH
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:28:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5109a13-dc36-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 18:28:24 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b61f82b5fso1175162a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:28:24 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b53c1sm3209423a12.5.2025.12.18.09.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 09:28:23 -0800 (PST)
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
X-Inumbo-ID: f5109a13-dc36-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078904; x=1766683704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyyCTn0BO84+8dgz1DD0QHNFwT8tEePxSeonQlFM4G8=;
        b=iQ7v3n60sz07N4/drhyaVgnB8tyKSa/yMiYs3Pg1tkCxizx2O7CWAZ+PelsHwL0Vxa
         7VW/DSUdl7YVSqm8Q4nzcaKTTqvX9hh2kGGfHqjneoeYCKjqW/eGfYOj5A2pgN/G3dQW
         CtoMzo41eEvmpUI2VbqBI3fLypsGvVcBfda57EJMXOYpYQgbLuzmB1C4u/HbSe7nGYNr
         yznbT6IhkrUpS4tONIvlXI4+gsGgh/XZSuRyj+KTuq6Z8dkcwNIo64xTUVRTXWiE9hOS
         uB501wW9rklW7Ae+esgw+4b2BgXCo8B4v9LUzX58wj4Bcb0PewgiEVf68yYH1RK7S+SJ
         m3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078904; x=1766683704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyyCTn0BO84+8dgz1DD0QHNFwT8tEePxSeonQlFM4G8=;
        b=l2urUUd91FumuADhe8ElCMCvYPbYgrW8hfPZpr9zzQ5YreBl+HQ0qaeEJHZ++zMmMm
         jXOO59HArzHe4bXpUdYprJwLGJsUsVvRo4F10f9IKyScrVL3X8xWRkTr5pZ6J7u+jkeY
         FrpcH5MoNXhER+ZQm9wH+StNEoxnuJk5oYIhV83iTjX9duP+C9FKRDcV8v5DoPxYyjOT
         ijK0tlCXZQXO/m9tYXfO4Ybf03mhH58drHhYKXlbsYBkzSB3qjNFVsM6kM5WwthYy0kE
         KvSQTP6583kYyzKqP0WbGnOLZyoCm1RZ/4joKLW13mSukM0qWWAD+ZjuWUB0k0xOlLqJ
         5zRQ==
X-Gm-Message-State: AOJu0Yy9qzmO6rIFWilWqiXr0tH+BwvsX31Ck2Q/D75jsTj3rA2UyQcV
	yxVhWjxFwkRCh5ou8EX1H8ynNUZWKl0q6yFK0pVVv+QVbIsbPO5KbKYR3aSF2g==
X-Gm-Gg: AY/fxX5WGV/Q4uoWPOQ8pjKI59LEnOzzBXbCMxM6l691q8QhkROSBy755mKdX+MZsYz
	Cc8D8/20sJQoWyURfbP1kshJqfSyGdPLg9qXnTrnuxtGYse7WMLQHUgT575nJA5EFSpWeIgohRf
	ZfjIl+3vxbEit6EpxNZF1LTnLrGy0ZELNJQGznapNuZyqqeOxD76hyPxkWuSt/FupMwKT2QcxZN
	V9ofioKeH5hWTpwjplr+bTUn8mf7Yd2THl63rgt3+NAMBqxJ9+acRRC+yB89SPXnddffYjy8W1e
	39sKcrnuthThbLwrEz7Cx6v6hzQpSEEFsWvFRXZ2vvBXh/msjfMnHw8OHMsiwWmdjqrdpXM/pDF
	MEvKKJ/OjMV2FHTTNpQwfPxdu95fyRyZhbfDp3jJFYyU9Hj8zUCR+XSc0nvZ7PsD2aBjEpBiqbH
	m9zuX0QpszE+s1HRhiJ+Vdv7GwDhK0ll23aOv+lwz5znJDeWxSlhisJ1Y=
X-Google-Smtp-Source: AGHT+IEJqDupn1iTF0rergfxLD/C09v+9f4H0/Bivd89XjTUtGTRXnvG436ZyPk5tpIjNL3JRCF/pg==
X-Received: by 2002:a05:6402:313b:b0:649:aa69:dc07 with SMTP id 4fb4d7f45d1cf-64b8ea4d917mr162395a12.12.1766078903920;
        Thu, 18 Dec 2025 09:28:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct() static
Date: Thu, 18 Dec 2025 18:28:09 +0100
Message-ID: <439f6e9dc1f35736024023d70ed7e1daf1ec294b.1766053253.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766053253.git.oleksii.kurochko@gmail.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As {alloc,free}_domain_struct() are used only within domain.c,
they can be declared static and their declarations removed
from xen/domain.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/common/domain.c      | 6 ++++--
 xen/include/xen/domain.h | 4 ----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92fc0684fc..7509dafd6f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -690,6 +690,8 @@ static int domain_teardown(struct domain *d)
     return 0;
 }
 
+static void free_domain_struct(struct domain *d);
+
 /*
  * Destroy a domain once all references to it have been dropped.  Used either
  * from the RCU path, or from the domain_create() error path before the domain
@@ -819,7 +821,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
-struct domain *alloc_domain_struct(void)
+static struct domain *alloc_domain_struct(void)
 {
 #ifndef arch_domain_struct_memflags
 # define arch_domain_struct_memflags() 0
@@ -835,7 +837,7 @@ struct domain *alloc_domain_struct(void)
     return d;
 }
 
-void free_domain_struct(struct domain *d)
+static void free_domain_struct(struct domain *d)
 {
     free_xenheap_page(d);
 }
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 644f5ac3f2..273717c31b 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -66,10 +66,6 @@ void domid_free(domid_t domid);
  * Arch-specifics.
  */
 
-/* Allocate/free a domain structure. */
-struct domain *alloc_domain_struct(void);
-void free_domain_struct(struct domain *d);
-
 /* Allocate/free a PIRQ structure. */
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *d);
-- 
2.52.0


