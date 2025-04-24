Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D053A9A516
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 09:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965957.1356335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rUF-0000Io-GC; Thu, 24 Apr 2025 07:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965957.1356335; Thu, 24 Apr 2025 07:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rUF-0000FG-Cm; Thu, 24 Apr 2025 07:59:11 +0000
Received: by outflank-mailman (input) for mailman id 965957;
 Thu, 24 Apr 2025 07:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7rUD-0000FA-Vq
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 07:59:10 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffa1534b-20e1-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 09:59:08 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso696676a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 00:59:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-309d5e18130sm3377973a91.1.2025.04.24.00.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 00:59:06 -0700 (PDT)
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
X-Inumbo-ID: ffa1534b-20e1-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745481547; x=1746086347; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHu2UgqDxCoVzYZt9cG62fKHZj5Tqst6+VKAMkbT3fc=;
        b=DwGSTtVIIyni/pwPw+3xsbHP/w9OTR2uN08tPoVeYVV4lwS5PBzTZ4cQ06Uy/JHjsS
         +MSnWzwNSjSht6t9T4mFHgTi5Jcr7rMHWPuM0tjcqypzCope0yKjeE+ZJyXWA7nQ0F7M
         0BeFdYAts3mAw7Fndcmm2sPvJc+Nm6bInfxQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745481547; x=1746086347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHu2UgqDxCoVzYZt9cG62fKHZj5Tqst6+VKAMkbT3fc=;
        b=J22o/7q6RiMpaHySNVCft6DWFRFvsl1guxFqVZ4FnT53I5E7nPa6DTVlXwDr8xkZBf
         TI3c0JAyEcc2yCeXzr36l2vOf2w8bYTtDiILbCGcqazzhqpCGXV95e3uwd9sTMPjFbY9
         yhxDGd9koEnrkNAu/E2ILqqBXz7JL0CL5ZxehCpuDOBRbzNoH8MNlBdQbnKGZjgPRh2o
         I8oG4ZuPa81L39LF+jeLdYBGanO/8fGisBOs6GStZ/0ItJ7cJxijr1A+LWtPAp5e7mNH
         9H5lNyuBNZKVOor5u+IntULqK9y5YXll3xnYQV/OtFrYZTzwPn5xM9Ar+TBm53Zrmwe+
         5vzA==
X-Forwarded-Encrypted: i=1; AJvYcCUDNaiGQOP6+2ZI2JcSICtC3Ezi7LSFRNWzeBVqnG74wXdAJ8UHzcQUHqEnmOtNHTLEJXLnE9o9+e0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC6iJanQddQQhkKdFZsfuuV8CItcRumwYOXtBgqhcem0f0a2EM
	tH3eY9UquK2pKfFgvBvzJSCpMlPYGWwywhvQVL8Onn5ilGfBEdXKt+T6Rny+KcM=
X-Gm-Gg: ASbGncsGi32lCADr31T5s+mIkbsqiA28AIlHBnK8EVEv0RtHBJKhMcVdwrMcqSDJ6oW
	XsIJgysTyrTFa9Y4GCfr/mlUS6NspTcRsXic62uf4ygKxX3oTPKyM6QdE7Uxkl/kMkIHDTZVkcA
	m9RdkYNnrrelyBXSSRYB0g1whH4IWxcrPo/VE775E25fb9C9FjluKHwRmEFshFlF14c4ZmyfkjY
	f7YbTqS2pcy8ZLZNEKHll2fAnI7osfUs9tBUfLoCjYIVsdPNo9bX61tjOFQq1F8RN3XO+pG6gEc
	TUBZce+WpD79+ytUTRm99XBR49DbujND8psXNi7egB/Blg==
X-Google-Smtp-Source: AGHT+IGCgHhrW31Pd6CgfpzX+ADejQHUxQ2kHW/zvbXh69X031MZskTFaBpRnqSGhToB1BqwAzuy/g==
X-Received: by 2002:a17:90b:51cb:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-309ed27a73dmr2886619a91.10.1745481547100;
        Thu, 24 Apr 2025 00:59:07 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:59:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aAnvRMgJxAskbCtE@macbook.lan>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
 <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
 <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan>
 <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>

On Wed, Apr 23, 2025 at 04:51:16PM -0700, Lira, Victor M wrote:
> [    4.570354] Intel(R) 2.5G Ethernet Linux Driver
> 
> [    4.579535] Copyright(c) 2018 Intel Corporation.
> 
> [    4.588898] sky2: driver version 1.30
> 
> (XEN) [   21.644361] d0v3 unable to fixup memory read from 0xfe91000c size 4: -1

This fault is unexpected, according to the identity mappings done at
domain build time:

d0: identity mappings for IOMMU:
 [00000000a0, 00000000ff] RW
 [0000009bff, 0000009fff] RW
 [00000cabc9, 00000cc14c] RW
 [00000cc389, 00000cc389] RW
 [00000cc70a, 00000cd1fe] RW
 [00000ce000, 00000cffff] RW
 [00000fd000, 00000fd2ff] RW

The page at 0xfe910 should be covered by the last range above.  I
think we have a bug somewhere that unexpectedly unmaps that address.

Can you try the Xen patch below and paste the output?  It should print
p2m modifications of the 0xfe910 gfn, so we can spot who/when removes
that mapping.

Thanks, Roger.
---
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 666abd46be16..c4bb2cb01422 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -591,6 +591,14 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     unsigned int flags, iommu_old_flags = 0;
     unsigned long old_mfn = mfn_x(INVALID_MFN);
 
+    if ( is_hardware_domain(d) &&
+         0xfe910 >= gfn && 0xfe910 < gfn + (1 << page_order) )
+    {
+        printk("gfn %#lx mfn %#"PRI_mfn" type %u order %u\n",
+               gfn, mfn_x(mfn), p2mt, page_order);
+        WARN();
+    }
+
     if ( !sve )
         return -EOPNOTSUPP;
 

