Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59BA85A7D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946997.1344722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzj-0006Tx-J6; Fri, 11 Apr 2025 10:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946997.1344722; Fri, 11 Apr 2025 10:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzj-0006S9-Fz; Fri, 11 Apr 2025 10:52:23 +0000
Received: by outflank-mailman (input) for mailman id 946997;
 Fri, 11 Apr 2025 10:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Bzi-0006S2-UR
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:52:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae69a28-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:52:20 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso12554135e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:52:20 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c81f6sm78493215e9.20.2025.04.11.03.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:52:19 -0700 (PDT)
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
X-Inumbo-ID: 0ae69a28-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368740; x=1744973540; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJLuk24Nv2+HO6h8WGaWezknIrFa+t8rLucFzGjUQUg=;
        b=ORX13FIhg8MqKvS0gOYqld1bXHRfrbzxJm/bMKfPi8yjjx3khLE+aGPWMG/AAPDDSY
         XXG97HIJVet8w6KhL9B0CYyQiJ3vY9LMCVe/OwpJQeEHf7t46Bg5InYXU7Odil8OtUi9
         YuxQjaKQvNiM9doiqjSJQYuiggBWG+rOzG20s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368740; x=1744973540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJLuk24Nv2+HO6h8WGaWezknIrFa+t8rLucFzGjUQUg=;
        b=UZdBUPrKYwm6CIqg0pNUYWulFlXdLrZiJHAPbfBIN9yFZeHU8S7Lb1NiwuBFLuyVt9
         79sMaODCLLh6qMhqBGpwcJ3LNF0I+pnd7FLUIfETJ2hmSzv8GwNJyuBKoPX6PYEYVAIo
         ppBu+K/7jQ7Nfyqq7mJS1mkbDYwQc1zgISfD2wx37NGPrt2xHjfHQ76AxxS9P57C1lAe
         7Zk7i9VTgzeahRL7K+BM/5j6FUCaC+2pmN2t+bhi1tYBoLeUN+HMYq3y4uuEXsT0BK0a
         qmiPJpLTtimysGT+3g/BqieVyoZ+g79igjuEgT7Tnq9xuDLDW1WnckR7EMllu8Z//wSK
         F6xg==
X-Gm-Message-State: AOJu0Ywx+qI9qm0g4LqPpNc/BFZ3Rk6Wu6MfIvkF03UdW7kaYkSpjG37
	2mq84O32HApD4WGjd+1+F0aMqlYdWd56Ct8rW1uGiW2+dbcxnmjbE0o/w6OSzSR4wOWO+T0OLdI
	E+aA=
X-Gm-Gg: ASbGncvZJtSFPqStFx545ZpUufzQoN3y0ASkMsxtCOLpcvP4TqK3yLuNpbjOh3oJ2M7
	e31FJK6EO1KoDi0LiaOWXNIonjR4oH9YX3TNAOy4k5yVIJugjhmSz+AgDymMT75OWDk2YI+4YEX
	uzF1wwF+HRhQvamyVu+7utlplNaqaahOgTHRPUiP8A8E3xqx820aBZUyM1Hf69tmmu6Y47rRqcv
	XVDERQYSLCtYJhnVFX43zNy2rqZKdE3t1AqVLuViNXEDiFTkhETSFPmDSoTAkeP8UmKbB2xERjn
	a/ednBbO8F37x2ZU8wAEXJi5ZHYWZYXvYXRq0XwpEicZ2p6NGIvNv8m+Nbv2N8l1hjgH+5zWfa3
	uhUnzyqpzvS34pw==
X-Google-Smtp-Source: AGHT+IH9bhqKpPDBQsv3OUHsucect5ibfmzohhlVmT6AFrzfJab7Audckg4aVTJgGR8EVI/IfubQsg==
X-Received: by 2002:a05:600c:1e1c:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43f39622728mr20316585e9.1.1744368739881;
        Fri, 11 Apr 2025 03:52:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH TEST-ARTEFACTS 0/3] Rootfs generation (ARM and x86)
Date: Fri, 11 Apr 2025 11:52:14 +0100
Message-Id: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Part 3 of the cleanup, reworking rootfs generation.

The Xen side of the change isn't quite ready yet, but this is in a good enough
state for review.

Andrew Cooper (3):
  Rework rootfs generation to make a cpio archive
  Shrink the rootfs substantially
  Provide an ARM64 rootfs too

 .gitlab-ci.yml                           | 16 ++++-
 containerize                             |  1 +
 images/alpine/3.18-arm64-base.dockerfile |  6 ++
 scripts/alpine-rootfs.sh                 | 92 ++++++++++++++++++++++++
 scripts/x86_64-rootfs-alpine.sh          | 60 ----------------
 5 files changed, 114 insertions(+), 61 deletions(-)
 create mode 100644 images/alpine/3.18-arm64-base.dockerfile
 create mode 100755 scripts/alpine-rootfs.sh
 delete mode 100755 scripts/x86_64-rootfs-alpine.sh

-- 
2.39.5


