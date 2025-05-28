Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D253DAC63AA
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 10:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998970.1379636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnW-00032F-4h; Wed, 28 May 2025 08:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998970.1379636; Wed, 28 May 2025 08:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnW-0002zM-0Y; Wed, 28 May 2025 08:06:02 +0000
Received: by outflank-mailman (input) for mailman id 998970;
 Wed, 28 May 2025 08:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ct5H=YM=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKBnU-0002zC-Pd
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 08:06:00 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96e112f0-3b9a-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 10:05:59 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3106217268dso38454721fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 01:05:59 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79f5478asm1437671fa.78.2025.05.28.01.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 01:05:57 -0700 (PDT)
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
X-Inumbo-ID: 96e112f0-3b9a-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748419558; x=1749024358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf1pYaaf9NAukq3r1Eh0Q6+adfJo6MUqgAu5HCoZAxo=;
        b=DSDBGFXlyTgEPMTwQa0/Yh0mniz5hSp4bhZY5GgNWvQvOgT/IzNU2tjetxQjgEez3c
         lqx9dF8JHlyGajpR6rLxddARhfI+ZjWjpykVr4uHET++pXVjKJMDSYnlVjeWyqN04F3r
         gFjc7HZIwCtLqeZ7HXujKH9/GpjniwM2y4XO6do5ufmoCYvBE89Z1cNVpsEjhOGkLYg0
         ahmntJ8T3GLZcWb5wlDpfMKvgQEubkPAZxWHCyKsVktEjyT/vQzWQfHFccomB6Hj9YID
         PBZUQ5AQ4zjVXQ6LB3AG8txk48vxipYf/TGTjCfuzJWHJUZKRE9G+nQc2jFdr9zsobTj
         jTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419558; x=1749024358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pf1pYaaf9NAukq3r1Eh0Q6+adfJo6MUqgAu5HCoZAxo=;
        b=MMEcx9mx4qK96GaAPm2fp4f8y4LWCcj+v/6fifrU180bCLGcovASIep1JGReXoEIR8
         7IFkI0SAKcc3zHcA6ltknjRroapZlDVzF/gkjUzmmNC//diZtX8JyGqmUncwbrp12caK
         TRg7xnYfETBSdZPWQghBCtdIZvbBWMpOJKhXrp1+bEtdk+PAKH4/wD1tfJGbreS7Ggqn
         7BdBET6oq+vnTZdLZszQeCqxYEkzdtL55R44flRf6QfG0LunPtmA8psUM+/0B2sOAjSo
         OBDunyO55giyTjc7jpbM9spopcu0lYgNkj2cYvaCD9Nvoy6FHOih7pvAwvAswXxY3pyP
         PV7w==
X-Gm-Message-State: AOJu0YwqENYz2SGKW8/UKzb6i0Q8El6tJ/OLS/z74JkTzcbT/tWQ/It6
	slGPW5p62jlBGDnXFc8fTaBPi7HQY150mj7jg9w7o1WBCppBzY7YzayIik/h4Q==
X-Gm-Gg: ASbGncv4zuulgvD81XLOzsfYUvHta0bbxl233c704DrEpbra7BuIRPFotiD9tfRtMQW
	A7H0oKflUWtlSDREBcZCauuh9F2owbZizsiiZ0ld+1Pe+5VzPQMnV8ngX7IGuuVsBed/mVTQfrP
	vR3QZQgxSybZc10eGvVMXoonjLS+kJ5N8Aahh3rLZhHZFG4uAkN/B6QUyv+LySd3u8FO4lGYWD3
	IyCsPyGYQyvcVTjiMM8uFyTZWniHbY9Q83KKHp9QMUnkSvxwOreVJYmNzgXXRXU69rllACMWLEG
	SUgyvLabwCNPMmcEL9AITTgwbqOJc3z6jXlM3P3ggaMkKLUVt8qEfv4mlOsjNNrEeAWzk13Pzlz
	RpmPBSDCn3ja9/MY6qvPJN45K/w76qVJqHmYn
X-Google-Smtp-Source: AGHT+IEJC6MZ/9R31TiqlrRoh+pl7vlJu08vXFaha9FalWLofKJTuuF37SHQM4ZbAPScCvROp4CgRA==
X-Received: by 2002:a05:651c:2207:b0:32a:7e4c:e915 with SMTP id 38308e7fff4ca-32a7e4ceb14mr1190761fa.29.1748419558020;
        Wed, 28 May 2025 01:05:58 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] Add CONFIG_SYSTEM_SUSPEND and SCIF UART suspend/resume handlers
Date: Wed, 28 May 2025 11:05:17 +0300
Message-ID: <cover.1748381788.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Hi all,

This patch series introduces CONFIG_SYSTEM_SUSPEND to Xen and implements
suspend/resume handlers for the SCIF UART driver. These changes address
feedback and discussions on the Xen-devel mailing list:

    https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00169.html
    https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg02188.html

I am marking this series as v2, as it is a logical continuation of the
discussion linked above regarding the SCIF driver changes.

Patch 1:
  Introduces the CONFIG_SYSTEM_SUSPEND infrastructure, which enables Xen to
support suspend-to-RAM functionality. It adds three new Kconfig options:
    - HAS_SYSTEM_SUSPEND: Indicates whether the architecture supports suspend.
    - SYSTEM_SUSPEND_ALWAYS_ON: Forces suspend support on platforms that
      require it (e.g., x86).
    - SYSTEM_SUSPEND: The user-facing option to enable suspend support,
      enabled by default when SYSTEM_SUSPEND_ALWAYS_ON is set.
      
  This approach is intended to be easily extendable to other architectures in
the future.

Patch 2:
  Implements suspend/resume callbacks for the SCIF UART driver. These functions
ensure proper shutdown and reinitialization of the UART hardware across
suspend/resume cycles. Their inclusion is gated by the CONFIG_SYSTEM_SUSPEND
option.
  The SCIF suspend/resume functionality has been tested on the Renesas R-Car H3
Starter Kit board.
  Compared to v1, the main change in this version is the addition of a
CONFIG_SYSTEM_SUSPEND check around the SCIF driver's suspend/resume logic.

Best regards,
Mykola Kvach


Mykola Kvach (1):
  xen: Introduce system suspend config option

Volodymyr Babchuk (1):
  xen/char: implement suspend/resume calls for SCIF driver

 xen/arch/x86/Kconfig         |  2 ++
 xen/common/Kconfig           | 17 +++++++++++++++
 xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.48.1


