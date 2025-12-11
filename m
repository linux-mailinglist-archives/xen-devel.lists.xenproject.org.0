Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E28CB6F14
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184549.1506993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfo-00046T-Ff; Thu, 11 Dec 2025 18:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184549.1506993; Thu, 11 Dec 2025 18:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfo-00042t-A8; Thu, 11 Dec 2025 18:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1184549;
 Thu, 11 Dec 2025 18:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfm-0003I8-QQ
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f5d2dff-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:54 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so80879166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:54 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:52 -0800 (PST)
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
X-Inumbo-ID: 9f5d2dff-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478753; x=1766083553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm0K7gfsRpBFVrENvrubslPphiODpeHwAJ+aZ5FZLuc=;
        b=VAtN9ae8nNmfC4oN1F4H4AKYzL+oZDGTL4OYCeAN6OK5L+kxX9rFYbErtaowWWOSSB
         8Kz7BUIME292K5+MkMRQZXV8jn83caFqqXOHp3pnCP8UYUq76CHlkS/8TTz7+3IA/yyn
         Z1sN8+r/JuQqBAPTFBkU6ixyTEbH2amdkcP4KJLSDtNdqen968IkVBoyi/TUvk9OPtfV
         3AsiCRf7cIkswQMuSFsm8TqpH4IH/UEtDaLJpwBkvukyJA14wnUbzoz+iM5137PJufQ+
         POGOlFsg8gW/c3lgAXcqYWOsPnA5+JWHtmwDrwAxK209H2cWfQrXw7eBErMAYysJFNBA
         8aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478753; x=1766083553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tm0K7gfsRpBFVrENvrubslPphiODpeHwAJ+aZ5FZLuc=;
        b=SkrsbzEl6ojawM3qN/is+iRHV9N+bEGRqXX9bNyUpv3f/8Vw9J6mUH0uvogTqQMM9k
         JjR86jA+OJn4F91qqFW6IwKLMdJbiELrey45c+K1+6Q4wLxGeor1DOjrpRCDQeDs3GvY
         GRJT8w0BNHk5AQgsfGgCutOHUlaNYP77pb/jS7lRqTjNhvyk3cVVvzfrE3f8Wc6qj8fa
         Z5V9dc5+HI3paMUdBgzg1WLQXd0gNEFQ7RCgxWe2lGIO2UHoHZMII2cMGz4i5vW0rtuJ
         DUsoeENc7XSNiozfjOOx2WjpD+AwEneNvWegUa13L2GSyFYb5KfZX4ZmNrADwWqunzF0
         upqA==
X-Gm-Message-State: AOJu0YzNotDLwY9yGqJhbjWVfUODzAhb4RCIGEqX6SDJjXJCnzrMPiTb
	i4QRSmQZ8/FtEHXsUzLTM41PrlJMo8k7TQCum7mwf8VpS1cJ/F5TkoU69+E1WVxJ
X-Gm-Gg: AY/fxX5pgfkAG4kAqGWrN9szAQ5Vtjaky5+jjLUYrVQFtSexOkZZhTp1npiuXYPMef7
	aTDivUBNKSx3H5aNfRyhE+edDGxhg0pEPQrP84Ucoxbd42LbK56lDX3aiRLDG6LnAAyYfYI6ANZ
	p6/jS4FmjQYRInjmbuYd8XS90RpOy8ysq9oD3D8YbKTStEiOG0wCaPc6Kn0JAgGMneOSsM8EhhV
	+u5mUoOIa9SNYgHZ/ZgT7tV6HvKBSBsGC99+R9PkDb5vbXwZLnDUo+6ZAilspjnk76Wzz+I7G7/
	KV6HvURiJQ474crDPSlRlU6fPOYu+8sRYRExqVMpPCK8cQbgQIGX1++xc42b7xbsveC2/j/0bxI
	Nhnj/gZXgkh8Et087grbsyQkQq++/d9QfMq//y7KfItiEZz8OqP13cFtPCm/O+W6uZK93lABLwj
	YMp1LryfGEuiWqV6E/cjbnNcHXggj0fBISSy8rIQQw7hP0leFijlU=
X-Google-Smtp-Source: AGHT+IE1B4v2NPTDPe7SduJz6oPKzgzBUZogvMigM1+f1OFVFif+aNHzSsolQ3PFCykuMUtOq1+ttg==
X-Received: by 2002:a17:907:9602:b0:b73:5acd:465e with SMTP id a640c23a62f3a-b7ce82322a4mr699424166b.11.1765478753252;
        Thu, 11 Dec 2025 10:45:53 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v7 05/12] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Thu, 11 Dec 2025 20:43:29 +0200
Message-ID: <a4378a4679851d62dd9897f599ad92a63acea2f0.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

init_tee_secondary() was marked __init and freed after boot. Calling it
from the CPU hotplug/resume path then executed discarded code, which
could crash Xen. Drop __init so the TEE mediator secondary init can run
safely on hotplugged and resumed CPUs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/tee/tee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..00e561fc78 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -128,7 +128,7 @@ static int __init tee_init(void)
 
 presmp_initcall(tee_init);
 
-void __init init_tee_secondary(void)
+void init_tee_secondary(void)
 {
     if ( cur_mediator && cur_mediator->ops->init_secondary )
         cur_mediator->ops->init_secondary();
-- 
2.43.0


