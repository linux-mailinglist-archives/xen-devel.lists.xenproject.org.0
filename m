Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1746757FB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481865.747136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssP-00013E-7b; Fri, 20 Jan 2023 15:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481865.747136; Fri, 20 Jan 2023 15:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssO-0000pi-Qy; Fri, 20 Jan 2023 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 481865;
 Fri, 20 Jan 2023 15:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssL-0006Kg-PI
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 267f584d-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:17 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id h12so1098388wrv.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:17 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:16 -0800 (PST)
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
X-Inumbo-ID: 267f584d-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78yWSa2oWiLzMGFflcvH/ERn5FdBlTt3em76ND/K9vE=;
        b=XvHOyf10LUlT6LmVnhY1ibZnrqr/iIjqulVWUGapL3LP6TjwBnILSqN37umGlIfWGo
         5vXq93ElkWy1VPP89tq0TnvEiYktTtL1UJ6o2MFWuyxffggA9/ufzv8xQDgJq0r48LX8
         xZlJ4GC+N2lWm5J+XFSclYN8MSXttXQFcNK0v0pImeBKP5y+5aZ/arZsHiCu+GrXvrUC
         L7gYf/bJQ25pvI/IwUm3vPXdxmMoz3ZT5Kk8M8S7qvJNV4ttCbYbcu8oDU+OKlDgcOto
         pSCt8VxSsJ6SkIO6EUjJ/Jvfk2crTEFq8Jgj2SC/6d/rA3/uTyl+8hcZVaEz5JmVKwUW
         UCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78yWSa2oWiLzMGFflcvH/ERn5FdBlTt3em76ND/K9vE=;
        b=w2msBVPA1rgEwKjQrV9tKQ4sPVdUDfUcT1qfmFdZst709U5J4iMARICherPhNPkEIR
         B0gcVb1bUgQcGUjFritUsUzmTFamphZ7JBKQ2qa9luA26OXwSjKki370764GHpReOFdF
         3WLf5uRgRmrWa6c9E0C5XTGAc8xFdenmuuTEb+SvrKCyPllCEsLksWf4tbsh2JuRDavz
         OpGIMIGGSEcbuEpt1sH2XQgERuFkyOY4LcB9vJM1cJdv0GkQVwqElSFazlgXM96Jj6EQ
         BK+okF/8662y8xa/LDlTONvvEToxhXpJM4Z/WLeIbLTnH5B+f2pz0/GX3ZTdp5xapAY/
         mSsg==
X-Gm-Message-State: AFqh2kp8WThQFqNonKfsbxYcPFyvPfSc5G4fs9zi66/TdKeJ9LZ46pIV
	slItx/eh25T19YsSfoXs5zDVikMF6rIS7w==
X-Google-Smtp-Source: AMrXdXty68AY1Bi6ypLUFvDVa6BIpSI51vivEHVWuO/BZ4HJwY6WN3iurrzFblkw5msdZClxnfBk/g==
X-Received: by 2002:adf:fa88:0:b0:2bd:d85f:55cc with SMTP id h8-20020adffa88000000b002bdd85f55ccmr12704200wrr.21.1674226816452;
        Fri, 20 Jan 2023 07:00:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 14/14] automation: add smoke test to verify macros from bug.h
Date: Fri, 20 Jan 2023 16:59:54 +0200
Message-Id: <4ce72535e44f49e82ad23f4e7dc004a67344b823.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index e0f06360bc..e7cc7f1442 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -17,4 +17,6 @@ qemu-system-riscv64 \
 
 set -e
 (grep -q "Hello from C env" smoke.serial) || exit 1
+(grep -q "run_in_exception_handler is most likely working" smoke.serial) || exit 1
+(grep -q "WARN is most likely working" smoke.serial) || exit 1
 exit 0
-- 
2.39.0


