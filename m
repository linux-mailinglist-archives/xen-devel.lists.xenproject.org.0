Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B98B3968
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712820.1113681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-0008Ui-59; Fri, 26 Apr 2024 14:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712820.1113681; Fri, 26 Apr 2024 14:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-0008RZ-0t; Fri, 26 Apr 2024 14:01:49 +0000
Received: by outflank-mailman (input) for mailman id 712820;
 Fri, 26 Apr 2024 14:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0M94-0008CS-QH
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:01:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83d2b586-03d5-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 16:01:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a587831809eso259910966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:01:44 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm10646714ejb.35.2024.04.26.07.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:01:42 -0700 (PDT)
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
X-Inumbo-ID: 83d2b586-03d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714140104; x=1714744904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs3g/4u7PsSjEgvku7tHk5LGTz36XpTJalrA46jZNVI=;
        b=mXz57k/0woT2RrscIbN+XoT7vYP4JVv8YhTm85pddcZe7njIhDkvdoKsQtwNLfvTqp
         s+0QIBHWH6te1AMIWACxU9lJrnfy/5xYWMbIAiymiODbbkZ9iUnIF48iNR4ydyWiiYOd
         3+3fO/JZK28okRJNaE1Z7c8Sf4Ep+fiIM5c8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140104; x=1714744904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs3g/4u7PsSjEgvku7tHk5LGTz36XpTJalrA46jZNVI=;
        b=NzqjPJpmkv7lHtD2QAvQdPpT+rJSl0e2xP+W3K6UjrACeX9OYuBydD7smzYnEwydvW
         UozcNh/sCSuAn3FYJt6zzkQl6QVmBEWkx8MFbBszqQ/pEswJvLe06EzdCNOShIfBqosq
         Og+HFFNZ8xLyraLQDdFfAAQZe4DtWoe+QMsCY8bAtKkXpWbmhxkWSQI5EYAq/BvRa8um
         ENSele3koC7LJA2vFZnFOqXzhBgovHutF7vw4FTY874sX8CcQ8zoFgb9aGPeq271KDwo
         UURX7+AdzIqymNlG5AlAonIEJj4M7aSM8+8dVyZykZKEX+FJ8tFJHPRlYi+KK67pl3dB
         RLug==
X-Gm-Message-State: AOJu0YxeD5kUUU8r5gjcM5yBFNwx4RbDncasBfF622FODXST4nsKGH1g
	JlxyIFyB16qQJ7P5AgwV5X6Ni/gebos4fDeYMMntItcffQVqLWn3q2ogAQ8GHguB83a6ByZwqYQ
	9
X-Google-Smtp-Source: AGHT+IHnij1wJjyb1RladpCBx/rNBYm1byBB9qPuEIty9/cYewQBU0Bh7k5PjK1m5Na4Cqrx/KVI3A==
X-Received: by 2002:a17:906:4a10:b0:a58:c0da:34a3 with SMTP id w16-20020a1709064a1000b00a58c0da34a3mr2008087eju.33.1714140104031;
        Fri, 26 Apr 2024 07:01:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 1/3] x86/boot: Explain how moving mod[0] works
Date: Fri, 26 Apr 2024 15:01:38 +0100
Message-Id: <20240426140140.465506-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240426140140.465506-1-andrew.cooper3@citrix.com>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

modules_headroom is a misleading name as it applies strictly to mod[0] only,
and the movement loop is deeply unintuitive and completely undocumented.

Provide help to whomever needs to look at this code next.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>
---
 xen/arch/x86/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index caf235c6286d..59907fae095f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1432,6 +1432,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = mbi->mods_count - 1; j >= 0; j-- )
         {
+            /*
+             * 'headroom' is a guess for the decompressed size and
+             * decompressor overheads of mod[0] (the dom0 kernel).  When we
+             * move mod[0], we incorperate this as extra space at the start.
+             */
             unsigned long headroom = j ? 0 : modules_headroom;
             unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
 
-- 
2.30.2


