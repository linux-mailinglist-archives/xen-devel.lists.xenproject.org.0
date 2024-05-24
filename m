Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87938CEAA1
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729744.1134992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8l-00079m-Az; Fri, 24 May 2024 20:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729744.1134992; Fri, 24 May 2024 20:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8l-00077D-7P; Fri, 24 May 2024 20:03:47 +0000
Received: by outflank-mailman (input) for mailman id 729744;
 Fri, 24 May 2024 20:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8j-00076x-Ka
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b96d3871-1a08-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 22:03:44 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f462so1170233a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:44 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:43 -0700 (PDT)
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
X-Inumbo-ID: b96d3871-1a08-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581024; x=1717185824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cmvQAA1/fqugFr137dsLZT1PnHQ0umZh9dz+pm+nU8=;
        b=VPdJVyqgwasHqrUATPyBDmILeCRS/BnJotEdwvxpS8wB7ARW0hFTX2+ZwVAsTDFHhB
         ytswLBFA8+4GpToqoV7r8hzNQpjyWTTuza3yPdRzX/szY1UNQGS2SiEQnILFPK/QRJgZ
         +rF0NfkIYOGoeccIzU13c8zjB9/5CPak4BOts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581024; x=1717185824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cmvQAA1/fqugFr137dsLZT1PnHQ0umZh9dz+pm+nU8=;
        b=S4za0inlRGdPqdmNHN3fgK9depTk1vshPnH0MomCsJEHfmjQaTBGYuz6KiszduLQ64
         pAwyI80Jhepcp4Ty6AYuBInmfTQV0GHUGZ9BYxclci8swoojpou2dlf0XZ8XXxjHVTOQ
         Eq0AqOWOpdg+dzjPfO9XTzSlMFjwnRnM1hoOxrW8vpYWp2cavYe+vKfucKQaZ/auMIt/
         sJHxT0Bwp0QFAgMtxuq5zjNNq5zDzmjJmCmQlnysKS4wzP0K8OX1lAUd6vztt0sY3rl1
         05nrzzq2+91J0i/dwViPmWaV2/58jZcDyww1O81Ef6tnwMg9xdicISKV+7YhVclOpqpe
         IxQw==
X-Gm-Message-State: AOJu0YwO84DycTcod+1811+cGFZLJdAXCdAloztrAam9xjurdpmjd6Uc
	1pRux1QwHlrFVfNFu/MB4FHNIZ+1iuZdfuhDYF8iNjhY7evfMXE9rBmaHTLHS8dfUbw4ueXCMeu
	ln7Y=
X-Google-Smtp-Source: AGHT+IFBtXPfaDlofqCV/C7m0DlQIHtiBrnlQHz5V05sHUxMp24nS1J5nbmw96zUOc2AFoBrVjV2mw==
X-Received: by 2002:a17:906:3683:b0:a59:a431:f951 with SMTP id a640c23a62f3a-a6265148b8amr226929166b.48.1716581023916;
        Fri, 24 May 2024 13:03:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 01/13] ppc/boot: Run constructors on boot
Date: Fri, 24 May 2024 21:03:26 +0100
Message-Id: <20240524200338.1232391-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PPC collects constructors, but doesn't run them yet.  Do so.

They'll shortly be used to confirm correct behaviour of the bitops primitives.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

CI: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/6931084695

v2:
 * New

RISC-V collects them too, but can't call init_constructors() until lib/ctors.c
is included in the build.

Constructors is the only way to get these tests working on PPC/RISC-V as
neither suvivie boot with initcalls() active.  Then again, initcalls() are
just a not-invented-here constructor, and we'd probably do well to move them
over..
---
 xen/arch/ppc/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 101bdd8bb648..7fe06aa4bfb0 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -39,6 +39,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
 
     setup_initial_pagetables();
 
+    init_constructors();
+
     early_printk("Hello, ppc64le!\n");
 
     for ( ; ; )
-- 
2.30.2


