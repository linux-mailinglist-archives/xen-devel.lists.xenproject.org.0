Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657ED9AFE2F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825692.1239973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GcQ-0001Do-5Q; Fri, 25 Oct 2024 09:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825692.1239973; Fri, 25 Oct 2024 09:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GcQ-0001BI-22; Fri, 25 Oct 2024 09:28:30 +0000
Received: by outflank-mailman (input) for mailman id 825692;
 Fri, 25 Oct 2024 09:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zran=RV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t4GcN-0001BC-U4
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:28:27 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d16a5bc-92b3-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 11:28:26 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so124361666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:28:26 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f29830esm47711466b.108.2024.10.25.02.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:28:25 -0700 (PDT)
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
X-Inumbo-ID: 7d16a5bc-92b3-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729848506; x=1730453306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIQ9z32lCDQ89ttrJpbt5YIpjXlndBpOXBMh88sptDw=;
        b=LZLY7RRfUllkZhU/rSE4a1pmWyV1mJfE2VZDuXoXLvo4maXRyxx1BYwr8r2AgZSBxL
         UBZhDxAof5kg/tQClP9VSO2tNl4dEUuFlf1cBUXy9b52sUbONwghgqFI/GPK/TvC/FVN
         hMdJ1xaHaENZJu+WM/HkHhM0UVyfdz7BSrWh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848506; x=1730453306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIQ9z32lCDQ89ttrJpbt5YIpjXlndBpOXBMh88sptDw=;
        b=vyl8fi8wNO2pQ7mIopOCmsu+CZlQNRbGTyM5VPIjZohsq1ih6mfwgCMsZP7BUEkkdS
         e+E3Q5sIcQezo/ouvfwGW5hLaOu3ZbNzlCzfRPSrBcU+JQ3QkdA/48w3j9KRschvGMov
         tBE+H3UEzZS4V1JImk/8s2sbuPKwyEUqoUF44StWi0QsTbu2T8hqEQXDMocV5wEy955C
         ZD1Dn+6IeGQTMXg0sN1+InqgFV9dbfc5waomPtj1QzmRELs5safqfPRj5WBTJOv7pHun
         Sg+vtfOzIXGYn/o7wnNsj3/RKYHbLNOv5rMoedpY5l9s6ORADhqc4mQ1oDz5ML5hdFjF
         x9Kg==
X-Gm-Message-State: AOJu0Yw7tBUUQ7QQtIDyvBJ1yW0SmyXOGk+7zniKIL4kkz7lijQOTQax
	7YA/RrdhZJlFflFS6LKbFcWlKqzWiahXqbK5ilGUTkDO233CP7pcEd4shYvWnEPu8FyX3MyJ9+b
	c
X-Google-Smtp-Source: AGHT+IGcEux7qbzxu8DVdJTrMqb09ps2lsNzSPC4X7DdtIqrZlLHUdB+061k35Z2bCJke9RFik8cOA==
X-Received: by 2002:a05:6402:e85:b0:5ca:ef8:bff8 with SMTP id 4fb4d7f45d1cf-5cb8b28ecf9mr9338060a12.33.1729848506039;
        Fri, 25 Oct 2024 02:28:26 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3] MAINTAINERS: minor file line update
Date: Fri, 25 Oct 2024 10:28:15 +0100
Message-Id: <20241025092815.524810-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"xen/arch/arm/include/asm/tee" is a directory and should be terminated
by a slash ("/").

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- removed second change, it was intentional.

Changes since v2:
- rebase on master;
- update list of Acked-by.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bba2c8c31..17fc5f9eec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -518,7 +518,7 @@ TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
 S:	Supported
-F:	xen/arch/arm/include/asm/tee
+F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
-- 
2.34.1


