Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C18B7610
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714806.1116130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtO-0005D7-MR; Tue, 30 Apr 2024 12:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714806.1116130; Tue, 30 Apr 2024 12:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtO-0005BJ-IL; Tue, 30 Apr 2024 12:47:30 +0000
Received: by outflank-mailman (input) for mailman id 714806;
 Tue, 30 Apr 2024 12:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtM-0005Ay-SM
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc53207d-06ef-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:47:26 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a55911bff66so691582866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:26 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:25 -0700 (PDT)
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
X-Inumbo-ID: cc53207d-06ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481246; x=1715086046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/3Z8kC2ZWmbOhYO1tAnyDEQujCWIxWiDUkHRYm3iqo=;
        b=LEXe4UlgDLJqw+83HhsRjo3krl8zEryqGDo1i+c6METHj+QD9SNt13RxRn2vdYsrKy
         ycMJIcaGPRSsp357ZCH4G21/a0QEkmSxONjhB3+sV2NC2lAoJOE3N2/AFNVZo9rpz/el
         h+QxUYYg3SEfdECBYVb2DGERZ3WF9Ik8xLZ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481246; x=1715086046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/3Z8kC2ZWmbOhYO1tAnyDEQujCWIxWiDUkHRYm3iqo=;
        b=t5GgrBwps1xyohnSy/VoLKM88m8UFvmg+SmR2SleflbUqVC4PmIJT8y1WeVoMVeKNx
         YeUB4N+voDru/1Jn43BcLdX11pv4nfMwR+PmwM5TQ9/VpbvF1jQAO4x5aYNmK0M7wehK
         Bt/iSG2xHyvkzPg0yoUMuwcL0nzKoYRFZO69HgzP7Q6eVLVGobfeavcb27CAYZZC5OBW
         98dvQEhebsCCi/vZdRFzxFhhNIuZrgCkoPQr7SicuuBxH5i43hPe0PQOBnMHg+hLvbSW
         WLE8qP+4o3PJF4OczFfsDX+uYsyrbbe7pbgBEiq1Y31+G871midFzgUYmpQUaBGYLboX
         Z4FA==
X-Gm-Message-State: AOJu0YwOPhB5ddAcTwFWIWEHgcRliZQzcgBvd6BdRwbodjL1olACn0WI
	t/EKinumg739t4tNFSplNPW+IsVuMDqSL18+XhNdSWJjPVeUPdTNDDg04fR0Dw4oCQ5bTUyR4tL
	k
X-Google-Smtp-Source: AGHT+IH8wMmIRSmYHYE3gK5HPYgamJ080gfvcaIyOY7muCualaNhVt2ijjkEvC7BsbS9RMKI612Iiw==
X-Received: by 2002:a17:906:194b:b0:a58:c0a1:f22e with SMTP id b11-20020a170906194b00b00a58c0a1f22emr7629631eje.2.1714481245974;
        Tue, 30 Apr 2024 05:47:25 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/5] x86/xen-ucode: Introduce --force option
Date: Tue, 30 Apr 2024 13:47:04 +0100
Message-ID: <20240430124709.865183-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.
This change is required to enable developers to load ucode that is the same version as the
one already loaded for testing. On top of that Intel is introducing "min rev", which will
require a mechanism to override version checks

Fouad Hilly (5):
  x86: Update x86 low level version check of microcode
  x86: Refactor microcode_update() hypercall with flags
  x86: Add usage() to print out usage message
  x86: Use getopt to handle command line args
  Add --force option to xen-ucode to override microcode version check

 tools/include/xenctrl.h              |  3 +-
 tools/libs/ctrl/xc_misc.c            | 12 +++---
 tools/misc/xen-ucode.c               | 61 ++++++++++++++++++++++------
 xen/arch/x86/cpu/microcode/amd.c     |  7 ++--
 xen/arch/x86/cpu/microcode/core.c    | 15 +++++--
 xen/arch/x86/cpu/microcode/intel.c   | 10 ++---
 xen/arch/x86/include/asm/microcode.h |  3 +-
 xen/arch/x86/platform_hypercall.c    | 12 +++++-
 xen/include/public/platform.h        | 14 +++++++
 9 files changed, 103 insertions(+), 34 deletions(-)

-- 
2.42.0


