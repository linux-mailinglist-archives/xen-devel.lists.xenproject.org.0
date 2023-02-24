Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020A6A21CA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501412.773142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd98-0001a8-3X; Fri, 24 Feb 2023 18:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501412.773142; Fri, 24 Feb 2023 18:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd98-0001X1-0d; Fri, 24 Feb 2023 18:50:18 +0000
Received: by outflank-mailman (input) for mailman id 501412;
 Fri, 24 Feb 2023 18:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd96-0001Wv-Tv
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:17 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a4be97-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:15 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cq23so1153443edb.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:15 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:14 -0800 (PST)
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
X-Inumbo-ID: 13a4be97-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPWU64P9jS5sgFIdD2Beznq5vyuGl4TCAyjWIhiI6p4=;
        b=Cdyo4SBxTWxk6zTj2VcRTvFPY5k4Oil02mGPLvTN7+gV2AltYdDK5LxfRz5v+2LnoW
         o+YyNo1v7uzIYVcSHDb/G8ovbPFNUa2YdWdPYHVpinN89fHD0rTq/felytAzOfNv6fn5
         yY/bSlj/YDBFRs7/IApbnkIfs4lNH2rwYXwleeBYr5GVhGE97nyGmtDmorJ7N9QEBhrH
         Ywq3ycUuo3mub5fMsW7zNs+ufOUJm8GlHHWsr7bIBgH2RDPGoUV+VKsi69bl/7SNBulK
         qZtTOOWDNLkuGohWdlF9oyFHrbfUFHcVFjx25wfJWlb0OnOShFjSa28mV/pSCsmFt7Vg
         Zk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPWU64P9jS5sgFIdD2Beznq5vyuGl4TCAyjWIhiI6p4=;
        b=A1SQgSe1mT/X/fznB0EILshRUd5z8/MdKnKg0j3YDDAVFdPGerJ7rxzwdH1zO9K8Wv
         N6sMdsQZPYAiUhrCmz7jmkPenno5AXCg6V2SkGHHuL2zJRVUaj0kPWX74fSq5RFURH+G
         5Y5Xa34AqNdCc0EybVPFXXZaun1fEswkWJlt5v+1AIMZqflfinYMZKyKDPppvapL4Tbf
         4K70sPKcqOdJbtBGJs9qPdtAV4QgdkPAbdj65wl/45PdjvaZi2oo0rRRlV0Ln6/uSHj7
         /wmOvN3VE9NPGciiya3WnzWPsSAqeiukPGqeFqnWQtGZvc9qAx5KYB3L3PUlZIJ8bo8N
         nAcA==
X-Gm-Message-State: AO0yUKVxOAfU4yiHOqZr92tUuQCAnInric8qDAEAL3Sz2s3n+h4MU62u
	xLjmcOHLJmv7U2xn5eZbbOZ6iLqwx+U=
X-Google-Smtp-Source: AK7set+5brI5Ej3zPaMIHvbXd/NKrG97foF+uPKqacv5xTYuvgaSBvNToLgEn1p/dUiSMIgyt2mBsA==
X-Received: by 2002:a05:6402:164c:b0:4ad:7c30:25a3 with SMTP id s12-20020a056402164c00b004ad7c3025a3mr17302430edx.1.1677264615035;
        Fri, 24 Feb 2023 10:50:15 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Date: Fri, 24 Feb 2023 20:49:56 +0200
Message-Id: <20230224185010.3692754-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series attempts a cleanup of files {svm,vmx} files and headers
by removing redundant headers and sorting the rest, reducing the scope of
declarations and definitions, moving functions used only by internal {svm,vmx}
code to private headers, fix coding style, replace u* with uint*_t types etc.

This series aims to address the comments made on v2.

Main changes from the v2 series:
  - move all internal svm/vmx declarations found in external headers into
    private headers
  - add SPDX tags and guards to the new headers
  - take the opportunity to fix coding style issues and rearrange the code
    per Jan's suggestion
  - replace u* with uint*_t
  - rebased to the latest staging

