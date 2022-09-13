Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1E5B6E72
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 15:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406422.648812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY642-0007rg-TZ; Tue, 13 Sep 2022 13:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406422.648812; Tue, 13 Sep 2022 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY642-0007pg-Qe; Tue, 13 Sep 2022 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 406422;
 Tue, 13 Sep 2022 13:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czD7=ZQ=redhat.com=vkuznets@srs-se1.protection.inumbo.net>)
 id 1oY642-0007pY-4X
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 13:34:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa96d5b-3368-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 15:34:56 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-P_oeLiB8M_qJvoNcs8hSaA-1; Tue, 13 Sep 2022 09:34:54 -0400
Received: by mail-ej1-f70.google.com with SMTP id
 qw34-20020a1709066a2200b0077e0e8a55b4so2362732ejc.21
 for <xen-devel@lists.xenproject.org>; Tue, 13 Sep 2022 06:34:54 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906218100b00730b61d8a5esm6099500eju.61.2022.09.13.06.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 06:34:51 -0700 (PDT)
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
X-Inumbo-ID: daa96d5b-3368-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663076095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3xh4EumEIvumafJwct5+WCk+ZsG9qjAIuO2sjxjanY=;
	b=M/IfkqASCXtjtwY/AYtLoCYgRwx5yTCT6uBjvEPS3t0X3dwIXvpIJ4sbsT3V6QliR4EPpg
	6marNFJZW/9RWF35JVNVMOG2ddC4Pp7tvQoazyDtIh+YTTw2MsLfhmlARVxqAphPf4ISZd
	R/zQxQsjtwfpkgYPW9n0YZm8Qpq7Qa4=
X-MC-Unique: P_oeLiB8M_qJvoNcs8hSaA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vptXUYceNtwYVyKwfHyA3dKZqDg4HJHh7ydKyqgQ4H0=;
        b=QwYBYMcMsv4+t8+eS61DUIP26YyK9T3pD7MSTW8rWbTSdi2Gc84JCzrxaghshJMB+V
         k0WdG8/zB0X+h/R8qycmdTwOMd6QShEQhPRkgqnNNoW7CmEgc9z/C/j2rmFKZx+A1Gck
         uAXRfv+JNS4vQ/0+ndKOtXSvu/kGQKC/1Cn26oxSNquryyvlrFQW2lE601JAeBAZz0+p
         uHbJunVVpoLMX7z5hNuCObX1lqugGRJuelR4wJy/5ZmrHGHWtFG8V6OU318g+0lj6Ogx
         az30FTJ9kN7DKZ4aTFCRQB5nbMibcc1wrrxeYSf+CRVbJKehq3N4pFoAfz6P4OSEk98f
         Tzzg==
X-Gm-Message-State: ACgBeo0xkXJ6vqBjIcAUIuK94zW3hDMRl909oZJikDtPFfwpyUPbXkK8
	5ABkuoNoYMKpu9082hBF60Eu9zSiTtJts4zKNzAB1DizOflyfuXx4pgYBLYGZNGiij37wFo4ud+
	wwFO1F3fcipT+kv5zgy7cF84FoCk=
X-Received: by 2002:a17:907:7f91:b0:77f:c4c7:9155 with SMTP id qk17-20020a1709077f9100b0077fc4c79155mr3137426ejc.476.1663076093156;
        Tue, 13 Sep 2022 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6avRwtqutArvSmcEzg7QncTSscL/a0gwHDnK2tQKDnZWQ3sHpo7gh8eU4Pf6A1+IXk9R/ikw==
X-Received: by 2002:a17:907:7f91:b0:77f:c4c7:9155 with SMTP id qk17-20020a1709077f9100b0077fc4c79155mr3137408ejc.476.1663076092870;
        Tue, 13 Sep 2022 06:34:52 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ajay Kaher <akaher@vmware.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
 <srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
 <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
 Nadav Amit <namit@vmware.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "jailhouse-dev@googlegroups.com"
 <jailhouse-dev@googlegroups.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
 <acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org"
 <helgaas@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Alexander
 Graf <graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
In-Reply-To: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
Date: Tue, 13 Sep 2022 15:34:50 +0200
Message-ID: <87zgf3pfd1.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ajay Kaher <akaher@vmware.com> writes:

