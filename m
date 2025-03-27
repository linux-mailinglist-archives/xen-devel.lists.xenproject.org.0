Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27EA72F7F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929042.1331662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlTY-0008LC-HV; Thu, 27 Mar 2025 11:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929042.1331662; Thu, 27 Mar 2025 11:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlTY-0008J3-Ei; Thu, 27 Mar 2025 11:32:44 +0000
Received: by outflank-mailman (input) for mailman id 929042;
 Thu, 27 Mar 2025 11:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFzh=WO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1txlTX-0008Ix-CX
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:32:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 320021db-0aff-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 12:32:42 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so148170766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:32:42 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb64a2asm1229031066b.92.2025.03.27.04.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 04:32:40 -0700 (PDT)
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
X-Inumbo-ID: 320021db-0aff-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075161; x=1743679961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiEaN7cfNVNuO5q9MKTZb30f+X3rKu30S9/vPJL/aWM=;
        b=M5jDdzX8A+E08JhdWQtuYpJxst1rF5Ca0we69+eUX5WYIAjDNW7xcmLlC6DQaKdNtj
         HR2TjyYi7wpK6Ecc2UEQ92GU5KQA9donh9khstSiiDB/K1uRwPDGuxRtn5TpKSKsc9vX
         4J0teKMdS3P5rOeKq1xovCMB2JgsrC0VscAPsTJPhDy/9hkWizu6HDns/eqrCXWC62u/
         x0HWu2FEk1WGXHBJa/2Q8n6WHDvDgdELjaHrXzWOH+13KbipPSJSl8g7AgNqzi8GMH0p
         SnxNiaVM98tKaXXR0116yUDypDo9q0FGNoy2pGmaHDQphsjpLgXRil/+kdK78LaFkXdy
         sHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075161; x=1743679961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiEaN7cfNVNuO5q9MKTZb30f+X3rKu30S9/vPJL/aWM=;
        b=SEl9rEWd+J8TzRiJigLinTWzqHXGVhpkRc47vpK/hqEevaSca9ZPpsCvQivJTaNab+
         L57W0c8ADkWPq+sxEYSLURhJ4CviFU/spdCVPwdJ8EU3X0Fd124PhGEh0M6yodozwpv1
         oQjiKyY8KrrAjpbTDzeiuQYrqiqHm4FxfmNbTiqTMilZDtPwzkaiS2mpmCf74j82nNm0
         FVTO+56XN7SXx1AyX/3mYpZxzswBtW95YIaO/9LuEMgUayVzQzb13LYZE1PLwlaieqgj
         7gNxq4zx7agYQb9Br5KrhV9LWVIpVUBvdBwT5X35w4C2dctPcU049Oml+C5uEinHJ16M
         Qnpw==
X-Gm-Message-State: AOJu0Yy+dGWIQre0x+rlmIbej6VxOLfdkxP4INA9OUeA3uRQ8l3kgFQe
	O2S62+4okSudonCB3WFxkxzdbyZPPaSxXqe5DvDoKRNeSIqn9F0ABFybGg==
X-Gm-Gg: ASbGncsrWCBJdaZjBO20MkLfDX6cbJdrZ294DxWdIEwi/709Lkw6+jGbQp3y+pFJdHV
	MLmqIdKGDsZTVJ3bhPa9CbbFU5mCj1zHGfaATiNXvjZP8mEFP5pLr9zEUNXMlrDVN9f6zWHf/xV
	DHrBTkQH5yTwnfdPsCJ5CSg4BfwUbKusmQxWTJPVAwsQ8brQeFZ+gjKqZNNjfGktzAsQ1Y5Atle
	f3gRJZyceh4y3c8MHryaz0NWz9ETq2h90Hh4cnwIRBn2XsvKg9LtX/w3KCHvudpU7vzWdtBAlvW
	/frWb65wfEI2k0js3C6sGVgoLOSZU1dOaKC0BtnfEzg6MqdONKc2iGnKamXuKR1JFmW0oD32C58
	+PvC9slAB
X-Google-Smtp-Source: AGHT+IG3V5Tr1egLTLnhtRk+Ob11D/SkbQlTGWvilIgAaiaHGTcghuBbYfROmo7OMaQ0JIuDra+hwg==
X-Received: by 2002:a17:907:3d92:b0:ac3:c7c6:3c97 with SMTP id a640c23a62f3a-ac6fa7e7335mr285968166b.0.1743075160370;
        Thu, 27 Mar 2025 04:32:40 -0700 (PDT)
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
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v2] xen/percpu: don't initialize percpu on resume
Date: Thu, 27 Mar 2025 13:32:25 +0200
Message-ID: <7c3fece57a28462ae0c071c1cf72eb32541f1b91.1743074241.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

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
Changes introduced in V2:
 - cosmetic fixes after review
 - chnages in a commit message: add "Fixes"
---
 xen/common/percpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index e4e8b7bcab..b20f0460fc 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -30,7 +30,9 @@ static int init_percpu_area(unsigned int cpu)
     char *p;
 
     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
-        return park_offline_cpus ? 0 : -EBUSY;
+        return park_offline_cpus || system_state == SYS_STATE_resume
+            ? 0
+            : -EBUSY;
 
     if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
         return -ENOMEM;
-- 
2.43.0


