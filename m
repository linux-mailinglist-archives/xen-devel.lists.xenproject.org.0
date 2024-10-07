Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF1799310A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812170.1224883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpZy-0007yc-UQ; Mon, 07 Oct 2024 15:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812170.1224883; Mon, 07 Oct 2024 15:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpZy-0007tC-RP; Mon, 07 Oct 2024 15:23:22 +0000
Received: by outflank-mailman (input) for mailman id 812170;
 Mon, 07 Oct 2024 15:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JJzu=RD=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sxpZx-0007l2-2o
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:23:21 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13d532c9-84c0-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:23:18 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id D2e8f2097FN6uqC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Oct 2024 17:23:06 +0200 (CEST)
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
X-Inumbo-ID: 13d532c9-84c0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728314586; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=M02XMiykRRo7bGwbbi6boN4cikEwYjx765x9X//8zAPm/h/+W7MP/thEie6L0CKB3l
    /9NJvHrhoHUAo4+jO00xyfJr3/06eosoWVoM6OXHV+uEU4vj0emAHqt/J2SkaZsptmYn
    23mD/mQfhmuE7/RqSW8FqnKovw+HGFOKlO8YUChA4FzsdlfXcgv3i4+TBy+21UHk5Zjz
    XgwncErIoyFvf2GxPD0hkZuh9OIs0p4LRCQTDja3rHHmI1i7L448rUZAU03PeyHkdPhQ
    4KvJUDv2lv6hVxYXnNgrIoJLTQFCHQB8QOF50sqnypxYClnSvb+W24fM8Cjm6NurtBFq
    gSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728314586;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZLyyPyY21XH/g5GFUA65N9ZAMMYv+X479puQnKzqNyI=;
    b=toYD0Qi5HfCahP/N4HQW87XGlg1VN+Ej9wIzrm9LNhbzqx14OFd0FzudaVpmeelfUh
    x3eFLk5ghFpPgYzc/3ZmaeAW3HEpG2kFDDt/402BoIiHDtg2zEJhxojwhH+DQMeDXnGI
    iT7TeZD9hs3kV60UiBSg2lVVfQU/J4iw38U3fFnb/+86o4HKLTDr/3SlS9nsQcZ9c+5c
    ZthCeiKBDTVYmmz387vSlATKo87Y+sgBZiBqILyvivt1Y4y7yM6YR3rsEF/FBBZRQJR2
    DrqQlGhh2z5oaImIA/aCu+6ncZmFXV/Xn/9XYaXOabU9x8Cmgm+I7QV/lBbZKb9K4FNb
    ZIlA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728314586;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZLyyPyY21XH/g5GFUA65N9ZAMMYv+X479puQnKzqNyI=;
    b=MfIyMuOBHMFZVEpjVLajPbktriRjeQ4x5QdTKND3FsOuzGvaQWpLA52sBwFaTR38LG
    AOYkiIeczIfWB747Sa5WFk6vdEKv//ARVBmlgjnzYABdfJpIvAxsVPNIta6EWjtq305F
    IH6jsWLOdVVh9r5bWgFsQIcotEhKzv10l9dj05ZhifKZPC1WRxjSAguR7WXuloSjkp4n
    D1VyItWrk8bZ+vxjg7cjmhkCSPQJzP8oXO8j+nTTBhZDrN37xC3yV3xEUW9MR9bXSw52
    e8NNIBE3PshKHDg3TxinpCeehrPCc6zkCS8URcxpbqvW41t3TMG9yAMO/JE538M9r3kY
    rfuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728314586;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZLyyPyY21XH/g5GFUA65N9ZAMMYv+X479puQnKzqNyI=;
    b=FFqZgk5Pe4wEW5uo8855Mh9oSq46hJN0JIkltRfvmYsco6Ew3n7bbmzBwbqJzAiR4w
    tiz7a24tSAwpd+VntaDw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4x9Fz7RcwtehfOImJwE3/YIR5VTNLPLdtEAAwSMQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: use PYTHON for qemu-deps-check.py
Date: Mon,  7 Oct 2024 17:22:45 +0200
Message-ID: <20241007152259.1353-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

This enables use of something else than the system 'python3' binary.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/scripts/build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 34416297a4..5d806c235a 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -93,7 +93,7 @@ else
 
     # Qemu requires Python 3.8 or later, and ninja
     # and Clang 10 or later
-    if ! type python3 || ! python3 automation/scripts/qemu-deps-check.py \
+    if ! type "${PYTHON:-python3}" || ! "${PYTHON:-python3}" automation/scripts/qemu-deps-check.py \
             || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
             || ! type ninja; then
         cfgargs+=("--with-system-qemu=/bin/false")

