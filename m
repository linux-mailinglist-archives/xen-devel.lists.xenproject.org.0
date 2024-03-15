Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D287D09B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693914.1082587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nm-0006pk-3v; Fri, 15 Mar 2024 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693914.1082587; Fri, 15 Mar 2024 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nm-0006nh-0p; Fri, 15 Mar 2024 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 693914;
 Fri, 15 Mar 2024 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ka1=KV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rl9nl-0006nS-0p
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 15:48:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 862b1ad4-e2e3-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 16:48:53 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ecbe78c3fso945055f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 08:48:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 bw29-20020a0560001f9d00b0033ecaf7a2adsm3394689wrb.23.2024.03.15.08.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 08:48:51 -0700 (PDT)
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
X-Inumbo-ID: 862b1ad4-e2e3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710517732; x=1711122532; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjkFnK8slP+AFdcjYO+Dd1es+dZZ+s27+xdsnD3t2d4=;
        b=lBOk1henbbZsVa3oDDNYXXf8D4/+49iBhitS0U01EE24MV1taQp9JOhFpSkAI38HJh
         vQNwUjfLaZLaFK2ttAYqX8QmKe/1zuJLAc67BbxwZr5jf3DRdbodjb1pbPqHu/pLHRoC
         M+4yx3E2SN6nTJc5tAoOCXxfUE4TRJVir/AIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710517732; x=1711122532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjkFnK8slP+AFdcjYO+Dd1es+dZZ+s27+xdsnD3t2d4=;
        b=M8bKk9x9C4tJy1K65HMl7JRw3RSuysuqZRpmeauJZRLu2jM+fAohvUACbC/rdE1mup
         HIdDRlRg9IB0qRBZqcbJr3fWwjMI3F3b4pkWQRHRykiAy9RodQjGa/Mojz1yRtu/zRuU
         4+YBOZ/XY1NM/xubVaQCAfQ+759hVAqQMstaOWeabZBjPoO6avLH6/cnDrd06K5WQ9IH
         hJg+ggz56iuXxM8IKwJ32WdNbL2dS+xS3EA7cqs4eF6UXTdZSO5TED+mWcTxWeSpmXjn
         xL4gI0OVYeuBKzA+WPXxG1bMvKuZeBWODKIMQ7v7kdc0NbqfiqWC+3TmDzOdW3UIHK3l
         gXhQ==
X-Gm-Message-State: AOJu0YxH+EzxDExXWxAT4oB1vqRh4ACrR6oaS34jyM+3e2aWC4GzIIyl
	ShZKhOGBjC7VW1UOX8jZNdYVxTnR4ICn8osHqqqdwSPvpU1t6tNcr7p+UFnMmowMB2DaqGtG6Ud
	W
X-Google-Smtp-Source: AGHT+IHTCKBi9KPx6D9K5BzvquMDLr5IRoandLn9mmWlzV4+tZXau1o0KUm8xkcLVLRlOpfuGy7Phg==
X-Received: by 2002:a5d:6a04:0:b0:33d:e6e:b5f6 with SMTP id m4-20020a5d6a04000000b0033d0e6eb5f6mr3743499wru.27.1710517732521;
        Fri, 15 Mar 2024 08:48:52 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH v2 0/3] Switch to Linux 6.1 by default on x86
Date: Fri, 15 Mar 2024 15:48:46 +0000
Message-Id: <20240315154849.28819-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/osstest.git br.linux-6.1-v2

Hi,

A set of patch which lead to using Linux 6.1 instead of 4.19 as a default
kernel on x86.

I've check the list of jobs changes with
OSSTEST_CONFIG=standalone-config-example nice eatmydata ./standalone-generate-dump-flight-runvars

All branches are affected with changes, most will have the same changes as the
branch "xen-unstable" (unless the only have a subset of those jobs like
"libvirt"), and linux-{linus,6.1} will have the changes as listed on
linux-linus.

Thanks,

xen-unstable:
- test-amd64-coresched-i386-xl
- test-amd64-i386-examine
- test-amd64-i386-examine-bios
- test-amd64-i386-examine-uefi
- test-amd64-i386-freebsd10-amd64
- test-amd64-i386-freebsd10-i386
- test-amd64-i386-libvirt
- test-amd64-i386-libvirt-pair
- test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
- test-amd64-i386-libvirt-raw
- test-amd64-i386-libvirt-xsm
- test-amd64-i386-livepatch
- test-amd64-i386-migrupgrade
- test-amd64-i386-pair
- test-amd64-i386-qemut-rhel6hvm-amd
- test-amd64-i386-qemut-rhel6hvm-intel
- test-amd64-i386-qemuu-rhel6hvm-amd
- test-amd64-i386-qemuu-rhel6hvm-intel
- test-amd64-i386-xl
- test-amd64-i386-xl-pvshim
- test-amd64-i386-xl-qemut-debianhvm-amd64
- test-amd64-i386-xl-qemut-debianhvm-i386-xsm
- test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
- test-amd64-i386-xl-qemut-win7-amd64
- test-amd64-i386-xl-qemut-ws16-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow
- test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
- test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
- test-amd64-i386-xl-qemuu-ovmf-amd64
- test-amd64-i386-xl-qemuu-win7-amd64
- test-amd64-i386-xl-qemuu-ws16-amd64
- test-amd64-i386-xl-shadow
- test-amd64-i386-xl-simplat-amd64-buster
- test-amd64-i386-xl-vhd
- test-amd64-i386-xl-xsm
- test-armhf-armhf-libvirt-qcow2
- test-armhf-armhf-libvirt-raw
- test-armhf-armhf-xl-vhd
+ test-amd64-amd64-libvirt-qcow2
+ test-amd64-amd64-libvirt-raw
+ test-amd64-amd64-xl-raw
+ test-amd64-amd64-xl-vhd
+ test-armhf-armhf-libvirt-vhd
+ test-armhf-armhf-xl-qcow2
+ test-armhf-armhf-xl-raw

linux-linus:
- test-amd64-amd64-freebsd11-amd64
- test-amd64-amd64-freebsd12-amd64
- test-armhf-armhf-libvirt-qcow2
- test-armhf-armhf-libvirt-raw
- test-armhf-armhf-xl-vhd
+ test-amd64-amd64-libvirt-vhd
+ test-amd64-amd64-qemuu-freebsd11-amd64
+ test-amd64-amd64-qemuu-freebsd12-amd64
+ test-amd64-amd64-xl-qcow2
+ test-amd64-amd64-xl-raw
+ test-armhf-armhf-libvirt-vhd
+ test-armhf-armhf-xl-qcow2
+ test-armhf-armhf-xl-raw

Anthony PERARD (3):
  make-fligh: Fix freebsd guest test test-id
  mfi-common: Rework toolstack-disk_format test matrix
  ap-common: Switch to Linux 6.1 by default on x86 + drop dom0 i386

 ap-common   |  2 +-
 make-flight |  4 ++--
 mfi-common  | 10 ++++++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
Anthony PERARD


