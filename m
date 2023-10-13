Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4CA7C85C2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 14:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616522.958597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG4-0003zT-3M; Fri, 13 Oct 2023 12:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616522.958597; Fri, 13 Oct 2023 12:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG3-0003wE-Vp; Fri, 13 Oct 2023 12:27:11 +0000
Received: by outflank-mailman (input) for mailman id 616522;
 Fri, 13 Oct 2023 12:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrHG2-0003w8-1I
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 12:27:10 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d36d8259-69c3-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 14:27:09 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c9daca2b85so15287375ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 05:27:09 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b001c452f827casm3768599plg.257.2023.10.13.05.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:27:07 -0700 (PDT)
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
X-Inumbo-ID: d36d8259-69c3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697200027; x=1697804827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMnL4cIfhKjfmwtT67M/o7wtHXbUxDyQP7k1KrTbbUY=;
        b=nrOn8sL8rq/Q9i/PKu898qeG6V4ci5w/RShJVByQRjdvCffVI7L8N3Xf+GQi4tv7Ue
         4vJBbOXKWgkb+dIrDgu0MwQ7JtibEkPpbl7DI54+BCN/bOTFECpthCafKPgxc4oZHXMa
         spt6FCiDTD/zvWa/wx6CNvJ2iejLrYQaFjVtEMby0p5IWXv/IhTjr6+uQD16mPYI9y5q
         mxExXgDlsPinmf98uGdTdDkem/XdbUY0ZmLRJYoWOvjVAfKKy0Fznmq9wxL4od7+HGnT
         nYZXny/2r5p8xiQA8sxfcfPr85LdIf7Zqo0VX2quQPHSNO34LstcG3ZT0T3f/nixkKHz
         dGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697200027; x=1697804827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMnL4cIfhKjfmwtT67M/o7wtHXbUxDyQP7k1KrTbbUY=;
        b=FrGxpGltNny6hSGINB4jeP+9FvfelxBTBz419qa2Ln470n8O2tTtMF5jjCEXyYRc6v
         iL3i+jZU8cG7jYgGuf++aRCmwRZZLj85TsrEW0ieeuLeEheoY8y4xV4yvZsl3QKqj2V5
         YFGuA+1ceQmnqZ+G0fhRv2Go1aqJxlCkWcrL7qtv4qJSEAqu0lt/gU1j4aof3k43k5WJ
         WQMLtmRISIgYwX7w9kqEfSHsgctH/5HKrn0UBLU0/HUspHixb0sZ0TxYcqm36NbDYNkG
         qGSiNtrJjjxvUJMYVWVqxSG9FMmXkB5325130Zu0cw4+M43Atl9K7SdsFrgSBLnq3r7i
         D2xA==
X-Gm-Message-State: AOJu0YywmQ/P9fNsY29hwBG4pGK/M1r+ExbUOE7Tj/OZMjT3YuEBHAO7
	erWOBqAJ1xs6OJp8Q/w08QchGFKPx2xM79I572uqKw==
X-Google-Smtp-Source: AGHT+IHAwfyPnVYl51JnEEtT3pDBacGWfuBBQGxxPqjlTIEJ0kuJy0clZsE3DaQU8PkRj9bI+jx8JQ==
X-Received: by 2002:a17:903:1c8:b0:1c0:afda:7707 with SMTP id e8-20020a17090301c800b001c0afda7707mr37692403plh.34.1697200027510;
        Fri, 13 Oct 2023 05:27:07 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 0/2] xen/arm: Enlarge identity map space
Date: Fri, 13 Oct 2023 20:26:56 +0800
Message-Id: <20231013122658.1270506-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest Xen fails to boot on ADLink AVA platform.  Alexey Klimov root
caused the issue is related with the commit 1c78d76b67 ("xen/arm64: mm:
Introduce helpers to prepare/enable/disable").

This is because on ADLink AVA platform, it loads Xen hypervisor to the
address above 8TB and hence causes Xen panic (see patch 02 for details).

To fix this issue, this series is to enlarge identity map space to 10TB.

Note, I did a smoke test for this patch set, but we have no chance to
test it on the AVA board which reported the issue since the board is
bricked now.  And it's likely we don't need this patch set anymore after
updating firmware on the AVA machine.

Hope this patch set can be helpful for the system with big memory, I'd
leave the judgement to maintainers for picking it or not.

Changes from v3:
- Changed the identity map space from 127TB to 10TB (Julien Grall).

Changes from v2:
- Kept macro naming IDENTITY_MAPPING_AREA_NR_L0 and removed introduced
  macros (Julien Grall).
- Minor improvement for coding style (Julien Grall).
- Added platform's detail in the patch 02 commit log (Julien Grall).

Changes from v1:
- Rebased on staging branch (Bertrand);
- Added Alexey Klimov tested tag for patch 01 (Alexey).
- Corrected the printing log with dynamically calculation ID map size.


Leo Yan (2):
  xen/arm: Add macro XEN_VM_MAPPING
  xen/arm: Enlarge identity map space to 10TB

 xen/arch/arm/arm64/mm.c               |  6 ++++--
 xen/arch/arm/include/asm/mmu/layout.h | 17 +++++++++--------
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.39.2


