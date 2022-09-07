Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3FA5B0854
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401960.643941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVwqZ-0004AW-Ed; Wed, 07 Sep 2022 15:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401960.643941; Wed, 07 Sep 2022 15:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVwqZ-00047l-BF; Wed, 07 Sep 2022 15:20:11 +0000
Received: by outflank-mailman (input) for mailman id 401960;
 Wed, 07 Sep 2022 15:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAJk=ZK=redhat.com=vkuznets@srs-se1.protection.inumbo.net>)
 id 1oVwqY-00047d-4s
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:20:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e37ecdc-2ec0-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 17:20:08 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-ND5nlDMpNH6gLpW8M_h5zA-1; Wed, 07 Sep 2022 11:20:05 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 h2-20020adfa4c2000000b00228db7822cbso1877153wrb.19
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 08:20:05 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm29360122wmc.36.2022.09.07.08.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 08:20:02 -0700 (PDT)
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
X-Inumbo-ID: 8e37ecdc-2ec0-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662564007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xYRHulRFq0HQCbPn97D2YEnCLSwRHPaOy9i5aW24Q8=;
	b=X27kb0uM7uwv25DflX7tIdV6krH0gRvREbnmuuTn/1MTERVdmQH3/3vxJZU+ZI1yc5Rp9t
	YM/KUMTu2D7ULjxw5NRTFpNm22NgYsdVdxJvVlclA+5N+P96VUJE4EkZmEz44gMoJ7F2ri
	JWTlTOgqC5b+7Ax1AiZswqWEKcN/e6Y=
X-MC-Unique: ND5nlDMpNH6gLpW8M_h5zA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CHNdLB0NEs0hPJCPuKfDS5PXO0uKkxor3QlPHHKcdWM=;
        b=8Hd3AN8SkPlLcVnTfGtIbxt/10w+Qd2Z5AHujOOl6AKPyDtfUHc8R0kC9y3EetMsfL
         h4eCL3r7gHLa7o2az9Qd6JQyQ1hLD7CAl9ieNCnpMivLAv03JTXGEbOutg9jRYdaACiI
         uz5Zo7JdOEu+byt8c8yxTwj2GouM9cnRwrQy7w5FWG7wlnvHmG5mk6/S1afZC/Ol2vr5
         ssjNmw2MzjoDcY9hTDliYXlhmVhQKeX1rjg7swk9V1VmLGHlFDSKeJhfAfS3QJpbq8X2
         QpmNnxLw8464eBY/FWDYsWEKaQJfvhpbNsJ23SJmJ1dx6f4C3ilj9ElkvxmC6EzhNydx
         07uA==
X-Gm-Message-State: ACgBeo1k2NuUumfc0b4p6XCvoxlUGqMw2h1ub8eaCDLYKCPOfMeeimAx
	MP58AwzvcnRVX4/PXgvrP7QjHX+dahKHRXsNZ8IErMH0aOYTI4fVGYt1KEQEf+M5/UwE1rY4YfU
	J8cluygKzt3wQucCP+2ixXFeGsfI=
X-Received: by 2002:a5d:59ab:0:b0:228:28df:9193 with SMTP id p11-20020a5d59ab000000b0022828df9193mr2471676wrr.323.1662564003266;
        Wed, 07 Sep 2022 08:20:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR756qiCLKEbLM1iNnFKS+9y7GWIyNG66GDmPAE9ydBmmICwjU+sxM3SEVFU1scSKoLlwTZJ6g==
X-Received: by 2002:a5d:59ab:0:b0:228:28df:9193 with SMTP id p11-20020a5d59ab000000b0022828df9193mr2471659wrr.323.1662564002953;
        Wed, 07 Sep 2022 08:20:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ajay Kaher <akaher@vmware.com>
Cc: x86@kernel.org, hpa@zytor.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, srivatsab@vmware.com,
 srivatsa@csail.mit.edu, amakhalov@vmware.com, vsirnapalli@vmware.com,
 er.ajay.kaher@gmail.com, willy@infradead.org, namit@vmware.com,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 jailhouse-dev@googlegroups.com, xen-devel@lists.xenproject.org,
 acrn-dev@lists.projectacrn.org, helgaas@kernel.org, bhelgaas@google.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
In-Reply-To: <1662448117-10807-1-git-send-email-akaher@vmware.com>
References: <1662448117-10807-1-git-send-email-akaher@vmware.com>
Date: Wed, 07 Sep 2022 17:20:00 +0200
Message-ID: <8735d3rz33.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ajay Kaher <akaher@vmware.com> writes:

> During boot-time there are many PCI config reads, these could be performe=
d
> either using Port IO instructions (PIO) or memory mapped I/O (MMIO).
>
> PIO are less efficient than MMIO, they require twice as many PCI accesses
> and PIO instructions are serializing. As a result, MMIO should be preferr=
ed
> when possible over PIO.
>
> Virtual Machine test result using VMware hypervisor
> 1 hundred thousand reads using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 8.517 seconds (~33.5% faster then PIO)
>
> Currently, when these reads are performed by a virtual machine, they all
> cause a VM-exit, and therefore each one of them induces a considerable
> overhead.
>
> This overhead can be further improved, by mapping MMIO region of virtual
> machine to memory area that holds the values that the =E2=80=9Cemulated h=
ardware=E2=80=9D
> is supposed to return. The memory region is mapped as "read-only=E2=80=9D=
 in the
