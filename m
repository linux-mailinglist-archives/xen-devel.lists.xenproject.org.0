Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF015A8420A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945331.1343583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNG-0004t2-U5; Thu, 10 Apr 2025 11:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945331.1343583; Thu, 10 Apr 2025 11:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNG-0004pH-Q4; Thu, 10 Apr 2025 11:47:14 +0000
Received: by outflank-mailman (input) for mailman id 945331;
 Thu, 10 Apr 2025 11:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qNE-0003hP-TN
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:12 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86af362f-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:06 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso5814325e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:04 -0700 (PDT)
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
X-Inumbo-ID: 86af362f-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285625; x=1744890425; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=flZ7BbtrrxFqgiPu3pGHNugrEO4DPt9EsjZO6Qw/J8g=;
        b=Bl5KDGCPkjHg1I9SS9cczNaiyw7JNhu1d4ZuiT2ROH3BhEiPu6lPTJDUUO8EZ7FSUX
         t7UMU5kZ8+P5jJsoOJSMevDAY8IHyDDMSoUfQ3+ssZuM9nnpwgi0aPI/Gi5GWVRIApAn
         OnXBIqyo007qkq6crD9fTrV+G9nMVNyecgWpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285625; x=1744890425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flZ7BbtrrxFqgiPu3pGHNugrEO4DPt9EsjZO6Qw/J8g=;
        b=pMSmLs904tFvLwMtozB6T4rxMSr0Xzv0LZ1v6+NnGG5HWZ+POJakIBmpUuLxNYsyCZ
         npvnenTnLvsNFFIYqMjai7BUqSRS/mL7D+3h0RxulJG1im/zPROhI7AFELAYUwWylUYs
         D8JaMC+7s4LhUDkvH9hEBlCGGLsVFVzAEbPjWjanaq3qSvaPXcUjC4S/uruG1gOUdB54
         X6hst4jfSTRbo6V1Y3sLJxSsHbubF83dMUBRsUU0YIfKtn/NnH8a624dcv7hZKsntr9/
         oUiRP24SCFL1XyOYhoBIqB7tdEPtz/JQvHP1PCLExKuoEhWYV+BB9OFN9jumdET/8qjz
         pPuQ==
X-Gm-Message-State: AOJu0YzJ4p39mp1VXnwlU12gby44H5o1c7mLK6L7fnPHT8WRaLxQWvRr
	ycm+W2xkdcK6M5uA8sIWJYmph7UKVlSd/LHbMpkXHnNpEuH/WkKHDHsYC4eygE6XgtcSjQ1fLGM
	S/TM=
X-Gm-Gg: ASbGncvxQ3ki9OA9zk0vg2C5mKtKLIWoAuBJJb3PtOyEz0O+lwBhPhliBshR7rzaK6u
	47h1O5AXKgtz9xoaHkPGDczceKqhL8RtWjMnaMsg5LrgIrEvGKYcWFNaf4AEf/rqCJ2Y6+L3IOs
	igiK0DocwZUX20SQKR1mu17qjL48xXSnPGa2+GCpMAUCxCfZTTIxd3yV0onJskvwdvNhwKZOFMu
	Ew+uzkS4+7szKCY9KVnXRdba9uw2V5vQNlzqk4VIhHbnh/ggToSAdgg/dV+Wv9onFJsEcBuQZHD
	6GDOdHkP2KtwhZ5p8vBoevT6pnlMYx5s0SGqRvaBOXz3DZuNMrosXz/C4umMRDDdQZ4faJNyF25
	1JOMDO2DotZDQqA==
X-Google-Smtp-Source: AGHT+IFirGQDmxdjeTGaZ2HOONhkxrcsUzUUMg3aNkWrJJYKQXzzmdfI3py46Qfm52GauliKQNVK4Q==
X-Received: by 2002:a5d:648c:0:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-39d8f4930f5mr1825818f8f.29.1744285625254;
        Thu, 10 Apr 2025 04:47:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH TEST-ARTEFACTS v2 0/6] Cleanup and Linux ARM64 support
Date: Thu, 10 Apr 2025 12:46:22 +0100
Message-Id: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two patches merged.  Only minor tweaks to the rest.

https://gitlab.com/xen-project/hardware/test-artifacts/-/pipelines/1762204421
is a pipline showing clean kernel builds.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1762221755 is
a Xen pipline using the artefacts from ^.

Andrew Cooper (6):
  Port containerise
  Clean up Gitlab yaml
  Adjust Linux build script to work with other major versions
  Factor our x86-isms in the linux build script
  Infrastructure for arm64 linux builds
  Linux builds for x86 and ARM64

 .gitlab-ci.yml                            | 41 ++++++++--
 containerize                              | 95 +++++++++++++++++++++++
 images/alpine/3.18-arm64-build.dockerfile | 27 +++++++
 scripts/build-linux.sh                    | 54 +++++++++++++
 scripts/x86_64-kernel-linux.sh            | 31 --------
 5 files changed, 212 insertions(+), 36 deletions(-)
 create mode 100755 containerize
 create mode 100644 images/alpine/3.18-arm64-build.dockerfile
 create mode 100755 scripts/build-linux.sh
 delete mode 100755 scripts/x86_64-kernel-linux.sh

-- 
2.39.5


