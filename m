Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A923B5520B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122090.1466010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50w-0005CV-NO; Fri, 12 Sep 2025 14:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122090.1466010; Fri, 12 Sep 2025 14:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50w-00057T-E8; Fri, 12 Sep 2025 14:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1122090;
 Fri, 12 Sep 2025 14:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50u-0004JZ-Hg
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe17845e-8fe6-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 16:44:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so14441275e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:31 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:30 -0700 (PDT)
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
X-Inumbo-ID: fe17845e-8fe6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688271; x=1758293071; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RGHXqBNJI6tQy2M8/bIoPq23nxzoU9POG3ZkPJ6xPE=;
        b=FfspcdjfLBaKcWWVsI1Q3ClaNBwxqBK/tzRdy8ECYHKIwS5pgvryd3uoxPr6j5nIn7
         EjlB9Y5+USoWSbcJKf18zLV1zOx69D8k+lHLixeml5Q4jurNalQillP3CmESLJXQA5TQ
         JCC5dp6NgVZMDHu/YH0ttDvZ2aXhDDGyQi+1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688271; x=1758293071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RGHXqBNJI6tQy2M8/bIoPq23nxzoU9POG3ZkPJ6xPE=;
        b=wu362P/AbJ0x2VQDyNe+ebHKAd9cBav4wyBNCy8C0yAi+dUzr0AfXpdTnufK9IsSFd
         iDScbMQJrIQkWroHvsE5C1BrgjoWXWPS5/p9kjPUw7yPpMRSekqXmzlhvEOLtUhpcW8F
         cDsONQZxOXZhOxp/zfg0+/iBuc6MbyUjy3yupbr6aSQTo/MUsb8p2bUF/RrLOv2crU9R
         SR4ECgUnxvHOksrJHYxsFIwOGDRpzeg4mYMx3/IG1N4ut81kETt6DoSVAcIGaPtKKE/H
         bAxga6vgJaILDtBxGmbgOiBQc0aisCrwKB16xGit1wRiMBqXxkvfEG0KU5oIS49yCyuF
         M4bQ==
X-Gm-Message-State: AOJu0YxvLjxteXzOnwtDm3HwT65aO9lRkIHrSEykd8tSsoI57JApnJiM
	68YklgUw4kgfPjERsmpkmY98f5XyDSnrbCq5+COQU0rgf3fRAkDY2+lkcfWleMcs/NPYCIeb6ai
	tSl7D
X-Gm-Gg: ASbGncu1mTPOf45HT1syW8k83sphqY0U7FlDuWLwsVwyDjSA0ojbwSLe2M9KY8f1aXV
	1vREbK7slL69P0Ud2GoavdvuuX6CYAIJNVBsK8Sn3f7bC0ND+baoVfiQS2c79O29fbvqyWqyDc5
	xGCInreip28EFUMIMLNGlQDznKxm38OALyrLqwGHw5iTffDBz4Ox/vyq26V42EvqQVCHXvzWBWI
	/RIxDRW+0u3gmuwr7tWJDWbGKFGw1Xv+OIbRooP0OYhOzA3i/7y+CEGjWJi74rmdy+sn5dcFpmR
	tFhKCb8DVrRNPt3PPD/BHlM1a1O4Gr2OqSIZGLvLdL6haUDgE5HVvyAX6o+N0pTfYDvA6VNyYuB
	7qpZNKH7WRzO9QR1PR/X6hoZL26I5JgQxo6qbGCiiCZnH0SFcGWy520GXgq+RfmPuMAIv4TBaCL
	DTCqow3m9RlOM=
X-Google-Smtp-Source: AGHT+IFJ7tXD7Isvqk1AB812PnDe847/r4b57QBBoUDIiIyAvhZ5Nt7pq5LCYCt72xrfxmZwaeJUVw==
X-Received: by 2002:a05:600c:6288:b0:45d:e326:96fb with SMTP id 5b1f17b1804b1-45f211ff89emr39879115e9.30.1757688270944;
        Fri, 12 Sep 2025 07:44:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/8] CI: Add Debian Trixie
Date: Fri, 12 Sep 2025 15:44:19 +0100
Message-Id: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refresh the Trixie series.  A few more bugfixes found by randconfig and log
inspection.

These containers are already built and deployed for people to test with.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2036687955

Andrew Cooper (8):
  CI: Use the Debian Trixie container for RISC-V test jobs
  CI: Update ppc64 to use Debian Trixie
  CI: Merge categories in debian/12-x86_64.dockerfile
  CI: Make qemu-smoke-x86-64-gcc-efi compatible with Debian Trixie
  x86/emul: Make condition coverage warning non-fatal
  CI: Use pipefail in scripts/build
  CI: Update x86 to use Debian Trixie
  CHANGELOG: Notes about distro changes in CI

 CHANGELOG.md                                  |  3 +
 automation/build/archlinux/current.dockerfile |  1 +
 automation/build/debian/12-x86_32.dockerfile  |  1 +
 automation/build/debian/12-x86_64.dockerfile  | 12 ++--
 ...c64le.dockerfile => 13-ppc64le.dockerfile} |  2 +-
 ...x86_32.dockerfile => 13-x86_32.dockerfile} |  3 +-
 ...x86_64.dockerfile => 13-x86_64.dockerfile} | 14 ++--
 automation/build/fedora/41-x86_64.dockerfile  |  1 +
 .../opensuse/leap-15.6-x86_64.dockerfile      |  1 +
 .../opensuse/tumbleweed-x86_64.dockerfile     |  1 +
 .../build/ubuntu/16.04-x86_64.dockerfile      |  1 +
 .../build/ubuntu/18.04-x86_64.dockerfile      |  1 +
 .../build/ubuntu/20.04-x86_64.dockerfile      |  1 +
 .../build/ubuntu/22.04-x86_64.dockerfile      |  1 +
 .../build/ubuntu/24.04-x86_64.dockerfile      |  1 +
 automation/gitlab-ci/build.yaml               | 72 +++++++++++++++----
 automation/gitlab-ci/test.yaml                | 18 ++---
 automation/scripts/build                      |  2 +
 automation/scripts/containerize               |  4 +-
 automation/scripts/include/xtf-x86-64-efi     | 12 +++-
 xen/arch/x86/Makefile                         |  3 +
 21 files changed, 109 insertions(+), 46 deletions(-)
 copy automation/build/debian/{12-ppc64le.dockerfile => 13-ppc64le.dockerfile} (93%)
 copy automation/build/debian/{12-x86_32.dockerfile => 13-x86_32.dockerfile} (93%)
 copy automation/build/debian/{12-x86_64.dockerfile => 13-x86_64.dockerfile} (89%)

-- 
2.39.5


