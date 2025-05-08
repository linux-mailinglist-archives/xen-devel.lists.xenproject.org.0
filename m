Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29257AAF669
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979100.1365806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxJ1-0002tH-78; Thu, 08 May 2025 09:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979100.1365806; Thu, 08 May 2025 09:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxJ1-0002ri-4N; Thu, 08 May 2025 09:12:39 +0000
Received: by outflank-mailman (input) for mailman id 979100;
 Thu, 08 May 2025 09:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCxJ0-0002rc-Ar
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:12:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c502f3-2bec-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 11:12:35 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso8551565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 02:12:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b0dffaa1sm7640390f8f.31.2025.05.08.02.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:12:34 -0700 (PDT)
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
X-Inumbo-ID: 94c502f3-2bec-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746695555; x=1747300355; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tTzO1n509S/7TZQBMtgevWvsDffCoLbD3fYFzoPqUQ=;
        b=ZvVFb8XlkiJX4AVrr8hLiNBko8vDENxa47DWcdqTqbtM9aJMs6x5mPIHrxKye1OIdz
         BDofec9HXHszrITbZBQoaE2rSeuS8ADDLEVdN44OGyRSV7XMwjPEJ1s0Cy/lZHIgkVLK
         Hz50mP65Afqq23Dy+a+Rm0V0yCxBJjxBPMquc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695555; x=1747300355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tTzO1n509S/7TZQBMtgevWvsDffCoLbD3fYFzoPqUQ=;
        b=OAaWQc7SDzYmbUdPoEvq2k0s4AcpF9Jvk/ScS63MAejwkA2jex7Utsc0REJeerwtDF
         d5jcDxjsQjMXfeq8iUZCGY7RKW3BMQPJw/MfbXDok/esIdQeXgAD7vZYKWE/GCxL6LFn
         hdobZZ/3Nd3VyS0rqSmnJ8HdIdHrgEZZoIuZS3h0AjxFIA56N+4YYKFyg41zX00YPFa4
         d0pfQWXTpyxKq+u7PdetVLREbmskvGwCY9qYYqbbaWqn85YQVLaC1eJNNVplA8fsc+CR
         rc1WJGFeQckjzJllBpS2aiXy2ISBbyJAl66aPAOWdgbmPGRZOLZ0H/Saau4RjS6/RtwN
         aOTg==
X-Forwarded-Encrypted: i=1; AJvYcCUh387JcuGBcx0zyEWcbH64N5b8v41StorHzv8TXiPlg5lr99bsjAPPg9BHnQJqdzubzco6dw2GLcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi8zIntQaMueTtkTb/gNZL5+Y43Ob0whShFNPTneMoO5H18M02
	Twoh8g514i/O9tEevZLhkcLTi0oznFf6FVNA+jpF/ePznjY7IONrpyCitiDtiIg=
X-Gm-Gg: ASbGncuW3CExOWP0HV0HtM/yePVcRWjB6Dgwr7BXSbGdM2CItljUpdX/Qc5PSLQqxz1
	r8fZ2Zno1UGe0bm8RF48M//mhXk+B73y0XPdaRlZgO1y1tW3wWIRi7XTmt9Z3CT159U8tk1xK5K
	J/K/UMxuywjh7+6yO6L1cuQa3pnqXVZr0WM9Zkumw64IOS6zLUwGpevH8QCm8ogXcbiBPoKejIR
	mvQQne+nwRCdwzKb6AyTaClT1ZLKsuic9fPrW0oXn7QZ/ReXsFdrLbQX6+c98JlbsGk0Sb7kT5j
	m2aaf+IM80fcqwgRILhv4GQvbV6IuTLrqMg3fNbIUw/RGfp7Rn/2yG8T
X-Google-Smtp-Source: AGHT+IEAbrIMXyDqEmQc6BJDtPUEVbovYPpPbaFNNIxNfDcgvYJvEgqYWCsK0lHZdO85NS8do7mMzw==
X-Received: by 2002:a05:600c:1d08:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-441d44c7d8cmr60332035e9.15.1746695555168;
        Thu, 08 May 2025 02:12:35 -0700 (PDT)
Date: Thu, 8 May 2025 11:12:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBx1gv6BXhZ0pSYt@macbook.lan>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl>
 <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
 <aBnOQyXSz-j33Wux@macbook.lan>
 <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop>

