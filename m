Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453DC89FDB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172611.1497708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTZ-0005oM-KB; Wed, 26 Nov 2025 13:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172611.1497708; Wed, 26 Nov 2025 13:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTZ-0005lh-H0; Wed, 26 Nov 2025 13:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1172611;
 Wed, 26 Nov 2025 13:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOFTY-0005lR-8r
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:22:28 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3990e48-caca-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:22:27 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso7362175e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:22:26 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052b3f5fsm42042275e9.4.2025.11.26.05.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:25 -0800 (PST)
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
X-Inumbo-ID: f3990e48-caca-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764163346; x=1764768146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UlMOKOoI7HTtph0FHg00RkwXgWbRILHYTI/VZE7vQ8Y=;
        b=A0fbV4wRSGkHR1TOkRSHc8Xi+5S/Vr1+5ibNflMykxedXL2InYnedsbxLHHCZrtu3+
         SModgx6RuCoq5bBOJS0X7NwZ03E8GdCnwLGwdZnwod5mXAARHSxTuZA8unz5Ss+/mvrd
         kAmwpOIZ9PNpSTim3wfA5KfNH3xTSGIaVXRF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163346; x=1764768146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlMOKOoI7HTtph0FHg00RkwXgWbRILHYTI/VZE7vQ8Y=;
        b=jppbzesMgnHGamh1qS5KPIh3x15Fcv7XUQVcMZZwoRC+uJMDkW6ds0QwFF6Fsq4I0C
         fby8POyAsM4ik8Be3rMc5ICNRI9W/8k/R12w0s0ST08tONtNke9asFssaKfIb5fjySWS
         M2DtM5u640JQh6HhMJEqvibrrJ3R6fUknnL4sV6/xjBBKQU6webca2OsOPjgbiXJzpuo
         TaYfuo9WrmW0ucSycgwICAKO/IIEGpAskjr0ASt8iMxrzsWWnfxqo/yGSVd70AQUv2cI
         Rx9q+ONaplyWr7QBixAXKdKPB7KscPLvJOQvlCgnbvD8sRmk0dISbUD4DxDUDk8Xksch
         RAXA==
X-Gm-Message-State: AOJu0Ywh4On6Z7UNAuUymV/Hm7m6nN7cCRFLvDdk6q4vA025DiHJ78BO
	uqgj5PcQDZH3Xxcb2WRFA5xQgsA+TjPT3k6nd+kTzoohlbY6/Guap3iS1E3TycLGem7Q4L/QIF4
	BMzet
X-Gm-Gg: ASbGncvXLpxLaLbJp3kYvrzqqJXdmfyliKMabmQJYv86hBUxwv4DxQyRMyGhfJ9Y0k6
	096W3OkjVk4110Fac4Yu3A+CSB3PagMDRrxYYW6weNSZqiXnmHzCnz2ixqpZ5LBj4OVx3ZOj1bG
	W7v3ALIdsoSvOZd8gu/iVlPe2eEP2TmVPLaVpQGTjKISoWdbInJU2998C8+VRZ/G070xpjQEKLE
	UDXw+/aRGGCBUSc6cEyBn9E3g70W3Wkhip+KihcQ0PiCZlP5xprz+990VegW+O9sVVEc+h/JH7T
	Mc3GSK/BFxrPNFRQ6acrp6fDaY5oSufxQruSk8CTf0/+tYJB7G9fGcvXrCrUAeYT9cX1Rmr7CTb
	R4dsCTkjGOx0YuslODe/UIbxv1xJBLNncDtWCKplMxHm1E0LLK8vo+hd3oVNUADqib+xc9xO4ST
	Z4/mSmAianlnNkO4g59w3psg08hRfk45BbC1VeoIe7IUyUL3gZ83StWjFk0QhF3Q==
X-Google-Smtp-Source: AGHT+IEuLOQC9gESN6AdWFyTsFgWT9WVNN5GCEX9WNCVy21ILyDcagBODSkKlx6G5gZluWkJnnUdPg==
X-Received: by 2002:a05:600c:4685:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-477c052f04bmr207457315e9.13.1764163345928;
        Wed, 26 Nov 2025 05:22:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/amd: Fix DE_CFG races and CPUID rescan issues
Date: Wed, 26 Nov 2025 13:22:17 +0000
Message-Id: <20251126132220.881028-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is sufficient to fix the CPUID recan issues found by XenServer's testing,
and a DE_CFG bug I found along the way.

There are other CPUID rescan issues which will take further work to fix.

Andrew Cooper (3):
  x86/amd: Use setup_force_cpu_cap() for BTC_NO
  x86/amd: Stop updating the Zenbleed mitigation dynamically
  x86/amd: Fix race editing DE_CFG

 xen/arch/x86/cpu/amd.c               | 232 +++++++++++++--------------
 xen/arch/x86/cpu/cpu.h               |   3 +-
 xen/arch/x86/cpu/hygon.c             |   6 +-
 xen/arch/x86/cpu/microcode/amd.c     |   2 -
 xen/arch/x86/include/asm/processor.h |   2 -
 5 files changed, 121 insertions(+), 124 deletions(-)


base-commit: 08c787f66cced18f0d0afafd86a040341adbd031
-- 
2.39.5


