Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13398A27096
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881364.1291499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHNe-0000Ac-Nw; Tue, 04 Feb 2025 11:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881364.1291499; Tue, 04 Feb 2025 11:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHNe-00008w-KR; Tue, 04 Feb 2025 11:46:14 +0000
Received: by outflank-mailman (input) for mailman id 881364;
 Tue, 04 Feb 2025 11:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNR/=U3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tfHNd-00008p-IW
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:46:13 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04f39e0-e2ed-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 12:46:10 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso128148495ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 03:46:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f07be072csm9615675ad.45.2025.02.04.03.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:46:08 -0800 (PST)
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
X-Inumbo-ID: a04f39e0-e2ed-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738669569; x=1739274369; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq57r6kNcS6wb6jppn0AlntpkLdWOT/wW/pISE9ulzk=;
        b=fJLaxRc3lV4xxbrYLYhubAUc28UT99NfkEy5P0Ef00zYg1Q+88arqD5gJpJmSyDNfY
         XtrDU+99xyjR6s9f9RclouZZOowD78yleSi9IaWYeYFVM7wCLDgm4G2OVhoifn1o12jV
         BL7OAU7/Lx8kEzQyp9PZNiLl1hPrrYLY+8VO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669569; x=1739274369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq57r6kNcS6wb6jppn0AlntpkLdWOT/wW/pISE9ulzk=;
        b=EfFQdEDOVaMk3Btp22yMle9CoIIvtXxmM6DqSHHEcFyRL6vIwgDBXLInP5HWBXIQTW
         oRybJf9PxRkW3FPi605GrSvd9ocPJQrT5GeqvPjDTNKMJMlRhBGmatZw2n4kLJdFWlCT
         h1yWbN7z9Ct/EKLq5SmhIijnc9ARxU23hGRv56c/8OpCp1+YtIlfaKjWkXqNyUaWeRkp
         08BD9FwPi1ZJvTNqwRzXusNTw1v6aTkrcPxo58BjcHREHiYVXXYrLfokSIZTafmgzymJ
         X8CwqeOn417BDFhYWz3Kq0FxR+zfu95PmVWX6Q2FKTI1yNvXi7Dj/X4Aur2IIEnI7C2n
         g7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFKzKWn9QTmlrvYV0+b42TsKrd75Kj0f4e9Lx1fnVnR6yPqVfkiDtkvijNCKzAv+khlyZx2wdm5jI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+Rh8uukqY0lmj1bEza9RWgRBGvs2am6Vq+20dBMqaaaOydNXP
	RouiE21/UlWltxWTwgCWkfRCayf4aI0RT/XYpzhAs4wvYhrpEpxHqiq9oIv/10U=
X-Gm-Gg: ASbGncus9IcVgSXe7sRlIDYutplgkQh1wAomQMCcEVZyzmDx2bya2xsr1P26w1bZG3+
	GTcJ135VHVSZ7jO+M62k15bS43nBJIm8L3EbyXiplNQ/FMnOxilFe9xVQcih1sAyzJ5rAem1N/y
	dEgBHwEhgc8LAThcYuMcGNCUBATPM2vx9HWyES5pBhG1SUWIV31IoBEhzwjsb8xsEsgHCVtwCXu
	gJj9IcFLjDfFPcRyzh5ljP2lAPfOyl5+rolr6hnH7OW5ywl9RLh54vIMMxVGY/ej6eUaI2m4BGj
	SHa9TqI7xMxSWb0H9UOj
X-Google-Smtp-Source: AGHT+IFWyrk86XLj7GWkYvLSwZGgEm+xyTGdFMLGBM7S4jTF/oPlKp9a4rjdcEesIHXi8b+pemcexw==
X-Received: by 2002:a17:902:f70c:b0:21d:3bee:990c with SMTP id d9443c01a7336-21dd7de15b4mr395852375ad.42.1738669568927;
        Tue, 04 Feb 2025 03:46:08 -0800 (PST)
Date: Tue, 4 Feb 2025 12:46:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20 1/2] x86/shutdown: quiesce devices ahead of AP
 shutdown
Message-ID: <Z6H9-9QyJOsN0gft@macbook.local>
References: <20250128162742.90431-1-roger.pau@citrix.com>
 <20250128162742.90431-2-roger.pau@citrix.com>
 <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>

