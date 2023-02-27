Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76A6A3BDE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502217.773910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNa-00012O-BM; Mon, 27 Feb 2023 07:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502217.773910; Mon, 27 Feb 2023 07:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNa-000105-7f; Mon, 27 Feb 2023 07:57:02 +0000
Received: by outflank-mailman (input) for mailman id 502217;
 Mon, 27 Feb 2023 07:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWYNY-0000zt-6v
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:57:00 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eff32ef-b674-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 08:56:58 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id f13so21995817edz.6
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 23:56:57 -0800 (PST)
Received: from uni.router.wind (adsl-209.109.242.226.tellas.gr.
 [109.242.226.209]) by smtp.googlemail.com with ESMTPSA id
 b23-20020a50ccd7000000b0049ef70a2894sm2788272edj.38.2023.02.26.23.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 23:56:56 -0800 (PST)
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
X-Inumbo-ID: 4eff32ef-b674-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ID3uCYe2CWd6ty/xP8fK1sRL4RZVuw6YXfqE73AmGHE=;
        b=lzcSMnzQSPwHPIODtMBUcEDWE3+j2ENhwalXivVO/WF/BsWJuUHzao4LcO10IvnWdo
         az+aEAl4gjKHjdM90Z1/4bLd7aKJhhDW5B+pC1f31bk3EhH+BhqcHsicmDiNPGNKUoVG
         n+6qfRj9XyOvOgR7JIp7m1b4nIiHGjjXnrRHJfGhqGqfAhf/IS9/ya02KE6+o7l2X6+Z
         4fIoZCUuqnMTUf1NbLbCBIbg63HenTvngcAphBCDawYc56gZyrfw0OR1k1qJg4pe2QMB
         e+tlY3TFlqTTpsdzRiL/9zCkzwcAX7wM2G4GgklV1QbLWCuyBmiiBgxhiVSEZWTYmxzW
         /Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID3uCYe2CWd6ty/xP8fK1sRL4RZVuw6YXfqE73AmGHE=;
        b=gRjX6YMV5hZ/akYYDIpl04vrHeKTdJzIIRXCRYeN7NCWEaVQ1pPpUt6Mltob94zsek
         wvYaoJr1SUVEmoI7ZLKFrziPOhPh7H4s/vGyvWdMjyfJbGhRoVVYS4ozXefuZcFcKaAg
         anHcBIrvb0P3aDyYsBtCRHA+ZarT9HcTjye4g8v/dE4rhMmZzpcMHFC2T+gipZ3VZmB8
         n0lpMZLfJoKK65st+aCassIyHAzdL4v/rZl8yqhzNQ1DL7/S+ZuA/kq5jqywX5pPxmfP
         iR67ilFmsKY0OblWAMaYTPWGmVrUPHKqAWem8jqF8Yhj0kNPFKQBsmyqJDUWjfloHQQr
         znOA==
X-Gm-Message-State: AO0yUKX3TQgQkk/yvCFAB4zDSB7RnHOctFPQ0/PTdG5RvRXgSisfCMLl
	WUVqngcIGggUcsdk8y5jlAnIAaSpf2L3mw==
X-Google-Smtp-Source: AK7set9+Xj6VJG0F/kjblsG7ak+w3VAIbj1pgTaWG/2/Hvva6lazWOkhZYukvjSUZBulucYDp+XCpg==
X-Received: by 2002:a17:906:494c:b0:879:6abe:915e with SMTP id f12-20020a170906494c00b008796abe915emr34353076ejt.69.1677484616861;
        Sun, 26 Feb 2023 23:56:56 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/4] hvm: add hvm_funcs hooks for msr intercept handling
Date: Mon, 27 Feb 2023 09:56:48 +0200
Message-Id: <20230227075652.3782973-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to make the msr intercept handling, performed in
vpmu code, virtualization technology agnostic.
It creates a common interface for setting/clearing the msr intercepts and
then add hooks to the corresponding hvm_funcs table to be able to call the
svm/vmx specific handlers through a generic hvm wrapper function.

Xenia Ragiadakou (4):
  x86/vpmu: rename {svm,vmx}_vpmu_initialise to
    {amd,core2}_vpmu_initialise
  x86/svm: split svm_intercept_msr() into
    svm_{set,clear}_msr_intercept()
  x86/vmx: replace enum vmx_msr_intercept_type with the msr access flags
  x86/hvm: create hvm_funcs for {svm,vmx}_{set,clear}_msr_intercept()

 xen/arch/x86/cpu/vpmu_amd.c             | 15 ++---
 xen/arch/x86/cpu/vpmu_intel.c           | 30 +++++-----
 xen/arch/x86/hvm/svm/svm.c              | 80 ++++++++++++++++---------
 xen/arch/x86/hvm/vmx/vmcs.c             | 38 ++++++------
 xen/arch/x86/hvm/vmx/vmx.c              | 46 +++++++-------
 xen/arch/x86/include/asm/hvm/hvm.h      | 32 ++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 13 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 14 +----
 8 files changed, 156 insertions(+), 112 deletions(-)

-- 
2.37.2