> Note: Corrected the Subject.
>
>> =EF=BB=BFOn 07/09/22, 8:50 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> =
wrote:
>>
>>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>>> index ddb7986..1e5a8f7 100644
>>> --- a/arch/x86/pci/common.c
>>> +++ b/arch/x86/pci/common.c
>>> @@ -20,6 +20,7 @@
>>>  #include <asm/pci_x86.h>
>>>  #include <asm/setup.h>
>>>  #include <asm/irqdomain.h>
>>> +#include <asm/hypervisor.h>
>>>
>>>  unsigned int pci_probe =3D PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROB=
E_CONF2 |
>>>                               PCI_PROBE_MMCONF;
>>> @@ -57,14 +58,58 @@ int raw_pci_write(unsigned int domain, unsigned int=
 bus, unsigned int devfn,
>>>       return -EINVAL;
>>>  }
>>>
>>> +#ifdef CONFIG_HYPERVISOR_GUEST
>>> +static int vm_raw_pci_read(unsigned int domain, unsigned int bus, unsi=
gned int devfn,
>>> +                                             int reg, int len, u32 *va=
l)
>>> +{
>>> +     if (raw_pci_ext_ops)
>>> +             return raw_pci_ext_ops->read(domain, bus, devfn, reg, len=
, val);
>>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +             return raw_pci_ops->read(domain, bus, devfn, reg, len, va=
l);
>>> +     return -EINVAL;
>>> +}
>>> +
>>> +static int vm_raw_pci_write(unsigned int domain, unsigned int bus, uns=
igned int devfn,
>>> +                                             int reg, int len, u32 val=
)
>>> +{
>>> +     if (raw_pci_ext_ops)
>>> +             return raw_pci_ext_ops->write(domain, bus, devfn, reg, le=
n, val);
>>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +             return raw_pci_ops->write(domain, bus, devfn, reg, len, v=
al);
>>> +     return -EINVAL;
>>> +}
>>
>> These look exactly like raw_pci_read()/raw_pci_write() but with inverted
>> priority. We could've added a parameter but to be more flexible, I'd
>> suggest we add a 'priority' field to 'struct pci_raw_ops' and make
>> raw_pci_read()/raw_pci_write() check it before deciding what to use
>> first. To be on the safe side, you can leave raw_pci_ops's priority
>> higher than raw_pci_ext_ops's by default and only tweak it in
>> arch/x86/kernel/cpu/vmware.c
>
> Thanks Vitaly for your response.
>
> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority' f=
ield to struct pci_raw_ops
> doesn't seems to be appropriate as need to take decision which object of =
struct pci_raw_ops has
> to be used, not something with-in struct pci_raw_ops.

I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
something like (completely untested):

diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_x86.=
h
index 70533fdcbf02..fb8270fa6c78 100644
--- a/arch/x86/include/asm/pci_x86.h
+++ b/arch/x86/include/asm/pci_x86.h
@@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *dev)=
;
 extern bool mp_should_keep_irq(struct device *dev);
=20
 struct pci_raw_ops {
+       int rating;
        int (*read)(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
                                                int reg, int len, u32 *val)=
;
        int (*write)(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index ddb798603201..e9965fd11576 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops;
 int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn=
,
                                                int reg, int len, u32 *val)
 {
-       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops->=
rating))
                return raw_pci_ops->read(domain, bus, devfn, reg, len, val)=
;
        if (raw_pci_ext_ops)
                return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, =
val);
@@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus, u=
nsigned int devfn,
 int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devf=
n,
                                                int reg, int len, u32 val)
 {
-       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops->=
rating))
                return raw_pci_ops->write(domain, bus, devfn, reg, len, val=
);
        if (raw_pci_ext_ops)
                return raw_pci_ext_ops->write(domain, bus, devfn, reg, len,=
 val);

and then somewhere in Vmware hypervisor initialization code
(arch/x86/kernel/cpu/vmware.c) you do

 raw_pci_ext_ops->rating =3D 100;

why wouldn't it work?=20

(diclaimer: completely untested, raw_pci_ops/raw_pci_ext_ops
initialization has to be checked so 'rating' is not garbage).

>
> It's a generic solution for all hypervisor (sorry for earlier wrong
> Subject), not specific to VMware. Further looking for feedback if it's
> impacting to any hypervisor.

That's the tricky part. We can check modern hypervisor versions, but
what about all other versions in existence? How can we know that there's
no QEMU/Hyper-V/... version out there where MMIO path is broken? I'd
suggest we limit the change to Vmware hypervisor, other hypervisors may
use the same mechanism (like the one above) later (but the person
suggesting the patch is always responsible for the research why it is
safe to do so).

--=20
Vitaly


