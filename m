Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEDA3F6C7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 15:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894495.1303196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlTf5-0002Dz-Hs; Fri, 21 Feb 2025 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894495.1303196; Fri, 21 Feb 2025 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlTf5-0002BP-Eh; Fri, 21 Feb 2025 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 894495;
 Fri, 21 Feb 2025 14:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQ+l=VM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tlTf3-0002BJ-Lp
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 14:05:49 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f125ccc7-f05c-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 15:05:45 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-220ecbdb4c2so57286425ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 06:05:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73268d7d8b9sm11955138b3a.133.2025.02.21.06.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 06:05:43 -0800 (PST)
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
X-Inumbo-ID: f125ccc7-f05c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740146744; x=1740751544; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp30YvI6z2n7371TX0k71IiT76YP/Dc383I7XeFcYQk=;
        b=qKNHOJNtSyDktYjsgSyMIYJXniZdFpBSHWaUk7G0fyBSPPX/LNTO+KRgaMjL0dwbCY
         Dfd/NWQGEkjgWi9rio1fkkBEEo3Wip2lcRk3cZQ0XhBkq8hOxooCajeGPydrSZ89Q9gC
         JZjsY3zAiIU7F9nRNPSPI3IizsoPWUVVGkid4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740146744; x=1740751544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp30YvI6z2n7371TX0k71IiT76YP/Dc383I7XeFcYQk=;
        b=TKIhDoi60cLSHZSuS/W4uK7F9EVTkhdfMLVyam/+efFcQolHUp8Vgn5CrLUjQ6qmEf
         Q38V2xRezuelSbpJeRdsz68Qn1JIvECvy226/QezkYLzhieE4l6Z+afStPg+zeIBcgYP
         NC08rocp27b10/Wp2Oa0LOZ4YfM40hAF6zZc19fm1vUDxZsmm1RuohCZ86n1zj+QIhAX
         APa6IRuGtapJigiCaD5s0P45iUBsMU4eZsH1vLCx9g3WhmulDzOoPlPP8tEq9JdFMNcs
         TKFdXLadF/yJ3RbZWlRZh+sCLPGADJJOOYmpUfufR5/pJ8FuPFUXNQpfSvA00W4V9vuW
         Qf8g==
X-Forwarded-Encrypted: i=1; AJvYcCU538eoZbkyBqv0kzpJqdroCjplDBEWxKzg+OKPFOvEroNDoteTcutb0FvsSXokbsVIsjUEN4K7KaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy2CBOVbTKrgGffituqvHczvuXIpOnJbCDhGOBb7Nhg6XzvDZY
	4wEkd/zgz2/rtjImOhS2XEonDbZ27x/FE8rZre3+Lu5O1eJHg+7ELF3/8fNiaBo=
X-Gm-Gg: ASbGncsbcM56t/712a1pX1d9H16s1mrx8WyHWDsC2PSVWqMPEZnPHmaWvfpDUA70lAm
	sxaM783+2/JmS0wtsIyMXfOLcRZczUYMthJdNPkJV7ZgdQpJsNUJkqWlK5ySKug8TiGsc0AtIqK
	E33AQ8SDBTXE24vKf3Xtclxz8rFwI9E1vXMuArnSrM8ibmlp965qSLZANDR8wHJUAWzCTSHDRlW
	XPE4lf6F+LduVRdM+e3bg9EtDwWTQSFaeHAlYyLjW9fxPfAPWlhXXslkxkknDYZyWjd3+PaQ/rh
	23pm3rY10e5n5nwEjG/0qlA/HuHEPYo=
X-Google-Smtp-Source: AGHT+IHbcyQBIITODPWByQlNHrsYaSvGX054aYB5T+wKR+9Os9Kuz7fVoMhkkATpr5mPovoMenTABg==
X-Received: by 2002:a05:6a00:14cb:b0:732:516f:21fa with SMTP id d2e1a72fcca58-73426cf11f6mr5309998b3a.14.1740146743820;
        Fri, 21 Feb 2025 06:05:43 -0800 (PST)
