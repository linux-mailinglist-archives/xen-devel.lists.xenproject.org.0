Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBACB8E4B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185385.1507574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36T-0000p6-Bc; Fri, 12 Dec 2025 13:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185385.1507574; Fri, 12 Dec 2025 13:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36T-0000mh-7s; Fri, 12 Dec 2025 13:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1185385;
 Fri, 12 Dec 2025 13:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU36R-0008Uq-Hm
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:35 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f0bcfb2-d75d-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 14:22:35 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6492e25cd7eso1872107a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:35 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm5168260a12.19.2025.12.12.05.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:22:32 -0800 (PST)
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
X-Inumbo-ID: 9f0bcfb2-d75d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765545754; x=1766150554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/JxxBDY+KhwZWz0jMdNpGTqDW+EDXqjFu4woHI4vHE=;
        b=DNXwvC4jLM4vanJFth/ZnjL9qjzqtLyIuNvOn5eNmbf0UMcUTzSG6DE+1FRv4JA90p
         HDBhyk01sROPNFc76SavRbCD2zmVpNUouqC/6UuNSHlCErH/1zCG5/g39uXDsRzd3Yen
         tehBYr335T7B4DBQJ5axEy8CndrQO/wc5suve4ush9UvL/lUCoveqpdnKjoLN8jP3iX2
         LQ0rPPW7A1dfid43Zamy5hHnTzRZkWwPqV3L9jUtLaIr7mX7iKsom9drwKgW7TUZGAoj
         70RvWvWBjSyhW0WmHbXGvikuozqf2Vj7qFHwrZDWNDysf5vr6KLOt7U/ITjxJiDIDC+W
         k26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545754; x=1766150554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/JxxBDY+KhwZWz0jMdNpGTqDW+EDXqjFu4woHI4vHE=;
        b=IyWO5C6M8uc3y66oQM8/tkhXltKuzjEqdYfREyhy2DktwsGIubBGSnLTUps0ne7JaO
         nWXBxiBiH8M6t4GIPFyKIrkOjogA/0PLBPDVUgVi6Dli4azjA582Gt2gDXvhGFWXis0x
         uhh+XJlLAt2tHYbL1IPjiwQFg0Yt1lOpjBkU/6mCrjKIJP7dl6hB6G6EwJUuiInfXFR3
         fbQSpkJxvzC2VeloEUoXc0e9kr2nDt6jmGzHnSm47AjhpwNwHpn0G0DIk6FO6tzxAhJ4
         WBYFj+pv1nrE1k9BAV6iLMd71jiMcPGWKGJp10V3ob92Q0r4QLlXQp8UjgiZIaYP0c4J
         4bAg==
X-Gm-Message-State: AOJu0YzZXTu5gpadlAJ/9if0B2JQIC81x6BTXkIVy5G3KckUv1h/3RP+
	xcig8DuU5YvwUFXtUOXsY9DPONImFKyNeU9UjJ1bKEdjEZT9p5OZ1Ka4F53gNl4N
X-Gm-Gg: AY/fxX7mM7JU6XFW8jFoNA08/3zmdKemTmrSuCG6AEbKBIuSvRzLOdRpG1iudUkTR3l
	ry6e6b1fnX2G41QuS/+zmNooGjeqFu91PolkKsBLDHGGkj7JK3ZgGqh9Wm5f71hgyJ9uZtvJ4YO
	c3seGt0zuy1Bcmr3vZO0W9wRCEYa9Em0VK0GsUQVAitweHPS2ChGyKukI16Oi1VaZA0uAlJvcA2
	BiEgFxt29lyNJ/OHmBeStfTVTM9nMDxB8GJSEW9E3myCNoVA9UTs4PJXhb3ljzuZWOnEpQQmF12
	MS1JpBrzVl3VzdTu2ZU83BjufDYOPiEMIsrYgUeT1N/ZH1SEPToFJWb5okUu2Shavl9qmuG54Fc
	5Hx8vMvGGUBC6NDYD1ctSmZyDj99jb/5+nWcPlO/RmLqqBFy4GsdQaJQ3UzuGuHGUoDUl2rAxOU
	qBpXgTobVpi5Ut8hbl0zb86vCmUlZE21kznauQJIjPqeYJKrkoX2A=
X-Google-Smtp-Source: AGHT+IHW97mlKs9EpH2a0rHl3ZPaJyK7IC/0kwYJdly5+rJ0Mh+pxexntuj7EYdwZbQkAhbB0Vpdbw==
X-Received: by 2002:a05:6402:254a:b0:647:9352:ce7 with SMTP id 4fb4d7f45d1cf-6499afaf5c4mr2131235a12.13.1765545753636;
        Fri, 12 Dec 2025 05:22:33 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v16 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Fri, 12 Dec 2025 15:18:20 +0200
Message-ID: <b50be85919d2f92c210a3fda8c4198e7f01fe6e5.1765533584.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765533584.git.mykola_kvach@epam.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, Hypervisor" section
documenting support for the optional PSCI SYSTEM_SUSPEND function
exposed to guests.

This function is available via the virtual PSCI interface and allows
guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V16:
- no changes.
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..8e7ab7cb3e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.43.0


