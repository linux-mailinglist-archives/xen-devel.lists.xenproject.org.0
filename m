Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A968DC09
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491199.760324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFg-0008Kt-0o; Tue, 07 Feb 2023 14:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491199.760324; Tue, 07 Feb 2023 14:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFf-00083t-FS; Tue, 07 Feb 2023 14:47:19 +0000
Received: by outflank-mailman (input) for mailman id 491199;
 Tue, 07 Feb 2023 14:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFb-0004Hz-Qs
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f636d1c-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:47:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id m14so13760224wrg.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:14 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:13 -0800 (PST)
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
X-Inumbo-ID: 4f636d1c-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X89Og2seSZDPBXzfRkfuOgunrgwSAjGT9JkLDw56FE=;
        b=MKkUIjqfar/5miiez4RxBwX2Sis0GVA/H92rR+af5yPU7SwTiSTe3g7KUck0pok9j5
         kYXxk8s+E7PHUPPYLdEjGWEFRgGSen2B3KZ1hWOW6vyUfnLHKzh35OP9Z3+KtoNYWgZ0
         5WpYe/z4puRVkObG63IRQZUhgiFGIjjoAxwKo29gG9gBi/vn2i7Y0QUdtrRYLZk3BpUy
         oebHOxZ/1EWDSJz1q7dDWOtnHNrGqgNUWhriXJsjEcoqqSYm7b0KPLMP/12C644ICXqr
         MyycV0fzvwdaFaf+NzXtt0QYADR2XilazaVqgPmAzD//lx0xVb3kjuhv5Z3+MIjq8q05
         dWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X89Og2seSZDPBXzfRkfuOgunrgwSAjGT9JkLDw56FE=;
        b=Xx6Ng+0h7bSEcp0x1cAUlN6f6LJx7bce4sXAX4O+HXSdqlrh1qwZfN6y+VDv7FiG9R
         xHOBh1H0a8G/aJEmHNodBQu5oAyFL/jgF+PeUAgQTTeujdqpiAEHaUu2zC8b0OdWRP7L
         HAIYlwuo+yQYu7tiP+taSuSyrzSE0UBq8/kKxiXIAtNcwyeZtvROzOU2uUHkj67M/sAn
         9FzC8oNh1cqerbtVFRiJrS2S6GGTqpBAVrF50ga2izZM7hWiuOIcDMLQ7AqiQCJuCenI
         hy3F6sRin9qr4qNxTcZNxdLbrjOEhmazuFd9gALvizG88EXn7h5eepW8KDxUyGxQXLCM
         qwCw==
X-Gm-Message-State: AO0yUKX10g0xWVnda8s/gOJylUY09BIO2lI4C6oqqViYE820LOynmaew
	c8sPQL2aUtVHJc2eV6Wbrdob9D/4UNo=
X-Google-Smtp-Source: AK7set/2dBDoiNyI90TorRCwsIqunxRJzQ9AUXnux2yDQnZ0kkLTQxpeVrzNe5fa52Gznyki+n93aQ==
X-Received: by 2002:adf:ef8d:0:b0:2c3:d296:7a84 with SMTP id d13-20020adfef8d000000b002c3d2967a84mr3254637wro.17.1675781233790;
        Tue, 07 Feb 2023 06:47:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 14/14] automation: modify RISC-V smoke test
Date: Tue,  7 Feb 2023 16:46:49 +0200
Message-Id: <95527748699e6ab643dc2fdee634fe934ae12f60.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch modifies the grep pattern to reflect the usage of WARN.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Update commit message
---
Changes in V2:
 - Leave only the latest "grep ..."
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index e0f06360bc..02fc66be03 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,5 +16,5 @@ qemu-system-riscv64 \
     |& tee smoke.serial
 
 set -e
-(grep -q "Hello from C env" smoke.serial) || exit 1
+(grep -q "WARN is most likely working" smoke.serial) || exit 1
 exit 0
-- 
2.39.0


