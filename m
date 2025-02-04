Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB201A27870
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 18:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881748.1291911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlh-00063U-Ks; Tue, 04 Feb 2025 17:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881748.1291911; Tue, 04 Feb 2025 17:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlh-000618-I9; Tue, 04 Feb 2025 17:31:25 +0000
Received: by outflank-mailman (input) for mailman id 881748;
 Tue, 04 Feb 2025 17:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfMlg-000612-KD
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 17:31:24 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab73df9-e31d-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 18:31:23 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3862a921123so4002158f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 09:31:23 -0800 (PST)
Received: from CSGPROD108744.Home (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102ac9sm16137748f8f.29.2025.02.04.09.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:31:22 -0800 (PST)
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
X-Inumbo-ID: dab73df9-e31d-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738690283; x=1739295083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVA23iSd/QWgZL29KhQ4ZXDA5mMSmPs3i50cUKNLpCc=;
        b=RdH6eVIBWJHWQw1XIdfoHNIRDDM3jXfMggD6AxQNRweQR9YSV/MDPLZDie5y5GEpqK
         JTy3mmfP7Tl41BieGKjNAxF5nCfrhfKm2NXwT0zaD6in8icA/Uk1mZobyGbeKDNuy5cy
         xTK3LTHjvxLx8bUnezHaNgd3dwddjfJpFS6Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690283; x=1739295083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVA23iSd/QWgZL29KhQ4ZXDA5mMSmPs3i50cUKNLpCc=;
        b=V0Ga6GcMxLiXbi/CCSD5x7r8OPBbAJ7Inxh1U1Ax1ON6/QEhbmOAU7UGXF1ylqPSXr
         kkcGaquYnfFdQV2MCRSbDSITf1Zbvhio/IayVhPS3WsE3TVljo4KwAdN1kRuZE8G0Gid
         b0Yysd+iOvHFppc7hEeX8w8+Jw40ckaN87U9WbzbZrPhAYPIOurS5ge8faPOsOyRTNCE
         NrGwxgWil67ii9L9vh8FfkAEN8K8wd8UPSgj/yh2yu86ktuG0Wzxwss4xOzKfPWWdU2Q
         3gVVt36/P5c/Y8EQ3NdAJkIyPRtcOCSaWjYsWRDVV4DOHeG08h2nUVAFF90fHqLL+Wy6
         vgSQ==
X-Gm-Message-State: AOJu0YzCGJHaXh1jk+yTynH9sxTWHIssBQkRRVMrS6kZyK11Po3TB+eS
	QdeiJ/7Zocj2qU8f4nz9MLqs/N52JTL5FFSoQgUE2TNnXf13w2ujx+v4+Kq0jwfKGEA9WgQStrP
	hh/coRA==
X-Gm-Gg: ASbGncvBqI97mSKAvZbLVDEGU97E7Z3zMBAWRqI6nfNbCi3f4PiF9tjDXxlUoU5ucze
	K7AOIulYqQkgzT3lZ5GKw+iAXgyWIIGNEupxPwf5faXsBivOCGDCruuYzQ2KIOsf96jDxSXU2Sx
	uQ9HPWzd4yK1hL8N9nk+kql/Cothq3kAbm33n8AMr2dQIw5meww1jpJ0agYVKuVt7B9SzSsuSXS
	u/Tm+Mkx5e40jofirtxqhyq+lC5AICy7esOItBprlzt0ONBsAEA68s4LHUwpjSnXE8O8PgqzyEN
	TFtOIg2TQ3FaNgTmZarMqFtRaLFG28oOCdb7QyPc/3CX9l2A3F4iGx4r3A==
X-Google-Smtp-Source: AGHT+IFgODG6cK4LJ/sIOx5/1ZGaM1yWlZEdXmqy/X/33W5OlvtrPUzZ57BCTS46/Sj22wTsFM2YXw==
X-Received: by 2002:a05:6000:2ce:b0:38c:3eab:2e13 with SMTP id ffacd0b85a97d-38c52093f22mr21760408f8f.46.1738690282761;
        Tue, 04 Feb 2025 09:31:22 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 0/2] tools/hvmloader: Decouple APIC IDs from vCPU IDs
Date: Tue,  4 Feb 2025 17:31:18 +0000
Message-ID: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2->v3:
  * Moved "extern uint32_t *cpu_to_apicid;" to patch1

v2: https://lore.kernel.org/xen-devel/20250204144542.7399-1-alejandro.vallejo@cloud.com/T/#t
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