On Wed, Jan 29, 2025 at 11:13:09AM +0100, Jan Beulich wrote:
> On 28.01.2025 17:27, Roger Pau Monne wrote:
> > The current shutdown logic in smp_send_stop() will first disable the APs,
> > and then attempt to disable (some) of the interrupt sources.
> > 
> > There are two issues with this approach; the first one being that MSI
> > interrupt sources are not disabled, the second one is the APs are stopped
> > before interrupts are disabled.  On AMD systems this can lead to the
> > triggering of local APIC errors:
> > 
> > APIC error on CPU0: 00(08), Receive accept error
> > 
> > Such error message can be printed in a loop, thus blocking the system from
> > rebooting.  I assume this loop is created by the error being triggered by
> > the console interrupt, which is further triggered by the ESR reporting
> > write to the console.
> > 
> > Intel SDM states:
> > 
> > "Receive Accept Error.
> > 
> > Set when the local APIC detects that the message it received was not
> > accepted by any APIC on the APIC bus, including itself. Used only on P6
> > family and Pentium processors."
> > 
> > So the error shouldn't trigger on any Intel CPU supported by Xen.
> > 
> > However AMD doesn't make such claims, and indeed the error is broadcasted
> > to all local APIC when for example an interrupt targets a CPU that's
> > offline.
> > 
> > To prevent the error from triggering, move the masking of IO-APIC pins
> > ahead of stopping the APs.  Also introduce a new function that disables
> > MSI and MSI-X on all PCI devices.  Remove the call to fixup_irqs() since
> > there's no point in attempting to move interrupts: all sources will be
> > either masked or disabled.
> > 
> > For the NMI crash path also call the newly introduced function, with the
> > hope that disabling MSI and MSI-X will make it easier for the (possible)
> > crash kernel to boot, as it could otherwise receive the same "Receive
> > accept error" upon re-enabling interrupts.
> > 
> > Note that this will have the side-effect of preventing further IOMMU
> > interrupts from being delivered, that's expected and at that point in the
> > shutdown process no further interaction with the IOMMU should be relevant.
> 
> This is at most for AMD only. Shouldn't we similarly disable VT-d's
> interrupt(s)? (It's only one right now, as we still don't use the QI
> completion one.) Even for AMD I'm uncertain: It has separate
> hw_irq_controller instances, and its set_iommu_interrupt_handler() is
> custom as well. Will pci_disable_msi_all() really affect it? (Hmm,
> yes, from amd_iommu_msi_enable() it looks like it will.)

I was only partly right, the XT interrupt type will still need to be
disabled in a custom way, as there's no associated MSI(-X) capability
in that case.

> 
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -1248,6 +1248,20 @@ void pci_cleanup_msi(struct pci_dev *pdev)
> >      msi_free_irqs(pdev);
> >  }
> >  
> > +static int cf_check disable_msi(struct pci_dev *pdev, void *arg)
> > +{
> > +    msi_set_enable(pdev, 0);
> > +    msix_set_enable(pdev, 0);
> > +
> > +    return 0;
> > +}
> > +
> > +void pci_disable_msi_all(void)
> > +{
> > +    /* Disable MSI and/or MSI-X on all devices. */
> > +    pci_iterate_devices(disable_msi, NULL);
> > +}
> 
> That's going to be all devices we know of. I.e. best effort only. Maybe
> the comment should be adjusted to this effect.

Sure.

> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -358,14 +358,15 @@ void smp_send_stop(void)
> >  {
> >      unsigned int cpu = smp_processor_id();
> >  
> > +    local_irq_disable();
> > +    disable_IO_APIC();
> > +    pci_disable_msi_all();
> > +    local_irq_enable();
> > +
> >      if ( num_online_cpus() > 1 )
> >      {
> >          int timeout = 10;
> >  
> > -        local_irq_disable();
> > -        fixup_irqs(cpumask_of(cpu), 0);
> > -        local_irq_enable();
> > -
> >          smp_call_function(stop_this_cpu, NULL, 0);
> >  
> >          /* Wait 10ms for all other CPUs to go offline. */
> > @@ -376,7 +377,6 @@ void smp_send_stop(void)
> >      if ( cpu_online(cpu) )
> >      {
> >          local_irq_disable();
> > -        disable_IO_APIC();
> >          hpet_disable();
> 
> Like IOMMUs, HPET also has custom interrupt management. I think this
> call needs pulling up, too (much like it is also there in
> nmi_shootdown_cpus()).

Indeed, I wasn't taking into account the FSB capability.

> 
> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -1803,6 +1803,38 @@ int iommu_do_pci_domctl(
> >      return ret;
> >  }
> >  
> > +struct segment_iter {
> > +    int (*handler)(struct pci_dev *pdev, void *arg);
> > +    void *arg;
> > +};
> > +
> > +static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
> > +{
> > +    const struct segment_iter *iter = arg;
> > +    struct pci_dev *pdev;
> > +
> > +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> > +    {
> > +        int rc = iter->handler(pdev, iter->arg);
> > +
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
> > +                        void *arg)
> > +{
> > +    struct segment_iter iter = {
> > +        .handler = handler,
> > +        .arg = arg,
> > +    };
> > +
> > +    return pci_segments_iterate(iterate_all, &iter);
> > +}
> 
> For the specific purpose during shutdown it may be okay to do all of this
> without locking (but see below) and without preemption checks. Yet then a
> warning will want putting here to indicate that from other environments
> this isn't okay to use as-is.
> 
> This use then also requires that msi{,x}_set_enable() paths never gain
> lock-related assertions.

Good point.  It might be better to just wrap the code in
pci_iterate_devices() with pcidevs_{,un}lock().

> Talking of the lack of locking: Since you invoke the disabling before
> bringing down APs, we're ending up in kind of a chicken and egg problem
> here: Without APs quiesced, there may be operations in progress there
> which conflict with the disabling done here. Hence why so far we brought
> down APs first.

I could implement a synchronized approach with the BSP only doing the
interrupt disabling after the APs are in stop_this_cpu() with
interrupts disabled, but before the calling __stop_this_cpu().

My thinking for doing it the proposed way is that MSI(-X) capability
enable is not toggled by Xen as part of interrupt handling, and hence
there should be no intent to enable the capabilities back after being
disabled by the BSP.

> With this special-purpose use I further wonder whether iterate_all()
> wouldn't better continue despite an error coming back from a callback
> (and also arrange for pci_segments_iterate() to continue, by merely
> recording any possible error in struct segment_iter), and only accumulate
> the error code to eventually return. The more devices we manage to
> quiesce, the better our chances of rebooting cleanly.

Fair enough, will do.

Thanks, Roger.

