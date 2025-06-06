Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33BBAD002E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008359.1387643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3C-0005To-9n; Fri, 06 Jun 2025 10:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008359.1387643; Fri, 06 Jun 2025 10:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3C-0005S5-6s; Fri, 06 Jun 2025 10:11:50 +0000
Received: by outflank-mailman (input) for mailman id 1008359;
 Fri, 06 Jun 2025 10:11:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNU3A-0005Rm-Ho
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:11:48 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a744b4c1-42be-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 12:11:46 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5534edc646dso2113755e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 03:11:46 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677389d5sm143592e87.259.2025.06.06.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 03:11:45 -0700 (PDT)
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
X-Inumbo-ID: a744b4c1-42be-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204706; x=1749809506; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/d5gb5VGmAwDho9Wku4Y6/OMgxq0De4Fzf9ZgJsnJk=;
        b=V8rH0zTFZyCf5vv1tTjLDsRdJ/5cF+JVpBuZvlkC0Rn4gLee3e7+gqGtEDpFzwHVUS
         6AmQ7TLeVkb9PhHND5NXtizVAIirKiAcw2PnH0mKJgPI8au5g2G8w2qbwZ/1SMI1GrKb
         Va3rc+aTEbjy1pniKg8NgLv6BDD8A1AHn7184oc1gXYdUPBijt+ponDaU/ocTQ/KLtE2
         OtfkvULnGGzRR8eo49CTO2DSswe7Kdugv+5fjGkj12K8j+OjPgj+8o86HyQCPdv3A029
         62gnhaWFUVJH8iqyRfr0aQeWF7t/nvpzt/c4U2RmDW0SaSaHEc5JvxsVxIDtw/6Xuuzq
         prTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204706; x=1749809506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/d5gb5VGmAwDho9Wku4Y6/OMgxq0De4Fzf9ZgJsnJk=;
        b=uPKG6+Hy/3e4Nlq0tfm0oee1uq75nKXtbESnPGOXME1R2uTDb/txS46GEDYblyJ/Kp
         mV1PvLNTkkYTTJOSovWhl7xx+DgXofTUyDGIg2HNRvlzNEeE+tCkTjypQb9if/VrBEDL
         xngq8gJwSId/kgWNRc3mHw3VDnTGoFn2MpqcMdcBEOeYLKIKRti1GXy/t/7ClDz4dcaC
         J9F1iEmZBqX5jC70zr0lU/KYGLM1bEfZYoy34wf7uuc/4f0SPHxxfwSzbDaFnQoqoY/q
         XRZ77sO1yfyhhuuUs7/mYkedh+P+Xhzvc30KhOWktMfqpQn3LBnYwl4K7zw+SOryj/J5
         ul8A==
X-Gm-Message-State: AOJu0YzF9ofkiONBCwLFjRxPwI2OgFuy6BgLX0qV9tqqvJtHa1eijnZz
	goobqiwRzl3Ma5Ea+uLUUaGdNfGYORP7rCccN0B+KofasakVuXxgm4TLxTVDLKRl
X-Gm-Gg: ASbGncv8FZOvKWzR8BYiyehSITngKfp6n2S7wB3tuY+g9MwsR0oBCkYjxcEHHWmR0dJ
	BwEaWo602W4GwagWvqiPJSzR1I2Yq4cPASX5khQFTP2xI5scN0/iGxX7NSNRs1l6oAlpTfB7Y2D
	uGjYL9r/U6tE2nEgKl0/YShn77V9OtO97bnVIW2tmlCEehYkwu3COpgDGO4Uqpjy6ye37pSPPQQ
	CrrsBcBKidcwx9Tav36IJDWbSQE+/0sqB/CBXKRBRtXeftHQMkokweIuJFZHUmBruERoSZThKLW
	wHfGqrnj3A/2jZOwJxfAIyAKsIor7rIkSdu6zoqZvhWMEb7ILIp3Ua+cAx9+9qsDEDgRENJif37
	bVACPEclBa+ecNlHQIE5meRTy8oLd93teR+yb
X-Google-Smtp-Source: AGHT+IH99V9BjKSR+AsHPLn+5vRM1Boboc/C8z0N2fXx8O+FRBuz18cAvL4urRI1t9gUSkeCHNtbLQ==
X-Received: by 2002:a05:6512:3a94:b0:553:2f47:ed21 with SMTP id 2adb3069b0e04-55366c0e640mr693268e87.41.1749204705504;
        Fri, 06 Jun 2025 03:11:45 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add CONFIG_SYSTEM_SUSPEND and SCIF UART suspend/resume handlers
Date: Fri,  6 Jun 2025 13:11:40 +0300
Message-ID: <cover.1749204282.git.mykola_kvach@epam.com>
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

Changes introduced in v3:
- select HAS_SYSTEM_SUSPEND from SYSTEM_SUSPEND_ALWAYS_ON
- drop selecting HAS_SYSTEM_SUSPEND from X86
- simplify default setting in SYSTEM_SUSPEND
- hide prompt of SYSTEM_SUSPEND when SYSTEM_SUSPEND_ALWAYS_ON is enabled
- move HAS_SYSTEM_SUSPEND alongside other HAS_* configs

Best regards,
Mykola Kvach

Mykyta Poturai (1):
  xen: Introduce system suspend config option

Volodymyr Babchuk (1):
  xen/char: implement suspend/resume calls for SCIF driver

 xen/arch/x86/Kconfig         |  1 +
 xen/common/Kconfig           | 18 ++++++++++++++++
 xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.48.1


