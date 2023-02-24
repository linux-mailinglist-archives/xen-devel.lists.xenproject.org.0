Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AD6A1B6E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500953.772567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMC-0000FY-Ol; Fri, 24 Feb 2023 11:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500953.772567; Fri, 24 Feb 2023 11:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMC-00004z-Hc; Fri, 24 Feb 2023 11:35:20 +0000
Received: by outflank-mailman (input) for mailman id 500953;
 Fri, 24 Feb 2023 11:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWMA-0007Ri-Sy
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:19 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5052f9a5-b437-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:35:18 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id h3so7820806lja.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:18 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:17 -0800 (PST)
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
X-Inumbo-ID: 5052f9a5-b437-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhDjXc5QZ2qmKSV3xte4Vj9qFfnQzX3JEEqYRrvMiGo=;
        b=jXp3wZzXEtg1G0jPWq0OaoCQsDDxu+oWJIrpVKHkdyNfyKQwyYUBhjo8mGVi4yq3Qi
         ay1HcLtoWDgFrlVqzdFur6lNd3yAv4EE/q3JTVo0BzUNoTcW8uC/wck3ICPuitsWK12T
         AjmzVlfos9Hhj0DiPc4Ny6WR4ZZle5wD7sKV3OhFXoB6vhZFB+Ch+7rpnyqafKKDpKzY
         j4UJ9U94A4tZE0WRphuo885YeCuRVmpsZGl4pdCgltluhNvKsZNECbCUqyiXvU+4yvWu
         6EZZp3DnTT1T0P2DSEQr2J6jB5266qQY56znJ4Ou610GopbmZ1d5rbKyoxaVSsUAUcnP
         VQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhDjXc5QZ2qmKSV3xte4Vj9qFfnQzX3JEEqYRrvMiGo=;
        b=iYA5/myFtR1hRT5cPeNEo9VQgLR7y/u7o3952LFozSB3JcCZp20STSeeuYge6Lj05u
         xAGTdiV4uvgHc9+eyYSnwCMOzibijpFTJD0jS2yldZgUqQOl+XUyQrJG3jwWreLooo/s
         X2o1I4momDHD/P3z9eBxLH1egAj7ZUm2hve1pFxonBDTFz/JDmV+FbQfjiSdJitKxwlg
         8f1XhXpIS9UAw3oV4FGIucUZCNKP0HzocehyPMOYjaHji0UmApWamcyBakbZxoeNLTDd
         I/TJgrh1ZSMXiePxGkxmLD/21Hdxoi4L6auki3Eva0bP2wHArSVXdXd9/4C++uQmt8nd
         RZlA==
X-Gm-Message-State: AO0yUKUT2Q35f3ZcOac1lMMaT+aeyGKhIeXubLrXAu3Dj/rUHJgh9ndM
	3kbXgG07lXcwYR1l5Er0s6Ors0xp62c=
X-Google-Smtp-Source: AK7set+kCZYjX00+I0jYPqCcg9yoYxAzqNu5KXS1Wd2yZGjwj9ZtrcYK/48pkTgsXOl5R1e04CnJTA==
X-Received: by 2002:a05:651c:b06:b0:295:733a:3463 with SMTP id b6-20020a05651c0b0600b00295733a3463mr7754865ljr.29.1677238517834;
        Fri, 24 Feb 2023 03:35:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 5/5] automation: modify RISC-V smoke test
Date: Fri, 24 Feb 2023 13:35:05 +0200
Message-Id: <8a34b2b5ea5a948cdd4c608834f22c14ebe7ca6d.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677237653.git.oleksii.kurochko@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch modifies the grep pattern to reflect the usage of WARN.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V4:
 - Add Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
   and Acked-by: Stefano Stabellini <sstabellini@kernel.org>
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


