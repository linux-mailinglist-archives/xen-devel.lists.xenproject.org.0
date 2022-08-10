Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517658E690
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 07:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383323.618478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwT-0005Dp-Ia; Wed, 10 Aug 2022 05:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383323.618478; Wed, 10 Aug 2022 05:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwT-0005BL-Fj; Wed, 10 Aug 2022 05:07:41 +0000
Received: by outflank-mailman (input) for mailman id 383323;
 Wed, 10 Aug 2022 05:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CIQX=YO=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oLdwR-0005BF-Vk
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 05:07:40 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a656361-186a-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 07:07:38 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id tl27so25720871ejc.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 22:07:38 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826504800504e9aff21bf95aa.dip.versatel-1u1.de.
 [2001:16b8:2650:4800:504e:9aff:21bf:95aa])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7009781edb.0.2022.08.09.22.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:07:37 -0700 (PDT)
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
X-Inumbo-ID: 5a656361-186a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=VbxQoe6fQMjbmMOpKGDHrB2IUNlWA7xE7c6RSpLy3Nw=;
        b=IC7qDwj3uhTT/tFcQhX0fl7EMLGTEXGn5oBMYiSuK2Mlf8TK/1vbV1vtnOGgnf5dt7
         PIW9KtfwJjkiVzT2qnmm15x0hvLxc6edoBw+yw5XxQxy4MrmKwkDrJOUsAnLN6qi8Lvh
         ygKmYs2LsXBhzP8VN0k6HSklP9GJHeSfjUveBAgL08trFsbKIp6pF4zuqiZtwQv1nR/M
         7XcLqDPUUv8/2hZbHDr+HiMz6NuhWE0aOGU9j3BZpwlgoWlFTZOrxvUeyk+wG88l0PFx
         8emfmV2xOpJa7WgWKj5xHL46rWQF4LBpc3wKzDezENR+Mwwb4q5rH6crmhQAdYfr8GLZ
         1dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VbxQoe6fQMjbmMOpKGDHrB2IUNlWA7xE7c6RSpLy3Nw=;
        b=XyOZI/oJpXhPJz0fy0X+i2fpMY8hjODtw5vFS2ObbUnFgGBOwCcfb3xqaA0L5sV4Jk
         Nuhunx7lGMNEL4JAd6OsH4Eqjx27E3ue7GHJF+al4U+Hywt4tEGr0eUamt5NfMoS9Nm1
         CjWEFmneBcJFtu8vL/ycZ7Wa19/pV6J9VMvmScKER4fndW8EsapNkYBBNeNZe1ckwSD1
         yWtVvMAy6iNCUJsVVXTHj7mywQzugd+u1VF64aFWe63pGpIzE84j4+tlzZazZCknaaP1
         jMQSDIUqzKH1UOoFvfXzettmdSMob0e0djlpXZCwO2+u/94nGRhACcPLBbIgYoJwYmRF
         JIuQ==
X-Gm-Message-State: ACgBeo0/mKB2lVDvA87M+djgeVLu2Ul3uvG0qiZ321JjVCbsxyQxVlfb
	apMimaHjp1J/ejHOtN0Uovo=
X-Google-Smtp-Source: AA6agR4Ilc9Mmk6bCf71q9Y4U7vONUnnGKet9rfY352UzgsL/7b2MdbpGf+DD7cnLyWAO/IqoW1hNA==
X-Received: by 2002:a17:907:608b:b0:731:8a9d:5a2d with SMTP id ht11-20020a170907608b00b007318a9d5a2dmr5099609ejc.443.1660108057768;
        Tue, 09 Aug 2022 22:07:37 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/4] update the xen config fragments
Date: Wed, 10 Aug 2022 07:07:08 +0200
Message-Id: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Dear xen maintainers,

here are three patches to update the xen config fragments to the currently
existing configs.

The fourth patch is just an addition to MAINTAINERS that I saw reasonable
after get_maintainers did not point to the XEN subsystem.

It applies cleanly on next-20220810.

Lukas

Lukas Bulwahn (4):
  xen: x86: set the config XEN_512GB after config change
  xen: remove XEN_SCRUB_PAGES in xen.config
  xen: move XEN_BALLOON_MEMORY_HOTPLUG to generic config
  MAINTAINERS: add xen config fragments to XEN HYPERVISOR sections

 MAINTAINERS                 | 2 ++
 arch/x86/configs/xen.config | 5 +----
 kernel/configs/xen.config   | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.17.1


