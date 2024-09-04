Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B296C282
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790490.1200256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzG-0003Xr-Is; Wed, 04 Sep 2024 15:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790490.1200256; Wed, 04 Sep 2024 15:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzG-0003W6-Er; Wed, 04 Sep 2024 15:32:02 +0000
Received: by outflank-mailman (input) for mailman id 790490;
 Wed, 04 Sep 2024 15:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzE-0003Va-OL
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d340546e-6ad2-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 17:31:59 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso2933152a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:31:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc54fd03sm52869a12.37.2024.09.04.08.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:31:57 -0700 (PDT)
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
X-Inumbo-ID: d340546e-6ad2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463918; x=1726068718; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts8oFQDl0Fz8AKQZb+xCmKntJCkPb51Es80wHPG1iHE=;
        b=i32VCHfl38U8Xmel7dqeN/nLKW8aKidOVfX75PUe9C0u811Vnei4m0Zz8ngZz683ln
         1i5CnGU2VRuT+4emQ3/TI4ki8hpbRctu2oZwE15EnrAK9ZiIwddkoryqQXHLjzJdY1Rl
         nZeNr+YNhnviQag2j3L3z0lQ6+XMzo/zQb0mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463918; x=1726068718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts8oFQDl0Fz8AKQZb+xCmKntJCkPb51Es80wHPG1iHE=;
        b=NMeQGbOVVq1M08wIWeiMFiNUZeBE5/lj7HZJcX4MdCIlDVw+FeteBHJGYUPWCW6mDl
         5Jr9X62BQ7va6+81IZwEuV8YYz9k37qyZiAEA+ZmydNomM1s7OCn3g3BUsYZctKNA/GI
         ahDUh7TMK/Dc2R8mj8wxdH4nYpvw5TPz8bpyu0k+Uyits32i1edahgG7S+TQlUe/Ki4D
         jcFOT+iSyR1u5LvLFQ1OfhqQUrZiESQ8WhwBrBMN8E+TzOpidt53NDv4g6Y6Gpk6nLkn
         GxVeexs6Sx5UZ9YGyUnRWsR8hCcMNDKCQGUjvEMAMY60Fd8G6HBhmmeGB52O1ZFsZeTC
         aDrA==
X-Gm-Message-State: AOJu0YwAeYOreueHehcKALOKzui2abvYhMTiVkZ/HQWRNb8zxtb5Nrnr
	avczBvKnfGqGNC2MFulr8GzWb1A1pcfeW9KRDNHYk5WqAFjVuy6qQQ4HCg+hfDy+h1jxduUxMvY
	k
X-Google-Smtp-Source: AGHT+IFMoGB1Os/LN5Sf+Qejfe2Syyv2L/EXp+BDt1DNA6c4esG7MMrmiF50xvewMF5VQSKr9Wx2rw==
X-Received: by 2002:a05:6402:3549:b0:5c2:6e51:9d2e with SMTP id 4fb4d7f45d1cf-5c26e519ffamr5200090a12.27.1725463917716;
        Wed, 04 Sep 2024 08:31:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/6] x86/time: improvements to wallclock logic
Date: Wed,  4 Sep 2024 17:31:45 +0200
Message-ID: <20240904153151.83995-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an attempt to change the default wallclock
preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.
First 3 patches should be non-functional changes, mostly chopping the
current logic into smaller functions so that in patch 4 the probing vs
runtime wallclock logic can be split. Patch 5 adds a new command line
option to force the usage of a specific wallclock.

Finally patch 6 changes the preference to use CMOS RTC even when booted
from EFI firmware.

Thanks, Roger.

Roger Pau Monne (6):
  x86/time: introduce helper to fetch Xen wallclock when running as a
    guest
  x86/time: move CMOS edge detection into read helper
  x86/time: split CMOS read and probe logic into function
  x86/time: introduce probing logic for the wallclock
  x86/time: introduce command line option to select wallclock
  x86/time: prefer CMOS over EFI_GET_TIME

 docs/misc/xen-command-line.pandoc |  19 +++
 xen/arch/x86/time.c               | 236 ++++++++++++++++++++++--------
 2 files changed, 198 insertions(+), 57 deletions(-)

-- 
2.46.0


