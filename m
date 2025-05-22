Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F60AC0F34
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994166.1377207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PE-0003sC-Ds; Thu, 22 May 2025 15:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994166.1377207; Thu, 22 May 2025 15:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PE-0003qt-A6; Thu, 22 May 2025 15:00:24 +0000
Received: by outflank-mailman (input) for mailman id 994166;
 Thu, 22 May 2025 15:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI7PC-0003qi-Da
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:00:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b04efd6-371d-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:00:20 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso12271921a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:00:20 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32a7fsm10550119a12.56.2025.05.22.08.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 08:00:18 -0700 (PDT)
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
X-Inumbo-ID: 7b04efd6-371d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747926020; x=1748530820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Qeom5nlma+YCwLHQnK5pcO1J4EMkRMoGec4Oh/qEI=;
        b=IDtsAq7DsVKMiDfSk20EItQ/1FTyQB/ff4/xU9kyS1yYDaUWdMw1vRL5cQOiPCZQYF
         Bwy9LRFyGZ7zuZ2AF7uArQ9eEk9P8hIZwfh8jVqmiLtYh161VR3p3axyOajbc1FyJn0N
         g8iQmchIwm06UIMsaBbhBmjbe5LvG5hZ3mNWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926020; x=1748530820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0Qeom5nlma+YCwLHQnK5pcO1J4EMkRMoGec4Oh/qEI=;
        b=XndDymleJNtS8zerp12+hXVBRu5XcZTB00zlV84SBQClKAqqEzjPmqOydlVoSAQeVJ
         Cuuum4dweTTpDv9CIk105fsJXQY0tXLgY6VgKDEG8XewDSHATB5+6H6xf3//4tHgRUU+
         Y7I2TXpW4k+dSvcwfAFRr8JmEdv26Y9iFx96Yjm2LRYgSfQ8Xh6mChu6koESYvKqWJFe
         fk5fa5KHOWaEbfIgf1zF0J2pabx/ed3bvwM2RFDfMqCEh2mRM71Ml93MtJq0OdhwBJ9X
         Z8YcX1lXR00UcWtz7UVjaso/LGXQgr7Lntjh56OnOOaVM+07qiMCLKlakdsLpMbPSEHV
         X9jg==
X-Gm-Message-State: AOJu0Yz1bUMP5y9QPrBNASs94oJybK1UclH90rhpGY17XGHDSA6XsSDx
	MFMtMXKEDSaGMbUcP/sHT+eCqAhnBDy3hBP3SLBGsnnWSEm5Z8mHIAJb62mmmRVVjt90lRDJLCQ
	KtUhm
X-Gm-Gg: ASbGncsbU85DiMR2vnbSNLaAw4gqzoukgCDTc42+1gB6sL7pKlx3meUt3hup2fiRGi2
	Ach93BHQwvXr3xriRVXQwvfvFoQnYQp2lBi1bGpZK9gqA3zSlngbyZN8UT+hU1QA4S6W9Roz4Hx
	2r7AhvFn3dtL3+8K884Vo+RylVi71k473yoXW7i3esMdIdf+BWcKzEqfWNYJGJ0eOVkravDVKdh
	GhNbaYSablkGgcFTBGvXXrg2ZcrS0Xvb9RSLNOoGAD+ZfvDwqyPF3o/ka69ckQuja2yiVQ1RkMs
	LrAik2k8l3KSHNqPqVWe1m9JCcAJIl7WzbPpBhl25/OqMsyxXkVzoNBLhYBZkUpzBsMRdoogV0P
	nctL65TUTfVU45JI06b7ZkevVkUO+KILcA5A=
X-Google-Smtp-Source: AGHT+IHWxTt4kKSid9W4YOdJaCq5uMBKesGFCWk88T29a4kl+xZwY6yK6pjLYH9aum7n2WSAfxNSMQ==
X-Received: by 2002:a05:6402:254a:b0:601:9aeb:3d9 with SMTP id 4fb4d7f45d1cf-6019aeb05f4mr18783040a12.20.1747926019821;
        Thu, 22 May 2025 08:00:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/alt: Simplify nops handling
Date: Thu, 22 May 2025 16:00:12 +0100
Message-Id: <20250522150015.555492-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mostly patch 2, with tidyup either side

Andrew Cooper (3):
  x86/alternatives: Factor out access to ideal_nops[]
  x86/alternatives: Rework get_ideal_nops()
  x86/alternatives: Introduce init_or_livepatch_ro_after_init

 xen/arch/x86/alternative.c  | 51 +++++++++++++++----------------------
 xen/include/xen/livepatch.h |  2 ++
 2 files changed, 23 insertions(+), 30 deletions(-)


base-commit: 1f75bd375d0757d6646ca2029a9559d535f6b511
-- 
2.39.5


