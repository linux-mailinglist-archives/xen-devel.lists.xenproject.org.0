Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1D918376
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749007.1156967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9x-0000ch-N0; Wed, 26 Jun 2024 13:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749007.1156967; Wed, 26 Jun 2024 13:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9x-0000az-KE; Wed, 26 Jun 2024 13:58:05 +0000
Received: by outflank-mailman (input) for mailman id 749007;
 Wed, 26 Jun 2024 13:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9v-0000af-L2
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:03 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 197228bd-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:01 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-700d1721dd9so401730a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:01 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:57:59 -0700 (PDT)
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
X-Inumbo-ID: 197228bd-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410280; x=1720015080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJdcCoIY2DohEWYmWF98zcK07KMjVwPqM+9Wb+zM6zM=;
        b=f94req+2waOcWi94iixta+ixblXGRM1tbztnueTyXYHadJxN8DZF3+tzIIberq19so
         5FO9E1zkm/SHv5VpZYibN8qm1K2IC+smkfCmQAJXe2mgLYkyB8jrK1OaXU1dyUShpEQw
         7mCBrGRET0MRaDHAKATR8AEursHks5NpictrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410280; x=1720015080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJdcCoIY2DohEWYmWF98zcK07KMjVwPqM+9Wb+zM6zM=;
        b=PsTINoLBd+MJK44e3GIIuaWYr7DmDvNm/BCrBrTqRxDsdh2Y11NocDyMiqD3yEhNTl
         bgcdckciMfSD804eVk+kHuHsTQB4LTrCMQuuyn3v6FqKWbO+Tnfb7QDDUBCKB6tODdfS
         m16B/A8TJ130c5crp6jt3iZjJTmQlGhawrJs0kPNkXMxqhk6ul4SV58WioXBAc9qldA+
         I/OySZrn/WtwCY4w9MqRjvVQTWBW6VzxzhUeZruI6p8L8NJqkm8LhrYw3s4nJfa/1b/H
         8b02tOz0o8LbsDANokuegj0lY9G0d6GaK6Afdn160+ZcCEBK/DOVbK4bDrqlsRMy/fFs
         x1WA==
X-Gm-Message-State: AOJu0YzrjEcGL1YLl67ZPMRdXlt9ZCeYEVlozMgGd9sYyy6tCdGfW8q0
	ASujv890oTMfknYH659C/drK/6syLSRz2+q6PZ58pN06N7GoXi4ZWGHM6LvXklP3iZFdudtK5xp
	9dBQ=
X-Google-Smtp-Source: AGHT+IG22bxAwgvOl603G9Q1O4nbcRp1s3ssLAoyT629EVsaXULg0uU3OSI67FLwFIfcO3zDNqN7/A==
X-Received: by 2002:a05:6830:25c4:b0:700:bf0f:66da with SMTP id 46e09a7af769-700bf0f6984mr7274402a34.18.1719410279585;
        Wed, 26 Jun 2024 06:57:59 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 00/14] AMD Nested Virt Preparation
Date: Wed, 26 Jun 2024 14:38:39 +0100
Message-Id: <20240626133853.4150731-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is my work-in-progress series for getting nested virt working
again on AMD.

The first patch is an early draft to integrate the SVM bits into the
CPUID framework.  It will be partially superseded by a series Andrew
has posted but which has not yet been checked in.

The second patch is a workaround which hides the PCID bit from the L1
when nested HVM is enabled.  Long-term, nested support for PCID will
be necessary for performance.

Most of the rest of the patches involve improving tracing: Either
fixing what's bitrotted in xenalyze, what's bitrotted specifically on
the SVM side, or what could be improved in the upstream tracing.

The last patch is a placeholder for future work, commenting a place
where behavior is wrong and another where more work needs to be done
to assure safety.

George Dunlap (14):
  x86/cpuid-policy: Add AMD SVM CPUID leaf to featureset
  x86/cpu-policy: HACK Disable PCID when nested virt is enabled
  xenalyze: Basic nested virt processing
  xenalyze: Track generic event information when not in summary mode
  xenalyze: Ignore vmexits where an HVM_HANDLER traces would be
    redundant
  xen/svm: Remove redundant HVM_HANDLER trace for EXCEPTION_AC
  xen/hvm: Don't skip MSR_READ trace record
  svm: Do NPF trace before calling hvm_hap_nested_page_fault
  x86/emulate: Don't trace cr reads during emulation
  xenalyze: Quiet warnings about VMEXIT_IOIO
  x86/trace: Add trace to xsetbv svm/vmx handler path
  xenalyze: Basic processing for XSETBV exits and handlers
  x86/svm: Add a trace for VMEXIT_VMRUN
  x86/nestedsvm: Note some places for improvement

 tools/libs/light/libxl_cpuid.c              |   1 +
 tools/misc/xen-cpuid.c                      |   1 +
 tools/xentrace/xenalyze.c                   | 133 +++++++++++++++-----
 xen/arch/x86/cpu-policy.c                   |  24 ++--
 xen/arch/x86/cpu/common.c                   |   2 +
 xen/arch/x86/hvm/emulate.c                  |   1 -
 xen/arch/x86/hvm/hvm.c                      |   4 +-
 xen/arch/x86/hvm/svm/nestedsvm.c            |  13 ++
 xen/arch/x86/hvm/svm/svm.c                  |   7 +-
 xen/include/public/arch-x86/cpufeatureset.h |  16 +++
 xen/include/public/trace.h                  |   1 +
 xen/include/xen/lib/x86/cpu-policy.h        |  10 +-
 xen/lib/x86/cpuid.c                         |   4 +-
 13 files changed, 167 insertions(+), 50 deletions(-)

-- 
2.25.1


