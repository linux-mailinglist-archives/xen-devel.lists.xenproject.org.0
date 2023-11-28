Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4987FB69D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642874.1002647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwp-0002RD-BI; Tue, 28 Nov 2023 10:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642874.1002647; Tue, 28 Nov 2023 10:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwp-0002Ot-8Y; Tue, 28 Nov 2023 10:04:07 +0000
Received: by outflank-mailman (input) for mailman id 642874;
 Tue, 28 Nov 2023 10:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwn-0001sW-Q1
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 755342ff-8dd5-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:04:03 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b2ddab817so36766465e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:04 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n44-20020a05600c502c00b004083a105f27sm17644559wmr.26.2023.11.28.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:02 -0800 (PST)
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
X-Inumbo-ID: 755342ff-8dd5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165843; x=1701770643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88UoW1cjiE+bnAHASTqBRasXiz9tSSx28ygJG4VnQ5I=;
        b=Whx9OLab4+t4TOVP8hwxrauhrjHfkBEUD3qKD4vRWUlRuNETil5/3wQPf9j8NHJ9NP
         cGuDsgBdWDh4pmhgf5Mm6MWgpqSap0vIXIhakDpTMnlaLt7+vRcCwliMwAHM/SiCZtKu
         ab5gJv6zynF+HZs06LkSVVlxwF6HoDb0NsznA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165843; x=1701770643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88UoW1cjiE+bnAHASTqBRasXiz9tSSx28ygJG4VnQ5I=;
        b=rA8QZTueYXiV8YMQcV5GNtHK+FypsyABZtfM3e0r797h54htp0vIFgUHB5Ti6h3GTR
         +SnGmGkPj2yZBtCR+nbElS5DNi2DUZKqH4NcLaNQou+KMnOEU4hGchyZ2ieCTtLw8ACX
         ilAHZY6QYvWWS0J3kFYJia2+nvBwOSjdNLBxHgIW4/iPLhOY9AKH/cehVuKu+8Z/Ybru
         OjDFOFxCoinlIcasr7viwv9cRlYXZUYOwM3I0dZ/sbKdmVxVvxvVRpTBW72aYq8qX11K
         rQ934epLppK4/fBRpHi67cdHwENe6I0sH/+nhLjrwykoq2k1H7sbYt/Zq40eWad/NAbj
         slFw==
X-Gm-Message-State: AOJu0Ywco965bVJxn67t7IuJua70LqH2gcgLaYxhwBb2qEVnBdHQAaBV
	Qhs30ZePKS+uHdqDL7P/WfMTan0imexiSXLflZM=
X-Google-Smtp-Source: AGHT+IHy2ZkZKGX9FneJgKA8Ij4p1l6+2WSbY/Byv3r7761Vy8NJ3+R+n0NVXYhyZvHr35mCo1EKKA==
X-Received: by 2002:a05:600c:4589:b0:40b:357c:bb9f with SMTP id r9-20020a05600c458900b0040b357cbb9fmr6675979wmo.33.1701165842735;
        Tue, 28 Nov 2023 02:04:02 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 0/5] xen/x86: add testing for self modifying code and livepatch
Date: Tue, 28 Nov 2023 11:03:47 +0100
Message-ID: <20231128100352.35430-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series contains a misc set of fixes and improvements.

There's one improvement for the hypervisor to set function alignment for
livepatch builds in order to make sure there's always enough space in a
function to be live-patched.

Following patches attempt to introduce a set of tests for self modifying
code, currently one test using the alternatives framework, and one test
for livepatch.

Last patch hooks the newly introduced livepatch test into the gitlab CI
using QEMU and an Alpine Linux dom0:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1087447618

For the gitlab CI Alpine build the following series is required for
livepatch-build-tools:

https://lore.kernel.org/xen-devel/20231128092152.35039-1-roger.pau@citrix.com/

Roger Pau Monne (5):
  x86/livepatch: set function alignment to ensure minimal function size
  automation/alpine: add elfutils-dev
  xen/x86: introduce self modifying code test
  x86/livepatch: introduce a basic live patch test to gitlab CI
  automation: add x86-64 livepatching test

 automation/build/alpine/3.18.dockerfile       |  2 +
 automation/gitlab-ci/build.yaml               |  8 ++
 automation/gitlab-ci/test.yaml                |  8 ++
 automation/scripts/build                      | 21 +++++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 ++++++++++++++++
 tools/include/xenctrl.h                       |  2 +
 tools/libs/ctrl/xc_misc.c                     | 14 ++++
 tools/misc/xen-livepatch.c                    | 29 +++++++
 xen/arch/x86/Kconfig                          |  6 ++
 xen/arch/x86/Makefile                         |  5 ++
 xen/arch/x86/include/asm/test-smc.h           | 20 +++++
 xen/arch/x86/livepatch.c                      |  4 +
 xen/arch/x86/setup.c                          |  3 +
 xen/arch/x86/sysctl.c                         |  7 ++
 xen/arch/x86/test-smc-lp-alt.c                | 23 ++++++
 xen/arch/x86/test-smc-lp.c                    | 23 ++++++
 xen/arch/x86/test-smc.c                       | 77 +++++++++++++++++++
 xen/common/kernel.c                           |  5 +-
 xen/include/public/sysctl.h                   | 13 ++++
 xen/include/xen/lib.h                         |  1 +
 20 files changed, 337 insertions(+), 2 deletions(-)
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
 create mode 100644 xen/arch/x86/include/asm/test-smc.h
 create mode 100644 xen/arch/x86/test-smc-lp-alt.c
 create mode 100644 xen/arch/x86/test-smc-lp.c
 create mode 100644 xen/arch/x86/test-smc.c

-- 
2.43.0


