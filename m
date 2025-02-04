Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4DA274BC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881633.1291786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBm-0000ud-Hy; Tue, 04 Feb 2025 14:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881633.1291786; Tue, 04 Feb 2025 14:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBm-0000sK-FK; Tue, 04 Feb 2025 14:46:10 +0000
Received: by outflank-mailman (input) for mailman id 881633;
 Tue, 04 Feb 2025 14:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfKBl-0000sC-Pk
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:46:09 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c454612d-e306-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 15:46:07 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so89600066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:46:07 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d0f1csm936741566b.70.2025.02.04.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:46:06 -0800 (PST)
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
X-Inumbo-ID: c454612d-e306-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738680367; x=1739285167; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRaKMQacNZaaRRD9KFdRkjGm4lY9R1gzBNVOaae6HZY=;
        b=jWRVR3jAbvHA86KFqbAUM5hJkHFCPJ4rN5VA21DDe47bUmwAPKvo3QnK3J0A9raqK9
         mZwUcerpzob6jfetJOd+z5Cfkz/zVUorvlqKTeHhhwdGYieXJOaDb75H7d053FAus5RD
         b9pBWamTZ7KQwswrTB0xxGFt0Q00YlUDhGZ3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680367; x=1739285167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRaKMQacNZaaRRD9KFdRkjGm4lY9R1gzBNVOaae6HZY=;
        b=SNuzL+zJGSfRJUMHUwhNKtcnk5RWTSAtH2q5sMGLW3bIjuEOJw+nPx1cF9N4mMBWoC
         KSIO2UmF85336jCMLKGylpfESWUmly42kDNQdwiLjhOk5jRcZ6JaQHwNpnjK3tpjZhSw
         qHEWB/K+cOKBbs0xrP7OpTystEDRMLXyr4Fxw/G58/rq+hGY+Bwme9OTnj/I5lX28e1h
         4rih1u/YEfZmhUevB7pxuqlIXEEOR6pk7bjtGyxrmXQhDhRaMZDaMNqfgKZPnAprbWTw
         YZVQRR24HtcVS2T9WUSwnDb94ZnMJkZ32Va3gI9c6Lj9MMSfDV+9m3dR5UF1JPZgx2Fm
         ORfg==
X-Gm-Message-State: AOJu0YyKhg+L60hvKBbfqRLw5ry/BhOFGQ/pmJmspNB/N/uYaNsuJz+Q
	Qb+Cv4/PZQwfPC06F7NuIzRdfvfOnov8X22sLoXNGuwGA8QE04/50pTw7zApHqN905CpDiBIX34
	8f+ti3A==
X-Gm-Gg: ASbGncvTKlZkybYGlWLTfJzdQZ+QtTkBKcjbgN4v3UMchZCH9JLc2oht7BpSCa3C3OB
	c7hCots98myLDtKHsJpcfO7jp7QjNHo3pNite+oK0Ze8UQ7sGWsaivHB1pLG0RPxeDcrPgTeGeI
	dMK3GTZmXPVvEffZhKI/m1w6iW63/k5szTKSHrII8EaSWaMQ/AyEb/rkTzvK/Zy11tlAEQpSC7D
	H5frV+vlCrWbMlpAOy4W4Nftf+M7tSSWo26tKdrTSK6I7fpdgVkvuoiWBa2FaO/Y9ugmpidEfyl
	auIT8Lit0edOkPERqAvpWnElrbnKaUsWDOi2oljHpAT1FT4XHUZmN1vB6l/iog==
X-Google-Smtp-Source: AGHT+IEMNJwRo7NIXaVivhDUYlBGBeooFSzATeUvkAHxF+H1cb5OMhSszTVQdSCvte0LtEUNgeEyGw==
X-Received: by 2002:a17:906:144f:b0:ab6:d7e2:1e16 with SMTP id a640c23a62f3a-ab6d7e21e84mr2296699666b.29.1738680366685;
        Tue, 04 Feb 2025 06:46:06 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 0/2] tools/hvmloader: Decouple APIC IDs from vCPU IDs
Date: Tue,  4 Feb 2025 14:45:40 +0000
Message-ID: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1->v2:
  * Dropped patch to skip writing the MP Tables if apicid >= 255

v1: https://lore.kernel.org/xen-devel/20250128163342.1491-1-alejandro.vallejo@cloud.com/
source series: https://lore.kernel.org/xen-devel/20241021154600.11745-5-alejandro.vallejo@cloud.com/

The hypervisor, hvmloader and the toolstack currently engage in a shared
assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
assumption from hvmloader, by making it read the APIC ID of each vCPU and
storing it for later use.

Alejandro Vallejo (2):
  tools/hvmloader: Retrieve APIC IDs from the APs themselves
  tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]

 tools/firmware/hvmloader/config.h    |  3 +-
 tools/firmware/hvmloader/hvmloader.c |  6 ++--
 tools/firmware/hvmloader/mp_tables.c |  2 +-
 tools/firmware/hvmloader/smp.c       | 43 +++++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.c      |  2 +-
 5 files changed, 49 insertions(+), 7 deletions(-)

-- 
2.48.1


