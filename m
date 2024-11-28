Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A59DB062
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 01:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845110.1260600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShC-0007gp-HO; Thu, 28 Nov 2024 00:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845110.1260600; Thu, 28 Nov 2024 00:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShC-0007cT-Cl; Thu, 28 Nov 2024 00:47:50 +0000
Received: by outflank-mailman (input) for mailman id 845110;
 Thu, 28 Nov 2024 00:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGShA-0007X1-BS
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 00:47:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f48d01e-ad22-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 01:47:41 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a68480164so27387666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 16:47:41 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a1asm8705566b.98.2024.11.27.16.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 16:47:39 -0800 (PST)
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
X-Inumbo-ID: 5f48d01e-ad22-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmNDhkMDFlLWFkMjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzU0ODYxLjMwNDYyMSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732754860; x=1733359660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tl88Ga0cjqANUUlz9nA/svkwamhfy/EqhdcjLfE9Lc=;
        b=YyPzJW3hsDzCGUDtR2Iz5xd+z7RAqLS5DqLHKYKRQlEGcBMw/aBF+n9NEAbe2PbS2e
         K0fbkdTUKTMstKHqCOLXJ67ob2wp0arPMIkWQD5gXeD1Z2KSz/X7OEBj22w8T/X7s/NN
         6kCott//nQiSHiQnDhWwSTP3qPQIB93BRj5mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732754860; x=1733359660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tl88Ga0cjqANUUlz9nA/svkwamhfy/EqhdcjLfE9Lc=;
        b=HKwoq0TTfa93BAB55utkou/g9vY731CgOZcPp6UaibHyml93Bjpra7Qze7hTtcNaTB
         vHdF0FC48Qo5QbfbRXSkbwbV/qk4pw9KSNMLXimkqQL+IxK6GLEqo5lh9fPklOwUYh5m
         VKlic1bpOVXfFedlYHy136jh0CfbIxvMoaXin4oe/ziT7LNetXLVuO5DHhHLnkgRuOFM
         7nhEOoS62c4NtW+Sh2IDVmfVGHN4UQd9+JWtvPnekw7I2ccASGY2EkIGkd5RS4V3itsn
         veeTM75i1zcW/JJzFj4nzxCFOXh2FMDkVqMISToV82wMONLcWyuOICsYdKVUfFvtS52C
         YCFw==
X-Gm-Message-State: AOJu0Ywv01dtHImJS2ApYxDBnw5nEZKXnlNqE7HTwwyPnVZ3UqQkyCxW
	w0smDPRST9MkTMmpiBXtvCwWAruP6ZqQCx6Qf28VNm/lRvfG5MBAGo2I2MsxAMzR/a8g63r6tGB
	I
X-Gm-Gg: ASbGnctheAej2QXfAjjz0P+nF5LgzTLDvo4kG2hseXAZhxOsCTmQtqV8RaTgfh1TtIA
	u3dnVckyWjIf/n8ARxuNgRpvM39VAAc4DLS1514p5mHaqqsQnTp1B7PLaT5oESF7tRO2wC1AD90
	gv38b7pwaxHoy5myU/X4UISIjMjL7rGerN29l2lEw+L1en8Uy8KcfJvnQTVkaqtXQUvgEm8Os4h
	VMDZRmfSVFNbvLNk0EE3S3Z4f4i2NDObczGV1rhu4ZhImMcMPn6zM+n63bxeZCoAjDG+WuLoRGr
X-Google-Smtp-Source: AGHT+IHyheEwAfRZb1M6XFQF8iZ6Wdf23hy+Md3kcZuOOX0Ex7vMRPduxFbXjT8LuZ13tAlb/MviQQ==
X-Received: by 2002:a17:906:2192:b0:aa4:fc7c:ea6d with SMTP id a640c23a62f3a-aa580f2c4a3mr384966766b.17.1732754859940;
        Wed, 27 Nov 2024 16:47:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/vlapic: Fixes to APIC_ESR handling
Date: Thu, 28 Nov 2024 00:47:35 +0000
Message-Id: <20241128004737.283521-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found because of yesterday's Pentium errata fun, and trying to
complete/publish the XSA-462 PoC.

Andrew Cooper (2):
  x86/vlapic: Fix handling of writes to APIC_ESR
  x86/vlapic: Drop vlapic->esr_lock

 xen/arch/x86/hvm/vlapic.c              | 27 +++++++++++---------------
 xen/arch/x86/include/asm/hvm/vlapic.h  |  1 -
 xen/include/public/arch-x86/hvm/save.h |  1 +
 3 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.39.5


