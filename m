Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7E895273
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 14:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700110.1092721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuN-0005Ur-DB; Tue, 02 Apr 2024 12:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700110.1092721; Tue, 02 Apr 2024 12:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuN-0005Se-8M; Tue, 02 Apr 2024 12:06:31 +0000
Received: by outflank-mailman (input) for mailman id 700110;
 Tue, 02 Apr 2024 12:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzup=LH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rrcuL-0005SQ-5G
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 12:06:29 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e61ace3-f0e9-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 14:06:26 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso561152466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 05:06:26 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.27])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170906774a00b00a4e472a8e54sm4303773ejn.48.2024.04.02.05.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 05:06:24 -0700 (PDT)
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
X-Inumbo-ID: 6e61ace3-f0e9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712059585; x=1712664385; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6fR0wNZtEGUemGL6SwR1BoZnu5IuAgT114Vfd4Nmsc=;
        b=XwaL/A+UOaPKpVPW+HXqZL+qGIut/Je9+Qsa8g3hTKEAtk23WI7afXXo4C3TW2e4Kl
         21uamhkaEX0IkONmotWXnsDscgaeJwqB4YkM+Z6iMQdTStEZ7j5mKxQW+82BTUEvaYvb
         +ZkACgt/5hLX0mSbI3olsOnZKf1THbeY9cTmliZcADo/gDoE5ba/14B//eRQ/RnRpKYP
         dA3ljjDVWukVThD3vYoeEnl1tIsiSwcyqZ6BR5GdmctrtY+L5muMA4w/kdylfHyj5095
         qAiV3QAMNox1oPv4L8ZMWNscS72GteJCcAgN6iHzj7ul2CGBpNakWt+umDdKSI5owmms
         tS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059585; x=1712664385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6fR0wNZtEGUemGL6SwR1BoZnu5IuAgT114Vfd4Nmsc=;
        b=OwSl7weGYMeMTRbxOBhNGeOk/xBCgBswbwonAftwZvV5X1yAt6YITDy3OuIl4U/Ehn
         xVkB7P7jcP1C9kUsjInjBFqX1lER/QyhwEI1THkAhndUvGx3ALEZjaKWNc9OASOAH/2N
         dDnaFQezxts6nE7ER4Mfz/SsIkj4SpQxBBuxtPR4uw3pGEC+tRghlfU/TQXyNkaokdcy
         bS7Ove1a9G8v7qFdLI2366VB7SSYxDkE9WV5ZBWxnpqyQ3gIMnDUoKv/8yoz2UzazJ4q
         m/OtgUJ0iolWWkmcjlBjgkS/XPdbUijmgUIdhPz3iWMKJJxrOb06S6//E5qtpqy88fjX
         CwQQ==
X-Gm-Message-State: AOJu0Yz1zEr4X6vXHO/r7oPt1t2u52A7XKq6z25wM04L8VgfiHDzDbkb
	/bvaQnHv56AIxdc/C4jz5r2wXovmRMdjEFGBjlpu1mIf3vNVsJOEeNP9HWMP
X-Google-Smtp-Source: AGHT+IETsxWyfJbGLSCKaBXlQefgDpz38esnVkYQlGbFn8eYsUmWrjtie7lAZNNOP8CkJudHo/XMAQ==
X-Received: by 2002:a17:906:1c08:b0:a4e:dd7:4e24 with SMTP id k8-20020a1709061c0800b00a4e0dd74e24mr6126277ejg.23.1712059585244;
        Tue, 02 Apr 2024 05:06:25 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/2] Add UART support for i.MX 8M Mini EVKB
Date: Tue,  2 Apr 2024 15:05:55 +0300
Message-Id: <20240402120557.1822253-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

This small series contains early printk and full UART support
for i.MX 8M Mini EVKB [1].

Tested on i.MX 8M Mini only to which I had an access, but from my
understanding, this UART support should be suitable for other i.MX8M* SoCs
(those UART device tree nodes contain "fsl,imx6q-uart" compatible string).

[1] https://www.nxp.com/document/guide/getting-started-with-the-i-mx-8m-mini-evkb:GS-iMX-8M-Mini-EVK

Oleksandr Tyshchenko (2):
  xen/arm: Add i.MX UART early printk support
  xen/arm: Add i.MX UART driver

 MAINTAINERS                           |   1 +
 xen/arch/arm/Kconfig.debug            |  14 ++
 xen/arch/arm/arm64/debug-imx-uart.inc |  38 ++++
 xen/arch/arm/include/asm/imx-uart.h   |  76 +++++++
 xen/drivers/char/Kconfig              |   7 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-uart.c           | 299 ++++++++++++++++++++++++++
 7 files changed, 436 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/drivers/char/imx-uart.c

-- 
2.34.1


