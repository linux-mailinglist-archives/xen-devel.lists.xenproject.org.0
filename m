Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B702E39BA82
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136860.253624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQe-00051A-Pn; Fri, 04 Jun 2021 14:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136860.253624; Fri, 04 Jun 2021 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQe-0004yb-MD; Fri, 04 Jun 2021 14:04:04 +0000
Received: by outflank-mailman (input) for mailman id 136860;
 Fri, 04 Jun 2021 14:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAQd-0004yR-1k
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:03 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c0fbb1d-a627-4eba-b3c9-1f4bba25d53d;
 Fri, 04 Jun 2021 14:04:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso4446003wmq.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:02 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:00 -0700 (PDT)
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
X-Inumbo-ID: 7c0fbb1d-a627-4eba-b3c9-1f4bba25d53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDPZN9rXn/2sWgCtIlnaMwucM0ZhhnFzjW38voB8XP0=;
        b=AZ9qPpOgKNZFV/4UmgwQQfpWul55LoMX8bUmhqdDHjMx3cIZPNpJxDzscteLozut+a
         TRECh9nqt+y+e7BEktoprseEdvjebbZeWlErt/36JD9ar5D2LfVnU3b5cY+eZjqMSxOG
         h0zTwomuOWWLGcnTSpiid/qRa4syjH2qZkpehTiUCv5S69acA9VcYR/wrD3zlXBYDZ2F
         uj0cFVBbdzdN/BlhpVzp8NaxNMjCYhruFSR//4y1j0bTd0m+U7y0tdYei2oswMt2M+sZ
         Ymn22uhPCdeCMGV0LDadFKDUiP5rHwjJ2HGNvlX3OhIEtKfVO+BZlK/1WELTC6YjMGcS
         Xq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDPZN9rXn/2sWgCtIlnaMwucM0ZhhnFzjW38voB8XP0=;
        b=oo8aLMcTV8blu+WkXfItxH0Vmd53M0kkz9rmwwtYdd7DMusXJeCoW1xeBA4jRrNJP5
         2gBRt1QJPBkANw+mMgmFdBaE6BwKcqgLSVU3Hq6R8X6MfhHzErdA+Xfkby+ES+BJ88ZS
         1xDlHgOHgWCkfSiFehOdGo0U4w+5jfh5L43gQgnCKPrLvpd8ofzM8JN52u/qcxYIy0qY
         59llaCIN3kcM4hZm1w3iqjFqZole727xJ5tAlaje55CseQRftwRvYvJ5M5KJnq6guwj5
         Ngn2HZR6Bv+UtOSUw7lKNNeq12/Zr9aYreJ6Ye9XwG6G0Sog77jvf/Af9v38DpPBzOhp
         90HA==
X-Gm-Message-State: AOAM532IB/fQwTVdQ9WJI+Sp20+sD1GYkLi6ZKWYBQlOMRuC7+GnyWXq
	5xYF68T55g+/hxM4dV9njhqerg==
X-Google-Smtp-Source: ABdhPJz6XYD0ouvZ2spj1i+HskfJEYeUlvOtKtkkuV4v4hqyWbkwEVFPqErNBxKEqheZXGCDnJTvtQ==
X-Received: by 2002:a1c:2456:: with SMTP id k83mr3867850wmk.87.1622815441364;
        Fri, 04 Jun 2021 07:04:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lorenzo.pieralisi@arm.com,
	sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	linux@roeck-us.net,
	treding@nvidia.com,
	arnd@arndb.de,
	xen-devel@lists.xenproject.org,
	patches@armlinux.org.uk
Subject: [RESEND 0/5] ARM/arm64: arm_pm_restart removal
Date: Fri,  4 Jun 2021 15:03:52 +0100
Message-Id: <20210604140357.2602028-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a rebase/refresh of a set sent out, reviewed,
then forgotten about.  It's still considered useful.

Here is an excerpt from the previous attempt:

 "Hi Russell, ARM SoC maintainers,

 here's the full set of patches that remove arm_pm_restart as discussed
 earlier. There's some background on the series in this thread:

	https://lore.kernel.org/linux-arm-kernel/20170130110512.6943-1-thierry.reding@gmail.com/

 I also have a set of patches that build on top of this and try to add
 something slightly more formal by adding a power/reset framework that
 driver can register with. If we can get this series merged, I'll find
 some time to refresh those patches and send out for review again.

 Thierry"

Guenter Roeck (5):
  ARM: xen: Register with kernel restart handler
  drivers: firmware: psci: Register with kernel restart handler
  ARM: Register with kernel restart handler
  ARM64: Remove arm_pm_restart()
  ARM: Remove arm_pm_restart()

 arch/arm/include/asm/system_misc.h   |  1 -
 arch/arm/kernel/reboot.c             |  6 +-----
 arch/arm/kernel/setup.c              | 20 ++++++++++++++++++--
 arch/arm/xen/enlighten.c             | 12 ++++++++++--
 arch/arm64/include/asm/system_misc.h |  2 --
 arch/arm64/kernel/process.c          |  7 +------
 drivers/firmware/psci/psci.c         | 12 ++++++++++--
 7 files changed, 40 insertions(+), 20 deletions(-)


-- 
2.31.1


