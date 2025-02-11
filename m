Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BFA31353
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 18:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885838.1295639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thuID-0005Os-Ly; Tue, 11 Feb 2025 17:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885838.1295639; Tue, 11 Feb 2025 17:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thuID-0005Mv-J8; Tue, 11 Feb 2025 17:43:29 +0000
Received: by outflank-mailman (input) for mailman id 885838;
 Tue, 11 Feb 2025 17:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OwBG=VC=flex--seanjc.bounces.google.com=3PIyrZwYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@srs-se1.protection.inumbo.net>)
 id 1thuIB-0005MZ-DU
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 17:43:27 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f9b739-e89f-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 18:43:26 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21f7519ae0cso60720055ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 09:43:26 -0800 (PST)
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
X-Inumbo-ID: b1f9b739-e89f-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739295805; x=1739900605; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4mrriPfgsPPxXSFmU/JBzChLIiRw5rZPULaSxSIiLc=;
        b=EsbuRBNHUYrnw69x/vsfpkctgf71gVmphh8VqzK2LcrXxX1MRY2NO/YdnudWDtjgN3
         j4zApwiHs9ijQ1DeQwG+EUCs0b/qoRG8J6BurVQ8OBrHurcnQekM9IpYrTzwAGX836Ya
         a6p+kACfnbQXgDk9E3GIAh7SkE89lHbBaNZBgayz0rpFpkue+zbq8WARosvFCh+3McHW
         VwSD2XEu9XwnXyjSkeJwDpeDGM/5XoZePAyR5z6Qcx0g4XWDBX9PjSuPn5mfW16DbXQW
         Nkm9w4ca77Fm6PrDbKI1o1+C7v2ah//4lzdi00n5KwKiuuX+G/ywA5ZPxyKdPeOglFdg
         lDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295805; x=1739900605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4mrriPfgsPPxXSFmU/JBzChLIiRw5rZPULaSxSIiLc=;
        b=ZxhYiu6L7d46pGqS3YFlC15IZUw8/uevjnD8zRl/AKNLkrwlMBzmTY0/lqNxsrDS5y
         uu7dJJcpCIUcFFBNb2DRwOAtBRFHo5jsNfjX1Xh2fdDL2TZr7CKjpj2ckPjVZn7ZgGB6
         ELWYHy2mjcDBKzmk/4kglcBEGbtZbwi5mo5UZy1T6wLK0Uhnuj8XqF2IByoAkuIfyuIC
         u592n831sMFP6flZXB4GyjGpjiEwtcQiFYpxRh9Jk5Pyg1Ui5GgzlCT2FmR1KpIe8ra1
         aL54qGYZYHx4D6PMMIXRW4xR9oLufF2yj9+yoDSRbYI6Mm4aFSGKxf/Clj5+qK70HfE6
         J4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUg9LMa10QW9MGVeWCtDY/BX5VWb24O/VyiCe3f++BaFN2VWb3Qx6yfle4K9FAi3oTiuB4i8JSI9fg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4Hfir9IgfEnQ0nWZsaFtmzM7oj4OMoF/M+r8jAo6St4zmaH5T
	CcN5PS9cJC0JOyMChXeoKO2B4hxy8Pp04Cquzsp20Vm2i5phVtXdWFAQz4qMEOlzSQbbyCMX3h4
	BZQ==
X-Google-Smtp-Source: AGHT+IFvsE6NJWsYg5eZawythPvtd1Ryiyh5QdfSD0iYprnIkMmal30fbTQ5swLortjkJ0haAujEqXDb7dE=
X-Received: from pfbbj9.prod.google.com ([2002:a05:6a00:3189:b0:730:8ca0:1f9b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998f:b0:1e1:becc:1c9c
 with SMTP id adf61e73a8af0-1ee5c7db2d5mr167479637.28.1739295804800; Tue, 11
 Feb 2025 09:43:24 -0800 (PST)
Date: Tue, 11 Feb 2025 09:43:23 -0800
In-Reply-To: <20250211173238.GDZ6uJtkVBi8_X7kia@fat_crate.local>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-4-seanjc@google.com>
 <20250211173238.GDZ6uJtkVBi8_X7kia@fat_crate.local>
Message-ID: <Z6uMOyHD3C6-qCXz@google.com>
Subject: Re: [PATCH 03/16] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:05PM -0800, Sean Christopherson wrote:
> 
> > Add a TODO to call out that AMD_MEM_ENCRYPT is a mess and doesn't depend on
> > HYPERVISOR_GUEST because it gates both guest and host code.
> 
> Why is it a mess?
> 
> I don't see it, frankly.

It conflates two very different things: host/bare metal support for memory
encryption, and SEV guest support.  For kernels that will never run in a VM,
pulling in all the SEV guest code just to enable host-side support for SME (and
SEV) is very undesirable.

And in this case, because AMD_MEM_ENCRYPT gates both host and guest code, it
can't depend on HYPERVISOR_GUEST like it should, because taking a dependency on
HYPERVISOR_GUEST to enable SME is obviously wrong.

