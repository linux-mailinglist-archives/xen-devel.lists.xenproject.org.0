Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0E926340
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753082.1161347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qB-0004Ag-8V; Wed, 03 Jul 2024 14:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753082.1161347; Wed, 03 Jul 2024 14:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qB-000484-5N; Wed, 03 Jul 2024 14:20:11 +0000
Received: by outflank-mailman (input) for mailman id 753082;
 Wed, 03 Jul 2024 14:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP0q9-00047s-V9
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:20:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 593e2ae7-3947-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:20:07 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso3866843a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:20:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm7114707a12.34.2024.07.03.07.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:20:05 -0700 (PDT)
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
X-Inumbo-ID: 593e2ae7-3947-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720016407; x=1720621207; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0VPZpVmpbFI8i8fQpd8fSbKeeEW0XdlJBIH/+k/nGY=;
        b=sQ6OoXGGncudnuBcNXo5vh6wD6O8/FdCam1nni1HPlmB14jRAt6kNLkSrZ2cJpirtt
         9jv+9P7dXdbsKnX2u1cKaar496vv8t3w46lGYlDIddXfEe2cssAO7oF5d85Gw9ir0qxq
         CVP5HKDBVYlqmDGZqP4W9SFAxQJMhNC0xVozM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016407; x=1720621207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0VPZpVmpbFI8i8fQpd8fSbKeeEW0XdlJBIH/+k/nGY=;
        b=L2i71x2vlSR/PuG7ZwiGYwiQGavDPK+PD3FK294sx0b2/5HcVclF5yNQhDw1cK/w5U
         x4rvTDyZWh+nKC7ZKrGWtPYtMOgBA4+HJ7gcfEZ37zZmPqovWw4Zd+6i53XOkd/G5akh
         uTs8g40QR7EHUxF0Ygn3e5mnRAt4fs3olQtD3HbKnudy6Qsd1ukIyxTWzWKejaFrtiFg
         UtTQAzGoBgetq5S1z0mJ+4HwyxMITt/WLUg9Jkk0OBFePv2HIJHaUlaxRgj1evi+ZXcR
         TqrkXizME52a+wrCI4Yyhcby7NJlePa/Yk+ArexlBknQLaU2kzChXuyuAeRJADPA4HNp
         WhrA==
X-Gm-Message-State: AOJu0YytclWWI2+ijBn4Udfr8vF0nqeqFckBfN4HX+YfXTSK8nZzGEd7
	eTcC/L8Visql7W3fpQtR9dMdqbxDZvWgXxgoBHo+qSHP/IDm6tJOka61pfmuTnUrXhIu+h5CKBe
	6yx8=
X-Google-Smtp-Source: AGHT+IFOanZmtiSFWG6jY3SSfUHrS9vuuPcdeHtZhMzHNrwCy5NGkv6Eo1A4TxSxkE07aXDEwzxqoA==
X-Received: by 2002:a05:6402:2109:b0:58c:ccc1:17ec with SMTP id 4fb4d7f45d1cf-58cccc11b43mr1335063a12.13.1720016406443;
        Wed, 03 Jul 2024 07:20:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/4] CI: Fixes, part 1
Date: Wed,  3 Jul 2024 15:19:58 +0100
Message-Id: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minimum fixes to rebuild the containers, following the HEREDOC problems.

Unrelated to the HEREDOC problems, Archlinux and CentOS 7 need aditional
chagnes to rebuild.

There will be subsequent work to make some improvements to CI for 4.19, so in
particular we're testing with up-to-date LTS distros.

Andrew Cooper (4):
  CI: Formalise the use of heredocs
  CI: Adjust the usage of inline files
  CI: Drop bin86/dev86 from archlinux container
  CI: Rework the CentOS7 container

 automation/build/README.md                    | 10 ++-
 .../build/alpine/3.18-arm64v8.dockerfile      |  1 +
 automation/build/alpine/3.18.dockerfile       |  1 +
 .../archlinux/current-riscv64.dockerfile      |  1 +
 automation/build/archlinux/current.dockerfile |  3 +-
 automation/build/centos/7.dockerfile          | 71 ++++++++++---------
 .../bookworm-arm64v8-arm32-gcc.dockerfile     |  1 +
 .../build/debian/bookworm-arm64v8.dockerfile  |  1 +
 .../build/debian/bookworm-cppcheck.dockerfile |  1 +
 .../build/debian/bookworm-i386.dockerfile     |  1 +
 automation/build/debian/bookworm.dockerfile   |  1 +
 .../build/debian/bullseye-ppc64le.dockerfile  |  1 +
 .../build/debian/buster-gcc-ibt.dockerfile    |  1 +
 .../build/debian/jessie-i386.dockerfile       |  3 +-
 automation/build/debian/jessie.dockerfile     |  3 +-
 .../build/debian/stretch-i386.dockerfile      |  3 +-
 automation/build/debian/stretch.dockerfile    |  3 +-
 automation/build/fedora/29.dockerfile         |  1 +
 .../build/suse/opensuse-leap.dockerfile       |  1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |  1 +
 automation/build/ubuntu/bionic.dockerfile     |  1 +
 automation/build/ubuntu/focal.dockerfile      |  1 +
 automation/build/ubuntu/trusty.dockerfile     |  1 +
 .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
 automation/build/ubuntu/xenial.dockerfile     |  1 +
 automation/build/yocto/yocto.dockerfile.in    |  2 +
 .../alpine/3.18-arm64v8.dockerfile            |  1 +
 .../tests-artifacts/alpine/3.18.dockerfile    |  1 +
 .../kernel/5.19-arm64v8.dockerfile            |  1 +
 .../tests-artifacts/kernel/6.1.19.dockerfile  |  1 +
 .../6.0.0-arm64v8.dockerfile                  |  1 +
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  |  1 +
 32 files changed, 82 insertions(+), 40 deletions(-)


base-commit: fb76e08a8f7a61dfbc07d0f335f1623bca650d7f
-- 
2.39.2


