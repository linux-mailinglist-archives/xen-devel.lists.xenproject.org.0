Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5939A677E0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919330.1323817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYv6-0002W2-3U; Tue, 18 Mar 2025 15:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919330.1323817; Tue, 18 Mar 2025 15:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYv6-0002Tk-0f; Tue, 18 Mar 2025 15:31:56 +0000
Received: by outflank-mailman (input) for mailman id 919330;
 Tue, 18 Mar 2025 15:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Po+=WF=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tuYv4-0001ML-La
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:31:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e045549-040e-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:31:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso24629455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:31:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcf12sm135384415e9.12.2025.03.18.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:31:50 -0700 (PDT)
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
X-Inumbo-ID: 1e045549-040e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311911; x=1742916711; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vw1XEvQqqiDg0JMXVUL6A2260HDubm8QJFwLoLdM56o=;
        b=XSvoDD8owYlBXCzjwk6i/7cnefVnzJSOIlPf2iF2qobAaW80RGr29sBKGhaFntj1c0
         JvtsiPsSsuzm+TDdYz9o0MAABBb0Esx0B1y9iEh4LH9z6Svvh3Cbo/ZNPdllSrIjdA42
         0k54URgFQlMCZNv5rAt7P8VOEq6B8iY/rOjX084sM14mwNU9AUoecp7g+nolS1KCKPKp
         u72lFHz0E++ZNFrj5CbQVJyW0JD4AVgMXR16ngaG/0IAXcGE7y/JYlP/gNzO5thMJTCe
         IATi+HA60UhK4HzfiuK83QSUIjmP42kdDzykrjGLIODxv9TTI2YZmQTzAZn/A26ws42a
         I/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311911; x=1742916711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vw1XEvQqqiDg0JMXVUL6A2260HDubm8QJFwLoLdM56o=;
        b=W4QDhy5s5fe0cZubm0itCsLWLWNoQ1QZ1ABSIUNsIoBb+Zmu0OIwSzqINOaWW/QpiA
         1yiOscAn3DqMlEC22g6NbCAALj4c1SJWTUuunI9nWxc/8qjvGz+vAtktZbiH93xvDvu1
         RTBWumfygM6dqDO/RvocSbiwLYHrJnj0C9E8yHigGekeoffYOGB+oZS2EIS9r8yBNvKd
         1AaQlJ4oci6VBzucX5ivfz+c+ddg5DmltIMKq8aaW+IBJNjZJ1rvLenodasc+iMiRXxG
         ChOpNNgE9MWmZ3htOX9X7VgNzJn+EHOmwVxssr5tromuz1n/YdNmyNW23hFnDsxf4nIa
         kCew==
X-Gm-Message-State: AOJu0Yzi/AT2uXJB093a15Q7c0OaPaN7xDcTEPtb3tTo4bkpbaY1PUqN
	AMHruMq7MGGIoQMbT9nVArvcQJRSeBprtZKkqcXOPjtVLrYsEdvyRcadHs6q
X-Gm-Gg: ASbGnctOrIRIstv2mAUvA5qcExicvrLd8v43mwQi16jRZQJWMgWDTkYILW6gZVJOFe5
	4/QLYLwmy4tszYJe4kpWy6uHLZOaf7Ep47rAOqfv/96aImvlDBm1EhfZjb8bRCA2uSvuAi4QnEy
	zBw6IEXCjjAwvnv8I+d8BVtLa/9Un24dHs9X+PUzxWPmsu/sq0tAfn1sK34aLQPDnjS91RXoH1W
	nMDmq1GVujHlJFEEmuQXJdjgIfMyamJ7hlSm5zYJLVy3O49wUkzUG1bmCs+i16ifhxgigAAfAYR
	gUmVABzBpCNlzl2LNELtUe9RsFxNHgdi7gsFYsXTx7CF6x7nyosS4NnYAEVspciSociTNifeV6A
	F9qe/UGLthWQoB8d0nodvWFAGF5lMVijwYOSM43smm1WO
X-Google-Smtp-Source: AGHT+IGMIkjb1IOTp53py0mI8LradF/uhXmHgrI80aAfDJCzr5QVROPhYS8DAi0uOT6dqq9CX5fmMA==
X-Received: by 2002:a05:600c:8486:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43d3b98e682mr27662165e9.9.1742311911117;
        Tue, 18 Mar 2025 08:31:51 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] drivers: Simplify handling of pci_sbdf_t in passthrough/amd
Date: Tue, 18 Mar 2025 15:30:20 +0000
Message-ID: <cover.1742311401.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Step-by-step, use pci_sbdf_t directly where appropriate instead of
handling seg and bdf separately. This removes conversions, reduces code
size and simplifies code in general.

Andrii Sultanov (3):
  drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
  drivers: Change find_iommu_for_device function to take pci_sbdf_t,
    simplify code
  drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t

 xen/drivers/passthrough/amd/iommu.h         | 11 +--
 xen/drivers/passthrough/amd/iommu_acpi.c    | 56 +++++++--------
 xen/drivers/passthrough/amd/iommu_cmd.c     | 10 +--
 xen/drivers/passthrough/amd/iommu_detect.c  | 18 ++---
 xen/drivers/passthrough/amd/iommu_init.c    | 39 +++++------
 xen/drivers/passthrough/amd/iommu_intr.c    | 76 ++++++++++-----------
 xen/drivers/passthrough/amd/iommu_map.c     |  8 +--
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 50 +++++++-------
 8 files changed, 132 insertions(+), 136 deletions(-)

-- 
2.49.0


