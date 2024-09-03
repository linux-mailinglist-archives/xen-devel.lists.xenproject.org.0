Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F646969E9A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789149.1198675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBt-0007Dr-KQ; Tue, 03 Sep 2024 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789149.1198675; Tue, 03 Sep 2024 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBt-0007Bb-FB; Tue, 03 Sep 2024 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 789149;
 Tue, 03 Sep 2024 13:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBs-0006aM-8r
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:24 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e636bad3-69f4-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 15:03:22 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso6958311e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:22 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374d00564b6sm4131022f8f.91.2024.09.03.06.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:20 -0700 (PDT)
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
X-Inumbo-ID: e636bad3-69f4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368601; x=1725973401; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMY1tlnv2qiwF5GOX0b0csChWfpLKrBqmkQN9XWdvZk=;
        b=thTo96ubxoQVdjhuzl7l2+nKdw7qF8M1/IyBk58qTtfSPzRhlHFr6bPhex0d6PLJfW
         fLjVYboMMo5IvZrKkQ6gLyNo8Y/QXBAlLh/2GgKF3jRaBUr1EMIC0XLjUyIp634uypV9
         cso2UMhShHv52YyDPC8SX6vKETXD8B1RP45Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368601; x=1725973401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMY1tlnv2qiwF5GOX0b0csChWfpLKrBqmkQN9XWdvZk=;
        b=hpBwxKcbeH2ptPqLJtVXpmzc9qBO/F4Hil1+nYQABR5jvzaGzfrL4uGtKilshfGnKA
         3cLs17tuCHvBN6xdSQtcuhgci41JVZxeZOhfcjPTSs0rjt/Ytt8+3uQjnt6Z7OLVNEfd
         GeK7ZK2Odg3YFL6W1NyPOUL+qZkW1xij25K5paDQxugjl0lactIlthmhMG0rOkKD0TUS
         0WItHs7p432Txtf61k+H9x6JHol8B1s2Z+XkPEU+0MK7Pzyz/8Ts9WyrgR8/X8MAx6PV
         m5gIE2A3uZPIRhz9un0uJ2IweJBHLDSXzpRI5CQ0JaNo25NZz4wGk8KcKhJKEfhJxolf
         C9Lg==
X-Gm-Message-State: AOJu0YydzrIkbmGep5T7ta9bxIddH4pSBKyf0AIj1Lxmtyxb7L32rnC+
	luTgl22M3gnJYR/L0jCbCDrKwZMsxYLrldwUFKi1WJhU4TWZnl6V2z9ginGSBzUYkmj3l5JNFoD
	X
X-Google-Smtp-Source: AGHT+IH2G6k/AHfjZOYMJfLOczoaqTcbneOnuIqfiRXWvpoE6m9cZqiWEMYIqgThHcwZBhBQFtmK7A==
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id 2adb3069b0e04-53546b052fdmr9993517e87.15.1725368600648;
        Tue, 03 Sep 2024 06:03:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/7] x86/time: improvements to wallclock logic
Date: Tue,  3 Sep 2024 15:02:56 +0200
Message-ID: <20240903130303.71334-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an attempt to change the default wallclock
preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.
First 3 patches should be non-functional changes, mostly chopping the
current logic into smaller functions so that in patch 4 the probing vs
runtime wallclock logic can be split.

Patch 5 changes the preference to use CMOS RTC even when booted from EFI
firmware.

Finally patches 6 introduces a new command line option to bypass the
probing an allow specifying which wallclock source to use on the command
line.  Patch 7 enables CMOS RTC probing by default.

Thanks, Roger.

Roger Pau Monne (7):
  x86/time: introduce helper to fetch Xen wallclock when running as a
    guest
  x86/time: move CMOS edge detection into read helper
  x86/time: split CMOS read and probe logic into function
  x86/time: introduce probing logic for the wallclock
  x86/time: prefer CMOS over EFI_GET_TIME
  x86/time: introduce command line option to select wallclock
  x86/time: probe the CMOS RTC by default

 docs/misc/xen-command-line.pandoc |  28 +++-
 xen/arch/x86/time.c               | 238 +++++++++++++++++++++++-------
 2 files changed, 208 insertions(+), 58 deletions(-)

-- 
2.46.0


