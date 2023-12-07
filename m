Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596E808E26
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 18:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650045.1015288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHmZ-0000Tg-JV; Thu, 07 Dec 2023 17:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650045.1015288; Thu, 07 Dec 2023 17:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHmZ-0000S1-GW; Thu, 07 Dec 2023 17:03:27 +0000
Received: by outflank-mailman (input) for mailman id 650045;
 Thu, 07 Dec 2023 17:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBHmY-0000Rv-G2
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 17:03:26 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884fd8a9-9522-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 18:03:24 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bf26f8988so1187859e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 09:03:24 -0800 (PST)
Received: from fedora.. (public-gprs375370.centertel.pl. [37.47.97.139])
 by smtp.gmail.com with ESMTPSA id
 br4-20020a056512400400b0050c1520f783sm213780lfb.303.2023.12.07.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 09:03:22 -0800 (PST)
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
X-Inumbo-ID: 884fd8a9-9522-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701968603; x=1702573403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYjRg1Gsp/+iKmIGBuuDsDy1z8aRFRzJg36YMCnFrhQ=;
        b=CoavOMQbE2P0f+lDaiYyL+OLi8vt8Paphm2JHo09Qw6VBbGTgEm7Kh08HyXh1FRuuX
         c/FsNZHRW23ra+lsnFH44lBB42uKjvGOtVtfu6Mm1V6WYoy2FGRZfi3bYahcE3eRA/nc
         y9zuCsPH+fuxpps7iJmqOJBcGWJXyH85BBHxkDt/4pfishwnBajh4XLiOJBw9DOThwX9
         KHtDMVIngEV/vrhYw+9+n20oeJqrf7CTj6h0ulTonJ/RHXUUMbcMja/9gXggVCuCtWun
         HrZDJFQ+LlTdYML6rHQKCI/5+oeEvlxZbrnS692OO7wuQoXvj2JeOv7PQYIwIrcyBWNx
         oqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701968603; x=1702573403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYjRg1Gsp/+iKmIGBuuDsDy1z8aRFRzJg36YMCnFrhQ=;
        b=abckpWh+Sigofl2cPgLzQLX1fHe6pJ6VQtkNy5qZlN0L2S9N2s2JUIfHIuk78kGNvM
         0L0kiLRHtA83o3ECKg/QxD346cpX4Xva31BkJDtgSEr17v6nyveLoHNbbkiHSIDoIdpv
         rNUttXUS6h6+R9SOeOgC6OXX3oTf98hAlPT8cSC88PKRSE7a7q1nLfIcSQdXjksCStZ3
         HZurwC2vwwfHEdja0pOUe+Novt//b+WGNpL6GGfjkh1YaXcirPaNa+JIIPEkTCFn5dEo
         UJZZiKRuQzQf7iTbpMRECI1wBSvTiTStLSCDXwS+OOTAVQNK4P9nNj0qLsLEVMOa/yok
         nixg==
X-Gm-Message-State: AOJu0YxvkiGqviaDD6MZfHvKMKO/BZtmbISTwJK2uLPgs2wDA7t57kXb
	LUDUihNLBnb9t+BdIM4CT1tau8mFDLA=
X-Google-Smtp-Source: AGHT+IEIt+CoyC9Lzp3N0m/hOGwoQu73DMTgAl7hBxPdjg8P+3D3YGI5HL6m1RRDAvT5TVSxIAl0dg==
X-Received: by 2002:a05:6512:476:b0:50b:f8da:23f2 with SMTP id x22-20020a056512047600b0050bf8da23f2mr1776307lfd.135.1701968603007;
        Thu, 07 Dec 2023 09:03:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v1 0/1] ARCH_FIXED_CONFIG introduction for randconfig
Date: Thu,  7 Dec 2023 19:03:18 +0200
Message-ID: <cover.1701966261.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brief Overview:
In the earlier patch series [1], it was introduced a comprehensive set of changes
enabling a full Xen build for RISC-V.
This early support primarily provides the minimum stubs required for the RISC-V
Xen build. At this stage of development, many configs are deemed unnecessary and
are expected to be disabled.

Without ARCH_FIXED_CONFIG (or an alternative mechanism), the alternative is
updating CI's build.yaml in multiple instances with the same configs,
mirroring the approach taken in [1] to prevent the inadvertent activation of
unsupported configs.

For example, in scenarios like dom0less, we can exclude grant tables by setting
"CONFIG_GRANT_TABLE=n" in ARCH_FIXED_CONFIG. This eliminates the need for intricate
modifications to Kconfig configurations with conditions like "depends on X86 || ARM"
or the introduction of HAS_* conditions followed by Kconfig updates with
"depends on HAS_*," as illustrated in examples [2] or [3].

It might be useful for other architectures as well, especially for PPC, which is
currently under development.

There are several open questions:
- Does introduction of ARCH_FIXED_CONFIG make sense?
- Should ARCH_FIXED_CONFIG be re-used for *defconfig?

[1] https://lore.kernel.org/xen-devel/b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/d42a34866edc70a12736b5c6976aa1b44b4ebd8a.1701453087.git.oleksii.kurochko@gmail.com/

Oleksii Kurochko (1):
  xen/Makefile: introduce ARCH_FIXED_CONFIG for randconfig

 xen/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


