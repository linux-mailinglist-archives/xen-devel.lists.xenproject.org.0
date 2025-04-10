Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF0A84F40
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946385.1344326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaa-0000dV-GH; Thu, 10 Apr 2025 21:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946385.1344326; Thu, 10 Apr 2025 21:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaa-0000bf-Be; Thu, 10 Apr 2025 21:37:36 +0000
Received: by outflank-mailman (input) for mailman id 946385;
 Thu, 10 Apr 2025 21:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zaY-0008Ll-CZ
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:37:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00d12e97-1654-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 23:37:29 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so11460755e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:37:29 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm100427f8f.50.2025.04.10.14.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:37:28 -0700 (PDT)
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
X-Inumbo-ID: 00d12e97-1654-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321049; x=1744925849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsA32EZ7RzMR5uxIf7T/6UhKmIGBK1+HzdGcMXVGVW0=;
        b=uHhO86u4HRGRu2kA+kA8CDqq6a9hCKDJe5sr6REKa/Udv11k8sFyUnAjSexRM3A/KG
         O6l6soRGny0vVh06psPdyZuF6ewldHXj/fyJRNfejxD39TLudNDnNkISzWI65g0N6wPn
         m63mqjBDAqun54zKuFjtotnvzSuZDwX3+QlTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321049; x=1744925849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsA32EZ7RzMR5uxIf7T/6UhKmIGBK1+HzdGcMXVGVW0=;
        b=mzREl2NXSNTlWSg1SkMJ2vt8Mn6g/gAdjJG9JB1PU2PrOGyFFj9vrYiXnt3uS2uTn+
         zmuil4CkwBHZruNS4PCwlWT/Vigv1S09CoSRsMBgcvOYjKyFXjIn4TENuWpT4aZCWwIZ
         RhBTyzIdarmdSagv/xJ8VHp4WZJYEqaMkz68usB8CnDJyqqw4mzZfhtf1QQl1yu++oDl
         dDAhcd67plMxUTfyY2rfvNr0fnQgahL+cZxG3CYYz5gsL+QhPOjHAb1/RKn51JG/tqyr
         I1Alql4jtZzvY330YUS/Z/fHqsGmHzzeCdPP5ulCtfGcVBnafrvNNDRSj5rp6lulkXBh
         Bptg==
X-Gm-Message-State: AOJu0Yy+rHII4WDAJcaEyVLFMy8YGSn7LWLwBdjWeLhcwhBFlb7jzyRs
	CcxMQPBKluJ4MeYGqRlkM/umU2VJWFTZnZcwgy4y4v4kFOdci8G10fWBNi6ZVqNXtRSOrtHg6bN
	7E9Y=
X-Gm-Gg: ASbGnctAPKzivMstR1cmesT1rFmwRyhiQQz+ZR8t99PoPF8wRuXqTCaYH8JXsr1emhZ
	OkVrAn2xJZEMd6758g+heRdW5rucaXXkzdGcL/SwFuP1fB/jQfw93kFzgWKgnpmWeIh4uoFRbcQ
	Vx2Xp47VdsJDWtpASx3ow/mvBXUmidyXB+BNB8iZ45JkT6XslELCRYSrEl4aBAP+ontQIaN+tEN
	KeOKyPdurgcpypj/XmewLX41dhdEyXPacCg8/KldkfYaLDF9tSAUjZUXqJzMByOrq+XrZZlnNxn
	5lNBj3uRVYILRwQCVyVqHPT08bkQvQ2jB7L3KLF37c+2XkiMmv0rieiai4MS76qEmx6xqkBkwjb
	4lsdRjqv1kvEJXuSBJHAOKpXl
X-Google-Smtp-Source: AGHT+IF8EITuAPf6schwPsC20fUR6Lrki2nwXNbNlxBTcOi8so7ZMcS4zMxVU9H/X0bBTYaZw0ZydQ==
X-Received: by 2002:a05:600c:83cf:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43f3a94de15mr1344155e9.14.1744321048868;
        Thu, 10 Apr 2025 14:37:28 -0700 (PDT)
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
Subject: [PATCH TEST-ARTEFACTS 0/4] Argo artefact
Date: Thu, 10 Apr 2025 22:37:20 +0100
Message-Id: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Part 2 of the cleanup, reworking Argo.

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9690063969

Andrew Cooper (3):
  Rename and adjust x86 containers
  Overhaul how Argo is built and packged
  Switch to fixed Argo

 .gitlab-ci.yml                                |  6 +-
 containerize                                  |  4 +-
 images/alpine/3.18-x86_64-base.dockerfile     |  6 ++
 ...ockerfile => 3.18-x86_64-build.dockerfile} | 32 +++++----
 images/alpine/x86_64-rootfs.dockerfile        |  4 --
 scripts/build-argo.sh                         | 66 +++++++++++++++++++
 scripts/build-linux.sh                        |  6 +-
 7 files changed, 103 insertions(+), 21 deletions(-)
 create mode 100644 images/alpine/3.18-x86_64-base.dockerfile
 rename images/alpine/{x86_64-build.dockerfile => 3.18-x86_64-build.dockerfile} (54%)
 delete mode 100644 images/alpine/x86_64-rootfs.dockerfile
 create mode 100644 scripts/build-argo.sh

-- 
2.39.5


