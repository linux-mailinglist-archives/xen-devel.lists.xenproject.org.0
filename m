Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA71C8B299
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173273.1498345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7K-0004B6-Uk; Wed, 26 Nov 2025 17:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173273.1498345; Wed, 26 Nov 2025 17:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7K-00049O-RU; Wed, 26 Nov 2025 17:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1173273;
 Wed, 26 Nov 2025 17:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOJ7J-0003vq-RU
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:15:45 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b4d9681-caeb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 18:15:45 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so66695f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 09:15:45 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm40370605f8f.21.2025.11.26.09.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:15:43 -0800 (PST)
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
X-Inumbo-ID: 8b4d9681-caeb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764177344; x=1764782144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv2GcjtNyLt38SYmgslAiyI7xWkbmfHZsKTKcBN/TsY=;
        b=v8XUqE/pN2lYGiWCPWHqcMJ4/XtlovTTDuLXOyQGqrQze1cCGP/h/MlgULSbz7SYXe
         xCnEcvNFh32WlKs/KsG2LbaYOINfk4d7iwIJmEmAwDhLT10wODeftcsDF4+HTOftdcGl
         BZ0u79vGJ4Xbu0v8vrUfHUK7GAAnVA5BiAuHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177344; x=1764782144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv2GcjtNyLt38SYmgslAiyI7xWkbmfHZsKTKcBN/TsY=;
        b=hZ2cw0dZ8crCAaM3/toX8Hl+5qJZJejJpViDnEaHU3sdASNzPz9MtqzUvU6d+ka78j
         rAeuQtyom1lJ/c0j9iv7Z0FEHa0EXXF35VAjRjDv+XhW0pYFfJmIRfLDeHWcjk657gmP
         UqVqoIaG9UsofLab0B0HkOWCJrUYfzMTXIFpRKylKoF3Q4k7aauLR/Ysyjv2Iv21Wrbt
         3PRX0zVzkgQMREYHYBOWHuFWdBOgtDsfcqHIphjzr22iPo6I+90siFhmatYsj3EwxL6/
         1V9gTPBhCne47IQwnmJ4k+AXcsVxvzMiYNCrfS8b/7r7Fj79PEU/6kGzOoY0q6+xygmJ
         AK/A==
X-Gm-Message-State: AOJu0YyiFgCoK/YP7F7C/iQny1+6URLWNuSYb7JUUK/y9DqIyuB4rfZE
	nIyaDQEUIgoZxlkiMHzVbQWghwTAYnRitbNmpt0CQEZMimBn+9SFodRkEHtyHRJ0PddrC5QuicW
	MRZil
X-Gm-Gg: ASbGncuEpyNRa09KKRFwZXBDoxQRo0lBoOla5K8LATKi899fyRtiPCQvsovFMisnwwh
	Nq/IO1PsKo9NeHz6J43BhKvtJQXX+Nn8cmjCbqxLU2zNiKDvMesh1Y1ZGiIV8/c63jRMU2zD4x8
	A/E24A/FsGURK99WSziJXhtaFjdPnie2FZRxUgZxqgcBK70YszZEOMWNfEJHdqOHp9gD6TxKWA5
	yHWjQzhoJEJWPMaSMgkZhLUUIhDlEmQiDMhKt+I+LaoknG3aacXW0F3+9KpPycdxa1N/VrJt4x/
	Kv9Yy1d7TGvdxOe8B2StI99Q+yHzWIT1AzeOar645h9gUcDusjk+b2QJCvLHoeHOAEH4KhxvBA4
	ROGeBx6haJOkojhrKSLw2UCERfiOgWvw5oUkX0snlzDPqCnBSasO2IiciRqDiv7dsQKZfL+VHH1
	ODDvsHZnx9FTX/iKDO41KhWxGJaMXrbSEa18TsMieEm21SNINXebBtQ5NVB+l2kQ==
X-Google-Smtp-Source: AGHT+IF993I/5wA/Dqltbx+GiKKXijf7P3FlFE6zjpPKdbZW/gyhm9Kq6uFR4Pw8IkZEonsg+GOdqA==
X-Received: by 2002:a05:6000:2004:b0:42b:5406:f289 with SMTP id ffacd0b85a97d-42cc1cd8f27mr22297855f8f.3.1764177344407;
        Wed, 26 Nov 2025 09:15:44 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/amd: Drop vestigial PBE logic in init_amd()
Date: Wed, 26 Nov 2025 17:15:38 +0000
Message-Id: <20251126171539.890253-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126171539.890253-1-andrew.cooper3@citrix.com>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The comment was adjusted by myself in commit 51bd4bbdfdba ("x86: drop
X86_FEATURE_3DNOW_ALT"), on the presumption that the underlying logic existed
for a good reason.

Having done further archaeology, it turns out to be vestigial technical debt
from the leadup to Linux 2.4 in November 2000.

Prior to "Massive cleanup of CPU detection and bug handling",
c->x86_capability was a single uint32_t containing cpuid(1).edx,
cpuid(0x80000001).edx, or a synthesis thereof.  X86_FEATURE_AMD3D was defined
as the top bit this single uint32_t.

After "Massive cleanup of CPU detection and bug handling",
c->x86_capability became an array with AMD's extended feature leaf split
away from Intel's basic feature leaf.

AMD doc #20734-G states that 3DNow is only enumerated in the extended
feature leaf, and that other vendors where using this bit too.  i.e. AMD
never produced a CPU which set bit 31 in the basic leaf, meaning that
there's nothing to clear out in the first place.

This logic looks like it was relevant in the pre-"Massive cleanup" world
but ought to have been dropped when c->x86_capability was properly split.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Linux patch:
  https://lore.kernel.org/lkml/20251126125147.880275-1-andrew.cooper3@citrix.com/T/#u
---
 xen/arch/x86/cpu/amd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ac49df681c2a..a32e5fa208d5 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1131,13 +1131,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		wrmsrl(MSR_K8_HWCR, value);
 	}
 
-	/*
-	 * Some AMD CPUs duplicate the 3DNow bit in base and extended CPUID
-	 * leaves.  Unfortunately, this aliases PBE on Intel CPUs. Clobber the
-	 * alias, leaving 3DNow in the extended leaf.
-	 */
-	__clear_bit(X86_FEATURE_PBE, c->x86_capability);
-	
 	if (c->x86 == 0xf && c->x86_model < 0x14
 	    && cpu_has(c, X86_FEATURE_LAHF_LM)) {
 		/*
-- 
2.39.5


