Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A96581A15
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 21:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375679.608141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPtt-0001o5-6r; Tue, 26 Jul 2022 19:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375679.608141; Tue, 26 Jul 2022 19:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPtt-0001mG-4D; Tue, 26 Jul 2022 19:07:25 +0000
Received: by outflank-mailman (input) for mailman id 375679;
 Tue, 26 Jul 2022 19:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSNJ=X7=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGPtr-0001mA-HV
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 19:07:23 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8a5a8a-0d16-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 21:07:22 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id bp15so27845657ejb.6
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jul 2022 12:07:22 -0700 (PDT)
Received: from uni.router.wind (adsl-45.176.58.224.tellas.gr. [176.58.224.45])
 by smtp.googlemail.com with ESMTPSA id
 eg47-20020a05640228af00b0043bbcd94ee4sm8952306edb.51.2022.07.26.12.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:07:21 -0700 (PDT)
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
X-Inumbo-ID: 2d8a5a8a-0d16-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdLrT8Wu/165k8es4dUu/NbOhpow/H7kiPk94jnel3M=;
        b=OnvHf7vq+Huy178VtcbeI/0he3xDr5OIjys5gnpbn+7mGQFnxzsXcNYjvUkpAB5tLe
         ZcKLMyIYsufVdwdggGOXZXGp0Zo47PcFkUNFuXNsYgaXAgOQI5RvNAHgm773WRhiNtvT
         1wsT/nBKIA9pJs8/nr6oIG5dtF/kqPxm6VKDdP92RUf2l5pv96Jkf7P7FJFkYxA28L/U
         DQunVhDdslPnAyZj01LMehHoW5u2WY3Fksz/5IFEkAJype3hBzNmuo0sxJG5rnoMXn9P
         8+LL84nItGNjdH8IY5woNuFpC9mD0HGRjrV6mlCfbCmUchQsKXc2wRQxTC3e8cNNHL13
         Yk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdLrT8Wu/165k8es4dUu/NbOhpow/H7kiPk94jnel3M=;
        b=ezsoCTIZi00YQp/ZSv01kzRasTr1nqxNkfQKOsEsZYh31ruQ15QVAQP4rAofUgzgpD
         YfR5I3Z0o500AIGW3Y4j3UAw35p+3wk6Ptv3Df5R1/KX0VYYZSxR25zdiQZAJhHFj7Nj
         FuDjq4WS1ctTZyGeTVh6RCs/89hpJoU7PIFL9eX3gZqRlyPSvd7gvcLAwVe/ghaaRu/m
         2N6QkG56i7oByRKriZijOfd+wXcNKJbfP1NF0DGrzKaDTy3BDcSAhiBGQiUeMNMbEwPC
         M89omQpdZ15oVQ+gr1XgKEMgTdmMn7oT9k0RiyxdauB0wx/QkBL/K+/ulACNLha859j/
         X/TA==
X-Gm-Message-State: AJIora++Wlm1mlIxcttYXamaRr1skvuCnmtnSkfaqYRMfLO0DskK4Fee
	2fA0kXSX8jGx4DyhR2w98YV8i5hFfyI=
X-Google-Smtp-Source: AGRyM1vCfVV5xaR/wwAG2DGXZfXXncNYuGlgrfOIX1VTE0qzaT1soom3bCOw7jUTfAeWGDfCe4Ujwg==
X-Received: by 2002:a17:907:16a6:b0:72b:5ce6:1f7d with SMTP id hc38-20020a17090716a600b0072b5ce61f7dmr15759083ejc.28.1658862441682;
        Tue, 26 Jul 2022 12:07:21 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] Create a test job for testing static memory on qemu
Date: Tue, 26 Jul 2022 22:06:59 +0300
Message-Id: <20220726190701.1048824-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series
- removes all the references to the XEN_CONFIG_EXPERT environmental variable
which is not used anymore
- creates a trivial arm64 test job that boots xen on qemu with dom0 and a
direct mapped dom0less domu with static memory and verifies that domu's memory
ranges are the same as the static memory ranges with which it was configured

The static memory test relies on the existing qemu-smoke-arm64.sh script.
This script uses the kernel-5.9.9 from the test-artifacts container as domu
kernel. This particular kernel does not work with dom0less enhanced enabled.
More specifically, domu crashes when it attempts to dereference the xenstore
interface which is still uninitialized,
So, qemu-smoke-arm64-gcc test, as well as its static memory version, fails.

To be able to test, I had to disable dom0less enhanced by adding the following
commands to the script.

sed -i 's/xen,enhanced "enabled"/xen,enhanced "disabled"/g' binaries/boot.source
mkimage -A arm64 -T script -C none -d binaries/boot.source binaries/boot.scr

These commands are not part of the patch.
Since dom0less enhanced is enabled by default, a newer kernel version would
be more appropriate for testing dom0less.

Xenia Ragiadakou (2):
  automation: Remove XEN_CONFIG_EXPERT leftovers
  automation: arm64: Create a test job for testing static allocation on
    qemu

 automation/build/README.md             |  3 --
 automation/gitlab-ci/test.yaml         | 18 +++++++++++
 automation/scripts/build               | 12 ++++++--
 automation/scripts/containerize        |  1 -
 automation/scripts/qemu-smoke-arm64.sh | 42 ++++++++++++++++++++++++--
 5 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.34.1


