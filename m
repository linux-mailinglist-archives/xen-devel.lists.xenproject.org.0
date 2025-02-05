Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88DA29C6F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 23:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882352.1292492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfneA-0004h7-G2; Wed, 05 Feb 2025 22:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882352.1292492; Wed, 05 Feb 2025 22:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfneA-0004fK-C7; Wed, 05 Feb 2025 22:13:26 +0000
Received: by outflank-mailman (input) for mailman id 882352;
 Wed, 05 Feb 2025 22:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQOl=U4=flex--seanjc.bounces.google.com=3geKjZwYKCRoI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1tfne8-0004fE-K1
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 22:13:24 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 692809f5-e40e-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 23:13:22 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2f9cf77911eso453197a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 14:13:22 -0800 (PST)
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
X-Inumbo-ID: 692809f5-e40e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738793601; x=1739398401; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVdg6lU59UKb0/TD/si7cIrxJXLN5wRx2BqZWD8EZQ0=;
        b=klYkP6AQwZinyckRgOOI0HFBTRcnrLcPskrvGPEj9eu4pI3sJFngRVLm3FJUUQ6CFl
         bn0U5hkTyfyND4Vlnv5DtXoxE9+SKqA4lw9iwQOZqkhf/uQPaASwlzdxNYy6+OPUCTH/
         4sJ8llEjr8+/3vKFneSNjffRzQwoFXsvwdaT2I+lsesa2aMJikKkG53kSy65KnZGUDL7
         PsV4Yy7q6F/Hp10SXO9QnqFe1ufi3cRHal2XVFA0RwFvvtIJh4ijusV+OOj/HHKVbA64
         Ktvxpv/CzjAdaM8JIHwos72TjUONZl0Kyl63GBza48OTUsS1jrGBa19kqjqqKzcbtDlP
         H0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738793601; x=1739398401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVdg6lU59UKb0/TD/si7cIrxJXLN5wRx2BqZWD8EZQ0=;
        b=qG4/1z0JCHykSIIjuUgRk0YuzbJL1HbjkbKeq5w65u+YoTmpA7cLe3Fgo7AhIH8MRA
         hkXMHAs9AhEpca0jDsVIE7eNaW+uJhLn2gWsBTmYFacFAH50TKsiAjBd7og1ZYOTNzUk
         PMrwv09j/q122U43bpYp5n4F6A3VcO4c1q4mC9ltLHwyO/oG8QraQ01Nr2TDBfF9fUer
         Ox4pxNKezuqwS2Hi1e3xUOjTSznILVIrSAJo++bK2TwCV9UN1dZHDPHvSuppge7w/LWW
         bNwcH14jsdmIYoEwBWlCnr0QaPHe4fdZKqlWQTIMESf7MtVCBvrEzLa7E1I54B1ApTQJ
         b9tA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8PW1MMV2zKGVeGRNABHiRPAl/ChE5kMP8GytaMRBKIPkTwEbcqtQd+ZxMm2dt7ZbgvWK5tEaowM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvwRFiwZpgDqc/z4m8/gx9/b3dn2p43UscQhi9m7ylz3VyPpC9
	rZ4zrRxqiXcuM5UCSXM0dBZuhCsdui4Wq2dKNjoAFCcMx1vJbOJGBDcJFE5USRwtcf92zBYzbSR
	p5Q==
X-Google-Smtp-Source: AGHT+IEzBJXIxqY+Exe441l1aJjABmGJq/OUJpRwmw6f4+fEJCNQJEg3bbzDZBjxuP/ajdzYJPIfpzBr2jA=
X-Received: from pjbsi5.prod.google.com ([2002:a17:90b:5285:b0:2ea:4a74:ac2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e707:b0:2f9:9c3a:ed3
 with SMTP id 98e67ed59e1d1-2f9ffb7ba78mr1633015a91.16.1738793601045; Wed, 05
 Feb 2025 14:13:21 -0800 (PST)
Date: Wed, 5 Feb 2025 14:13:19 -0800
In-Reply-To: <20250201021718.699411-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
Message-ID: <Z6Pif2CFE0o1eOnj@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 31, 2025, Sean Christopherson wrote:
> +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> +				     unsigned int *crystal_khz)
> +{
> +	unsigned int denominator, numerator;
> +
> +	if (cpuid_get_tsc_info(tsc_khz, &denominator, &numerator))

As pointed out by Dan, this is broken.  It should be crystal_khz, not tsc_khz.
I fixed the bug in my test build but clobbered it before posting.

> +		return -ENOENT;
> +
> +	if (!*crystal_khz)
> +		return -ENOENT;
> +
> +	*tsc_khz = *crystal_khz * numerator / denominator;
> +	return 0;
> +}

