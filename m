Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C677692A845
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755530.1163918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGw-0000Jq-HT; Mon, 08 Jul 2024 17:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755530.1163918; Mon, 08 Jul 2024 17:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGw-0000HA-Eo; Mon, 08 Jul 2024 17:35:30 +0000
Received: by outflank-mailman (input) for mailman id 755530;
 Mon, 08 Jul 2024 17:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQsGv-0000H0-Hk
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:35:29 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76d8e4ad-3d50-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:35:27 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so21181741fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:35:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm11603666b.6.2024.07.08.10.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:25 -0700 (PDT)
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
X-Inumbo-ID: 76d8e4ad-3d50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720460126; x=1721064926; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/OMQyB3Pr1i2mf+3/h4TWNIvtqthBOoCW1eSge6Fm4=;
        b=EbJEIlHCDMG+R7hEhpCKECCPpCsWLHpO+7+MDWbKeMqJN3fFyMmuTcEK0WM9WiqDAL
         a89VIFjVujCljkAOzBUGMXKNXYF8+yP17GIGFjTvPd+q3PbH7XTqjHeNJhZtcT7HcNo6
         /edrwQaFCUzTjG1/fzYcfHZiaMDHbFMzY8cSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460126; x=1721064926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/OMQyB3Pr1i2mf+3/h4TWNIvtqthBOoCW1eSge6Fm4=;
        b=FEuhTgyl0tHJtL/noNri45jzWLFH05ghSRenM1BShYPGhtusXtgeXZTsn0Kltfxw1u
         nq3aVCpTlPSOOZf2VTjpBascxs1XjOFnFpDS0XSJNggluDZ11DtYG2zBP6zMB51vhYbj
         tciZOiovl3rXfVj0efoYtrPS7g1uVDyxbynXLJJ5WML51eFuTPjVeQsiglUTU6YkAC3H
         khUitYuMUUT2TmcLwEpYTQNjj8zUu9E5Rf5Cryrf9SM1Ur5uucHIBMthl5+OnmG4er/C
         XzoQTMtndUqK4HQC9ItxrKNSXj7cvpdn0qEEo/LRNQR7vIdIML+0fVfHTkAPEtmWZ790
         f0Eg==
X-Gm-Message-State: AOJu0YyF3JJXnBLbHOck950AaOZ5QNs8V3H+fygXyloahGliJlpsDX7J
	Cnpsm9Wd5XCmPwXNweEtEx1dqRuL02fNDI8j5pdwj9/NvnSLnZKREE9X7j/Jy+swQcon/M9Gr+Y
	a
X-Google-Smtp-Source: AGHT+IEXXCjqWNxM0y8hYVEEoqXo/39xABgi/Q7HoBf1Q9UpbFpiyi8YgwqP9XxjtGSpkWw2ifz5cA==
X-Received: by 2002:a2e:9852:0:b0:2ec:5843:2fb8 with SMTP id 38308e7fff4ca-2eeb316affamr3321761fa.42.1720460125518;
        Mon, 08 Jul 2024 10:35:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.19 0/4] CI: part 3 (improvments to PPC)
Date: Mon,  8 Jul 2024 18:35:18 +0100
Message-Id: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is a run with these improvements in place:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7277624801

Jan: I hope to backport this series to 4.18 so we can remove
qemu-system-ppc64/8.1.0-ppc64 entirely.  This will simplify changes in the
future by making the testing more consistent.

Andrew Cooper (4):
  CI: Fix CONTAINER_UID0=1 scripts/containerize
  CI: Introduce a bookworm-ppc64le container
  CI: Use bookworm-ppc64le for both build and test
  CI: Refresh bullseye-ppc64le

 .../build/debian/bookworm-ppc64le.dockerfile  | 36 +++++++++++++
 .../build/debian/bullseye-ppc64le.dockerfile  | 51 ++++++++++---------
 automation/gitlab-ci/build.yaml               | 22 ++++++--
 automation/gitlab-ci/test.yaml                |  3 +-
 automation/scripts/containerize               |  2 +-
 automation/scripts/qemu-smoke-ppc64le.sh      |  4 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 38 --------------
 7 files changed, 84 insertions(+), 72 deletions(-)
 create mode 100644 automation/build/debian/bookworm-ppc64le.dockerfile
 delete mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile


base-commit: 64cee188376e52a154475a86a9d2adc85f029870
-- 
2.39.2


