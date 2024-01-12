Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A079482BEDC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666814.1037712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFM0-0005Z9-DR; Fri, 12 Jan 2024 11:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666814.1037712; Fri, 12 Jan 2024 11:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFM0-0005U1-73; Fri, 12 Jan 2024 11:05:36 +0000
Received: by outflank-mailman (input) for mailman id 666814;
 Fri, 12 Jan 2024 11:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvc=IW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rOFLz-0005QQ-0D
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:05:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812dec73-b13a-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 12:05:33 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e68d0dc2aso847055e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:05:33 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b0040d5b849f38sm9376455wmq.0.2024.01.12.03.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 03:05:32 -0800 (PST)
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
X-Inumbo-ID: 812dec73-b13a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705057532; x=1705662332; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0fKtKx8f4NRRmDQBJOBk21ATr4s902HPCm3N4KyZPKA=;
        b=PvCSms6J5C0my5XlnLbsDvhJein3WfBTcFDq+iy1tXcj6XZu9xF8zkhsfwXiz4HZQE
         W8i9iec8Yh0cMz8GBOY8eeWO1C38I37FoDgi6Gk8HlDUp0yCrFTSsudlgZQ/io0UTb/E
         nAG6qmzZM2VdsgWWnXVjUZmyel5Wmtnol/bZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705057532; x=1705662332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fKtKx8f4NRRmDQBJOBk21ATr4s902HPCm3N4KyZPKA=;
        b=wN0+XgBHKxqHexfxcoxlS22m7O8u/xLM6ZS/HVmEjVlsPI+AyrMRSk1vHvYoDKY3Xx
         6pkJ02NNmspnFesmza9+JNp33NlO7ypGJxOB7P/7z/hbGyV7kMjWy10VAgqtRV8zwLIY
         0FlyVR50ixegs7Lo7zTkCMjJ7pCIiL3romY1LT/iWq4l6y34tndqxh/b10W9its4q155
         VhLXWzYbgGvYkMGvMJgpQvmZVAwDUw6vLsbmWnWKIR6BBDu8TNQBKucN7S3r0kQZ9RAt
         FY5xBwKgs19lmEMBsulMfno66ocVP3mLk6gpph1MXXmM9EgBAPWnoob4bCC/2WOAP8u5
         fxVg==
X-Gm-Message-State: AOJu0Yz3xnqZM/sP1HgNgG2HdjzlCMhDdJph84MXa2/mwO0PZFvuqtOa
	73KLlH7ybCt/+qfIyieWlu1SboA2DZ9X/g==
X-Google-Smtp-Source: AGHT+IE6YA4uifsZlbkks0kaKplgSxGM6yO0CKaqEnDQnMCdUVKCG3iSvWealcHIfJtFApfrljSptw==
X-Received: by 2002:a05:600c:1885:b0:40e:50d7:6902 with SMTP id x5-20020a05600c188500b0040e50d76902mr414056wmp.64.1705057532462;
        Fri, 12 Jan 2024 03:05:32 -0800 (PST)
Date: Fri, 12 Jan 2024 12:05:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <ZaEc-3tVnpFWVxLr@macbook>
References: <20240110095311.61809-1-roger.pau@citrix.com>
 <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
 <96182bf50bd52cc16b8378ff571b6954144b0723.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96182bf50bd52cc16b8378ff571b6954144b0723.camel@infradead.org>

On Thu, Jan 11, 2024 at 05:47:30PM +0000, David Woodhouse wrote:
> On Wed, 2024-01-10 at 11:26 +0100, Jan Beulich wrote:
> > On 10.01.2024 10:53, Roger Pau Monne wrote:
> > > The HVM pirq feature allows routing interrupts from both physical and emulated
> > > devices over event channels, this was done a performance improvement.  However
> > > its usage is fully undocumented, and the only reference implementation is in
> > > Linux.  It defeats the purpose of local APIC hardware virtualization, because
> > > when using it interrupts avoid the usage of the local APIC altogether.
> > 
> > So without sufficient APIC acceleration, isn't this arranging for degraded
> > performance then? IOW should the new default perhaps be dependent on the
> > degree of APIC acceleration?
> 
> In fact Linux already declines to use MSI → PIRQ routing if APIC
> acceleration is enabled.
> 
> static void __init xen_hvm_msi_init(void)
> {
>         if (!apic_is_disabled) {
>                 /*
>                  * If hardware supports (x2)APIC virtualization (as indicated
>                  * by hypervisor's leaf 4) then we don't need to use pirqs/
>                  * event channels for MSI handling and instead use regular
>                  * APIC processing
>                  */
>                 uint32_t eax = cpuid_eax(xen_cpuid_base() + 4);
> 
>                 if (((eax & XEN_HVM_CPUID_X2APIC_VIRT) && x2apic_mode) ||
>                     ((eax & XEN_HVM_CPUID_APIC_ACCESS_VIRT) && boot_cpu_has(X86_FEATURE_APIC)))
>                         return;
>         }
>         xen_setup_pci_msi();
> }
> 
> > > It has also been reported to not work properly with certain devices, at least
> > > when using some AMD GPUs Linux attempts to route interrupts over event
> > > channels, but Xen doesn't correctly detect such routing, which leads to the
> > > hypervisor complaining with:
> > > 
> > > (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> > > 
> > > When MSIs are attempted to be routed over event channels the entry delivery
> > > mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> > > inject the interrupt following the native MSI path, and the ExtINT delivery
> > > mode is not supported.
> > 
> > Shouldn't this be properly addressed nevertheless? The way it's described
> > it sounds as if MSI wouldn't work at all this way; I can't spot why the
> > issue would only be "with certain devices". Yet that in turn doesn't look
> > to be very likely - pass-through use cases, in particular SR-IOV ones,
> > would certainly have noticed.
> 
> I agree. The MSI to PIRQ routing thing is *awful*, especially the way
> that Xen/QEMU snoops on writes to the MSI table while the target is
> *masked*, and then Xen unmasks the MSI instead of the guest doing so.
> 
> But it does work, and there are three implementations of it on the
> hypervisor side now (Xen itself, QEMU and the Nitro hypervisor).

There's only one implementation in Xen, that's split between the
hypervisor and QEMU.  IOW: it's not like the QEMU and the hypervisor
sides are independent.

It's also only used by Linux, I don't know of any other guest having
implemented support for them (thankfully I should say).

> We
> should fix the bug which is being reported, but I don't see why it's
> necessary to completely disable the feature.

It's not just this bug, the feature is fully undocumented, and every
time there's an issue reported against interrupt delivery on HVM Linux
we need to reverse engineer how this is supposed to work.

Not to mention the MSI breakage it introduces by re-using the MSI
data and address fields for Xen specific purposes.

Note that this commit is not removing the code, just disabling it by
default.  Users can still enable it using hvm_pirq option on xl.cfg
(and toolstacks can use the domctl create flag to enable it).

IMO if someone whats to make a case for having HVM PIRQs enabled by
default, we first need documentation about how it's supposed to work,
plus all the reported bugs fixed.  I have to admit I would probably be
reluctant to enable it by default even then.

Apart from the original issue, Xenia has also reported that when
having the option enabled they see some unexpected scheduling
imbalance, that's gone when the option is disabled:

https://lore.kernel.org/xen-devel/6fe776cd-3fa6-421f-9d02-9350e85d5612@amd.com/

Regards, Roger.