On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> On Tue, 6 May 2025, Roger Pau Monné wrote:
> > On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> > > On Mon, 5 May 2025, Roger Pau Monné wrote:
> > > > On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > > > > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > > > > 
> > > > > > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > > > > > addresses to firmware or co-processors not behind an IOMMU.
> > > > > > > 
> > > > > > > I definitely don't understand the firmware part: It's subject to the
> > > > > > > same transparent P2M translations as the rest of the VM; it's just
> > > > > > > another piece of software running there.
> > > > > > > 
> > > > > > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > > > > > concrete scenario might be nice, yet I realize you may be limited in
> > > > > > > what you're allowed to say.
> > > > > > 
> > > > > > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > > > > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > > > > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > > > > include/linux/psp-tee.h in Linux.
> > > > > 
> > > > > We had (have?) similar issue with amdgpu (for integrated graphics) - it
> > > > > uses PSP for loading its firmware. With PV dom0 there is a workaround as
> > > > > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> > > > > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> > > > > the one I used for debugging this issue).
> > > > 
> > > > That's ugly, and problematic when used in conjunction with AMD-SEV.
> > > > 
> > > > I wonder if Xen could emulate/mediate some parts of the PSP for dom0
> > > > to use, while allowing Xen to be the sole owner of the device.  Having
> > > > both Xen and dom0 use it (for different purposes) seems like asking
> > > > for trouble.  But I also have no idea how complex the PSP interface
> > > > is, neither whether it would be feasible to emulate the
> > > > interfaces/registers needed for firmware loading.
> > > 
> > > Let me take a step back from the PSP for a moment. I am not opposed to a
> > > PSP mediator in Xen, but I want to emphasize that the issue is more
> > > general and extends well beyond the PSP.
> > > 
> > > In my years working in embedded systems, I have consistently seen cases
> > > where Dom0 needs to communicate with something that does not go through
> > > the IOMMU. This could be due to special firmware on a co-processor, a
> > > hardware erratum that prevents proper IOMMU usage, or a high-bandwidth
> > > device that technically supports the IOMMU but performs poorly unless
> > > the IOMMU is disabled. All of these are real-world examples that I have
> > > seen personally.
> > 
> > I wouldn't be surprised, classic PV dom0 avoided those issues because
> > it was dealing directly with host addresses (mfns), but that's not the
> > case with PVH dom0.
> 
> Yeah
> 
> 
> > > In my opinion, we definitely need a solution like this patch for Dom0
> > > PVH to function correctly in all scenarios.
> > 
> > I'm not opposed to having such interface available for PVH hardware
> > domains.  I find it ugly, but I don't see much other way to deal with
> > those kind of "devices".  Xen mediating accesses for each one of them
> > is unlikely to be doable.
> > 
> > How do you hook this exchange interface into Linux to differentiate
> > which drivers need to use mfns when interacting with the hardware?
> 
> In the specific case we have at hands the driver is in Linux userspace
> and is specially-written for our use case. It is not generic, so we
> don't have this problem. But your question is valid.

Oh, so you then have some kind of ioctl interface that does the memory
exchange and bouncing inside of the kernel on behalf of the user-space
side I would think?

> In Linux, the issue is hidden behind drivers/xen/swiotlb-xen.c and
> xen_arch_need_swiotlb. There are a few options:
> - force swiotlb bounce for everything on the problematic SoC
> - edit xen_arch_need_swiotlb to return true for the problematic device
> - introduce a kernel command line option to specify which device
>   xen_arch_need_swiotlb should return true for

Isn't it a bit misleading to use the swiotlb for this purpose?  Won't
this usage of the swiotlb (to bounce from gfns to mfns) create issues
if there's any devices that have a DMA physical address limitation and
also needs to use the swiotlb while being behind the IOMMU?

> - introduce an ACPI table with the relevant info

Hm, best option might be an ACPI table so that Xen can signal to the
hardware domain whether communication with the device must be done
using mfns, or if accesses are mediated and hence can be done using
gfns?

It's a bit cumbersome however to have to resort to an ACPI table just
for this.  Not sure whether we could expand one of the existing tables
already under Xen control (STAO?) to contain this information.  It all
looks a bit ad-hoc.

I think we need some kind of list of devices that are not behind the
IOMMU, but I have no idea what URI to use to identify those.  I assume
the PSP doesn't have a PCI SBDF (as it's not on the PCI bus?).  Maybe
by ACPI path?

Or maybe it's fine to always communicate with those non-translated
devices using MFNs, and even if we later add some kind of PSP
mediation (so that both Xen and dom0 can use it), accesses by dom0
will still be assumed to be using MFNs, and thus need no translation.

Thanks, Roger.

