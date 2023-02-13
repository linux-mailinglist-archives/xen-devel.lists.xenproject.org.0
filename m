Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71566694950
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494605.764722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHH-00015e-Tl; Mon, 13 Feb 2023 14:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494605.764722; Mon, 13 Feb 2023 14:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHH-00012V-Qo; Mon, 13 Feb 2023 14:57:59 +0000
Received: by outflank-mailman (input) for mailman id 494605;
 Mon, 13 Feb 2023 14:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHG-00012P-6N
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:57:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd016c47-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:57:57 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id s11so5547936edd.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:57:57 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:57:56 -0800 (PST)
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
X-Inumbo-ID: cd016c47-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pz7y6fakkviK8BUqb6LS14mzybL3uUwzelTkpr8P0S0=;
        b=N2maH1/mR97GVPsFJ7KnEBgVfdaufB93hYcPcQGoAXntHrOPNyNW5Vo/nAj84Fx8NJ
         1MTFmb474/KQYDZk/UbtaEUJd74hV4ABhb+wM3gqk2ih5IrZSk7khTjpj16GJzqTIR0E
         rkcYNTMS7X/6uUuqrtmlyNr9RjLi9iEdBXrf2vXu2DaZ6w2ECp8wHNN0JmuYJ/480F1N
         dQMx42QC6y6UvVuqSNBTjC48sBb6XYYQgKlhigIjYiMvFTd7U2b8yYebbDYfrFkxxL8Q
         aY0NNXd914f2B08qGABRYeYSGpAYcSCV+iUAd+4emYNo1vB1rgFWLI73yGuxzlh3O0LA
         mY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pz7y6fakkviK8BUqb6LS14mzybL3uUwzelTkpr8P0S0=;
        b=0h4aYeZousE6yZcnTgYRfWc9e7JcwBMX9Sqgs+cbyHaocYut2F2fOSrlyqIjZ/tz/b
         BNkM8+8kz4sK10L1Jc/h3UJFT/9qaKHDoEuqUjIxXrhfIsyriH8OYMH9OFOWNfvidEVy
         W8Bm6L1vzkORJNonsemLUDC93zaoYaMQpM51S/2TDprLQ2EE7uyPjLWf/7Dh6a6Bx/hv
         BYiOqXJgrEbBUB2o9UEr+xxL8wt68QWA3hY42Ykt1zXuoWqwbYERpuFJnFlB0XYjXNxm
         jui/hSWkZgfyN5zQCccmX4b3q3xAHYI3OuZmsQptV0q5zBImkc2hkxx2noyKbGUr1qWe
         sh0g==
X-Gm-Message-State: AO0yUKU5EtFo2PVWrkQ57+qEWUOzKg2LN7jJibvRci8ZCIK28627BcMQ
	kAiselUncCInTuKumQhpjby2aF86BpA=
X-Google-Smtp-Source: AK7set/NFS9TNWlrQumydTYD6cBOz+GrHufuuGVeGixW6W4NwCWqCXuiF3pwerOEYw+9xBVEOq19Mw==
X-Received: by 2002:a50:c31e:0:b0:4ab:4c5e:8828 with SMTP id a30-20020a50c31e000000b004ab4c5e8828mr11547045edb.37.1676300276498;
        Mon, 13 Feb 2023 06:57:56 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC 00/10] x86: Make cpu virtualization support configurable
Date: Mon, 13 Feb 2023 16:57:41 +0200
Message-Id: <20230213145751.1047236-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a means to render the cpu virtualization
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT-x
drivers are built.
The series adds two new Kconfig controls, AMD_SVM and INTEL_VMX, that can be
used to switch to a finer-grained configuration for a given platform, and
reduce dead code.

The code separation is done using the new config guards.
The series is sent as an RFC to gather feedback in case the changes are in
the wrong direction (I m mostly concerned about hap (ept/npt))

It depends on patch
"x86/vlapic: call vmx_vlapic_msr_changed through an hvm_function callback"
(otherwise it won't compile with Intel VT-x support disabled)
and on the series "Make x86 IOMMU driver support configurable" (AFAIU, the
series has been reviewed but not merged yet) because Intel IOMMU depends on
Intel VT-x for posted interrupts. 

Xenia Ragiadakou (10):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/hvm: separate AMD-V and Intel VT-x hvm_function_table initializers
  x86/p2m: guard vmx specific ept functions with INTEL_VMX
  x86/vpmu: separate AMD-V and Intel VT-x init arch_vpmu_ops
    initializers
  x86/traps: guard vmx specific functions with INTEL_VMX
  x86/domain: guard svm specific functions with AMD_SVM
  x86/oprofile: guard svm specific symbols with AMD_SVM
  x86: wire cpu_has_svm/vmx_* to false when svm/vmx not enabled
  x86/ioreq: guard VIO_realmode_completion with INTEL_VMX
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/arch/x86/Kconfig                    | 20 ++++++++++++++
 xen/arch/x86/cpu/Makefile               |  4 ++-
 xen/arch/x86/domain.c                   |  4 +--
 xen/arch/x86/hvm/Makefile               |  4 +--
 xen/arch/x86/hvm/ioreq.c                |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      |  8 ++++++
 xen/arch/x86/include/asm/hvm/svm/svm.h  | 17 ++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 35 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 18 +++++++++++++
 xen/arch/x86/include/asm/vpmu.h         |  9 +++++++
 xen/arch/x86/mm/Makefile                |  3 ++-
 xen/arch/x86/mm/hap/Makefile            |  2 +-
 xen/arch/x86/mm/p2m.h                   | 16 +++++++++++
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 xen/arch/x86/traps.c                    |  4 +--
 xen/drivers/passthrough/Kconfig         |  2 +-
 16 files changed, 139 insertions(+), 11 deletions(-)

-- 
2.37.2


