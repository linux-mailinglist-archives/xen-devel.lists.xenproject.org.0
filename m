Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA0AEAE7A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 07:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027228.1401954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV1iL-0007CB-BU; Fri, 27 Jun 2025 05:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027228.1401954; Fri, 27 Jun 2025 05:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV1iL-0007A4-8G; Fri, 27 Jun 2025 05:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1027228;
 Fri, 27 Jun 2025 05:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV1iK-00079y-3T
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 05:33:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e0942e3-5318-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 07:33:25 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-553b544e7b4so1835361e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 22:33:23 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2d0a49sm296845e87.192.2025.06.26.22.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 22:33:21 -0700 (PDT)
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
X-Inumbo-ID: 3e0942e3-5318-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751002403; x=1751607203; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck4QcCZhtWT+wZCyZsWQpDgsHHh2Ls7o7eMTmnBThXw=;
        b=ZOyUqvRhGmisWTNnX9x3U+FENRcMKyuAuTE07j18k9RD+2eCLYexQ+ijHVOSFJV5xJ
         JFi0s4OqBg/X68UNAR56Ya0jvMnx1A7vdm3pAaciFK1GLtJ046579jkvbHB06SeQawWn
         wOM0DvyYxFc7OIT8chAkLzyr4OyBDzkTK7Guq6gUSxDEgWK3M1kfibulA7zduC4tjfsZ
         hjKoE/6HzkVZ2POSv9hLfMUA+0V/puAHseh6hP7n5H23SNf3VpAXY0veVb4klDF/rkiE
         /tT0BRhRFXwEgzgGTnf2RW711uX6YKiiLe44/bsSV2P/pjUT9yT2cAoAM4nI/E+rzFla
         QM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751002403; x=1751607203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck4QcCZhtWT+wZCyZsWQpDgsHHh2Ls7o7eMTmnBThXw=;
        b=Pb2pF6DZaCCSMr3BMlHuFpdsJOB1RNhS0g0u+xne4Kfaf3bD8/eieAdGGdeqV2FfwB
         Apoewsm/d8APueUe+p9Us4RZcRPsFIa7d3A2+N/B+Fvd0/9p7tEH0rx9a0C5VCeoXx//
         Vz1FikIB8Os3FhjIO6Rixj75PneqQtj4LfNkixIugYZo61Vz/ayPCzN2nqwxSiP1TNxW
         NV6Jds2xDNAohl3mL7Q8k0DL2caDXUV8npg1KgNV5nZy7bMkhHyhCy/HrWe+J1D5Oqtb
         rZD5WsTcMClEhDaaFDT+DkLtwV8ZTApY/OOOI95DXBaVKykwIoUH2fv3xn/Nm1/Ecbp1
         ofbA==
X-Gm-Message-State: AOJu0YxpqP5C7jYt8lDlKjYyA5fhJC5VuLifFrELdczvZukRWHk3bE1i
	oFa8H/2VGwMRabEwEIXOpaeX9KUgf5Q8OM4UtHxgkHuDc8SnF/z+2FdLXOKwlyeY
X-Gm-Gg: ASbGncu6/QmQvDSg22CYDe4vcXdwsQL/hahcD0GwNgVEbp2f/t5suuyHSVmtZa5RRNz
	//B65psXqgnhQW9QCVT0A8g/yNvLRibcSWtyjONkUfvt3s+UAmBYNB8tZ9i+di1okDX0O6xb/hG
	ZmPAD8rMiiT1lAI5hcLfC5KDjWFRYjxfqH/UHmpGTrX+AY/nu8WHYb9hEMvCMTT3KIdGO8didX1
	JnGErggz6Q4/gseDsQveLBl8vMibvnWOAMB9+hWXZxyl8eQ2dcd+oeX7yEZI3rzL6Z9Dpa3BY1i
	A73iAdNSZ3/FUMIaGw26OPlRenRTp/owr3zu9T8ilF/vZZb/4sg2WVw+wIEZAnIZz0/rwVfp9fQ
	T78Y2wOVwxXPobjiFpnCXdWobBA==
X-Google-Smtp-Source: AGHT+IHbVv+cbcuPFo2L+WuDLVrA6u7XPEqiKPWaE1bwPDedy6NESR19iTkUMO7AdP2sHGwj+VEqlg==
X-Received: by 2002:a05:6512:2346:b0:553:3492:b712 with SMTP id 2adb3069b0e04-5550ba167f5mr662570e87.54.1751002402326;
        Thu, 26 Jun 2025 22:33:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] SUPPORT.md: Document guest PSCI support
Date: Fri, 27 Jun 2025 08:33:13 +0300
Message-ID: <20250627053313.2233826-1-xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under "Virtual Hardware, Hypervisor" for guest PSCI
support on ARM. Describes support for mandatory functions from
PSCI versions 0.2 and 1.0, as well as the optional MIGRATE_INFO_TYPE
function.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 SUPPORT.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index f0b5718e84..01a3ee9499 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -956,6 +956,14 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
 
     Status: Supported
 
+### ARM: Guest PSCI support
+
+Emulated PSCI interface exposed to guests. Supports all mandatory functions
+from PSCI versions 0.2 and 1.0, as well as the optional MIGRATE_INFO_TYPE
+function.
+
+    Status: Supported
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.48.1


