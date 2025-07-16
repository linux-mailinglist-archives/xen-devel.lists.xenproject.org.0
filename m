Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67272B07C14
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045517.1415645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5ym-0002ok-JQ; Wed, 16 Jul 2025 17:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045517.1415645; Wed, 16 Jul 2025 17:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5ym-0002mc-Fh; Wed, 16 Jul 2025 17:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1045517;
 Wed, 16 Jul 2025 17:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5yk-0002mM-UJ
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:38 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9b29dc8-626a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 19:31:37 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so65976f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:37 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:35 -0700 (PDT)
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
X-Inumbo-ID: b9b29dc8-626a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687096; x=1753291896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VvQD0o8nt5u2NglgLYe9IcO/Qe2EFADGor/d6eX1FQ=;
        b=pUy+0hE9j+GjXNL1DoXnhiXQZsRveK61L0Z1kHL0zGTp7KI93vYN434mlzefjtvz7c
         aNWg9jtTGiNLaobpWM+ScOVA+y6hazWaT9A2/RpMH0dWkYVWXqe8zVMO5jWEnzqxcWmM
         IuaATXpyN0fk3JddVraSzHwUUAxbEsy4ERYsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687096; x=1753291896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VvQD0o8nt5u2NglgLYe9IcO/Qe2EFADGor/d6eX1FQ=;
        b=VRG69U7TK02g0qyiM6avIYya0p9xQrtSqAs/x2Qu9Z0soTT3ZC1X+hTCzZtCuM6MDz
         KKtD+fM/tKZnWgHCgGagbrXYvub+EOnSgqX8W+H1qMdt0eqlSsAhWULz0IzEGpjDB1Cb
         cdv++2/3lpukiCVxVGgm+gikeZnVaDDZ4JdGnCVhjw0I7SUcHkocoHcTwCtjz1RFM21J
         CyDcQ5oK8QDsU4pydQ2Ry7bB2qaQtkNYTY5W92Wzm/Z52osifwXmot9egnPtSeCjU3GB
         Pma07LiIzCaaYlNuSyRZbZ2KYoRHcYdRCGzS/D3zLp6k9Sqw5sNIQmUCOHomXGjDK8tr
         apNw==
X-Gm-Message-State: AOJu0Ywphcqrc2ZIiev/W+2cggaLhdTYlcSEx1+h68REERt3JI3Hzhzj
	8W8egtLnQ89dPgzjbDi2qB9M3fgE0awzQ/gKO989qSUHYJlJUz59Lo3Q6Wy42iltWz0tY+uCWWI
	xYpfCBhbc4IBa
X-Gm-Gg: ASbGncv0opuUDjowh6C29j7aJqdldqPDoXlgw0ftAONWZMPZlEN+vYJlaXras6IwTcK
	k3Tn88vvDoeY5ohfPC92ZUnBCCsnRJFP2gTpxUHFAbGHwfISrrPXnGFlfVFiLZy9Marv2XF85rl
	n14OlnUoMjEPofF1YUyeJHfZzUZUcRq+pJ0cxOoKHgot+GITdjr1XtG2kxTnwBcslzyAC5eVr3W
	vYlOERBKD/nbduUc9m08E9+OzKE5TBPK2Df0Ls7NyjzSFI+hion0iF7m7X5Qi398EcWWCT1dzuf
	zOUkk0FHd9q22p/nAd8Al5YMzp1ZcrecGghsD3NWXXWgCIPzAhclKTXhv+PW9zOnGRjTeiyxpmk
	pjYKlrl3vpeNXm+9AKpaK4if59k00YpnPNSKZrigWlrBMLLmbqRvYHy7iugX2fa6WFJR04P4EVH
	b8
X-Google-Smtp-Source: AGHT+IHfMsLDMaL/IwM91fMZOHJWGSXzSJVRQ6s1SWAW6Dr8rbo6g2/YjHOI9BHY6TRaEV+00GoUSg==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3b60e4d1e7fmr2880127f8f.2.1752687096120;
        Wed, 16 Jul 2025 10:31:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/6] x86: Convert x86_cpu_id to VFM
Date: Wed, 16 Jul 2025 18:31:26 +0100
Message-Id: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next part of the VFM converstion, focusing on struct x86_cpu_id.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1930706122

Andrew Cooper (6):
  x86: Sort headers
  x86: Break struct x86_cpu_id out of processor.h
  x86/match-cpu: Introduce X86_MATCH_VFM() and convert intel_idle_ids[]
  x86: Convert users of INTEL_FAM6_MODEL() to X86_MATCH_VFM()
  x86/match-cpu: Support matching on steppings
  x86/apic: Convert the TSC deadline errata table to X86_MATCH_*()

 xen/arch/x86/acpi/cpu_idle.c         |  53 ++++++--------
 xen/arch/x86/apic.c                  | 105 +++++++++------------------
 xen/arch/x86/cpu/common.c            |  25 +------
 xen/arch/x86/cpu/intel.c             |  64 ++++++++--------
 xen/arch/x86/cpu/mwait-idle.c        |  11 +--
 xen/arch/x86/include/asm/match-cpu.h |  53 ++++++++++++++
 xen/arch/x86/include/asm/processor.h |  10 ---
 7 files changed, 148 insertions(+), 173 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/match-cpu.h

-- 
2.39.5


