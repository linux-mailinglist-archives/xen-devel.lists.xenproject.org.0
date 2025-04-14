Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D6A87D5B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949552.1346053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtv-0005PN-I5; Mon, 14 Apr 2025 10:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949552.1346053; Mon, 14 Apr 2025 10:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtv-0005Ns-FH; Mon, 14 Apr 2025 10:18:51 +0000
Received: by outflank-mailman (input) for mailman id 949552;
 Mon, 14 Apr 2025 10:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gtu-0005Nh-2W
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:50 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2115ee-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:49 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c14016868so3787731f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:49 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:47 -0700 (PDT)
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
X-Inumbo-ID: db2115ee-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625928; x=1745230728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cb4VOug/ZvqBw0yisUMHavtruUhlAlPkD0+fd9CRM4=;
        b=gISghh5CIaMA8l8RNFv11Nkn/O4A7UTmadkjpF+F+unuW5cuz4zNEt/azn7QTg9YHJ
         h6k0FDSOQ4U+h4qTNWUCKZbrmcWVyUmLB/NUPJbBwlPEYrm8F5vjG7QDPIywm9QPDTF2
         cM1yQ8PoA3RMdlzIL1nHfYOAiCu2YsVp61Ji4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625928; x=1745230728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cb4VOug/ZvqBw0yisUMHavtruUhlAlPkD0+fd9CRM4=;
        b=BQX6AxVODPLyo00qY1Yunie4ef+1VUoDiG7R9HR3YHzWyCd/KQgqymSGlywosVh1gE
         beT6MSu4iRUUx3puUZsA0p3Al0OqP3szVho0F/AabcQAyZwtm523o/xR/I26ZDv6hV9S
         zQVDOgBjZsj9QH+6tBnPqZBHOVbjcOv+O8kFlimdUbhbM9f9Dm62sNNJvkufg4M6tVbW
         XH7xpm50sNkqEsTMY0N8JsAm8bt8VAv32la3Qwt8t80GDWXlZCtGIhmVUdoVbSEgRwMR
         bSez57lc5pSI6dLHr56FPaNy1pXYypMODNeQ2I1XXmmfDX3oYWLaIRkro2XRvpoWI3I4
         UJFA==
X-Gm-Message-State: AOJu0Yz1OTnUlGA1M5gr1DQcs23OHAII0BwhlopTvryA4YIGMMrX/EQS
	lNHRDZ5Tw2K47BHNzkgHDr2NhUpj4F+H4V9oshaNjj1CGVEcmZvxb7LiyacjIXQbh4wFkVXY8E8
	GyI8=
X-Gm-Gg: ASbGncuRFheE1hd1/zAaScneVqQyKndcjSgLQooBdpzSsGDnx8kCzHADwZAGSMKR7D1
	DijLVLMgIEnMo9+jjj+n2s8PZwMMNyS/FSwwyrNx1utKaOBFmirGycUlR6+Ym4YQZ3liTlBGRhh
	gVsLLdDEPi8OeY5/dZ5KudoA9r0GZZh5MvUlzBE+SpndGraprr/vojS5agg0bh27HF5FnywGRWU
	A0aDV7+OJBEeR57sx39Y7DXwmZFNSXSI6VDkw/KcM4UI8W2VfxQgWCxo+wOoPlmK8UE4P1kjIW5
	czTUp0GhAhIFmU36fPcRi1Z31m0sue+Nsi1z8unn0gqnvty9z4Q9gTxe4dUK29q8G38NsQjBAw4
	v7Pn7Or8EOmTSGg==
X-Google-Smtp-Source: AGHT+IGrzcWx8bLqV9EMO5pgzZxJTS96cWsavHwt8//9REH1sRSelv45vYe7VJafZiX+w2+cpIndJg==
X-Received: by 2002:a5d:64ce:0:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-39ea51ee650mr8479410f8f.9.1744625928221;
        Mon, 14 Apr 2025 03:18:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH TEST-ARTEFACTS v2 0/7] Rootfs/argo cleanup and microcode support
Date: Mon, 14 Apr 2025 11:18:36 +0100
Message-Id: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series supersedes the others posted.  Only minor changes from before; see
patches for details.

See the companion Xen series for the testing using these new artefacts.

Andrew Cooper (7):
  Rename and adjust x86 containers
  Overhaul how Argo is built and packged
  Rework rootfs generation to make a cpio archive
  Shrink the rootfs substantially
  Adjust directory layout for rootfs.cpio.gz
  Provide an ARM64 rootfs too
  Package microcode for the x86 hardware runners

 .gitlab-ci.yml                                | 26 ++++-
 containerize                                  |  5 +-
 images/alpine/3.18-arm64-base.dockerfile      |  6 ++
 images/alpine/3.18-x86_64-base.dockerfile     |  6 ++
 ...ockerfile => 3.18-x86_64-build.dockerfile} | 35 ++++---
 images/alpine/x86_64-rootfs.dockerfile        |  4 -
 scripts/alpine-rootfs.sh                      | 95 +++++++++++++++++++
 scripts/build-argo.sh                         | 67 +++++++++++++
 scripts/build-linux.sh                        |  8 +-
 scripts/x86-microcode.sh                      | 42 ++++++++
 scripts/x86_64-rootfs-alpine.sh               | 60 ------------
 11 files changed, 272 insertions(+), 82 deletions(-)
 create mode 100644 images/alpine/3.18-arm64-base.dockerfile
 create mode 100644 images/alpine/3.18-x86_64-base.dockerfile
 rename images/alpine/{x86_64-build.dockerfile => 3.18-x86_64-build.dockerfile} (51%)
 delete mode 100644 images/alpine/x86_64-rootfs.dockerfile
 create mode 100755 scripts/alpine-rootfs.sh
 create mode 100755 scripts/build-argo.sh
 create mode 100755 scripts/x86-microcode.sh
 delete mode 100755 scripts/x86_64-rootfs-alpine.sh

-- 
2.39.5


