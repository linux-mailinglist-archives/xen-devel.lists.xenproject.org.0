Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473BAB3B10
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981606.1368011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQu-0004hh-H4; Mon, 12 May 2025 14:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981606.1368011; Mon, 12 May 2025 14:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQu-0004eZ-E7; Mon, 12 May 2025 14:47:08 +0000
Received: by outflank-mailman (input) for mailman id 981606;
 Mon, 12 May 2025 14:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUQs-0004eT-FX
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e0641e-2f3f-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:47:05 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so4696718a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:05 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:04 -0700 (PDT)
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
X-Inumbo-ID: f8e0641e-2f3f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061224; x=1747666024; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edvOPEfgYBiY31RUPQrTKj3oj6FLwY0EZ5M5g55NxnM=;
        b=P2SjFqQtBTyDcOEr1aBlDYXXhY6qw43Ql88LfS4cYkHKJmd3UQEiGNYS5p++hNe/Vn
         WgDOQ84tN9e2t7zAV6nYQRDFzOvYrcf248NIqNpOHanj1ZyRqY2QS8UsPNBcclJfYfRp
         c5WN0JDMjrDV8set+WYiJMA/Qzgj9S2LoDwPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061224; x=1747666024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edvOPEfgYBiY31RUPQrTKj3oj6FLwY0EZ5M5g55NxnM=;
        b=Bu29JHncNPNs/MzMHVZK4TvtFicBpmk/FfFQtk11UcbWE/rL6rHhs8Wr1gbhmuWVR8
         s/TNFO6FC6JczjzgJq300twYM7C1wiv4irGRguhR7ZGk8digJr+mpGnFcYVsFzWUv4f0
         wLiKxhnGBm/XC7g/FaY7WWrM9s/qKcw2yF59HcsWhih8xnRXO//6A+eaBmBIMYxOuqD5
         iYm2nOJ1DJCKWPj0sp6YH8XKp+M422iyqMcOq9gU0lo8PCOitLTbZTwnKchF6nKysxiV
         baBB05ORSOSAdJWWjjJZZ9t/j5uM2CMHaqpHE99CS5CvUW/EjklOp9Xn0nXX9GY+pufn
         OG6Q==
X-Gm-Message-State: AOJu0Yx5lTiGNElbmyoyRsVNip4CPdKHI2sueV2qGjaI6KdL75q8aJGR
	6mJS1RyRybLUM/28tx7Yi8sT3dU6pQ/mfuJNzBUI+BgIEFh3ZHM1fkOLHPZhl5SfArh1vSwUlEM
	=
X-Gm-Gg: ASbGnctmtXnVy3Y+1N3pRjURDeJBzbAAR1I+KB0dJVhj+yAc7uqBNbe36BqLR1C5qjJ
	veAPlyDDquaRzlH0OFoC3V5oarBLQLWPCnapawbi+kjugWwIKEiZaa5pEt9/LAEAM6YzsBelMYt
	0lznb9UQx7fEkqTOqy8qAZsrR6gniW60SWYuiYdxuTKNopF+ffWA9TxjbmP5xAC5zehgFAOVq6a
	7m32Ut8isgraQyuQqdiIQYbYiJVfac6ExVTCMEf6Os+cvo+uuIk7puiBnHjRkhDS7CUR0MDsOZ6
	wITlC2l+M1hMT4Eh5EjAZP1AW4cEqTURpuAg/GBDVG9OqE1FA1wF1I3QWUMiSrUXHPk/fQHJenU
	=
X-Google-Smtp-Source: AGHT+IHG4mPFcPutSdz0S4m0QP068mVkMhrjUODjFuan01ZTRRK4WVwpMA9FsAQF0HJgL2mq6snOUw==
X-Received: by 2002:a17:907:6a13:b0:ace:c518:1327 with SMTP id a640c23a62f3a-ad218f1b830mr1298948766b.14.1747061224589;
        Mon, 12 May 2025 07:47:04 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/5] pmstat interface fixes
Date: Mon, 12 May 2025 15:46:51 +0100
Message-ID: <20250512144656.314925-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify and fix usage of the pmstat hypervisor and tools interfaces
regarding sizes of buffers passed in.

Ross Lagerwall (5):
  x86/pmstat: Check size of PMSTAT_get_pxstat buffers
  public/sysctl: Clarify usage of pm_{px,cx}_stat
  cpufreq: Avoid potential buffer overrun and leak
  libxc/PM: Ensure pxstat buffers are correctly sized
  libxc/PM: Retry get_pxstat if data is incomplete

 tools/libs/ctrl/xc_pm.c       | 20 ++++++--------
 tools/misc/xenpm.c            | 48 ++++++++++++++++++++------------
 xen/drivers/acpi/pmstat.c     |  6 ++--
 xen/drivers/cpufreq/cpufreq.c |  4 ++-
 xen/include/public/sysctl.h   | 52 +++++++++++++++++++++++++++--------
 5 files changed, 87 insertions(+), 43 deletions(-)

-- 
2.49.0


