Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79218C1E57
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 08:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719530.1122318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5K1M-0003pV-3G; Fri, 10 May 2024 06:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719530.1122318; Fri, 10 May 2024 06:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5K1M-0003n9-0O; Fri, 10 May 2024 06:46:20 +0000
Received: by outflank-mailman (input) for mailman id 719530;
 Fri, 10 May 2024 06:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5K1L-0003n3-5M
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 06:46:19 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c71e91-0e99-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 08:46:17 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so1799590e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 23:46:17 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb660sm1526751a12.36.2024.05.09.23.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 23:46:16 -0700 (PDT)
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
X-Inumbo-ID: 00c71e91-0e99-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715323577; x=1715928377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXiDu9fHyqu4n99SnTsmyeycGZXOyLvOeHSQ/rJF36g=;
        b=emQlZ/CQwZxSDNXqe0MI/11X+BjQak2a+PAdDfs/5wXFAXG5zUmn1rGKB6ULHcLGni
         rRM7XYS04E74bgBnCnxoKDXAtJ8bkceUDC5U8IU0zMSAZ/b1ws9pIEkqo1Z0O7ckwibD
         B2TTsd+6MrRcQPnv0JHSdFVbNpkZnMbd3DM2h7Ib3V4fjaCwD9B0RKBVCqNjhJelliaL
         +CXjTjXGi52fzjRp8g0FGoqTHAdwHBYWA1xcPNuOw2mMtnh5chcsqx6vtVn22s6H4SZo
         ttwgZjnNRsHBXFaFl9G2QZmvVTPtWk2GvulC/4BiOybB+qgdIfxvYT9kyRGk4TEI3Ivf
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715323577; x=1715928377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXiDu9fHyqu4n99SnTsmyeycGZXOyLvOeHSQ/rJF36g=;
        b=sOn77v/uQoE4Aj5ZjrlU+UMJJkOC5iqSMvyWzgR+CLjBEFt+afswGLcDwM+LdlhJci
         hlSx0TppH7VsLTGmfd9z3iPxtdZvQriL3gMPWL1o+Q6lW+unAG5v2QdYpLg2aNIyV+kl
         Bh4U5a7wjjtELeRreUT4aGdgVeRkpt3NEg2dLUj1seSCgfmA7SQ5BQEvtApOrRhmGMat
         UrCEqHL1XIRbqHB6i8CGnAzodjfbhbBauxbAQn2tiqrrkf2TRmgMQgpu/6PhOIRbPwqr
         gtQysADZbedydKqIPpUonn/pCshF2EbUJmwrFdDr9vOgD6mh33LRUv8TSYjg6xQpwWH5
         IUFA==
X-Gm-Message-State: AOJu0YyA84EjC38fmxra9tPtKSDAu4x8DPx400fcVXIOUpolA5hbSJlQ
	OVr/0rJfEnrBtqLK9541JhStJo7qwQVH9YBEBYh/XUJnYSBPrItyAB8tbuzq7zU=
X-Google-Smtp-Source: AGHT+IFqK/cSOVqRKoyq3BVFcNHdx6Uad4d+cjVO+0R0aeAeSJBQPqsxX5qu4tubXu8bA2FhNXUVRg==
X-Received: by 2002:ac2:4437:0:b0:519:2d60:d71b with SMTP id 2adb3069b0e04-5220fb748e2mr967415e87.22.1715323577232;
        Thu, 09 May 2024 23:46:17 -0700 (PDT)
Message-ID: <79666084-fc2f-4637-8f0b-3846285601b8@suse.com>
Date: Fri, 10 May 2024 08:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 Huang Rui <Ray.Huang@amd.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
 <20240419033616.607889-4-Jiqian.Chen@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240419033616.607889-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.04.24 05:36, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi 28,
