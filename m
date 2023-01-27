Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB467E7B6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485623.753056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPLt-0001MB-0Z; Fri, 27 Jan 2023 14:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485623.753056; Fri, 27 Jan 2023 14:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPLs-0001JS-Ta; Fri, 27 Jan 2023 14:05:12 +0000
Received: by outflank-mailman (input) for mailman id 485623;
 Fri, 27 Jan 2023 14:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGp-0000nM-SK
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e207bc04-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5486905wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:57 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:56 -0800 (PST)
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
X-Inumbo-ID: e207bc04-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqiiG/Dxt3kswno1Fem+rUYZyblwf9Uw3t4hy1o3WcQ=;
        b=h7ryYdfPsalVmQWY/BhcuEeCHfTyjoSIhX8dEzvpw6QgLyhCudRlHSfaKXubBK+rA+
         eB5LsLM/Sl+4sT8tyazwZAlYL/Xk+RV04zwUAyktBM7a/nqJTqc1QOQy3T+ChB2tvEFP
         DCYQK3yeM7XzbiEITTTiEgnS4fOLi4IUbOglAk0xaLo7fS69favF6rXrBs/FdqqPiiXk
         Qu0MCKJ6gOiTvkOwxy5si5IqHFQInv/evuyveuw2HQuenfSupcyHvq3GiLNberIWc4YD
         MqHxGhBCA5r4hLcNKQkOAeNSPU1w5mVg4zOlEm6NtWS3XdYfG2kKM/R7KWqMynTI4Lie
         dKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqiiG/Dxt3kswno1Fem+rUYZyblwf9Uw3t4hy1o3WcQ=;
        b=MZWGs/WBpt5QeuunkmUejUdb9Tfph5i1Ghxb5Ack+sYKhEpSL5nTr1jnfpEXCaI1qm
         NFHn5AAEdandMM5xIzs2tQzUfUdIlu6KmIcAm27uwJiNQ/raENv10Su4utpXSrlM/g23
         ngHr02BBgFgrMvpDu1yC7MhblH02pD/y8hCs9DbshsvrgCd6QwDDktn6UZm9Tw87LGZS
         2OVY3owZnJHHCgoCptPYBoYITpMlNrpIbfGCmToU7K3a94tz04RWofFfcJnI9Xy+Kq41
         8KUtzrOkGiv0RKzkFTMu0NzC9dJq+qEcgJSthdAKj0K2a2Umlb1tqcySULpkrQ5efBzV
         4RQw==
X-Gm-Message-State: AFqh2kr2p13ecy71qIRoWBqt8xX23yqzw9lBz1CHCLNf/dL4bpqkSEgE
	voXWNOhyf8bx1IGx1hq0AkuFF8MSb8M=
X-Google-Smtp-Source: AMrXdXsUmCoZys6I0gJyXVumu88pFsz6IizpYHHgKKEW5yJ2MNdxYnxZK6/nbnFYE/tejsYxnBnyOA==
X-Received: by 2002:a05:600c:4f10:b0:3d3:48f4:7a69 with SMTP id l16-20020a05600c4f1000b003d348f47a69mr40997118wmq.17.1674827997031;
        Fri, 27 Jan 2023 05:59:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 14/14] automation: add smoke test to verify macros from bug.h
Date: Fri, 27 Jan 2023 15:59:19 +0200
Message-Id: <ed819dc612fcadbd04b4b44b2c0560a77796793a.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