Date: Fri, 21 Feb 2025 15:05:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Message-ID: <Z7iIMgnBKwzYkYwq@macbook.local>
References: <20250221120417.20431-1-roger.pau@citrix.com>
 <6e24ee01-9b07-4180-9430-7b5ce949d140@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e24ee01-9b07-4180-9430-7b5ce949d140@suse.com>

On Fri, Feb 21, 2025 at 01:44:00PM +0100, Jan Beulich wrote:
> On 21.02.2025 13:04, Roger Pau Monne wrote:
> > The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
> > Currently Linux is unconditionally attempting to read the MSR without a
> > safe MSR accessor, and since Xen doesn't allow access to it Linux reports
> > the following error:
> > 
> > unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
> > Call Trace:
> >  <TASK>
> >  ? ex_handler_msr+0x11e/0x150
> >  ? fixup_exception+0x81/0x300
> >  ? exc_general_protection+0x138/0x410
> >  ? asm_exc_general_protection+0x22/0x30
> >  ? xen_do_read_msr+0x7f/0xa0
> >  xen_read_msr+0x1e/0x30
> >  amd_get_mmconfig_range+0x2b/0x80
> >  quirk_amd_mmconfig_area+0x28/0x100
> >  ? quirk_system_pci_resources+0x2b/0x150
> >  pnp_fixup_device+0x39/0x50
> >  __pnp_add_device+0xf/0x150
> >  pnp_add_device+0x3d/0x100
> >  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
> >  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
> >  ? acpi_walk_resources+0xbb/0xd0
> >  pnpacpi_add_device_handler+0x1f9/0x280
> >  acpi_ns_get_device_callback+0x104/0x1c0
> >  ? _raw_spin_unlock_irqrestore+0x18/0x20
> >  ? down_timeout+0x3a/0x60
> >  ? _raw_spin_lock_irqsave+0x14/0x40
> >  acpi_ns_walk_namespace+0x1d0/0x260
> >  ? _raw_spin_unlock_irqrestore+0x18/0x20
> >  ? __pfx_acpi_ns_get_device_callback+0x10/0x10
> >  acpi_get_devices+0x8a/0xb0
> >  ? __pfx_pnpacpi_add_device_handler+0x10/0x10
> >  ? __pfx_pnpacpi_init+0x10/0x10
> >  pnpacpi_init+0x50/0x80
> >  do_one_initcall+0x46/0x2e0
> >  kernel_init_freeable+0x1da/0x2f0
> >  ? __pfx_kernel_init+0x10/0x10
> >  kernel_init+0x16/0x1b0
> >  ret_from_fork+0x30/0x50
> >  ? __pfx_kernel_init+0x10/0x10
> >  ret_from_fork_asm+0x1b/0x30
> >  </TASK>
> 
> Across all the halfway recent Linux versions I've never seen this. The MSR
> access therefore can't be entirely unconditional, I expect. Or is this new
> in 6.14, which I haven't tried yet?

Hm, no, the above report is from 6.6.  It is gated on the presence of
a device with PnP ID "PNP0c01", which triggers the execution of the
quirk_amd_mmconfig_area() function.  Such PnP ID seems to be "System
Board".  The system is currently busy, so I can't gather more
information about the device that triggers it.  The issue was
originally seem on a Dell system with AMD Naples (Zen) CPU (possibly
other CPUs also, that's the one I tested the fix on).

> > Fix by allowing access to the MSR on AMD systems, returning 0 for
> > unprivileged domains (MMIO configuration space disabled), and the native
> > value for the hardware domain.
> > 
> > The non hardware domain logic will need to be adjusted if in the future we
> > expose an MCFG region to such domains.
> > 
> > Write attempts to the MSR will still result in #GP for all domain types.
> > 
> > Fixes: 84e848fd7a16 ('x86/hvm: disallow access to unknown MSRs')
> > Fixes: 322ec7c89f66 ('x86/pv: disallow access to unknown MSRs')
> 
> Hmm, if we consider this a bug fix, then perhaps we'd need to go quite a bit
> farther with what MSRs we permit at least read access for. More generally in
> this event I'd wonder whether for any MSR that's in principle writable we
> shouldn't silently ignore same-value writes.

Yeah, I also wondered whether to silently ignore writes of the same
value.  I would initially leave as-is initially.

Thanks, Roger.

