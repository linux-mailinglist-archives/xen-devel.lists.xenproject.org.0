Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C817A74439
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930199.1332868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3qm-0006nc-Sj; Fri, 28 Mar 2025 07:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930199.1332868; Fri, 28 Mar 2025 07:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3qm-0006kx-Pq; Fri, 28 Mar 2025 07:09:56 +0000
Received: by outflank-mailman (input) for mailman id 930199;
 Fri, 28 Mar 2025 07:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqHR=WP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ty3ql-0006kr-AA
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:09:55 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a61b3b33-0ba3-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 08:09:54 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so359616666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:09:54 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7192e7d36sm113585466b.77.2025.03.28.00.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 00:09:52 -0700 (PDT)
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
X-Inumbo-ID: a61b3b33-0ba3-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743145793; x=1743750593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgnirDI5Z6jVdU8BzlRjfzaNqqaKOUcJC3vL34SH97E=;
        b=JPyfQby3N2J1B8PtnvJq5DjTsW5JeJqdYIATEvx+LKhdmwq8LQ7IQzOCKqIPxLHUfD
         2i+dWwZlJIdFkpK1hXkvPQYMmiGddM3d3rz2w0CgbIHmfbopmaHelXuO1X/hmU1i1P2n
         ywBFtlT+dhIaIrbOxwfzFQACtlJ6Y8ECvkIWKMan7RXUGLl4U0q5OEMcR99PqXuiT/XT
         280pVrXxBLN4c0eHGXZ+SDtogJHwla2gmcQecI4JlAqMB3YaaQ8f+2vX9J7eFQq1wWyV
         itzumEo2oTNdqL8Ey+gDUD0raonwP5i/aGyK3jw8EXFkC59Uw6zuhbeFGFsua5cAgNrq
         1uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743145793; x=1743750593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgnirDI5Z6jVdU8BzlRjfzaNqqaKOUcJC3vL34SH97E=;
        b=atbXPdF239XufpWJtZPFnF1vYvdRHnFyuOeQAw/IPoXq3e2oOWGCEWGLQPoQbklPVw
         dR6cbg3DuM9U4/iBSCxuAwZa6unmoJM6+YvUxdDjjJgs5+JoD1dX4Jyws8QhYyWc+707
         tViO2flKpAbc87EByFHMZAH4UFWpk3b2r/vpAXh+BM4v9pXDIT1aNL+f4BLF6U6PIqDy
         w8SQrLpRLwprghzU36A3AihsUmXoVmeFR8UcfscivmZpMq0f4uRKcoaEtLJKKd6NKwCR
         gdTo3RTjolwHbogOv6xpUIdETqQT3Vg3elKSTU0jl0OZIg+r1ZDIB8AodAIvZC3P9Vnw
         xeJQ==
X-Gm-Message-State: AOJu0YyTvnaJw5EOmMt/gqLx94eZS+H9vqdd013U3env+4v9qppda+a2
	5oGI0zIojrKLG4otSStj9urAXXGESVu04xhxatlHUX3HTCv7wDk8IQxJqg==
X-Gm-Gg: ASbGncvDdbnJv3zpKlvkBRUP1hAc/sS2WwTeTG2EZggjMPfrqBII16BoYc+WQXf9CAx
	XLANiFdsM7n9E++fphSfJknEuZ03YWccoCxeDUGwJl+Q/SLyEnNPI4+pO20tZT9H6mptMMrpd+O
	DTISYVdNdL9OxBdViFV7M2DDTdPPxTbe1tAGT1Ae3WudrTO3AuB9S9V6Ua35+qSBwsf9+S7u1wB
	huCgqkcy4sskIkKQpmVQ36mvwOQ/JQDRUwEXjJ+6F/NuGhtOwS0kKiRWUyjKnoi9V7K6PJy7y6r
	MDyCvMajnbvfFlonmMqjrcpskfuXLmdbW9PFY3CPMRfvWtTut4GtOe+J6kUasZ54ZISYCBfk20D
	j4n87vheY2FlyoUnixo4=
X-Google-Smtp-Source: AGHT+IH8yNxZW7Q/KzLPPZ87s2aTgfSNmKKJ2ScX6hHjamY672pz8vID3rMVyz2XoCz1T7Is3PjRtw==
X-Received: by 2002:a17:907:6d05:b0:ac4:4c5:9f26 with SMTP id a640c23a62f3a-ac6fb0fcadamr624132166b.38.1743145792773;
        Fri, 28 Mar 2025 00:09:52 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v3] xen/percpu: don't initialize percpu on resume
Date: Fri, 28 Mar 2025 09:09:48 +0200
Message-ID: <c2badfebc1efe612c75884218f57af607df5394c.1743110205.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykyta Poturai <mykyta_poturai@epam.com>

Invocation of the CPU_UP_PREPARE notification
on ARM64 during resume causes a crash:

(XEN) [  315.807606] Error bringing CPU1 up: -16
(XEN) [  315.811926] Xen BUG at common/cpu.c:258
[...]
(XEN) [  316.142765] Xen call trace:
(XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
(XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
(XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
(XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
(XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
(XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
(XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
(XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
(XEN) [  316.202383]    [<0000000000000008>] 0000000000000008

Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
INVALID_PERCPU_AREA depends solely on the system state.

If the system is suspended, this area is not freed, and during resume, an error
occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
set and park_offline_cpus remains 0:

    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
        return park_offline_cpus ? 0 : -EBUSY;

The same crash can occur on x86 if park_offline_cpus is set
to 0 during Xen resume.

Fixes: f75780d26b2f ("xen: move per-cpu area management into common code")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes introduced in V3:
 - cosmetic fixes
 - change email in the "From:" tag

Changes introduced in V2:
 - minor fixes after review
 - add "Fixes:" tag
---
 xen/common/percpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index e4e8b7bcab..c6ecd95a08 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -30,7 +30,9 @@ static int init_percpu_area(unsigned int cpu)
     char *p;
 
     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
-        return park_offline_cpus ? 0 : -EBUSY;
+        return park_offline_cpus || system_state == SYS_STATE_resume
+               ? 0
+               : -EBUSY;
 
     if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
         return -ENOMEM;
-- 
2.43.0


