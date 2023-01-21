Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87C6769AC
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 22:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482382.747853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLaX-0004NK-Sd; Sat, 21 Jan 2023 21:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482382.747853; Sat, 21 Jan 2023 21:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJLaX-0004Kk-PC; Sat, 21 Jan 2023 21:39:49 +0000
Received: by outflank-mailman (input) for mailman id 482382;
 Sat, 21 Jan 2023 21:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ql0K=5S=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pJLaV-0004Ke-LA
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 21:39:47 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e75ed17-99d4-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 22:39:44 +0100 (CET)
Received: by mail-qv1-xf2f.google.com with SMTP id u20so6385239qvq.4
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jan 2023 13:39:44 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:4282:e612:9c15:499])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05620a424600b00705be892191sm24202402qko.56.2023.01.21.13.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 13:39:42 -0800 (PST)
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
X-Inumbo-ID: 1e75ed17-99d4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6jtH6JbVqik8S2gIyLE8s1X6O+bKE7q59Ed51ysmUw=;
        b=m2++UL6NpfMIJWua3g6Wuq5di7JrygMuiF7USvPJwXUlC0ARX4XapJwgp4k5TyhJgZ
         S4QKeMHARJjzwu2vJUhUarT5WI3sN6Kcbiq9u0K9Q8rvDqZI2JTdmyPjpL2CILgbAeph
         lKT34cl2oXvuTkMFIeUrjDTIQb0Ul5l2HGqXFe9tK1G84ESGFK/69DmzNNuWcX8KaMcM
         BDvtrpTSNHJz33pDMFZLiO1Ir36jSBjdGuYjRSR7r+XIkTGHaJN1wsZGH50vf8u8IEHg
         wcX+svCf9WdSQ96L3jI932IL/TpehMlmipMq1uBhCwYvByraGqBY4CT6UFe/kOJkPlNX
         aTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6jtH6JbVqik8S2gIyLE8s1X6O+bKE7q59Ed51ysmUw=;
        b=DCBvO5IJOzfbTtbPwmhYbrv0VgnTLxRfTZmpKVQ6xn6sW1ynKcD9rwOtLKzKIox081
         okO81qy7ZCbtmfNb8GTZgTFqKKBUbxvt+NX0+6S9ySZr2+JUpq3s+K+oH5zmbcmrgYon
         YCRaaav6OEuiaRqti1yGZ6YmQaRip14JGnP6jKA6WyR3gHsJ3+tavEXxX5C+ViTKwChw
         eoWnGyFgAeYSvnCCh6io5A9tLrnqJiOP+kYBDpY+pu/oe4DNNySZ0TDri1kj9AizqQkj
         45KipBKLlrHVDWDUtAfosmWIeJArP9Zxx6mp7ZSDdTwJCEE4mKTiuiT8M8OvZirWk0YW
         7ifg==
X-Gm-Message-State: AFqh2krJOBHzwF6qON6AhV5OqNpJEs6gPTzqngeo5og0a4u+M5gJXj8o
	KpjaagV8g8GFe2uviKM8kGkbcEceCII=
X-Google-Smtp-Source: AMrXdXuJcpaS79twOFs56ZwwbS18TNy60brcEB+8yohdgAhogEGjubyUV+2nxJShHMaFVRSRxbw9rg==
X-Received: by 2002:a0c:fc03:0:b0:537:4b09:670f with SMTP id z3-20020a0cfc03000000b005374b09670fmr9193415qvo.25.1674337183131;
        Sat, 21 Jan 2023 13:39:43 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH 0/2] tools: guest kexec fixes
Date: Sat, 21 Jan 2023 16:39:06 -0500
Message-Id: <20230121213908.6504-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two toolstack fixes for guest kexec.  This restored kexec enough that I
got Debian bullseye to kexec once.  Trying to kexec the guest a second
time had it spinning at 100% CPU after initiating the kexec.  Haven't
looked into that part yet.

Regards,
Jason

Jason Andryuk (2):
  libxl: Fix guest kexec - skip cpuid policy
  Revert "tools/xenstore: simplify loop handling connection I/O"

 tools/libs/light/libxl_create.c   |  4 ++--
 tools/libs/light/libxl_dom.c      |  5 +++--
 tools/libs/light/libxl_internal.h |  2 +-
 tools/xenstore/xenstored_core.c   | 19 +++++++++++++++++--
 4 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.34.1


