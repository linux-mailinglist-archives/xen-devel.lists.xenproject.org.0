Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2CC67983A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483547.749755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcZ-0008MG-Jn; Tue, 24 Jan 2023 12:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483547.749755; Tue, 24 Jan 2023 12:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcZ-0008JF-Gl; Tue, 24 Jan 2023 12:41:51 +0000
Received: by outflank-mailman (input) for mailman id 483547;
 Tue, 24 Jan 2023 12:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIcX-0008J9-Lt
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:41:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e892a4-9be4-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:41:48 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id v6so38671796ejg.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:41:48 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:47 -0800 (PST)
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
X-Inumbo-ID: 77e892a4-9be4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=And5MUKJQR/wk63gLOcXdYnpoe091+y1Os1GWl1dLpM=;
        b=Qj5nZN5/oOs8U+AUP9KtbZ/bcFpK/SGYOZZLPYtE61gbPS0W0bXkIirUdhqFnZdi4G
         Nx4k/xlgpHqLXSzuRH2rBw177io0iPVf5nkhgeeu4/w74V4dz6QfMJ0VbpsCSIpLWCPS
         RgAZKoQlXIDhrj5OpmRgvk4P6dns29PiKy0FCL8pdqZ/tZDLfp//btQ9hwE+K5PHku8h
         X3vYC08u96mPyhnUj3do7IajIc+//cWuVVblfgP3rnqgNNThzI+J8flpXcpTONd9UzaU
         Xf/6XJvhMK7W33oTdkBlf06NUcfJlD9aoYLwFoMBAjrDFIqHMhZk6+Or9tw9SkqFGHMg
         Vs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=And5MUKJQR/wk63gLOcXdYnpoe091+y1Os1GWl1dLpM=;
        b=r4AT+W3/0Dkvnd/z4sJoOXWVapueo+5HN+sxzqGIf2zpxPOaeC8gW0paAQ6bRzMVEf
         GRfQHWsaVD5rSy4OeHMAoDqSzb/t37irqgmW1Ba/MbdITALhS53lgKKWdElH2V71DAh7
         J1SS52K+vT1E8XAiOmFa+tUMOFmQNQ9w/NolOaq27Evptm3L12umXGoKhWrFNDvwEiCK
         v8bV3L4dASFpajcqOySp3YQZ7e/l/XLAUqz8zVUHYKKByFc9ymAyFdceCcZeEikEdoHZ
         0+4PosZytxtbpqoGZJMrEWwML8gXU3oC6PfpCGKk4yFo5w0O4ePzZI2gtJogw30p+D55
         dEOA==
X-Gm-Message-State: AFqh2kraIR5xZUCvl92ijXPagk4GF7XLvJhBTOyx8lYIwWpLF5XNLCzt
	KpxNIaIF1KTo6Si89UsxViM0Qs/DeeM=
X-Google-Smtp-Source: AMrXdXu7CvUxDkCr90FAwG0UrE6PWxE4k7AdI7HBcTxrTyEilRfrbAwIiyxLhIq8VgTWiVF0k65bYw==
X-Received: by 2002:a17:907:ca85:b0:86f:ae1f:9234 with SMTP id ul5-20020a170907ca8500b0086fae1f9234mr31691357ejc.7.1674564107980;
        Tue, 24 Jan 2023 04:41:47 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/5] Make x86 IOMMU driver support configurable
Date: Tue, 24 Jan 2023 14:41:37 +0200
Message-Id: <20230124124142.38500-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a means to render the iommu driver support for x86
configurable. Currently, irrespectively of the target platform, both AMD and
Intel iommu drivers are built. This is the case because the existent Kconfig
infrastructure does not provide any facilities for finer-grained configuration.

The series adds two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, that can be
used to generate a tailored iommu configuration for a given platform.

This version of the series is rebased on top of the current staging and
addresses the comments made on version 3.
Patches
"[v3 1/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific"
"[v3 2/8] x86/iommu: iommu_igfx and iommu_qinval are Intel VT-d specific"
"[v3 4/8] x86/acpi: separate AMD-Vi and VT-d specific functions"
are not included in this series because they have been already merged.

Xenia Ragiadakou (5):
  x86/iommu: snoop control is allowed only by Intel VT-d
  x86/iommu: make code addressing CVE-2011-1898 no VT-d specific
  x86/iommu: call pi_update_irte through an hvm_function callback
  x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
  x86/iommu: make AMD-Vi and Intel VT-d support configurable

 xen/arch/x86/hvm/vmx/vmx.c               | 41 +++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h       | 10 ++++
 xen/arch/x86/include/asm/iommu.h         |  4 --
 xen/drivers/passthrough/Kconfig          | 22 +++++++-
 xen/drivers/passthrough/vtd/intremap.c   | 36 -------------
 xen/drivers/passthrough/vtd/iommu.c      |  5 +-
 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 50 ++++++++++++++++--
 xen/drivers/passthrough/x86/iommu.c      |  5 ++
 xen/include/xen/iommu.h                  |  8 ++-
 11 files changed, 131 insertions(+), 115 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

-- 
2.37.2


