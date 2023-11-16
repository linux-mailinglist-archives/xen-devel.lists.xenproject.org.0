Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB667EE078
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634146.989432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFU-0003br-4c; Thu, 16 Nov 2023 12:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634146.989432; Thu, 16 Nov 2023 12:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFU-0003ZS-23; Thu, 16 Nov 2023 12:13:32 +0000
Received: by outflank-mailman (input) for mailman id 634146;
 Thu, 16 Nov 2023 12:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFS-0003ZM-S3
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d98cda2-8479-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:13:29 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso5375485e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:29 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 dk14-20020a0560000b4e00b0032179c4a46dsm13517657wrb.100.2023.11.16.04.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:28 -0800 (PST)
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
X-Inumbo-ID: 8d98cda2-8479-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136808; x=1700741608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyuybwvHT4fiOcG6F7Us+wWuyqI0xHKPsg6Q+aCkCvs=;
        b=nOCxDsdQcJpaxByYgrSocXc4ScvY5FNGD/QZ42kYYEPbYafvAmPWZD7rYSVmHaKRmS
         Lwa+srJduy+pwxMmBr7X9nRy6LIkVSkSg3LXh9AvksPF8lSaANafCTkwFXC+v6cwWRtS
         XeupCSb4pkizE4Wn3hNxY8gScLCoPtOQqcSeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136808; x=1700741608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyuybwvHT4fiOcG6F7Us+wWuyqI0xHKPsg6Q+aCkCvs=;
        b=fUaOuG2Z5z5dmJVABvcCOfb0qcuLFyqI5GEgI/FTR7UATHui7A+4fma06rcpWZSxXU
         0Uay4Wdtv1AhBcH2o5cMIbHTF1YiJm32CsDXF2MYxkGJIJwUgymqqBHA/ZoaU2Lzpv+n
         CRfqxdHFhV9bwgjUiXslFnCIJjtlE38gJAn8YgXaWtpM6h+8iWZ740fvIlegkTD5p0ZU
         uqEUElHYb5EqE1BaNezttsVHBBlzqHq9gziSQYvrvNSPaTMrpPnv1duFnKiGzx2MmE6w
         sTVTvz0n1k7PYheEMS/l6YIWt9P4n6V9VxLGFRcdPLDhWRDC/a9Wjm0N9kNHzSiSnQlz
         M6gw==
X-Gm-Message-State: AOJu0YyOGK2LC/yioGhf13HMQbQbcfZUnMv6u+VFL04UESNovzQdcNiB
	Z/pb0wymkT9VJRHWq3kWoRhHf1avkCFcSiIfWLc=
X-Google-Smtp-Source: AGHT+IHl8P1D6qC6HcAZp+4Bmpienb5wfgWccG8xSGdjgeURLUHa2HAmc5NQhkx8NQbxpoEfQrGyqQ==
X-Received: by 2002:adf:9dcc:0:b0:331:3b67:3bc0 with SMTP id q12-20020adf9dcc000000b003313b673bc0mr11541826wre.37.1700136808522;
        Thu, 16 Nov 2023 04:13:28 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/6] automation: minor fixes and improvements
Date: Thu, 16 Nov 2023 13:13:04 +0100
Message-ID: <20231116121310.72210-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Some assorted minor fixes and improvements, as a result of work I'm
doing to expand the tests.

I've done a full run with the updated containers, and found no major
issues:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137

There's however one tests that fails with the updated container,
debian-buster-gcc-ibt:

https://gitlab.com/xen-project/people/royger/xen/-/jobs/5550235258

With:

$ ./automation/scripts/build 2>&1 | tee build.log
+ test -f /etc/os-release
+ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
+ cc=gcc
+ gcc --version
./automation/scripts/build: line 10: /opt/gcc-11-ibt/bin/gcc: No such file or directory

I assume there's something wrong in the Dockerfile, but not caused by
this series.

I suggest we hold off updating debian:buster-gcc-ibt image until this is
fixed.

Note the bookworm amd64 image must be updated in the registry ahead of
pushing the changes here (patch 4/6 depends on the new image).

Thanks, Roger.

Roger Pau Monne (6):
  automation: remove CR characters from QEMU serial
  automation: add timestamps to QEMU non-smoke x86-64 test
  automation: fix jessie/stretch images to use archive.debian.org apt
    repos
  automation: update tests to use Debian Bookworm
  automation: set architecture in docker files
  automation: switch to multi-platform images when possible

 automation/build/alpine/3.18-arm64v8.dockerfile    |  2 +-
 automation/build/alpine/3.18.dockerfile            |  2 +-
 .../build/archlinux/current-riscv64.dockerfile     |  2 +-
 automation/build/archlinux/current.dockerfile      |  2 +-
 automation/build/centos/7.dockerfile               |  2 +-
 .../debian/bookworm-arm64v8-arm32-gcc.dockerfile   |  2 +-
 .../build/debian/bookworm-arm64v8.dockerfile       |  2 +-
 .../build/debian/bookworm-cppcheck.dockerfile      |  2 +-
 automation/build/debian/bookworm-i386.dockerfile   |  2 +-
 automation/build/debian/bookworm.dockerfile        |  7 ++++++-
 .../build/debian/bullseye-ppc64le.dockerfile       |  2 +-
 automation/build/debian/buster-gcc-ibt.dockerfile  |  2 +-
 automation/build/debian/jessie-i386.dockerfile     |  7 +++++++
 automation/build/debian/jessie.dockerfile          |  9 ++++++++-
 automation/build/debian/stretch-i386.dockerfile    |  9 ++++++++-
 automation/build/debian/stretch.dockerfile         | 14 ++++++++------
 automation/build/fedora/29.dockerfile              |  2 +-
 automation/build/suse/opensuse-leap.dockerfile     |  2 +-
 .../build/suse/opensuse-tumbleweed.dockerfile      |  2 +-
 automation/build/ubuntu/bionic.dockerfile          |  2 +-
 automation/build/ubuntu/focal.dockerfile           |  2 +-
 automation/build/ubuntu/trusty.dockerfile          |  2 +-
 automation/build/ubuntu/xenial-xilinx.dockerfile   |  2 +-
 automation/build/ubuntu/xenial.dockerfile          |  2 +-
 automation/gitlab-ci/test.yaml                     |  4 ++--
 automation/scripts/qemu-alpine-x86_64.sh           |  7 +++++--
 26 files changed, 63 insertions(+), 32 deletions(-)

-- 
2.42.0


