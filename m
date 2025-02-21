Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A8A3F67B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 14:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894485.1303186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlTSb-0000Fz-Ey; Fri, 21 Feb 2025 13:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894485.1303186; Fri, 21 Feb 2025 13:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlTSb-0000Dl-C8; Fri, 21 Feb 2025 13:52:57 +0000
Received: by outflank-mailman (input) for mailman id 894485;
 Fri, 21 Feb 2025 13:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQ+l=VM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tlTSZ-0000Df-Qm
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 13:52:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 258376ab-f05b-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 14:52:53 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso375524166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 05:52:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbb860fc11sm726812466b.124.2025.02.21.05.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 05:52:52 -0800 (PST)
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
X-Inumbo-ID: 258376ab-f05b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740145973; x=1740750773; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GwMTn584G9HE74yTNEdXOe+qvf1KyC0S+GD83xNay8I=;
        b=YU4jfmsW/D5iuQxyBwIWefDlln7saLFuFnyKDS5oWA55v6YhPBZjiwRVl1YfwtCGNe
         a4xQ14jUpqJUykeuK3/18MvdaGI688g/UrkSZAZfdCh630fC8taq49u3/ijJwqMMeSz+
         yBZpRlkfT2LaEFplIRQ2cvPiHYwvc1ppEDhX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740145973; x=1740750773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwMTn584G9HE74yTNEdXOe+qvf1KyC0S+GD83xNay8I=;
        b=jJRZJ4Cakc/v0tWKh+P0EM8YqurdRx8LkatmmjdB7zTnnq1DDHFXTyzSlYjEx9H+22
         D0FhIKh8RFtQ4FvsbOsSmetk9BUyk1W42sDSFnhXu3Ru3K6bA2PYzhz9tlHLw7+N4El0
         7OOJzTDG78jlI3XbpiL0qp7Ze7r5FB2MZ28iJ7oBuIUzr1XV4WYzE4dbRyJX8N1S3RvG
         Vr+2FYJ5WLLL9n7gtKlzutq8LK/idvYYIYMqQNkkrBY46PCt7C+HI6tPNe4LpGLMc8X9
         a9902XgFM3BWs9+ytK04D2zN0iFyZkIYVlTUJzE3zQr0lU7YiElqBApRLhimBtwe33xh
         MH+g==
X-Gm-Message-State: AOJu0Yzd1One66P8KY5RBOinteVa/BSgJzvJ400TniFqFXnaoAL7qo/m
	8s05h29DGPVReFY6ZU1hTMm+mozaWdZPHnX2qqyCP1I+g/wqiPvfpKHRxUbXxvg=
X-Gm-Gg: ASbGncsH+2T32eyanAewGeW4ueZ5Vp0kGSGXpsjZrnFT8im7RFX2OMpDQdKbsUPpC18
	UwbnKjokvqKQtNDk6YbMPSmUOS5+lef408ZK53CNeb95LpiL5LisBSpnvmN4ZWOndnWvZj/Fi+H
	Vywx33jCTCvq7L7nGkqjQ9xGSYZf0BtfD64boeBMlBKKzC3lC+3Rqu+UzT8S2VyP9HvFp1241Gx
	5VxyuVl5I6zfn5kGuPY9T1ziht6HCtgkoM7KCut/7596s7aXFgGgPLcv6X5HbPVGATzg0Nh6M6i
	Y0cY2uxWwq39CtyfxpF9XM5Mg8KzsWI=
X-Google-Smtp-Source: AGHT+IHEDYW13KcET6JqPXYaRPatfFvN4sh12rUZD4uKTs9DAoCyl5MqD0oU/YgNapqch7RGMLREOg==
X-Received: by 2002:a17:907:3f20:b0:ab7:b928:1e05 with SMTP id a640c23a62f3a-abc0d997aafmr291266766b.4.1740145972898;
        Fri, 21 Feb 2025 05:52:52 -0800 (PST)
Date: Fri, 21 Feb 2025 14:52:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
Message-ID: <Z7iFM_49F47St5gZ@macbook.local>
References: <20250221120417.20431-1-roger.pau@citrix.com>
 <30a21ae6-14a0-4069-a715-e8b906169199@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30a21ae6-14a0-4069-a715-e8b906169199@citrix.com>

On Fri, Feb 21, 2025 at 12:34:21PM +0000, Andrew Cooper wrote:
> On 21/02/2025 12:04 pm, Roger Pau Monne wrote:
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
> >
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
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/msr.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index 289cf10b783a..c588c9131337 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -245,6 +245,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          *val = 0;
> >          break;
> >  
> > +    case MSR_FAM10H_MMIO_CONF_BASE:
> > +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> > +            goto gp_fault;
> > +
> > +        /*
> > +         * Report MMIO configuration space is disabled unconditionally for
> > +         * domUs, as the emulated chipset doesn't support ECAM.  For dom0
> > +         * return the hardware value.
> > +         */
> > +        *val = 0;
> > +        if ( is_hardware_domain(d) && rdmsr_safe(msr, *val) )
> > +            goto gp_fault;
> > +
> > +        break;
> > +
> >      case MSR_VIRT_SPEC_CTRL:
> >          if ( !cp->extd.virt_ssbd )
> >              goto gp_fault;
> 
> Looking at the linux code, can we not fix this just by turning it into a
> rdmsr_safe(), noting that not all hypervisors virtualise this MSR?

Well, for dom0 it would be best if we expose it.  For domU it would be
fine to use rdmsr_safe() in Linux.

> Given the number of VMs which genuinely don't have PCI (emulated or
> otherwise), it's a buggy assumption in Linux.

I think we need to expose for the hardware domain, at which point
returning all 0s for domUs is kind of a very small nit.

I agree that Linux should use rdmsr_safe(), I can send a patch to that
effect, but I still think there's no harm in returning all 0s on domUs
instead of #GP.

Thanks, Roger.

