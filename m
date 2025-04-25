Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0631A9C76A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967687.1357425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAN-0001F7-Rv; Fri, 25 Apr 2025 11:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967687.1357425; Fri, 25 Apr 2025 11:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HAN-0001DI-Mu; Fri, 25 Apr 2025 11:24:23 +0000
Received: by outflank-mailman (input) for mailman id 967687;
 Fri, 25 Apr 2025 11:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8HAM-0001AX-39
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:24:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4cce376-21c7-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:24:20 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so15048715e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:24:20 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a531072csm21743005e9.18.2025.04.25.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:24:18 -0700 (PDT)
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
X-Inumbo-ID: d4cce376-21c7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745580259; x=1746185059; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiFJDGmQn+KQNTJ2JzPNQ5Hnz+qZ6HXT6jjVBS38GNk=;
        b=rYvfmEbSyKlmh0qFt3C9utLc2MTbSsVYsxJQZMzLD/bYWAf1YohDcL4Q36ImXNUGMa
         GUhztUlSfw+onjKyjoHskjUR5knSCoB5MlxSk6b1/Nziq1OXBQX5WFISWU56diOyDXB2
         odl2xmvfFBBcHkOjuDb/JsltH05hljW2K1WT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580259; x=1746185059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiFJDGmQn+KQNTJ2JzPNQ5Hnz+qZ6HXT6jjVBS38GNk=;
        b=UcMSxYajoc8W77InW5mocWmsTgcEW1KYmoqfEuKGonb/hcKDBgxb1b5wCDYa/NNkiW
         zD8h6zWxL5xVzXn/QymQTSvhiF0WIfzF5GAJ01SkvH7LGPuLAqMJua7iAvTbHD3IKjoB
         mMHynT1dxc78UsXKAomqnhJpUBgNUf2qopJcrzOySHgiYuhaGng2DxZZ6klbzOkVD6EN
         HmsBbTRcLSRtnI4fMk7qwWSainEbC5euA2QLatPph60i+F7y589HzgmMok1MC1utkS7W
         Rqz5qqsSKdV6xNoLoWeYM4MTk2tG3D3gUcKk3bqP0LCKtBg1RV3cuuyZgOk/ShtQOkNr
         SMjA==
X-Gm-Message-State: AOJu0Yxj+U81RAfgCnB0fqR+sUO2KJ7dEb0CMIUBTLRnhP02MHiTxfI3
	Ne4yckixKOIERSkxeNgWLa0haEgFQ19iZplpci7eaKtulwGj4h3noPYQ9PTlJC7jkG4kUGwUNwo
	f
X-Gm-Gg: ASbGncuoJLlrXsy+18CqfLGPgu7Ca/1oq7XxPqWj+NI1KDRGF99vepki+9rRpiN5vFq
	MwDvMalFooGzSXwoYhVIOCyIwmirNXrQg6Ciio6zOFF0HeaPRRYKHldlinfl/ZigI8DJ9O5SwEv
	cHXPt1x18Lo8BVVu2nBwz4JCNSM/xQdSj7a/4J+J4sIauBB5KGIJoEMspBFuE8yc6tSFO/G6oLz
	/WZuhVR5CwsTtzyHfcDXaWZl7TPV5YidkuJC5jbbub0jB8Dypvc+8Zk0vumCbKNQR9m4pjFGZSI
	87dlkj1f5oaz52FfDlfRSZyltsAHkZHtNhO4VEQJ8GkkCVzgzq0k01Z1i3J7un8L8iz3VgSgtMd
	O8DFac6+c5lECBQ==
X-Google-Smtp-Source: AGHT+IEzI4yvi2ZlxZKf3Lt/U46wM/oxeiZTMcJO8ab9we6uVs6D8qHzxmqn65nQbEbGkQeCDQxOVA==
X-Received: by 2002:a05:600c:1c0a:b0:440:68db:a045 with SMTP id 5b1f17b1804b1-440a66abaffmr14477275e9.26.1745580259369;
        Fri, 25 Apr 2025 04:24:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 0/3] xen/mm: Introduce pte_attr_t
Date: Fri, 25 Apr 2025 12:24:12 +0100
Message-Id: <20250425112415.245585-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is in order to support PPC needing wider flags, but I've also written it
as a showcase of the new __has_include().

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1786141700

Andrew Cooper (1):
  xen/mm: Introduce mm-types.h

Shawn Anastasio (2):
  xen/mm: Switch some APIs over to pte_attr_t
  ppc/mm: Introduce mm-types.h

 xen/arch/arm/mmu/pt.c               |  4 ++--
 xen/arch/ppc/include/asm/mm-types.h |  7 +++++++
 xen/arch/ppc/mm-radix.c             |  2 +-
 xen/arch/riscv/pt.c                 |  2 +-
 xen/arch/x86/mm.c                   |  6 +++---
 xen/common/efi/boot.c               |  4 ++--
 xen/common/vmap.c                   |  2 +-
 xen/include/xen/mm-types.h          | 19 +++++++++++++++++++
 xen/include/xen/mm.h                |  7 ++++---
 xen/include/xen/vmap.h              |  3 ++-
 10 files changed, 42 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/mm-types.h
 create mode 100644 xen/include/xen/mm-types.h


base-commit: 6dc1b711ded0e477c501d4017ccb0da83d6d56a1
-- 
2.39.5


