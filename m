Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E52CB9EA6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185899.1507865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVD-00057H-1s; Fri, 12 Dec 2025 22:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185899.1507865; Fri, 12 Dec 2025 22:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVC-00054E-Tx; Fri, 12 Dec 2025 22:20:42 +0000
Received: by outflank-mailman (input) for mailman id 1185899;
 Fri, 12 Dec 2025 22:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBVB-0004B7-2H
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c81f5f06-d7a8-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 23:20:36 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so27997f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:36 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:34 -0800 (PST)
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
X-Inumbo-ID: c81f5f06-d7a8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578035; x=1766182835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2jJNF67fYLAyfN83jmoeM9RIevMWPKAhBdSFpC71yw=;
        b=pgR+EcEU1qStJe87n/w/E6h26NFxaqHq7JTRmf2Uvrd9Yu9KGtf0fx1vM0BTEKwgnJ
         kbhbx1JqIDX0Cq2wSw8e6ETSpB2EOPTl/NkHFHdMIgGGqwf6+kIwsgxjZpQLvy2fQnT2
         byidWRDoiy58Z/7fmjzlI+qWKwaR5oIZKj4DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578035; x=1766182835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2jJNF67fYLAyfN83jmoeM9RIevMWPKAhBdSFpC71yw=;
        b=MDDZFXnOM6oCyCutLeldTNApXG82kowL+N6/ycwtExOIGDkvHCszTiRca96T5jAfz8
         xJf9cTYAiLZxl+fjowfKoPKn87ZUwEovVBANddzXjgi8XB7se/F9k++8PUxA0FqZHuDy
         qeTiPnNIQWr7fRXUsbYYkJ5m9FS/C1Djp/mptisNmBykmKBNF1Of6utaucfHaiEO3t73
         wynWZ0qEQK8EnW0Y+td53ei6WaxdiSCXKRqIVlxsGWS6+tc+Dg1mYUdZxgYqd1wQtGeC
         4UT/P/IJfj953ive/qGeEQSehLFUmXfm3nMHI/iZW/x1tQGMSQ4nCrBkU8yKL519rguP
         BrbA==
X-Gm-Message-State: AOJu0Yx/p/jFaQ+JhmsHXRF0aip4B6h/U1wy4V4/5zOuoIkx188dJHKP
	xAbLm1XhGodZC9WDNPyG+fS2bEDxKPbVIu0okii4THLKiUhfyDhENYTHGlIhL3hYUTokIlCLt/g
	+KTPH
X-Gm-Gg: AY/fxX6ZQmk1TR35a3ZNMbycmVkre/OARMiIwqy0k289tTM8wewjIU1Yx6O2LOkhXgN
	J04j/1OkUD3ddFanR5riO/jdCJuPEAUI9ESTF97Y8zxJxYYZs7FBRsh9GyKN2LIEpOen9f8l8l2
	+puVTC4HbAQIFymVBpWY7Mk1py8NwZWHaqsf9I0e7LL/tXxPMJLNp8AUAacPS+37tkexQQaeY4v
	neDMvkk7aPiGQqGNQOG9zeP98Oc8kColKXKRytGYC8Q2BrVXbBdiYH6kKQoQnxNlTSwcRHlpqol
	3wAGSbmzy/D1qzmXss89flgiQCNLcld3bi4eGpnsGCh99c5V0+UFTzftfWH+KTctXQQDQrGbZ6j
	FRHQ1ZFu+8xVtD0yCyD9sE7mw3khNiN17nYzr384RgsIuZbzJwCTkK1VSzf6BIzAbYUpl2n+ydd
	EYiEmy5Eg/tSCp3HQHd0cm+w1yKZTtHfDY9Q7SPAXil++1vEyaEmldWSHxwiLqTQ==
X-Google-Smtp-Source: AGHT+IHO5r/jR4Vcpk95h9FsfiDZDba+aLvhZPBUi02jL0KsDN0U1YAhQvWJeaQkVM0/BNpFgfil0Q==
X-Received: by 2002:a05:6000:2c12:b0:42b:3bee:a7ff with SMTP id ffacd0b85a97d-42fb44c1629mr3889464f8f.24.1765578034809;
        Fri, 12 Dec 2025 14:20:34 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 0/5] x86: More misc MISRA fixes
Date: Fri, 12 Dec 2025 22:20:27 +0000
Message-Id: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrew Cooper (5):
  x86/pv: Address MISRA C:2012 Rule 4.1
  x86/pv: Change type of do_update_descriptor()'s desc parameter
  x86: Address MIRSA R8.3 (declaration/definition mismatch) issues
  x86: Address MIRSA R8.4 (declaration visibility) issues
  RFC x86/shadow: Deviate multi.h as being included multiple times

 xen/arch/x86/include/asm/hypercall.h |  4 ++--
 xen/arch/x86/include/asm/pv/mm.h     |  4 ++--
 xen/arch/x86/include/asm/shadow.h    |  2 +-
 xen/arch/x86/mm.c                    |  4 ++--
 xen/arch/x86/mm/shadow/common.c      |  8 ++++----
 xen/arch/x86/mm/shadow/multi.h       |  6 ++++--
 xen/arch/x86/mm/shadow/private.h     | 10 +++++-----
 xen/arch/x86/pv/descriptor-tables.c  | 10 ++++------
 xen/arch/x86/pv/emul-inv-op.c        |  2 +-
 xen/arch/x86/pv/traps.c              |  4 ++--
 xen/arch/x86/setup.c                 |  4 ++--
 xen/common/kimage.c                  |  2 +-
 xen/common/livepatch.c               | 14 +++++++-------
 xen/include/hypercall-defs.c         |  2 +-
 xen/include/xen/livepatch.h          |  2 +-
 15 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.39.5