> it causes the irq number is not equal with the gsi number.
> And when passthrough a device, QEMU will use device's gsi
> number to do pirq mapping, but the gsi number is got from
> file /sys/bus/pci/devices/<sbdf>/irq, irq!= gsi, so it will
> fail when mapping.
> And in current linux codes, there is no method to translate
> irq to gsi for userspace.
> 
> For above purpose, record the relationship of gsi and irq
> when PVH dom0 do acpi_register_gsi_ioapic for devices and
> adds a new syscall into privcmd to let userspace can get
> that translation when they have a need.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>   arch/x86/include/asm/apic.h      |  8 +++++++
>   arch/x86/include/asm/xen/pci.h   |  5 ++++
>   arch/x86/kernel/acpi/boot.c      |  2 +-
>   arch/x86/pci/xen.c               | 21 +++++++++++++++++
>   drivers/xen/events/events_base.c | 39 ++++++++++++++++++++++++++++++++
>   drivers/xen/privcmd.c            | 19 ++++++++++++++++
>   include/uapi/xen/privcmd.h       |  7 ++++++
>   include/xen/events.h             |  5 ++++
>   8 files changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> index 9d159b771dc8..dd4139250895 100644
> --- a/arch/x86/include/asm/apic.h
> +++ b/arch/x86/include/asm/apic.h
> @@ -169,6 +169,9 @@ extern bool apic_needs_pit(void);
>   
>   extern void apic_send_IPI_allbutself(unsigned int vector);
>   
> +extern int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
> +				    int trigger, int polarity);
> +
>   #else /* !CONFIG_X86_LOCAL_APIC */
>   static inline void lapic_shutdown(void) { }
>   #define local_apic_timer_c2_ok		1
> @@ -183,6 +186,11 @@ static inline void apic_intr_mode_init(void) { }
>   static inline void lapic_assign_system_vectors(void) { }
>   static inline void lapic_assign_legacy_vector(unsigned int i, bool r) { }
>   static inline bool apic_needs_pit(void) { return true; }
> +static inline int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
> +				    int trigger, int polarity)
> +{
> +	return (int)gsi;
> +}
>   #endif /* !CONFIG_X86_LOCAL_APIC */
>   
>   #ifdef CONFIG_X86_X2APIC
> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
> index 9015b888edd6..aa8ded61fc2d 100644
> --- a/arch/x86/include/asm/xen/pci.h
> +++ b/arch/x86/include/asm/xen/pci.h
> @@ -5,6 +5,7 @@
>   #if defined(CONFIG_PCI_XEN)
>   extern int __init pci_xen_init(void);
>   extern int __init pci_xen_hvm_init(void);
> +extern int __init pci_xen_pvh_init(void);
>   #define pci_xen 1
>   #else
>   #define pci_xen 0
> @@ -13,6 +14,10 @@ static inline int pci_xen_hvm_init(void)
>   {
>   	return -1;
>   }
> +static inline int pci_xen_pvh_init(void)
> +{
> +	return -1;
> +}
>   #endif
>   #ifdef CONFIG_XEN_PV_DOM0
>   int __init pci_xen_initial_domain(void);
> diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
> index 85a3ce2a3666..72c73458c083 100644
> --- a/arch/x86/kernel/acpi/boot.c
> +++ b/arch/x86/kernel/acpi/boot.c
> @@ -749,7 +749,7 @@ static int acpi_register_gsi_pic(struct device *dev, u32 gsi,
>   }
>   
>   #ifdef CONFIG_X86_LOCAL_APIC
> -static int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
> +int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
>   				    int trigger, int polarity)
>   {
>   	int irq = gsi;
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 652cd53e77f6..f056ab5c0a06 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -114,6 +114,21 @@ static int acpi_register_gsi_xen_hvm(struct device *dev, u32 gsi,
>   				 false /* no mapping of GSI to PIRQ */);
>   }
>   
> +static int acpi_register_gsi_xen_pvh(struct device *dev, u32 gsi,
> +				    int trigger, int polarity)
> +{
> +	int irq;
> +
> +	irq = acpi_register_gsi_ioapic(dev, gsi, trigger, polarity);
> +	if (irq < 0)
> +		return irq;
> +
> +	if (xen_pvh_add_gsi_irq_map(gsi, irq) == -EEXIST)
> +		printk(KERN_INFO "Already map the GSI :%u and IRQ: %d\n", gsi, irq);
> +
> +	return irq;
> +}
> +
>   #ifdef CONFIG_XEN_PV_DOM0
>   static int xen_register_gsi(u32 gsi, int triggering, int polarity)
>   {
> @@ -558,6 +573,12 @@ int __init pci_xen_hvm_init(void)
>   	return 0;
>   }
>   
> +int __init pci_xen_pvh_init(void)
> +{
> +	__acpi_register_gsi = acpi_register_gsi_xen_pvh;

No support for unregistering the gsi again?

> +	return 0;
> +}
> +
>   #ifdef CONFIG_XEN_PV_DOM0
>   int __init pci_xen_initial_domain(void)
>   {
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 27553673e46b..80d4f7faac64 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -953,6 +953,43 @@ int xen_irq_from_gsi(unsigned gsi)
>   }
>   EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
>   
> +int xen_gsi_from_irq(unsigned irq)
> +{
> +	struct irq_info *info;
> +
> +	list_for_each_entry(info, &xen_irq_list_head, list) {
> +		if (info->type != IRQT_PIRQ)
> +			continue;
> +
> +		if (info->irq == irq)
> +			return info->u.pirq.gsi;
> +	}
> +
> +	return -1;
> +}
> +EXPORT_SYMBOL_GPL(xen_gsi_from_irq);
> +
> +int xen_pvh_add_gsi_irq_map(unsigned gsi, unsigned irq)
> +{
> +	int tmp_irq;
> +	struct irq_info *info;
> +
> +	tmp_irq = xen_irq_from_gsi(gsi);
> +	if (tmp_irq != -1)
> +		return -EEXIST;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (info == NULL)
> +		panic("Unable to allocate metadata for GSI%d\n", gsi);

Please don't kill the system here, just return -ENOMEM.

> +
> +	info->type = IRQT_PIRQ;
> +	info->irq = irq;
> +	info->u.pirq.gsi = gsi;
> +	list_add_tail(&info->list, &xen_irq_list_head);

I think you need some kind of locking to protect changing of the list against
concurrent accesses.

> +
> +	return 0;
> +}
> +
>   static void __unbind_from_irq(struct irq_info *info, unsigned int irq)
>   {
>   	evtchn_port_t evtchn;
> @@ -2295,6 +2332,8 @@ void __init xen_init_IRQ(void)
>   	xen_init_setup_upcall_vector();
>   	xen_alloc_callback_vector();
>   
> +	if (xen_pvh_domain())
> +		pci_xen_pvh_init();
>   
>   	if (xen_hvm_domain()) {
>   		native_init_IRQ();
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 67dfa4778864..11feed529e1d 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -842,6 +842,21 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
>   	return rc;
>   }
>   
> +static long privcmd_ioctl_gsi_from_irq(struct file *file, void __user *udata)
> +{
> +	struct privcmd_gsi_from_irq kdata;
> +
> +	if (copy_from_user(&kdata, udata, sizeof(kdata)))
> +		return -EFAULT;
> +
> +	kdata.gsi = xen_gsi_from_irq(kdata.irq);
> +
> +	if (copy_to_user(udata, &kdata, sizeof(kdata)))
> +		return -EFAULT;
> +
> +	return 0;

Shouldn't you return an error if xen_gsi_from_irq() returned -1?


Juergen

