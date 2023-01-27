Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B267F284
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 00:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486008.753465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLYas-0007Hu-Kx; Fri, 27 Jan 2023 23:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486008.753465; Fri, 27 Jan 2023 23:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLYas-0007EX-HK; Fri, 27 Jan 2023 23:57:18 +0000
Received: by outflank-mailman (input) for mailman id 486008;
 Fri, 27 Jan 2023 23:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BMZP=5Y=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pLYar-0007EO-1f
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 23:57:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5287e869-9e9e-11ed-b8d1-410ff93cb8f0;
 Sat, 28 Jan 2023 00:57:14 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id k16so4565692wms.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 15:57:14 -0800 (PST)
Received: from [192.168.0.114] ([196.77.14.77])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db0bb81b6asm5975351wmb.1.2023.01.27.15.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:57:13 -0800 (PST)
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
X-Inumbo-ID: 5287e869-9e9e-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83C/sqLpYcRoe72UESTSQaaVCL+73bpf4QRcam6XkOQ=;
        b=KsUF4JL9cfOoJtRyznvNR/BwaPQD7NpThV9G5oCpMmQ14t+0dU95I0IO8bOWUH4ArQ
         boN2ct+k+O39oW9PF0tjs6rSRtDGbOIGu4QJvk7Iqmz9kSTblMBSvbSkcpqFGhq1yg6Y
         27WMuEjSGgRSPVcgfz6fH5LVZtwFSUQgx2hA7QAqwn8IjnT1cwZDLMoRXg4QIJsuhik0
         IVP2lq+OKg2UqCxALQqHNNsl+PdfDzh3CcV5s6h+ISZ6NDiZDmuPmoS8xRZuNMhnt567
         oPMXOIaC6EWp0q5Q7XfHSFyn3xU+pxCVUGtBzMkAQB4zIcJ+i87QcwLl4ijwM94suV5d
         xiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83C/sqLpYcRoe72UESTSQaaVCL+73bpf4QRcam6XkOQ=;
        b=Fr/tt8IYEdSpzKN6AeTeWMr4YHD7weoN+I5cNh1h5OJQ9kbdpO4mzBtBE7vecXaNB7
         cVCmcAaPWBbYGP6WWRzNq/3kODNPhg8uE8ChMqLZBkLoqcv0svCYcrPCc7VYup3XhIap
         m6Zb1HXEe+JsuqZry2wHrxEJMcne1MvV0oScbAWAI1evOQtRAJF05a/P8z6dyk+sVaY0
         MF8Wkr3zRjkbncDxvI80iAK25y+bqavhaB/NWU0+ieUvkpIO7OIPxhP0sxPhH85FeP2A
         eYC/S+ASN5SLHmvNlpRpPP810qjWghdeMoE3DXmQB7htbjXS5Y/YsTip7+mbVfE3Lh79
         nq6Q==
X-Gm-Message-State: AFqh2krmDH3HXBmwsB0BLcxonc1L/jxmvKMQc/nXW3QyE0ieL6DjlbCR
	02KrUwBTHCdGm5mBMbH0dyf4RQ==
X-Google-Smtp-Source: AMrXdXtwL+SC1CEsaB+gZBcbt+ILUbPRKm89eURC+M+uo7XJxNmJawyVIaj/H+xHnHamksdM/k6fzg==
X-Received: by 2002:a05:600c:5025:b0:3db:14dc:8cff with SMTP id n37-20020a05600c502500b003db14dc8cffmr37244799wmr.33.1674863834222;
        Fri, 27 Jan 2023 15:57:14 -0800 (PST)
Message-ID: <cd7b2036-b203-5cd7-4efe-281dfaa0c186@linaro.org>
Date: Sat, 28 Jan 2023 00:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] hw/i386/pc: Initialize ram_memory variable directly
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230127164718.98156-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/1/23 17:47, Bernhard Beschow wrote:
> Going through pc_memory_init() seems quite complicated for a simple
> assignment.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   include/hw/i386/pc.h | 1 -
>   hw/i386/pc.c         | 2 --
>   hw/i386/pc_piix.c    | 4 ++--
>   hw/i386/pc_q35.c     | 5 ++---
>   4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88a120bc23..5331b9a5c5 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -163,7 +163,6 @@ void xen_load_linux(PCMachineState *pcms);
>   void pc_memory_init(PCMachineState *pcms,
>                       MemoryRegion *system_memory,
>                       MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                       uint64_t pci_hole64_size);
>   uint64_t pc_pci_hole64_start(void);
>   DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..8898cc9961 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -936,7 +936,6 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>   void pc_memory_init(PCMachineState *pcms,
>                       MemoryRegion *system_memory,
>                       MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                       uint64_t pci_hole64_size)
>   {
>       int linux_boot, i;
> @@ -994,7 +993,6 @@ void pc_memory_init(PCMachineState *pcms,
>        * Split single memory region and use aliases to address portions of it,
>        * done for backwards compatibility with older qemus.
>        */
> -    *ram_memory = machine->ram;
>       ram_below_4g = g_malloc(sizeof(*ram_below_4g));
>       memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
>                                0, x86ms->below_4g_mem_size);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5bde4533cc..00ba725656 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>       if (xen_enabled()) {
>           xen_hvm_init_pc(pcms, &ram_memory);
>       } else {
> +        ram_memory = machine->ram;
>           if (!pcms->max_ram_below_4g) {
>               pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
>           }
> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>   
>       /* allocate ram and load rom/bios */
>       if (!xen_enabled()) {
> -        pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory, hole64_size);
> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>       } else {
>           pc_system_flash_cleanup_unused(pcms);
>           if (machine->kernel_filename != NULL) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b97979bebb..8559924eb4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -128,7 +128,7 @@ static void pc_q35_init(MachineState *machine)
>       MemoryRegion *system_io = get_system_io();
>       MemoryRegion *pci_memory;
>       MemoryRegion *rom_memory;
> -    MemoryRegion *ram_memory;
> +    MemoryRegion *ram_memory = machine->ram;
>       GSIState *gsi_state;
>       ISABus *isa_bus;
>       int i;
> @@ -215,8 +215,7 @@ static void pc_q35_init(MachineState *machine)
>       }
>   
>       /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
> -                   pci_hole64_size);
> +    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
>   
>       object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
>       object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,


