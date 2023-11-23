Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927C7F5DBD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639616.997152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oF-000114-KO; Thu, 23 Nov 2023 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639616.997152; Thu, 23 Nov 2023 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oF-0000zM-Hf; Thu, 23 Nov 2023 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 639616;
 Thu, 23 Nov 2023 11:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67oE-0000zG-M8
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:23:50 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c59b75ad-89f2-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:23:48 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso1038439e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:23:48 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 jg28-20020a05600ca01c00b004063cd8105csm2384791wmb.22.2023.11.23.03.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 03:23:47 -0800 (PST)
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
X-Inumbo-ID: c59b75ad-89f2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700738628; x=1701343428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPhgdKiA0Qnpii00cZhFiVFGp+c5vexH8n0jcy3WPms=;
        b=ol4MhUFQlOoO81EFgT56hqb/B3BVxNKFjUtNvaPsMfzOigGxw7u8y7zTccd+f7ToV9
         k1VrLjUAgTeCa/hV7n0Y4NOjl9sSPmjqb6eXncJR9hJp6ebCzx643MiuPBUcXqfyPgGa
         KvFNOeq8QVOlCGpGJBQCU1IQgL/09wV+MvgLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700738628; x=1701343428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPhgdKiA0Qnpii00cZhFiVFGp+c5vexH8n0jcy3WPms=;
        b=t7EYWE8uxlcXUhVFB8AeP8uIj9ZZuIR2Z26xIxY/oyiQqW7ncK2n3Ogitz/bVgYFc3
         tAAFPWKAWIU3K2nklcMqdZJ3zzO56S1iUsMei0Z0k+CVFZNB554Yma5b+ma/i2dR4KJ3
         Ge8EvEu4riZDVPkyoCdthTuH0lzuwZKJYlicWu/XtHgESeozqh37SoLpDrKYKdAQDUUT
         PvKJpIHP5M2nW1CnIzQ+l2I2UGcfrq3HJiwenSTRsG2x4DZXpDTOD1S/PhpXErOQkHqn
         lrmZyYkf9PydipuDynUyitzZnp0OV4SVecrIze8z2iasLGalL7DSoaleQGkQZBb+Ogls
         DBvQ==
X-Gm-Message-State: AOJu0YydLoKqE2UbsumPRKha6kgLWet/8fO3MFayVrs2gnJROQFhY/Zl
	EOQtC5lhVjm1ChzCbBKauN/rJN1UaLqC7HjTb7Y=
X-Google-Smtp-Source: AGHT+IFPovOILCn5j/2wGj/3p8Nuc8mE6/91x/WVtzz045HcSCft30cztSVEFSgjzZGlS/5kH+OjIw==
X-Received: by 2002:a2e:9582:0:b0:2c5:f8e:35cf with SMTP id w2-20020a2e9582000000b002c50f8e35cfmr3736200ljh.20.1700738627868;
        Thu, 23 Nov 2023 03:23:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/3] automation: add livepatch testing
Date: Thu, 23 Nov 2023 12:23:35 +0100
Message-ID: <20231123112338.14477-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series attempts to introduce some basic livepatch testing
in the gitlab CI loop.  Such testing will be more similar to what
downstreams use, as the patch payload will be built using
livepatch-build-tools.

A sample gitlab run can be found at:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1082636267

The series introduces a new build and test steps.

Thanks, Roger.

Roger Pau Monne (3):
  automation/alpine: add elfutils-dev and coreutils for
    livepatch-build-tools
  livepatch: add a dummy hypercall for testing purposes
  automation: add x86-64 livepatching test

 automation/build/alpine/3.18.dockerfile       |  4 +
 automation/gitlab-ci/build.yaml               |  8 ++
 automation/gitlab-ci/test.yaml                |  8 ++
 automation/scripts/build                      | 13 +++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 79 +++++++++++++++++++
 tools/include/xenctrl.h                       |  3 +
 tools/libs/ctrl/xc_misc.c                     | 14 ++++
 tools/misc/xen-livepatch.c                    | 25 ++++++
 xen/common/Makefile                           |  2 +-
 xen/common/livepatch-test.c                   | 20 +++++
 xen/common/livepatch.c                        |  4 +
 xen/include/public/sysctl.h                   |  7 ++
 xen/include/xen/livepatch.h                   |  4 +
 xen/test/livepatch/patches/test1.patch        | 13 +++
 14 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
 create mode 100644 xen/common/livepatch-test.c
 create mode 100644 xen/test/livepatch/patches/test1.patch

-- 
2.43.0


