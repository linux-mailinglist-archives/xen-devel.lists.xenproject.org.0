Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E9A7F332F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637947.994084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THb-00024S-1p; Tue, 21 Nov 2023 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637947.994084; Tue, 21 Nov 2023 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THa-000220-V8; Tue, 21 Nov 2023 16:07:26 +0000
Received: by outflank-mailman (input) for mailman id 637947;
 Tue, 21 Nov 2023 16:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THZ-00021p-RL
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eac61dd-8888-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:07:23 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507a55302e0so8277874e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:23 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b0040651505684sm17695960wmo.29.2023.11.21.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:22 -0800 (PST)
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
X-Inumbo-ID: 0eac61dd-8888-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582843; x=1701187643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF9Xc1vQVIRBbaoOjGN8yfS/Xm06izcWm1wb8FArGYU=;
        b=iamSxzRo9gjmhq3Th4el/IFtLNOg0SaCj8K8QyAJQyKsFtp5ms/m6Lqtx5yRxuMTRT
         GcZLavxCAWAhLaIeio/SGwWJpPEHuExZc05fgLAiE7mDm8LeVZy7zixgBiCMMFgjU22a
         K6IHBTb+NgLvadZH96j2VJ7YX0oOt+PX7BSLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582843; x=1701187643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF9Xc1vQVIRBbaoOjGN8yfS/Xm06izcWm1wb8FArGYU=;
        b=QJgOkoe0eFljIkm7TLZao+yXFLdsubaxJMT3DF0d3xJAaFT0wIBrgqroldiosmY+p0
         xoLdysrOujJB39g+ae6aiPA0loH/Fo0NrLgv8igWwg3N8yrA+m44NYw/Vz1Twu8RpBuY
         FBHQIrELRKJSVDKH6gw3dhWzSdtx3X7xl/jASE434Fx1LJhpExaAhTKdOzuC9KA51zeD
         wxDy8cwRpb8rmAfqjNy+eOgoSuRbzZ1wDzLtm6s+iw0biKJVZXFoiQ3JRtMDMtLPnxS1
         ASXaA1Y2DS8J2i6GL0r7EXOTQpUlqjmRUTsmKuWQHtBR+X0FdjCe8/qcS5BerTSUf30V
         tRwQ==
X-Gm-Message-State: AOJu0YzcZ8UhuU82t+s4mtYJSwIm6BEDUvghsi2rts6V2MXD/ei4t1oZ
	9D4A3BYsND2Y8oTrVkmPX7pe5BxE2B5/w8GdUno=
X-Google-Smtp-Source: AGHT+IGJ/K0h/8JuUtXqeEexoyhoFFkIO3Nuhbj864r/ARJFFyJfiuh4180efykxo8aolLHoDcCsfA==
X-Received: by 2002:a19:c219:0:b0:50a:71e1:e1c9 with SMTP id l25-20020a19c219000000b0050a71e1e1c9mr7545356lfc.42.1700582843102;
        Tue, 21 Nov 2023 08:07:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/7] automation: minor fixes and improvements
Date: Tue, 21 Nov 2023 17:03:51 +0100
Message-ID: <20231121160358.8080-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Some assorted minor fixes and improvements, as a result of work I'm
doing to expand the tests.

I've done a full run with the updated containers, and found no issues:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1080250168

Thanks, Roger.

Roger Pau Monne (7):
  automation: remove CR characters from serial output
  automation: remove com1= parameter on QEMU smoke tests
  automation: add Xen timestamps to all tests
  automation: fix jessie/stretch images to use archive.debian.org apt
    repos
  automation: update tests to use Debian Bookworm
  automation: set architecture in docker files
  automation: switch to multi-platform images when possible

 automation/build/alpine/3.18-arm64v8.dockerfile          | 2 +-
 automation/build/alpine/3.18.dockerfile                  | 2 +-
 automation/build/archlinux/current-riscv64.dockerfile    | 2 +-
 automation/build/archlinux/current.dockerfile            | 2 +-
 automation/build/centos/7.dockerfile                     | 2 +-
 .../build/debian/bookworm-arm64v8-arm32-gcc.dockerfile   | 2 +-
 automation/build/debian/bookworm-arm64v8.dockerfile      | 2 +-
 automation/build/debian/bookworm-cppcheck.dockerfile     | 4 ++--
 automation/build/debian/bookworm-i386.dockerfile         | 2 +-
 automation/build/debian/bookworm.dockerfile              | 7 ++++++-
 automation/build/debian/bullseye-ppc64le.dockerfile      | 2 +-
 automation/build/debian/buster-gcc-ibt.dockerfile        | 4 ++--
 automation/build/debian/jessie-i386.dockerfile           | 7 +++++++
 automation/build/debian/jessie.dockerfile                | 9 ++++++++-
 automation/build/debian/stretch-i386.dockerfile          | 9 ++++++++-
 automation/build/debian/stretch.dockerfile               | 9 ++++++++-
 automation/build/fedora/29.dockerfile                    | 2 +-
 automation/build/suse/opensuse-leap.dockerfile           | 2 +-
 automation/build/suse/opensuse-tumbleweed.dockerfile     | 2 +-
 automation/build/ubuntu/bionic.dockerfile                | 2 +-
 automation/build/ubuntu/focal.dockerfile                 | 2 +-
 automation/build/ubuntu/trusty.dockerfile                | 2 +-
 automation/build/ubuntu/xenial-xilinx.dockerfile         | 2 +-
 automation/build/ubuntu/xenial.dockerfile                | 2 +-
 automation/gitlab-ci/test.yaml                           | 4 ++--
 automation/scripts/qemu-alpine-x86_64.sh                 | 7 +++++--
 automation/scripts/qemu-smoke-dom0-arm32.sh              | 5 +++--
 automation/scripts/qemu-smoke-dom0-arm64.sh              | 5 +++--
 automation/scripts/qemu-smoke-dom0less-arm32.sh          | 5 +++--
 automation/scripts/qemu-smoke-dom0less-arm64.sh          | 5 +++--
 automation/scripts/qemu-smoke-riscv64.sh                 | 2 +-
 automation/scripts/qemu-smoke-x86-64.sh                  | 3 +--
 automation/scripts/qemu-xtf-dom0less-arm64.sh            | 5 +++--
 automation/scripts/qubes-x86-64.sh                       | 4 ++--
 automation/scripts/xilinx-smoke-dom0less-arm64.sh        | 4 ++--
 .../tests-artifacts/alpine/3.18-arm64v8.dockerfile       | 2 +-
 automation/tests-artifacts/alpine/3.18.dockerfile        | 2 +-
 .../tests-artifacts/kernel/5.19-arm64v8.dockerfile       | 2 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile      | 2 +-
 .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile         | 2 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile             | 2 +-
 41 files changed, 92 insertions(+), 52 deletions(-)

-- 
2.42.0


