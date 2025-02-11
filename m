Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35302A3148E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 20:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885893.1295689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvXn-0001rE-AL; Tue, 11 Feb 2025 19:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885893.1295689; Tue, 11 Feb 2025 19:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thvXn-0001p6-7d; Tue, 11 Feb 2025 19:03:39 +0000
Received: by outflank-mailman (input) for mailman id 885893;
 Tue, 11 Feb 2025 19:03:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MMBD=VC=flex--seanjc.bounces.google.com=3BZ-rZwYKCTYkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@srs-se1.protection.inumbo.net>)
 id 1thvXk-0001p0-Ud
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 19:03:36 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e40f22a5-e8aa-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 20:03:35 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21f6cb3097bso94463245ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 11:03:34 -0800 (PST)
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
X-Inumbo-ID: e40f22a5-e8aa-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739300613; x=1739905413; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RZHwu8fSUx1PRlASdGoMqhsw6pMz1JSKazfVdmFy0=;
        b=j3E3QBTQvQNAzt2C+D49qcxjnxMogIW1A5HyN5rHOpHly9YP22jvSkj6bPxyNINkLK
         6PVgPTZ28X3h/IIBmT4avhEYeRY+yMtbqyU1OZKjQQfmr2aGF0iRrh+gv+SYwhQTh5SB
         mYoFjIi5kxxY3M1banB6+QKk0wu9fqwCWsiFPcB5jh7BCjYgxGC9Qyj1cZxuFP/IWkZ3
         OYcJN/7ZD96mtHcgLkG+JrbEuxpp2HDopUockiJ8DTLkeeNbUGjOIZ9PIO/iatmdqxte
         YL0zsUNq4IYaAggs/PXBX8LUdWLMuFYQGZ5eJqT2Em8mEEW5A3Fqs8oAcVVPlOhpemKD
         HyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739300613; x=1739905413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RZHwu8fSUx1PRlASdGoMqhsw6pMz1JSKazfVdmFy0=;
        b=pIAYgkcizdE96VfX5bmNMj0MJBHW3rwsV0SbElLIfZJBTEPTpIcZjbK9fM9dTUUNvc
         chRsKhq0KOJnIOQsnRV4C5qYfO7zKlLP3Bpfnx0Q1uuKdbaaFpe2WZDUPhO41Ez5Fxd1
         Y3qa0JHrw9CkWNdNfRp8cQ3jpORq9IlHbjMhZ1mSQ58V7GnvRaQcppnxjS3m/cy9U4lz
         0fJjwnPYK8fIERCzoF2IKdxMNhHFo53KYCzw8E3+WJWHQ7A7BnOyMjbIysOWiVKrxmYu
         t0Ln2pxsRQUvb1CK6W0KKfLM1179ZcZ3efULKz71W0Zk/rGkJC/ruKxHah+8xnIEC6h0
         6Pbw==
X-Forwarded-Encrypted: i=1; AJvYcCVq5DxAj8bBN1TPvFXsea1ZauWNSyfcEqzXQiNfN0dJu91MQvEhWvR58GH480J+0sdC/XzFL+Mwc+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfWe/qVWOIlIDH+71ui28Wd8TnI1flL39BnKcAEN63v1+lJ9S4
	8gYvjuD7SyFf4/vpd0lpyuJr5hEJhereQaVjkKT91H2cXU7JPxVITz0+4CSaGZn67RP+0OIZ+j0
	RMg==
X-Google-Smtp-Source: AGHT+IF83FAVS6JbAJzhSAAsNQR7sGHkfYmlENylg6JcCsQBTAIdcwm5DyQRH0pv2Gc0GyUcz7M5iSbKK64=
X-Received: from pfbbh7.prod.google.com ([2002:a05:6a00:3087:b0:730:7b6c:d5d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:258e:b0:1e0:d6ef:521a
 with SMTP id adf61e73a8af0-1ee5c732f01mr650938637.1.1739300613311; Tue, 11
 Feb 2025 11:03:33 -0800 (PST)
Date: Tue, 11 Feb 2025 11:03:32 -0800
In-Reply-To: <20250211184021.GFZ6uZlZWPVTI5qO1_@fat_crate.local>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local> <Z6uIGwxx9HzZQ-N7@google.com>
 <20250211184021.GFZ6uZlZWPVTI5qO1_@fat_crate.local>
Message-ID: <Z6ufBMy4u0jcmIl0@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
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
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Tue, Feb 11, 2025 at 09:25:47AM -0800, Sean Christopherson wrote:
> > Because obviously optimizing code that's called once during boot is super
> > critical?
> 
> Because let's stick 'em where they belong and keep headers containing only
> small, trivial and inlineable functions.

LOL, sorry, I was being sarcastic and poking fun at myself.  I completely agree
there's no reason to make them inline.

