Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5087EEF2F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634959.990609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vS7-0007ZQ-VD; Fri, 17 Nov 2023 09:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634959.990609; Fri, 17 Nov 2023 09:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vS7-0007W5-SZ; Fri, 17 Nov 2023 09:47:55 +0000
Received: by outflank-mailman (input) for mailman id 634959;
 Fri, 17 Nov 2023 09:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vS6-0007Vz-CI
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:47:54 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600708b6-852e-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 10:47:52 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso15060415e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:47:52 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b00407efbc4361sm6706778wms.9.2023.11.17.01.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:47:50 -0800 (PST)
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
X-Inumbo-ID: 600708b6-852e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700214471; x=1700819271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTRkF380G4A6IHN12bKndfGgc5EBx94Uag0DU0kxCG0=;
        b=W0X9H9OJWDgPU1CUPBjKV9F/R48giYmg9qQr8+kO1yg+v4h15E28G6vuFoz1KcnA2v
         yH/jB1zr6jcYBXHuyoKSwe4s3q4gpQRChNwOFyiQfCiADwDdJ9O6/dcwFR+V5PJDiNUJ
         QTsMFVtxOuXQv0sHZfQJp9Uf+5hiGcIhfW7Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214471; x=1700819271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTRkF380G4A6IHN12bKndfGgc5EBx94Uag0DU0kxCG0=;
        b=g7rGmUsZN8KDA5HP2D6Sw2Ot0SwkvbC9nBK+XpA2IrX/F6tvza3rtMSOAf2nuknFTv
         o+WQ86gQm07Ve6x169RneZ1alXRW1S88aSv58k75gyrjZ/1L4AKekDNyaY/ymsjSWkzK
         CEEsgRnjV6j0JvNwoA2s/84cfBu7QplcDWJbMnVbYUlrzzJo9tMvJz3jjbyHD7ASEPEj
         xgSuI4g/A56Fr0BUxC2g1PbJG7IG7snP7M7z288To2cqwJZC2p6KXAQRHyUpE8vZj5z3
         wwWCdGElZ9awcAS+LSdk/rAWbQp38TcbqXUzfdCIB/ly3PEltI9MuAXbkp7OLmlJrD1N
         pbSQ==
X-Gm-Message-State: AOJu0YxPURsz8I1IiksnbrMPzmvAtJE1io1HFohmM2nQHsbO+ubnE7lL
	i5yoNg1bzDI9ZLwN3EyXhUMQzaIu5FK9KzIB2qE=
X-Google-Smtp-Source: AGHT+IFEbvGFD8B+Wpt3DilAGVWP7FcYu0rj2AIzeA0eT2yfd2EcFXrX9AAsqyB2VKXIEXm70LTyBw==
X-Received: by 2002:a05:600c:350a:b0:405:359a:c950 with SMTP id h10-20020a05600c350a00b00405359ac950mr15598721wmq.19.1700214471386;
        Fri, 17 Nov 2023 01:47:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 0/3] x86/iommu: improve setup time of hwdom IOMMU
Date: Fri, 17 Nov 2023 10:47:46 +0100
Message-ID: <20231117094749.81091-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The follow series aims to improve the time consumed to setup the IOMMU
for the hardware domain.

Patch 1 and 2 are prereqs, while patch 3 is the actual change that
speeds up IOMMU setup.  See patch description for figures.

Thanks, Roger.

Roger Pau Monne (3):
  amd-vi: use the same IOMMU page table levels for PV and HVM
  x86/iommu: move xen_in_range() so it can be made static
  x86/iommu: use a rangeset for hwdom setup

 xen/arch/x86/hvm/io.c                       |  15 +-
 xen/arch/x86/include/asm/hvm/io.h           |   4 +-
 xen/arch/x86/include/asm/setup.h            |   2 -
 xen/arch/x86/setup.c                        |  49 ---
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
 xen/drivers/passthrough/x86/iommu.c         | 321 ++++++++++++++------
 6 files changed, 247 insertions(+), 164 deletions(-)

-- 
2.42.0


