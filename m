Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7DDA3A03C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891762.1300806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOpk-0004sj-En; Tue, 18 Feb 2025 14:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891762.1300806; Tue, 18 Feb 2025 14:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOpk-0004pb-BM; Tue, 18 Feb 2025 14:44:24 +0000
Received: by outflank-mailman (input) for mailman id 891762;
 Tue, 18 Feb 2025 14:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkOgo-000673-4n
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:35:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de899e9-ee05-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 15:35:09 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abb9709b5b5so435498566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:35:09 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322e6sm1067364666b.1.2025.02.18.06.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:08 -0800 (PST)
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
X-Inumbo-ID: 8de899e9-ee05-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889309; x=1740494109; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0U7Kjm0K8i5rqhLPLXCHGParQ+uCx4LOB3GCQNbl50=;
        b=h9njrex9+pctM76Ft+lnTIINxV7glmEDK/aXxDtoLHIQS9tUzvWTkrmr1UHFCmNSsI
         5PbeFz9yngX52H/t/gVoVIrSjjYHUEDfXX6dwefkX41JYv+fwBsWv3W+6nRjqw5M5rbc
         N8NDyXUvRtsL94E/V7hrjQizmaq/V1AR0yIIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889309; x=1740494109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0U7Kjm0K8i5rqhLPLXCHGParQ+uCx4LOB3GCQNbl50=;
        b=H86u1D/fqdrB3QId2nbpJ2OKGqrFqzzM9q07thjMDKRH2ZjmfgE4oeCEW7zFRJ4DRP
         qfCX/5Uxixg3NDR/VX/m/zcF2gscMQPHeHiT4o/yGrQ0jZHDsvOFnDyarv1vNfSbQEpO
         F5uLIXOXTcFzVfDlGTIV7qyyyiwOzrhTT0w+Ov25XBqA8Hy8J8OjcKL+pXjqtyK5z8Wt
         vwk9+9oXQjeHdUfCgl6DW8BRXVinFXn+0/FiF7GCMZ8872+DDbTMVMFGoMH+iOZOQowD
         s27YWDUrkd2JTWaWbUrSMFmFUo8mSucVX6Yl22NNn61roidNmOPrX7VUyBIzMc6mxLbI
         6mkw==
X-Gm-Message-State: AOJu0YyIkjLk9xWBwQduZSdss/HgeOkYnBYBCVx9A77gpzc1nzBXYnFG
	zwDZmV4Y5C268ZBcYI24ttvz0UJPv0GRUGRSrlUXxEKIod/gUlFB/P/BbWyvWECKClydo+wAdce
	R
X-Gm-Gg: ASbGncufnrSQS6J7rsd9w+hFgZBTGQAvU3Hu2bVdYEQVe7gHClvlK0q/f8gczy2ASMh
	nSW09ahJZGAQ9RvnlQAnKktRdZ2TyZRIYoPNJmGMItbh5fihqr0XhWyayLpQEXsCHfJtVCj9IfE
	89lMojv3pP1UNJjSlcXxzNJYouY7iceRklzAvi+ObXxKrU2SYcxzZ0rgg2AvvPvLOCzLKPTR79Y
	mrDvR6AH4oAXslBJ/r6vdHBFf8+tHnGjcA22H66b+wTESJ58XkaLg0fC7ft6U4+5DASFIaEr7Xo
	4gweu1xmp1K9v/rygPSL
X-Google-Smtp-Source: AGHT+IHdrtJ2xa/8ov1UzyOSXbGF88cZhYnlkSM6oB7eHtgMeotHcTAD2palVsJs6b7cUy/CjmTARA==
X-Received: by 2002:a17:907:86a1:b0:ab7:cc43:c51e with SMTP id a640c23a62f3a-abb70cbbcf2mr1273738466b.13.1739889308602;
        Tue, 18 Feb 2025 06:35:08 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] x86/pvh: workaround missing MMIO regions in dom0 p2m
Date: Tue, 18 Feb 2025 15:35:02 +0100
Message-ID: <20250218143504.77638-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of this series is to provide a workaround for better handling
missing MMIO regions in a PVH dom0 p2m.  Xen doesn't know the complete
host memory layout, as it's not able to parse any information from
dynamic ACPI tables.  Hence the p2m built for a PVH dom0 might be
missing some MMIO regions only described in ACPI.

Since a PVH dom0 has no way to request the mapping of such regions (and
adding one would also require dom0 kernel modifications) instead provide
an option for Xen to add those MMIO regions as part of handling p2m
page-faults.  The option is currently off by default.

Thanks, Roger.

Roger Pau Monne (2):
  x86/emul: dump unhandled memory accesses for PVH dom0
  x86/dom0: attempt to fixup p2m page-faults for PVH dom0

 CHANGELOG.md                           | 10 ++++
 docs/misc/xen-command-line.pandoc      | 16 +++++-
 xen/arch/x86/dom0_build.c              |  5 ++
 xen/arch/x86/hvm/emulate.c             | 73 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/emulate.h |  3 ++
 5 files changed, 106 insertions(+), 1 deletion(-)

-- 
2.46.0