There are more detailed per-patch changesets.

Xenia Ragiadakou (14):
  x86/svm: move declarations used only by svm code from svm.h to private
    header
  x86/svm: make asid.h private
  x86/svm: delete header asm/hvm/svm/intr.h
  x86/svm: make emulate.h private
  x86/svm: move nestedsvm declarations used only by svm code to private
    header
  x86/svm: move vmcb declarations used only by svm code to private
    header
  x86/svm: move svmdebug.h declarations to private vmcb.h and delete it
  x86/vmx: move vmx_update_debug_state() in vmcs.c and declare it static
  x86/vmx: remove unused included headers from vmx.h
  x86/vmx: move declarations used only by vmx code from vmx.h to private
    headers
  x86/vmx: remove unused included headers from vmx.c
  x86/vmx: declare nvmx_enqueue_n2_exceptions() static
  x86/vmx: move vvmx declarations used only by vmx code to private
    header
  x86/vmx: move vmcs declarations used only by vmx code to private
    header

 xen/arch/x86/hvm/svm/asid.c                   |   4 +-
 xen/arch/x86/hvm/svm/asid.h                   |  38 ++
 xen/arch/x86/hvm/svm/emulate.c                |   4 +-
 .../x86/{include/asm => }/hvm/svm/emulate.h   |  20 +-
 xen/arch/x86/hvm/svm/intr.c                   |   4 +-
 xen/arch/x86/hvm/svm/nestedhvm.h              |  77 +++
 xen/arch/x86/hvm/svm/nestedsvm.c              |   7 +-
 xen/arch/x86/hvm/svm/svm.c                    |  10 +-
 xen/arch/x86/hvm/svm/svm.h                    |  62 ++
 xen/arch/x86/hvm/svm/svmdebug.c               |   3 +-
 xen/arch/x86/hvm/svm/vmcb.c                   |   3 +-
 xen/arch/x86/hvm/svm/vmcb.h                   | 597 ++++++++++++++++++
 xen/arch/x86/hvm/vmx/intr.c                   |   4 +
 xen/arch/x86/hvm/vmx/pi.h                     |  78 +++
 xen/arch/x86/hvm/vmx/realmode.c               |   2 +
 xen/arch/x86/hvm/vmx/vmcs.c                   |  17 +-
 xen/arch/x86/hvm/vmx/vmcs.h                   | 100 +++
 xen/arch/x86/hvm/vmx/vmx.c                    |  76 +--
 xen/arch/x86/hvm/vmx/vmx.h                    | 416 ++++++++++++
 xen/arch/x86/hvm/vmx/vvmx.c                   |   4 +
 xen/arch/x86/hvm/vmx/vvmx.h                   | 187 ++++++
 xen/arch/x86/include/asm/hvm/svm/asid.h       |  49 --
 xen/arch/x86/include/asm/hvm/svm/intr.h       |  25 -
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h  |  53 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h        |  41 --
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h   |  30 -
 xen/arch/x86/include/asm/hvm/svm/vmcb.h       | 575 +----------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h       | 118 +---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h        | 453 +------------
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h       | 165 +----
 30 files changed, 1685 insertions(+), 1537 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/asid.h
 rename xen/arch/x86/{include/asm => }/hvm/svm/emulate.h (73%)
 create mode 100644 xen/arch/x86/hvm/svm/nestedhvm.h
 create mode 100644 xen/arch/x86/hvm/svm/svm.h
 create mode 100644 xen/arch/x86/hvm/svm/vmcb.h
 create mode 100644 xen/arch/x86/hvm/vmx/pi.h
 create mode 100644 xen/arch/x86/hvm/vmx/vmcs.h
 create mode 100644 xen/arch/x86/hvm/vmx/vmx.h
 create mode 100644 xen/arch/x86/hvm/vmx/vvmx.h
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/asid.h
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/intr.h
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/svmdebug.h

-- 
2.37.2


