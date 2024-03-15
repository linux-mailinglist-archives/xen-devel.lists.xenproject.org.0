Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4187D31D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 18:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693975.1082657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjK-0002v5-L9; Fri, 15 Mar 2024 17:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693975.1082657; Fri, 15 Mar 2024 17:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjK-0002si-Hw; Fri, 15 Mar 2024 17:52:30 +0000
Received: by outflank-mailman (input) for mailman id 693975;
 Fri, 15 Mar 2024 17:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+CdM=KV=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rlBjJ-0002sX-H5
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 17:52:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca03e395-e2f4-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 18:52:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-413feaf0625so8445865e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 10:52:28 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0033e9f6997c7sm3631448wrw.66.2024.03.15.10.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 10:52:27 -0700 (PDT)
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
X-Inumbo-ID: ca03e395-e2f4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710525147; x=1711129947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4EgK/nbAcJVQaX7mMXVqp7DYcV82QrYjBG/VZPrZqc=;
        b=AZOxzMd8JQSACyKPxp1dKqJ1tNF7IdV/AeKnGdA3X0dkCE/mI4Wwch8mMuXAurkhPd
         G1hdh37P7IbqxLUcX1p0PZSuiIaSE7/lI1ZNbl75uRx65x3o/w+NNCk2XI0l0UCJSWoT
         SoLasmCec487ywFhKFhcNVyuQ6bpweYLSMqa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525147; x=1711129947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4EgK/nbAcJVQaX7mMXVqp7DYcV82QrYjBG/VZPrZqc=;
        b=EtzttwI2GVsHS8Zl3AamWaKH72tCRMVZmCFPRb2r6YTHWMbmZJOpBJltrX94fBpsvF
         luVOXdHNfSnG4Sk9JOC2k4O11Sswl1t0KymH6OidlRgcrqCWZ8uMLGKguqxLPTA1ec4d
         v8cqZcIcwGGDYdvWg37GgAg1Gww4pPId1icDMJfEDTCNDNmvQGZvdClGYfobHoP4iXpt
         V2hygyHaiAsw/qLXfW36ogtaNaB3jdExoGKTboWP9l1hZoKCFfYveIK6O2UZW7k5YlJT
         y1+vreCYp/slMo1Ou54N7+3iv/dsNfJ4V2FkMvdJSCjhl3LktSP4jnG2zw87M3lYQYvv
         v8xg==
X-Gm-Message-State: AOJu0YwWFrrbhXt6Rq1mTi8+B2jrOj5CGdaMHZlfh9YWilDiJ5744oAh
	3n6dDpY1gs0p4ee/H5VlDAbVsYu6ymARIqLZaHwcAnSCLwNxwBNdzUweDJdCSmCCqKKyp2gSdkL
	jMJ4=
X-Google-Smtp-Source: AGHT+IFjB2r6zpqvqMDCGFxLfaADnfywP2I8IzQTV4qnUzaQgVGIH7OrKKL8mGWjs5+pbybakBX17g==
X-Received: by 2002:adf:f192:0:b0:33e:7333:d459 with SMTP id h18-20020adff192000000b0033e7333d459mr2530612wro.49.1710525147351;
        Fri, 15 Mar 2024 10:52:27 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/2] Enable Bus Lock Detect as rate limiter
Date: Fri, 15 Mar 2024 17:52:22 +0000
Message-Id: <cover.1710524011.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bus Lock Detect can be used to reduce the effects of DoS in case it
happens.

This patch series enables BLD from MSR_DEBUGCTL if available, and
refines a mechanism to restore MSR_DEBUGCTL upon VMExit to support BLD
as well as LBR.

Said mechanism is also refactored to have a name that reflects generally
restoring the MSR, instead of only one field.

Matthew Barnes (2):
  x86: Enable BLD and handle #DB traps
  x86: Refactor LBR feature into general MSR_DEBUGCTL feature

 xen/arch/x86/cpu/common.c              |  5 +++++
 xen/arch/x86/hvm/vmx/entry.S           |  6 +++---
 xen/arch/x86/include/asm/cpufeature.h  |  2 +-
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/include/asm/debugreg.h    |  1 +
 xen/arch/x86/include/asm/msr-index.h   |  1 +
 xen/arch/x86/include/asm/msr.h         |  2 ++
 xen/arch/x86/msr.c                     |  2 ++
 xen/arch/x86/traps.c                   | 16 +++++++++++-----
 9 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.34.1


