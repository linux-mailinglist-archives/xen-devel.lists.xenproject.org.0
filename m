Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE642A82C94
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944339.1342816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQH-0004fi-3g; Wed, 09 Apr 2025 16:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944339.1342816; Wed, 09 Apr 2025 16:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQH-0004e0-0m; Wed, 09 Apr 2025 16:37:09 +0000
Received: by outflank-mailman (input) for mailman id 944339;
 Wed, 09 Apr 2025 16:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQG-0004du-FR
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e03dd8f9-1560-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 18:37:07 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so4386323f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:05 -0700 (PDT)
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
X-Inumbo-ID: e03dd8f9-1560-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216626; x=1744821426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7f6YtoFpANmOKJW9HXTVsTqmlMIMm/vITFVLirPZXE=;
        b=MwhdD3nYX6yGWBjBWntvrQl2kcvH+Wl6j5VrS+dovmWCuX8Q4VCPtkEabzOYIVEWGM
         Em5XmmyTKW+/m96yAzSKppfCikyMtYHEZaACHRmTyzIA5cJsa7zmbAs7RPYeveK8TcMc
         fA81wtZcAP0YtuW+K3F6WwEwePRWHtXK1GEyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216626; x=1744821426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7f6YtoFpANmOKJW9HXTVsTqmlMIMm/vITFVLirPZXE=;
        b=fXIGGX405EwIJ8j0DeAYYtBLb1iZ+/Fz316FulJJvPpFL3VHowhpLWA/jmwU6664WH
         Obu/yw8O3fndAM37f3WT/1PtZ5ki8XVyqZPjL814BYx9Buy/3pGS9Fw+pG0CLGMn+hWk
         pM2NhODGoRDez2ltM3K4AL0uDfyQeNx4U8yvjjbr/ldrYjRWgy0yVwC+vav/L64L1jy/
         r/j7gExTc4WU4kfm1sotDAeJtxi/QJjA0jWqPuXEVkmPb3NOJXt3VcLIZ+t75rUssWgb
         wDQeHlPcA00zFjzQP7/BZE8dKiPCQf2mVU3wYt9L5mBHcvzdOq+vYQJtdbA8GQJptYfO
         vbZg==
X-Gm-Message-State: AOJu0YyrU1q/JbDfMSd5r4sV9OUhsvfBoiiHf0BRQWOCF8KqBQNAYfWI
	02eMxpK8XyWgvMXhQbSA1zZHR/2NnLQoNxQrThjvVybli0BkkKrg8F4NKrm9opyz6iWLQ0bsNwS
	haQw=
X-Gm-Gg: ASbGnctqIk5FsKWYP6eg+f4xEow0P1R2ostkDTvyCfzho9Hdu5QcXFcXwHr494nmejo
	ijkmoQLAplgeaF/fCOyPIAebML4YEBzX4lOs3h9IRXR6M6nZnObmAK7jaIYWfZ4eUpb0PrATtdL
	ryWeDr+8Q4U+JLFfD+JdV2P9Rapf35PbXDZN54zW4UikUINtcnFoXBZ2//Dp3A+SI+5boqY/u6C
	iq2KyOkJyn4EsbB2BdFXmIn38r6rUfYECyDHlP9t26r6MORoIlTO12mJMjLXZWdddCROyyR3ELM
	xjixZ4i/Z/oHm2YmiTGV+dZoCUfgeUihmq8qH0f/3S/0e/RqJR3POj/lBldB9/yQyH3Ai6fE3aM
	7oM29Jb88G3as8g==
X-Google-Smtp-Source: AGHT+IHwZLdULMDOr4DV788g/vpvaXTaDzDUcYrg+MHb78FBAIzgpTfHNCyYHyJQLfDwAZ87GDElJw==
X-Received: by 2002:a5d:6da7:0:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39d8856a0a1mr3093712f8f.55.1744216626423;
        Wed, 09 Apr 2025 09:37:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
Date: Wed,  9 Apr 2025 17:36:54 +0100
Message-Id: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various bits of cleanup, and support for arm64 Linux builds.

Run using the new Linux 6.6.86 on (most) x86, and ARM64:
  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760667411

Still to go:
 - Merge argo into the linux build (as it builds a module), strip devel artefacts
 - Rootfs generation, both x86 and ARM64

The argo kernel module and userspace should be a CPIO fragment too, as it's
embedded into both dom0 and domU in the relevant test.

Switching from tar to cpio can happen when the artefact name changes; which
fixes the backwards comptibility concerns.  In hindsight, domU shouldn't be
automatically embedded in dom0, as several tests further customise it; the
test job can adjust, then wrap the whole lot in a CPIO and append it to
dom0's.

Xen's main build jobs should either build with --prefix=/usr, or the common
rootfs wants to set up /usr/local/, because right now it's done by all jobs.

Andrew Cooper (7):
  Port containerise
  Fix container user setup
  Clean up Gitlab yaml
  Adjust Linux build script to work with other major versions
  Factor our x86-isms in the linux build script
  Infrastructure for arm64 linux builds
  Linux 6.6.86 for x86 and arm64

Marek Marczykowski-Górecki (1):
  Consistently use DOCKER_CMD in makefiles

 .gitlab-ci.yml                                | 43 ++++++---
 containerize                                  | 95 +++++++++++++++++++
 images/Makefile                               |  5 +-
 ...dockerfile => 3.18-arm64-build.dockerfile} | 22 ++---
 images/alpine/x86_64-build.dockerfile         |  7 +-
 scripts/build-linux.sh                        | 54 +++++++++++
 scripts/x86_64-kernel-linux.sh                | 31 ------
 7 files changed, 197 insertions(+), 60 deletions(-)
 create mode 100755 containerize
 copy images/alpine/{x86_64-build.dockerfile => 3.18-arm64-build.dockerfile} (55%)
 create mode 100755 scripts/build-linux.sh
 delete mode 100755 scripts/x86_64-kernel-linux.sh

-- 
2.39.5


