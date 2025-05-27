Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB31AC51FD
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998558.1379281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCT-0000bb-If; Tue, 27 May 2025 15:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998558.1379281; Tue, 27 May 2025 15:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCT-0000Z8-Fu; Tue, 27 May 2025 15:26:45 +0000
Received: by outflank-mailman (input) for mailman id 998558;
 Tue, 27 May 2025 15:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCS-0000Yz-Mq
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id febdff96-3b0e-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:26:44 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6045a8a59c5so4893175a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:44 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:42 -0700 (PDT)
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
X-Inumbo-ID: febdff96-3b0e-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359603; x=1748964403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4zPih8KENWeN6thgWYfkXf1bdKX5fZSG2XUP/lLAmM=;
        b=JVxG5UyN7598WqrTAhpnPygHJx6WJRwNG00yKaEGcWDZ1Cvht2Ef7h7GyyseD6IEmn
         hp8W+4Du1DQRB6nqdQVS63Bz0kkpILSPmz4T4aETosJ9/4XjwWczIa6t3gYsayfaSiA7
         UttYhYHqgxQMBxCfbnPGkHOLZTaPv77Pqgka8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359603; x=1748964403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4zPih8KENWeN6thgWYfkXf1bdKX5fZSG2XUP/lLAmM=;
        b=bQzs7XjjHS0gwp3PBDHVl31Y2p/9k8S7WYMsils5+fSvo+iIh80sdWiCMvZBceprqJ
         fOS/wS3OhR8SW1YlnsSc07dgZeXqSLlKOyEd2McwaqZJzodQ3Ja4SVhCXtoWU228NAAV
         PnWmwGjz95jNqnSDmu/xOd+DRbre1vjlwisyRcn2vjn1ptDSJzg7HGSB2KajSbw3I3Sk
         PG2eDwnI8Sj/3IT588CveJgxkWQoqW8YrQo2qBluqzGBiXk/AeUhGP/kyRARce/pUAFA
         zsijRoXBk90zOhMfbYnMBlKYO+hH6EdNjBOukpYSurF3qw3xzg3U7RMXqO1xh5P5hLpZ
         dUyA==
X-Gm-Message-State: AOJu0Yyr3g+own8hKnWDBVL9Cfnoj03UMyd28DgPUSXlwX/SxyxbSyk+
	YF9AzBFm2HJtCR/joZX3/xA67qn49T1pCPpFYev+JvbcWIVJ9fX0rmEzMCLnJwQIBShT4PVIRD8
	yB/I=
X-Gm-Gg: ASbGncuv0v580YjEhnSlkBc+1fxRbQ5z2kPNqIzK1MLEWkvUzA3wyAOoZbm2RCGuL/+
	U0scYQK5PrIogflcDnBoKATceIN17sNsWLeZxMKPW5SaaNt8QiTyUs6TLOOQrp7MQUxORGzk95h
	e3QcGSrjIO/NdBtDAdjpSVEJS+46AM7PyASD3PSp7574WDi3YnnRaSep0lD6fBs2/agsCYfFK4/
	GEqGBAhv7OHCcyD1gPXAE767WK4gzuWbI5zchLEnDqwBoBIwJqq7SDk8U1TWolYijpAtxD6hW+A
	tItOk2fMvndaaFvLhXvPY+mSRgNORTYfYQ71TNDf8ENVk/yz42KEcqyKiH5gBt+f0i52/U+S6Rn
	gkis7KDE/N6KF7CcE8cx6
X-Google-Smtp-Source: AGHT+IGONYKqkGAr2A7Y4JQSqqgb3WyFAgxXEN/mVswVccTduaodlntO6/Or2lsSZQ3Pmb7GNWhySA==
X-Received: by 2002:a17:907:7288:b0:ad8:9a3b:b274 with SMTP id a640c23a62f3a-ad89a3bb390mr67755766b.52.1748359602951;
        Tue, 27 May 2025 08:26:42 -0700 (PDT)
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
Subject: [PATCH v3 0/5] pmstat interface fixes
Date: Tue, 27 May 2025 16:26:30 +0100
Message-ID: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
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

 tools/libs/ctrl/xc_pm.c       | 21 +++++++-------
 tools/misc/xenpm.c            | 48 ++++++++++++++++++++-----------
 xen/drivers/acpi/pmstat.c     |  7 +++--
 xen/drivers/cpufreq/cpufreq.c |  3 +-
 xen/include/public/sysctl.h   | 54 +++++++++++++++++++++++++++--------
 5 files changed, 90 insertions(+), 43 deletions(-)

-- 
2.49.0


