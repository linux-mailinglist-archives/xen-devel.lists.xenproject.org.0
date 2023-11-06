Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0127E281E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628132.979248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-0008BC-AP; Mon, 06 Nov 2023 15:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628132.979248; Mon, 06 Nov 2023 15:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-00089S-6w; Mon, 06 Nov 2023 15:05:18 +0000
Received: by outflank-mailman (input) for mailman id 628132;
 Mon, 06 Nov 2023 15:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AC-000892-Bq
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:16 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e36e36cb-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:05:14 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c6b30acacdso61666331fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:14 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:12 -0800 (PST)
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
X-Inumbo-ID: e36e36cb-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283113; x=1699887913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ5iPIHVMmyDKXCEcRpB1PLVr212+b0o2RYlwTZzSbw=;
        b=csuCPZXd8b4Xwft6rsJxnLhaNQewbwuGCBeMBGfCJ9mxnm551isON1hmF+/s/646Wd
         oVt6gBsxWVkDySX7YBT++h6qw6nVaiq2cKTAxuA5Rnm5TJX28FtfobX+uUxHlk18K7Hj
         ao4lWz1RF39KAMx7sTA0b3JM2ovOfJYpxkrLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283113; x=1699887913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZ5iPIHVMmyDKXCEcRpB1PLVr212+b0o2RYlwTZzSbw=;
        b=njDFPHig4Mdu2ZfahCW3n1fSOSxD/iv1QeQwaZMH3FR6ZY1LX1EgdXQO2+w9lx8g5O
         +X4LbriwlCIlOFaQqpTeTwU7GVOQVF0BXHhqy51AKlpkjn3zlULjoXBmqZjExDCbTZjd
         FXGZNwy9j+rDUSsI/bcl+kquDeL3U6DDc3SXDwt7gfIsZ3l0RfDUZexhu/vMbUi1M3su
         z0YDle1yNtbChRnVJKF9ilLiSMn5keTzoZDzpPZufzmV+XZC3X7a6pLa+RUxCP5p4yE7
         V3VcHa0UF+L8xyFxIPMEuEVVPLpEkmDQ7aDmBZtB+R7uhGKrVVQemr1vWDO2ur6A2GXt
         MVgQ==
X-Gm-Message-State: AOJu0YzSmNhPdHnCSjb4g3wXwVv3vrohu0YRi323i0gFn/9vf91VwWo7
	8hYmDocHUmQ0J6jvMdLLt+IOUp9BX2+iQQbVanU=
X-Google-Smtp-Source: AGHT+IGyi2S6KzVl8/CIZkXikN4EfOvMJITc61jW9uBr9shg1jkD0ewUerNvzJkP1A1yAoxpi6SJcQ==
X-Received: by 2002:a05:651c:39a:b0:2c5:ee7:b322 with SMTP id e26-20020a05651c039a00b002c50ee7b322mr22221290ljp.18.1699283112985;
        Mon, 06 Nov 2023 07:05:12 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/6] Pygrub security enhancements and bugfixes
Date: Mon,  6 Nov 2023 15:05:02 +0000
Message-Id: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few extra bugfixes and security enhancements for pygrub.

The biggest security enhacement is the removal of filesystem permissions
from the depriv thread of pygrub. This is possible on newer versions of
e2fsprogs, as it has an interface to consume file descriptors rather than
file paths.

Bug fixes
=========

Patch 1: Properly confines the mount namespace in Linux systems and
         corrects an incorrect statement about older Linux kernels being
         buggy with them. With this patch, mounts done inside the namespace
         disappear altogether after the last process is killed.
Patch 2: Fixes a bug preventing setting the LIMIT_FSIZE override

Security enhancements
=====================

Patch 3: Limits the amount of memory pygrub can chew
Patch 4: Tweaks libfsimage to support a new interface ( fdopen() ) which
         allows passing file descriptors rather than paths
Patch 5: Modifies the python bindings to grant access to the new interface
Patch 6: Modifies pygrub to open every required file before depriv.

Alejandro Vallejo (6):
  tools/pygrub: Set mount propagation to private recursively
  tools/pygrub: Fix bug in LIMIT_FSIZE env variable override
  tools/pygrub: Restrict depriv operation with RLIMIT_AS
  tools/libfsimage: Add an fdopen() interface to libfsimage
  tools/pygrub: Expose libfsimage's fdopen() to python
  tools/pygrub: Hook libfsimage's fdopen() to pygrub

 docs/man/xl.cfg.5.pod.in                    |   6 +-
 tools/libfsimage/common/fsimage.c           |  42 ++++++--
 tools/libfsimage/common/fsimage_grub.c      |   2 +-
 tools/libfsimage/common/fsimage_plugin.c    |   4 +-
 tools/libfsimage/common/fsimage_priv.h      |   3 +-
 tools/libfsimage/common/mapfile-GNU         |   2 +
 tools/libfsimage/common/mapfile-SunOS       |   2 +
 tools/libfsimage/common/xenfsimage.h        |   3 +
 tools/libfsimage/common/xenfsimage_plugin.h |   2 +-
 tools/libfsimage/ext2fs-lib/ext2fs-lib.c    |  14 ++-
 tools/pygrub/src/ExtLinuxConf.py            |  20 ++--
 tools/pygrub/src/GrubConf.py                |  29 ++---
 tools/pygrub/src/LiloConf.py                |  20 ++--
 tools/pygrub/src/fsimage/fsimage.c          |  33 ++++++
 tools/pygrub/src/pygrub                     | 113 +++++++-------------
 15 files changed, 173 insertions(+), 122 deletions(-)

-- 
2.34.1


