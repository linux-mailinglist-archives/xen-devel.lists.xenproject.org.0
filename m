Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C3B1F720
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076300.1437937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-0006Hz-HA; Sat, 09 Aug 2025 22:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076300.1437937; Sat, 09 Aug 2025 22:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-0006CE-Ar; Sat, 09 Aug 2025 22:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1076300;
 Sat, 09 Aug 2025 22:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnU-0005qO-GO
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e53f4d9e-756d-11f0-b898-0df219b8e170;
 Sun, 10 Aug 2025 00:12:10 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so1784268f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:10 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:08 -0700 (PDT)
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
X-Inumbo-ID: e53f4d9e-756d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777530; x=1755382330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lh4a8o2Cj1kZRtez3yhL6/zREtjrE8nJebwU6afQ+n8=;
        b=JzMAzm2SA6DqT51AKGXsjeWdKtiCgrnvQnw993H/D6v604DZGJyV1nTQuC8uIep4kV
         9wbK3KyR2cp62bfbjmKp+xl2j+pkO5bJAaA/pDiP/tLtPj8zZYEQ2MVRyNMUwh2HVoXW
         f0D25RDyXPZBuzsV7/i/ou2blupdwVjsBetlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777530; x=1755382330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lh4a8o2Cj1kZRtez3yhL6/zREtjrE8nJebwU6afQ+n8=;
        b=wxP4UQ5yHeypKvZiZ8SWh68+4zbtb3Lovdux6X+U3KSF5QZAiUX4tG3hnXtHEa8wlG
         /a8vNmmREtEdv0XOWXABCN3Xg+Y+CKW3X+KUHTEz0qVk1bpSfa23oUSOpxU0S7QWbyNN
         /tOmlbYxYpbQG9oaWRCY7ZB3kxruMtHNAl213Uk9qeFvp6WO2UpOx0hx530KB8vJWT/K
         WETdo5yx3D+hl/VfOpxVzp7ID8Nrb10HK1DtWrV2j2p6oDYUf3Cv6EP60y/t5/T1et+q
         wOImx4e5WJ/tMEaH6GAbJmrcAOJtlSAGhIWQ27nRcd04dHRGK92+KJKz7olPcebNerh+
         f2fg==
X-Gm-Message-State: AOJu0Yx3qVwZe8IaqYMC77cIxtJ03wrenPXbTuRMkuggMTakWDl/uVE8
	UJtpnM7Mro5FtIJG7EEHJ6wldw9Jg2PuwvVK3ZHnpaQW/zOrp7fyWZK6bMfubhCd5ARgByM1Ydo
	A/nYLkMk=
X-Gm-Gg: ASbGncvGlZxBna7XJmrxyLZwrnp5aDqCIw+YpR2M8PjI1chV64b0jejBJWZn8GzSKWs
	DX8kzwPkV5QIxVw9MCJLD+lzkuLBJkifv/2Ngg+m3Cecv5per2mC09mITuWnlGf3ikajwFF6G3t
	VMamEch6qlYD4xtKMKEquV3Iy833dFeQ7em42YXJLdfIf+KJ/oMiJh9KiDqOuklmR0f2KfneJGY
	jgF/IHzaRVm9SQcfZWq+/UsAaGY/sjvJWiwZg3cLEoMllqt+2qEyPPU/JPFIWJ8PacmcUT0RAyX
	ofkjJLJyKgHbwcuIkPBQAg/agOJjD3W9RlN/xd5Czx+pcYscaiepQBFV2pbss5B1hyXP+Vy3OiT
	+BhRHqJVQr8w7VWPpcUYIVBPmRtH2sFLQ5tIiPo49UzlYg/U6JvDgH7Le0NsHeTrjIdSrg6Pgmg
	X0
X-Google-Smtp-Source: AGHT+IG/cJIfjwwKByHhQx+n1LZqJv0rVgSazJarinQUcI21HSnqw/Ly3g2G5PgiAmWPoVatjfKrzw==
X-Received: by 2002:a5d:5848:0:b0:3b8:893f:a17d with SMTP id ffacd0b85a97d-3b900b511b8mr6590422f8f.49.1754777529942;
        Sat, 09 Aug 2025 15:12:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.21 0/5] CI: Add Debian Trixie
Date: Sat,  9 Aug 2025 23:12:01 +0100
Message-Id: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I know it's past the last-post deadline, but Trixie was only released today.

In terms of backports, we should at least go back to the bugfix branches.

Andrew Cooper (5):
  CI: Trixie containers
  CI: Update ppc64 to use Debian Trixie
  CI: Update riscv64 to use Debian Trixie
  stubdom: Fix -Wimplicit-int in newlib
  CI: Update x86 to use Debian Trixie

 automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++
 automation/build/debian/13-riscv64.dockerfile | 37 ++++++++
 automation/build/debian/13-x86_32.dockerfile  | 51 ++++++++++
 automation/build/debian/13-x86_64.dockerfile  | 74 +++++++++++++++
 automation/gitlab-ci/build.yaml               | 94 +++++++++++++++----
 automation/gitlab-ci/test.yaml                | 14 +--
 stubdom/Makefile                              |  1 +
 stubdom/newlib-fix-etext.patch                | 23 +++++
 8 files changed, 306 insertions(+), 25 deletions(-)
 create mode 100644 automation/build/debian/13-ppc64le.dockerfile
 create mode 100644 automation/build/debian/13-riscv64.dockerfile
 create mode 100644 automation/build/debian/13-x86_32.dockerfile
 create mode 100644 automation/build/debian/13-x86_64.dockerfile
 create mode 100644 stubdom/newlib-fix-etext.patch

-- 
2.39.5


