Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D362E9AE20E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825098.1239298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhs-0005kn-Jn; Thu, 24 Oct 2024 10:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825098.1239298; Thu, 24 Oct 2024 10:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhs-0005iG-Gd; Thu, 24 Oct 2024 10:04:40 +0000
Received: by outflank-mailman (input) for mailman id 825098;
 Thu, 24 Oct 2024 10:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhq-0005hp-AQ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:38 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fcd3d10-91ef-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 12:04:36 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso10158351fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:36 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:35 -0700 (PDT)
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
X-Inumbo-ID: 5fcd3d10-91ef-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764275; x=1730369075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNqbImwZxs4xFzcEhVZHP0Hlanuz5ZfZG5QPVUx0lBc=;
        b=ZNKc4Jq/NMNcCm/vPBbm22Jn6V6beYeQazdgJoiN3GQu7RQzlaSMbhG2nACxPcn73G
         qU4fSWKBFzgf8QyxjReWqADnamFPCAm9mxOvhLTB7m3oDoXpJYKmsx+13pAdUouRhJvg
         8HmOh2TRiXpmIEYZ6UCst+wXTsFI2kPe0o9RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764275; x=1730369075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNqbImwZxs4xFzcEhVZHP0Hlanuz5ZfZG5QPVUx0lBc=;
        b=MoT4/nBAKTFZwTQptoCFzxoTGEQZ0UHvqhByBhlandtfpJ0EPU2vGWSt7PEKjgG8eB
         o4BacUWdVDlrjYeqsk8bRyvHUuflACtG7phSt8W/mo2d6k8SrqB9Kah6gLx9oumMaSoH
         Z3w04f79+k0Ge1tiVnb8qYKZwz4wvwS38hFi3RfkPlgf9X8g3yt+4NVXVjwLMTT4YXUT
         3/m7ipVJY4JRwC540VS8FhVqHNzCBKvzWTNsdsWwwmAXo8gDCYjY2SXRPeTeU0O0oA7e
         xlyFdPQqih3Uy1+IVeVlvc98LILmuepkxiebzjnWPwDxlepzhNDB8OkZ+dYkw2eMXxgt
         5DCA==
X-Gm-Message-State: AOJu0YxTtMiZsc8yHlvgpwXETsSjUM049GdUdDvqmPNuVUyaqW1xM7SH
	XdAKOWB4yYtEdRre3PA78CKrh4eunsye2TfquCHz6Gg2hSiXUPd8bUBjiwD+69pmV0MPRpmOAYF
	QrWY=
X-Google-Smtp-Source: AGHT+IH3943bW0nY8yaRYdy9TzXpNfHF87hgoEt7ylU1CKOVRt7vMr1oYtHQhBIHYagVhWtyJ8RkOg==
X-Received: by 2002:a2e:f11:0:b0:2fb:5c84:929b with SMTP id 38308e7fff4ca-2fc9d39399dmr35341901fa.36.1729764275404;
        Thu, 24 Oct 2024 03:04:35 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v1 0/6] automation: Refresh the remaining Debian containers
Date: Thu, 24 Oct 2024 11:04:15 +0100
Message-ID: <cover.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

These series continues the refresh of the CI containers after[0], focusing on the
remaining Debian 12 containers. The containers now build and run as a
non-root user, use heredocs for readability, and use
apt-get --no-install-recommends to minimize the installation of unnecessary packages.

The Debian 12 x86_64 and arm64v8 containers required additional
modifications to the test scripts to enable test execution as a
non-root user, so I did them in their own patch at the end of the
series.

The updated containers have been tested in
https://gitlab.com/xen-project/people/javimerino/xen/-/pipelines/1509304440

[0] https://lore.kernel.org/xen-devel/cover.1729170005.git.javi.merino@cloud.com/T/#t

Javi Merino (6):
  CI: Refresh the Debian 12 x86_64 container
  CI: Refresh the Debian 12 x86_32 container
  CI: Refresh the Debian 12 arm64 container
  CI: Refresh the Debian 12 arm32 cross compile container
  CI: Refresh the Debian 12 cppcheck container
  CI: Run the builds and tests that use the Debian 12 containers as a
    normal user

 .../debian/12-arm64v8-arm32-gcc.dockerfile    | 28 +++++++
 .../debian/12-arm64v8-cppcheck.dockerfile     | 80 +++++++++++++++++++
 automation/build/debian/12-arm64v8.dockerfile | 71 ++++++++++++++++
 automation/build/debian/12-x86_32.dockerfile  | 51 ++++++++++++
 automation/build/debian/12-x86_64.dockerfile  | 71 ++++++++++++++++
 .../bookworm-arm64v8-arm32-gcc.dockerfile     | 24 ------
 .../build/debian/bookworm-arm64v8.dockerfile  | 55 -------------
 .../build/debian/bookworm-cppcheck.dockerfile | 54 -------------
 .../build/debian/bookworm-i386.dockerfile     | 50 ------------
 automation/build/debian/bookworm.dockerfile   | 57 -------------
 automation/gitlab-ci/build.yaml               | 68 ++++++++--------
 automation/gitlab-ci/test.yaml                | 36 +++++----
 automation/scripts/containerize               | 10 +--
 automation/scripts/qemu-alpine-x86_64.sh      |  4 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  7 +-
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  5 +-
 16 files changed, 371 insertions(+), 300 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
 create mode 100644 automation/build/debian/12-arm64v8-cppcheck.dockerfile
 create mode 100644 automation/build/debian/12-arm64v8.dockerfile
 create mode 100644 automation/build/debian/12-x86_32.dockerfile
 create mode 100644 automation/build/debian/12-x86_64.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8.dockerfile
 delete mode 100644 automation/build/debian/bookworm-cppcheck.dockerfile
 delete mode 100644 automation/build/debian/bookworm-i386.dockerfile
 delete mode 100644 automation/build/debian/bookworm.dockerfile

-- 
2.45.2