> NPT/EPT, so reads from these regions would be treated as regular memory
> reads. Writes would still be trapped and emulated by the hypervisor.
>
> Virtual Machine test result with above changes in VMware hypervisor
> 1 hundred thousand read using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 0.010 seconds
>
> This helps to reduce virtual machine PCI scan and initialization time by
> ~65%. In our case it reduced to ~18 mSec from ~55 mSec.
>
> MMIO is also faster than PIO on bare-metal systems, but due to some bugs
> with legacy hardware and the smaller gains on bare-metal, it seems pruden=
t
> not to change bare-metal behavior.

Out of curiosity, are we sure MMIO *always* works for other hypervisors
besides Vmware? Various Hyper-V version can probably be tested (were
they?) but with KVM it's much harder as PCI is emulated in VMM and
there's certainly more than 1 in existence...

>
> Signed-off-by: Ajay Kaher <akaher@vmware.com>
> ---
> v1 -> v2:
> Limit changes to apply only to VMs [Matthew W.]
> ---
>  arch/x86/pci/common.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
> index ddb7986..1e5a8f7 100644
> --- a/arch/x86/pci/common.c
> +++ b/arch/x86/pci/common.c
> @@ -20,6 +20,7 @@
>  #include <asm/pci_x86.h>
>  #include <asm/setup.h>
>  #include <asm/irqdomain.h>
> +#include <asm/hypervisor.h>
> =20
>  unsigned int pci_probe =3D PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROBE_=
CONF2 |
>  =09=09=09=09PCI_PROBE_MMCONF;
> @@ -57,14 +58,58 @@ int raw_pci_write(unsigned int domain, unsigned int b=
us, unsigned int devfn,
>  =09return -EINVAL;
>  }
> =20
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +static int vm_raw_pci_read(unsigned int domain, unsigned int bus, unsign=
ed int devfn,
> +=09=09=09=09=09=09int reg, int len, u32 *val)
> +{
> +=09if (raw_pci_ext_ops)
> +=09=09return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, val);
> +=09if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +=09=09return raw_pci_ops->read(domain, bus, devfn, reg, len, val);
> +=09return -EINVAL;
> +}
> +
> +static int vm_raw_pci_write(unsigned int domain, unsigned int bus, unsig=
ned int devfn,
> +=09=09=09=09=09=09int reg, int len, u32 val)
> +{
> +=09if (raw_pci_ext_ops)
> +=09=09return raw_pci_ext_ops->write(domain, bus, devfn, reg, len, val);
> +=09if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +=09=09return raw_pci_ops->write(domain, bus, devfn, reg, len, val);
> +=09return -EINVAL;
> +}

These look exactly like raw_pci_read()/raw_pci_write() but with inverted
priority. We could've added a parameter but to be more flexible, I'd
suggest we add a 'priority' field to 'struct pci_raw_ops' and make
raw_pci_read()/raw_pci_write() check it before deciding what to use
first. To be on the safe side, you can leave raw_pci_ops's priority
higher than raw_pci_ext_ops's by default and only tweak it in
arch/x86/kernel/cpu/vmware.c=20

> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  static int pci_read(struct pci_bus *bus, unsigned int devfn, int where, =
int size, u32 *value)
>  {
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +=09/*
> +=09 * MMIO is faster than PIO, but due to some bugs with legacy
> +=09 * hardware, it seems prudent to prefer MMIO for VMs and PIO
> +=09 * for bare-metal.
> +=09 */
> +=09if (!hypervisor_is_type(X86_HYPER_NATIVE))
> +=09=09return vm_raw_pci_read(pci_domain_nr(bus), bus->number,
> +=09=09=09=09=09 devfn, where, size, value);
> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  =09return raw_pci_read(pci_domain_nr(bus), bus->number,
>  =09=09=09=09 devfn, where, size, value);
>  }
> =20
>  static int pci_write(struct pci_bus *bus, unsigned int devfn, int where,=
 int size, u32 value)
>  {
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +=09/*
> +=09 * MMIO is faster than PIO, but due to some bugs with legacy
> +=09 * hardware, it seems prudent to prefer MMIO for VMs and PIO
> +=09 * for bare-metal.
> +=09 */
> +=09if (!hypervisor_is_type(X86_HYPER_NATIVE))
> +=09=09return vm_raw_pci_write(pci_domain_nr(bus), bus->number,
> +=09=09=09=09=09  devfn, where, size, value);
> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  =09return raw_pci_write(pci_domain_nr(bus), bus->number,
>  =09=09=09=09  devfn, where, size, value);
>  }

--=20
Vitaly


