Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F81A07C20
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868812.1280314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudJ-0002L2-2C; Thu, 09 Jan 2025 15:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868812.1280314; Thu, 09 Jan 2025 15:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudI-0002JR-Ug; Thu, 09 Jan 2025 15:39:40 +0000
Received: by outflank-mailman (input) for mailman id 868812;
 Thu, 09 Jan 2025 15:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVudH-0002Hw-9D
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:39:39 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eec35999-ce9f-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:39:37 +0100 (CET)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso1597650a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:39:37 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95aede8sm82723366b.136.2025.01.09.07.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:39:36 -0800 (PST)
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
X-Inumbo-ID: eec35999-ce9f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736437177; x=1737041977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUHykMg+qTNNNoZ4AzcISeSLhmGpDC7jBb9/QneoS9E=;
        b=vKcxQAOyGRfZf8dOt3pewl3A2cqYg2fzBAYMxosHbaT0RxnZzhfRcTJmexk56/5Cc3
         h24/bwybSVSaq3AHgUaYX80MgkMMRGI4Avl8ihVjwDfEwjjNK6eb7PP/JvQIDbs7S0qV
         7ZrbONPAyRdpHZobRavXUQzc+hCIqA5s7W1iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437177; x=1737041977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUHykMg+qTNNNoZ4AzcISeSLhmGpDC7jBb9/QneoS9E=;
        b=gHmOmZfSK8/GlFlhUmhcj/TLo8lnwlD4bd3qZOblQmCHNHj30+Xx+L0Nk/FLuqpMPr
         lmJA8o7qtXi2QYotqEingxCTFaZHxPidRjvZoGnffsUFReQjWY4vVL1KNRoXrlh0g6Dl
         EiBmitMx8U8qdLVhqumFTixIstotIHpsAn/FCTL969GAQNSHl7Dv4C5Bje7mjFhZNb3Y
         LFYEK+GkzSF4LXzp6sgDXA4IVhe8nXfF8VcV+zf6yVpJhyk+MVVx+4opFPvMXrf4KZ2E
         RURT0uPUlVqkWTW/pcLeffrNoCOFIrcemrGSc2SbqBUhPtIj1mtNdeDBrioF5NRxnx7g
         zOOA==
X-Gm-Message-State: AOJu0Yx5p5H1Hw39LPxk1e8yfIJ3rM3Gq9hewpndzd63K78mIt+buPgL
	WgH5oW/Obeb8w6sCrAXRsn/FpuHITWL4rNgCNKC5O1c5DjDhoYZfXuzXq4+TXgmC/Hmi6H+0sSM
	lnj2yv2kg
X-Gm-Gg: ASbGnctDhYPI+QZk4hVC5kleMtCuvLsSo2sS9mjnnuj5xaxWK39hPM1DIcC9/+WF9Ry
	P/ayFfGI94VBkjcMixKaBMSekVh3AaFQsZ/owyoR08XlEuNDOMn7ybCB5nUsnX/qDrbB41uCNOQ
	Nmz/vs+1rD7Y4EflXbP4/oK7rlbp+NGNKR3wPuc3ZUubksvWWy3xVQ8cPncODNaH42uoaqW3Gzv
	ETk5NgNzhYo/pasa3Ob316dVOI/6R/PFaQsn8h1kj5DfXasCy47Qx+D3rytssRqGGhvMkCSAN1d
	muMFOg==
X-Google-Smtp-Source: AGHT+IGQWuSJ7jquH1H9yx7VCPn1auv47Z+XoQYe3Mrv64gGl5OysGCMbyo3QQf22ZFvvbnmw+B6nw==
X-Received: by 2002:a17:907:998c:b0:ab2:c2f1:4578 with SMTP id a640c23a62f3a-ab2c2f145fdmr318902666b.4.1736437176619;
        Thu, 09 Jan 2025 07:39:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20 0/2] Prep for 4.20-rc1
Date: Thu,  9 Jan 2025 15:39:19 +0000
Message-Id: <20250109153921.43610-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RC1 is scheduled for tomorrow (Jan 10th).

Andrew Cooper (2):
  Config.mk: Pin QEMU_UPSTREAM_REVISION
  Update Xen version to 4.20-rc

 Config.mk    |  2 +-
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)


base-commit: 40f35d07aa14bde44d7baafad171f7c92b053017
-- 
2.39.5


