Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64222A21AD0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879014.1289225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td54N-0004SI-Tv; Wed, 29 Jan 2025 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879014.1289225; Wed, 29 Jan 2025 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td54N-0004PA-Qs; Wed, 29 Jan 2025 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 879014;
 Wed, 29 Jan 2025 10:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td54L-0004P4-Lk
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 10:13:13 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d6a173-de29-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 11:13:11 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so1283575466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 02:13:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6d9bfe8afsm11264766b.170.2025.01.29.02.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:13:10 -0800 (PST)
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
X-Inumbo-ID: a4d6a173-de29-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738145591; x=1738750391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dilwzZLmL6ENvq+ua7V+MRhIZ8PixkwHoP0NVF7nR1Y=;
        b=VCaeQZpMYsH6fagukdzqZ585i11cg0d67ISk+Qgaz8BcH79EZ+5IKxXaB2HRk0TCG8
         UCjV0/1f07tqIRAW+5oDFIhfAo8ZAOzo3+DBRYrf5G8Z0Uu/YNIy1jpkHET1v3QuxLqx
         uPberGyxrKFHoBA3l3RgLUfQ87hezJi+/3AebPyQsD4+XjnnqKSjW8KOGLOmfZD2qBtE
         319ylQqM4E2z2qKsU6dlD4v03hwxAkCb0lXUYx4P7g/oSMl5AHfxEgFBPNsqMH2kl2UR
         DJdZspYrqLIM28of3Bs0Y8zmRQjftI3XnZreMmYigEuKpfTdf68XyHsiOYeugRGafv2R
         i9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145591; x=1738750391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dilwzZLmL6ENvq+ua7V+MRhIZ8PixkwHoP0NVF7nR1Y=;
        b=b0kkcZmBhAhB0l5Q+0RtBENp4R2yFphkdflWt9s5AWbz90B49v1H1gdKfYdwf/8Q/B
         o7ZeeJre7soeemTGJd/GqbXimq+zrTkVKLFYn7ZVGwaa2xsxfpzzf8UOrB7MrsBF+DFq
         fbeZ9MyJ1yYXoXZobwfEJV/qRuMzWlpxRgjG5XhE8gLkAD40MB1rXwTHIiWTYR7f6mOj
         3jJbSiRNDfXR+bY9ZbSNu6hp8DtyJ/goya+n13yS3NcEsnqqVCwWjlb8mkZNHQzbky/W
         Dc+PVKerI4XPaxjWJaiKkgbDpsfWgpobgswl53/eO0zVeTF7FfyFxgIPNJFx38szw8a2
         9XaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/mYB2KLd1pqUHEB9xIVnjy8Q6EkYZtTb2VyDEC7/XdP8/NAyoP801Xe145W6a5iSQnfgzLANr0ns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySz/W1SBtxeOI5x0E6iyIa5vmmZdRO4C0nwBCGHHD76Eb5mVA5
	7Dk5IaRPsI++RsgvEhlfygkHt8zOf+jg0/MNCJ33XXjQCQdlEC8CjnZSZaG2Mg==
X-Gm-Gg: ASbGncv8WiXI3yCNCkQ3w9RBBFXlCt01BqETdQ+Sybg2mDkAjyF5q4fZNKz9/FoEva0
	3s08M1BuWf8OaxDZY2jrypO7aQQnAXGwJZ5RmatVzbhY/RlXnthqm1Id1QG7/soxbOLXuziwBcT
	/4X6WbbcPZVTahcPCm9E76wzha+ZkOdhWVycP1f+VyamYOa0kzGyqCFJQePKszLtEvDb4Aucex8
	G00weukdxH/MC5X8ZyeO9hq7opCXgpeXwH1yw3fF2M8gz9m+WdKzJk5NRUV0Tvhw6eNtK2NbZ+p
	Qn0OE3r419L0v5XQYtXsdkfH9opGjfUt/zewUr1Is64WS6yaOoHjOeqGAaR3CqmqxaXfbJBkigs
	4
X-Google-Smtp-Source: AGHT+IF4QIe+XNr/oYfnDUlpfDxewrC3a2lA6mEh6XMvW0iWkkdeY84eTQd6eTRDZucJVtDyhjfARQ==
X-Received: by 2002:a17:907:1c07:b0:aa6:834b:d136 with SMTP id a640c23a62f3a-ab6cfd10a0dmr269337866b.33.1738145590691;
        Wed, 29 Jan 2025 02:13:10 -0800 (PST)
Message-ID: <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>
Date: Wed, 29 Jan 2025 11:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 1/2] x86/shutdown: quiesce devices ahead of AP
 shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250128162742.90431-1-roger.pau@citrix.com>
 <20250128162742.90431-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250128162742.90431-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.01.2025 17:27, Roger Pau Monne wrote:
