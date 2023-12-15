Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A738146A6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655029.1022672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DV-00027c-0J; Fri, 15 Dec 2023 11:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655029.1022672; Fri, 15 Dec 2023 11:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DU-00024P-Tn; Fri, 15 Dec 2023 11:18:52 +0000
Received: by outflank-mailman (input) for mailman id 655029;
 Fri, 15 Dec 2023 11:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE6DT-00024C-OQ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:18:51 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8bad3d4-9b3b-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 12:18:50 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so5131405e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:18:50 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040c4c9c52a3sm16968713wmo.12.2023.12.15.03.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:18:48 -0800 (PST)
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
X-Inumbo-ID: b8bad3d4-9b3b-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702639129; x=1703243929; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQSfgCUH/gyqfKahydnZfRc1+dZ9TnmnpZoNnoVbHCA=;
        b=tAZyuB+L/axBWDP5SxLPpMoNdbQ7QdcZow+tl53MBRbyxu8JQPKneocVtvOrjVoM5g
         X/ZcEsVwBP0GdfBEWv14Ez7RfLuhgKt8Od/vYhWcGyxwscRJ8Jt2ZBY3VfQp+17niR42
         RpCwGgFCaaPnQv3jGvaR8/AkZvt4i7XHvG3Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639129; x=1703243929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQSfgCUH/gyqfKahydnZfRc1+dZ9TnmnpZoNnoVbHCA=;
        b=wELR+IgOeNNjyYQknoDfjPuKgEfpIzTCHRO16kSfHPZl55EJwa+FNVSWWqcdOBc9ap
         zzA+ZJ7dFcqcLHuf+ANylo90EIXZ93s1yHVFM+le1rP/kA+fS+y8DEV5FfNczQjtt43Y
         5tAfQYlfUVjazY+1q2kudlENp1WxtXRsN0oxlhnnI/1Ak1lRZurU8aMoIMaYkOrBRcF7
         LEqg8bZHlIIxofNj//2Ky42XBD64xQAc25kInQvJRu1P+U/+fTFM8MJUfj4YXHaoLdJN
         5TddPvR5hQFoA6kNPdEH/7VclClPvuJtyypthdZJFR77f0ufhkTNMHfP/pkoA+qfkeUQ
         RnGg==
X-Gm-Message-State: AOJu0YxM+GQgISHPrr8dTZSlWxxBErXk9IfW9xDejZV6S86mFVVdyJwY
	tj15Hjl/WI6ueaKLd6hXouK5c/qPdD/tfxz9kS4=
X-Google-Smtp-Source: AGHT+IFwESF7Ewp9G+VWRj6rmJQWPYVvDfKnaUTthxyii3n7Ut2mEE7WCszR1WVBmtYa1xVTNilVCA==
X-Received: by 2002:a05:600c:3411:b0:404:4b6f:d70d with SMTP id y17-20020a05600c341100b004044b6fd70dmr6839489wmp.17.1702639128764;
        Fri, 15 Dec 2023 03:18:48 -0800 (PST)
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
Subject: [PATCH v4 0/4] xen/x86: add testing for self modifying code and livepatch
Date: Fri, 15 Dec 2023 12:18:38 +0100
Message-ID: <20231215111842.8009-1-roger.pau@citrix.com>
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

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1108069448

Roger Pau Monne (4):
  x86/livepatch: align functions to ensure minimal distance between
    entry points
  xen/x86: introduce self modifying code test
  x86/livepatch: introduce a basic live patch test to gitlab CI
  automation: add x86-64 livepatching test

 automation/gitlab-ci/build.yaml               |  9 +++
 automation/gitlab-ci/test.yaml                |  8 +++
 automation/scripts/build-livepatch            | 27 +++++++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 ++++++++++++++++++
 tools/include/xenctrl.h                       |  2 +
 tools/libs/ctrl/xc_misc.c                     | 14 ++++
 tools/misc/xen-livepatch.c                    | 29 ++++++++
 xen/Kconfig                                   | 19 +++++
 xen/Makefile                                  |  3 +
 xen/arch/arm/livepatch.c                      |  2 +
 xen/arch/arm/xen.lds.S                        |  4 ++
 xen/arch/x86/Kconfig                          |  1 +
 xen/arch/x86/Makefile                         |  1 +
 xen/arch/x86/include/asm/test.h               | 37 ++++++++++
 xen/arch/x86/livepatch.c                      |  4 ++
 xen/arch/x86/setup.c                          |  3 +
 xen/arch/x86/sysctl.c                         |  9 +++
 xen/arch/x86/test/Makefile                    |  3 +
 xen/arch/x86/test/smoc-lp-alt.c               | 24 +++++++
 xen/arch/x86/test/smoc-lp.c                   | 24 +++++++
 xen/arch/x86/test/smoc.c                      | 70 +++++++++++++++++++
 xen/arch/x86/xen.lds.S                        |  4 ++
 xen/common/Kconfig                            |  5 +-
 xen/common/kernel.c                           |  5 +-
 xen/include/public/sysctl.h                   | 13 ++++
 xen/include/xen/lib.h                         |  1 +
 26 files changed, 386 insertions(+), 3 deletions(-)
 create mode 100755 automation/scripts/build-livepatch
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh
 create mode 100644 xen/arch/x86/include/asm/test.h
 create mode 100644 xen/arch/x86/test/Makefile
 create mode 100644 xen/arch/x86/test/smoc-lp-alt.c
 create mode 100644 xen/arch/x86/test/smoc-lp.c
 create mode 100644 xen/arch/x86/test/smoc.c

-- 
2.43.0


