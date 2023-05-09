Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E66FCB8E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532375.828541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRF-0001tU-8z; Tue, 09 May 2023 16:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532375.828541; Tue, 09 May 2023 16:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRF-0001r0-6H; Tue, 09 May 2023 16:43:45 +0000
Received: by outflank-mailman (input) for mailman id 532375;
 Tue, 09 May 2023 16:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwQRD-0001qp-6N
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:43:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fb8427-ee88-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:43:42 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f315735514so216226995e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:43:42 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002ffbf2213d4sm14754606wrt.75.2023.05.09.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:43:39 -0700 (PDT)
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
X-Inumbo-ID: a7fb8427-ee88-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683650621; x=1686242621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Vv9h8xRR34WXMgEze0CmFq4k7f1bgK9vFoprNoHdzc=;
        b=DSNgs0hmVkJMJlA6yBYq9TF7QVy7IfG0z9GULd8GywiDk2FKO04piCfpzWMnSrV65/
         0Dx/auYQzpE38dxMuoz3BE8Sat8RAQddKRB5IpenwTa6fSShArj4Qc/7zu7+qHUqX4HE
         9KQyOMVQMq5/Erb6CZvgu8xWl+ID87LEoFqcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650621; x=1686242621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Vv9h8xRR34WXMgEze0CmFq4k7f1bgK9vFoprNoHdzc=;
        b=j0yIIbCZG7BktbBLhWtq2qt4L6hg/I8e3QyQZJRpsS3gRYo1K25nAT5fZcg2ujFLFp
         6MQZ5NlRHfuMnExHqlkjjB2Cm8hEVc7FeiygvpHoTnOIzgKwW0DzDsQczk8PwruqFCIf
         nIOhHmBCsGmN7Ak39yXzeBEzKDTr1l2okIEmq3oZYwfQJN+FDwa9rMvZ8on4ZaUSyXmv
         IJ+Ytwfi9hyIHOChnZN7qi7WsCex+FZGwr+oRfiyKJRquGZCvstwnX8SGVQbw3KbpOo4
         MEui0KscKmxPS2G6Oj0XqWqZdKt0GpoDnmE0HZLWUn9Kc3lA+FxLAfIUik2gh1V8h2Ya
         aLAw==
X-Gm-Message-State: AC+VfDySimX1gV8RaTfxpHAEpXLprQ+eoFnTUU5NZY9W4/M3f9invn5H
	XGb9QF45q29PPNbj9eh4wuka4tYC84bmbcPiHgo=
X-Google-Smtp-Source: ACHHUZ7zPKxYr8ChuNd7x3xyoGnskZRptPhUxOU9LOoGvv57zoOdccEaZNbbEjBeGCUKb+Os2c74EQ==
X-Received: by 2002:adf:feca:0:b0:2fb:92c7:b169 with SMTP id q10-20020adffeca000000b002fb92c7b169mr14253235wrs.10.1683650620761;
        Tue, 09 May 2023 09:43:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] Add CpuidUserDis support
Date: Tue,  9 May 2023 17:43:33 +0100
Message-Id: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
 * Style changes
 * Remove v1/patch3: HVM not to be addressed by this series
 * Adds one patch between v1/patch1 and v1/patch2 with the vendor-specific
   refactor of probe_cpuid_faulting()

Nowadays AMD supports trapping the CPUID instruction from ring>0 to ring0,
(CpuidUserDis) akin to Intel's "CPUID faulting". There is a difference in
that the toggle bit is in a different MSR and the support bit is in CPUID
itself rather than yet another MSR. This patch enables AMD hosts to use it
when supported in order to provide correct CPUID contents to PV guests.

Patch 1 merely adds definitions to various places in CPUID and MSR

Patch 2 moves vendor-specific code on probe_cpuid_faulting() to amd.c/intel.c

Patch 3 adds support for CpuidUserDis, hooking it in the probing path and
the context switching path.

Alejandro Vallejo (3):
  x86: Add AMD's CpuidUserDis bit definitions
  x86: Refactor conditional guard in probe_cpuid_faulting()
  x86: Add support for CpuidUserDis

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +
 xen/arch/x86/cpu/amd.c                      | 28 ++++++++++-
 xen/arch/x86/cpu/common.c                   | 51 +++++++++++----------
 xen/arch/x86/cpu/intel.c                    | 12 ++++-
 xen/arch/x86/include/asm/amd.h              |  1 +
 xen/arch/x86/include/asm/msr-index.h        |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 8 files changed, 71 insertions(+), 26 deletions(-)

-- 
2.34.1