> The current shutdown logic in smp_send_stop() will first disable the APs,
> and then attempt to disable (some) of the interrupt sources.
> 
> There are two issues with this approach; the first one being that MSI
> interrupt sources are not disabled, the second one is the APs are stopped
> before interrupts are disabled.  On AMD systems this can lead to the
> triggering of local APIC errors:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Such error message can be printed in a loop, thus blocking the system from
> rebooting.  I assume this loop is created by the error being triggered by
> the console interrupt, which is further triggered by the ESR reporting
> write to the console.
> 
> Intel SDM states:
> 
> "Receive Accept Error.
> 
> Set when the local APIC detects that the message it received was not
> accepted by any APIC on the APIC bus, including itself. Used only on P6
> family and Pentium processors."
> 
> So the error shouldn't trigger on any Intel CPU supported by Xen.
> 
> However AMD doesn't make such claims, and indeed the error is broadcasted
> to all local APIC when for example an interrupt targets a CPU that's
> offline.
> 
> To prevent the error from triggering, move the masking of IO-APIC pins
> ahead of stopping the APs.  Also introduce a new function that disables
> MSI and MSI-X on all PCI devices.  Remove the call to fixup_irqs() since
> there's no point in attempting to move interrupts: all sources will be
> either masked or disabled.
> 
> For the NMI crash path also call the newly introduced function, with the
> hope that disabling MSI and MSI-X will make it easier for the (possible)
> crash kernel to boot, as it could otherwise receive the same "Receive
> accept error" upon re-enabling interrupts.
> 
> Note that this will have the side-effect of preventing further IOMMU
> interrupts from being delivered, that's expected and at that point in the
> shutdown process no further interaction with the IOMMU should be relevant.

This is at most for AMD only. Shouldn't we similarly disable VT-d's
interrupt(s)? (It's only one right now, as we still don't use the QI
completion one.) Even for AMD I'm uncertain: It has separate
hw_irq_controller instances, and its set_iommu_interrupt_handler() is
custom as well. Will pci_disable_msi_all() really affect it? (Hmm,
yes, from amd_iommu_msi_enable() it looks like it will.)

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -1248,6 +1248,20 @@ void pci_cleanup_msi(struct pci_dev *pdev)
>      msi_free_irqs(pdev);
>  }
>  
> +static int cf_check disable_msi(struct pci_dev *pdev, void *arg)
> +{
> +    msi_set_enable(pdev, 0);
> +    msix_set_enable(pdev, 0);
> +
> +    return 0;
> +}
> +
> +void pci_disable_msi_all(void)
> +{
> +    /* Disable MSI and/or MSI-X on all devices. */
> +    pci_iterate_devices(disable_msi, NULL);
> +}

That's going to be all devices we know of. I.e. best effort only. Maybe
the comment should be adjusted to this effect.

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -358,14 +358,15 @@ void smp_send_stop(void)
>  {
>      unsigned int cpu = smp_processor_id();
>  
> +    local_irq_disable();
> +    disable_IO_APIC();
> +    pci_disable_msi_all();
> +    local_irq_enable();
> +
>      if ( num_online_cpus() > 1 )
>      {
>          int timeout = 10;
>  
> -        local_irq_disable();
> -        fixup_irqs(cpumask_of(cpu), 0);
> -        local_irq_enable();
> -
>          smp_call_function(stop_this_cpu, NULL, 0);
>  
>          /* Wait 10ms for all other CPUs to go offline. */
> @@ -376,7 +377,6 @@ void smp_send_stop(void)
>      if ( cpu_online(cpu) )
>      {
>          local_irq_disable();
> -        disable_IO_APIC();
>          hpet_disable();

Like IOMMUs, HPET also has custom interrupt management. I think this
call needs pulling up, too (much like it is also there in
nmi_shootdown_cpus()).

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1803,6 +1803,38 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +struct segment_iter {
> +    int (*handler)(struct pci_dev *pdev, void *arg);
> +    void *arg;
> +};
> +
> +static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
> +{
> +    const struct segment_iter *iter = arg;
> +    struct pci_dev *pdev;
> +
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        int rc = iter->handler(pdev, iter->arg);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
> +                        void *arg)
> +{
> +    struct segment_iter iter = {
> +        .handler = handler,
> +        .arg = arg,
> +    };
> +
> +    return pci_segments_iterate(iterate_all, &iter);
> +}

For the specific purpose during shutdown it may be okay to do all of this
without locking (but see below) and without preemption checks. Yet then a
warning will want putting here to indicate that from other environments
this isn't okay to use as-is.

This use then also requires that msi{,x}_set_enable() paths never gain
lock-related assertions.

Talking of the lack of locking: Since you invoke the disabling before
bringing down APs, we're ending up in kind of a chicken and egg problem
here: Without APs quiesced, there may be operations in progress there
which conflict with the disabling done here. Hence why so far we brought
down APs first.

With this special-purpose use I further wonder whether iterate_all()
wouldn't better continue despite an error coming back from a callback
(and also arrange for pci_segments_iterate() to continue, by merely
recording any possible error in struct segment_iter), and only accumulate
the error code to eventually return. The more devices we manage to
quiesce, the better our chances of rebooting cleanly.

Jan

