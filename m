Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF5C812CBC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654400.1021284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimm-0006FL-Vc; Thu, 14 Dec 2023 10:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654400.1021284; Thu, 14 Dec 2023 10:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimm-0006Dc-Sb; Thu, 14 Dec 2023 10:17:44 +0000
Received: by outflank-mailman (input) for mailman id 654400;
 Thu, 14 Dec 2023 10:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDiml-0006DQ-5M
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:17:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0367efaf-9a6a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:17:41 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so2429125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:17:41 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 je22-20020a05600c1f9600b0040c5177a479sm9699403wmb.20.2023.12.14.02.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:17:40 -0800 (PST)
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
X-Inumbo-ID: 0367efaf-9a6a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702549060; x=1703153860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGpsS9ewPpfJ6fuvi3hbjOPSo2USkgEAi+sqPnYK2BE=;
        b=mX5zRf/FrA1YdeAyXSFmr7JNkGtrbOT32OvmJkJbCJfIN2U2/X7Dz+h92Mro7D4MYu
         AQ1Rq2Ee4WoxtIIUx9r4LC185yLwJnl/ado98YNzvAXECsftvqq6zhbDi1PYP0QYiy78
         6fC03RK6+Z1rztg2exJSbNVPmcrxXNtnxH4+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549060; x=1703153860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGpsS9ewPpfJ6fuvi3hbjOPSo2USkgEAi+sqPnYK2BE=;
        b=fdTqpeCmioQiDPh134XfFYpX9iTNgthGTvvTJRKhKhkQ4typOR8sivQDumk3NoakTd
         hnvwZp6ufCSZGIU4WOBhnty9VJCzCILbdYmeS1q/hQ1JYtcT06n9a8ABC8TM8+n0WFXh
         YHK1bUG8nHqE9Mjnzi1m1L2VpmUPrNt9ZfaYNh1tDGvU9aksr0MvelE5ZP0XSvv5hYwZ
         NlP6EYVG5DQR6H9MGkHPkaYu6Jo6sVsJVBeWqYxA2HGUJFYxic4hz5EW++CIfKSq65Ht
         pjuMs+p2ADxGGeZfQQIgU0YpZeQqwqOgW28BOiF0EikdIvYUdrSqO/A8Losi2SePgwJ1
         ntaw==
X-Gm-Message-State: AOJu0YxiYE81H19wmI34iTGXnQD/xk62iNQunpAx1XyPFIGy2Ca95SQ4
	ycLXj1/1gUo/I0EqrR5lENItpp9JgKBqBkS/3fY=
X-Google-Smtp-Source: AGHT+IH/J8lg2tnAZiI5zsWX3qpnr6iClUDyoardnVCWta0djfZTiHda2Ntk5DXQEgKO9L6+sk7k7Q==
X-Received: by 2002:a05:600c:524d:b0:40c:3d02:57a1 with SMTP id fc13-20020a05600c524d00b0040c3d0257a1mr4863762wmb.132.1702549060308;
        Thu, 14 Dec 2023 02:17:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 0/4] xen/x86: add testing for self modifying code and livepatch
Date: Thu, 14 Dec 2023 11:17:15 +0100
Message-ID: <20231214101719.18770-1-roger.pau@citrix.com>
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

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1106713873

Roger Pau Monne (4):
  x86/livepatch: align functions to ensure minimal distance between
    entry points
  xen/x86: introduce self modifying code test
  x86/livepatch: introduce a basic live patch test to gitlab CI
  automation: add x86-64 livepatching test

 automation/gitlab-ci/build.yaml               |  9 +++
 automation/gitlab-ci/test.yaml                |  8 ++
 automation/scripts/build-livepatch            | 27 +++++++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 ++++++++++++++++
 tools/include/xenctrl.h                       |  2 +
 tools/libs/ctrl/xc_misc.c                     | 14 ++++
 tools/misc/xen-livepatch.c                    | 29 +++++++
 xen/Kconfig                                   | 18 +++++
 xen/Makefile                                  |  3 +
 xen/arch/arm/livepatch.c                      |  2 +
 xen/arch/arm/xen.lds.S                        |  4 +
 xen/arch/x86/Makefile                         |  1 +
 xen/arch/x86/include/asm/test-smoc.h          | 22 ++++++
 xen/arch/x86/livepatch.c                      |  4 +
 xen/arch/x86/setup.c                          |  3 +
 xen/arch/x86/sysctl.c                         |  9 +++
 xen/arch/x86/test/Makefile                    |  3 +
 xen/arch/x86/test/smoc-lp-alt.c               | 24 ++++++
 xen/arch/x86/test/smoc-lp.c                   | 24 ++++++
 xen/arch/x86/test/smoc.c                      | 77 +++++++++++++++++++
 xen/arch/x86/xen.lds.S                        |  4 +
 xen/common/Kconfig                            |  5 +-
 xen/common/kernel.c                           |  5 +-
 xen/include/public/sysctl.h                   | 14 ++++
 xen/include/xen/lib.h                         |  1 +
 25 files changed, 377 insertions(+), 3 deletions(-)
 create mode 100755 automation/scripts/build-livepatch
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
 create mode 100644 xen/arch/x86/include/asm/test-smoc.h
 create mode 100644 xen/arch/x86/test/Makefile
 create mode 100644 xen/arch/x86/test/smoc-lp-alt.c
 create mode 100644 xen/arch/x86/test/smoc-lp.c
 create mode 100644 xen/arch/x86/test/smoc.c

-- 
2.43.0


