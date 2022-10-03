Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33025F3247
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 17:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414909.659337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofMz2-0005k7-O0; Mon, 03 Oct 2022 15:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414909.659337; Mon, 03 Oct 2022 15:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofMz2-0005iK-L4; Mon, 03 Oct 2022 15:03:52 +0000
Received: by outflank-mailman (input) for mailman id 414909;
 Mon, 03 Oct 2022 15:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5U8=2E=redhat.com=vkuznets@srs-se1.protection.inumbo.net>)
 id 1ofMz0-0005iE-Tj
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 15:03:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95acdf2f-432c-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 17:03:49 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-VFdEnWKYMFCP8kgOCb-3NA-1; Mon, 03 Oct 2022 11:03:46 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 f25-20020a7bc8d9000000b003b4768dcd9cso2985971wml.9
 for <xen-devel@lists.xenproject.org>; Mon, 03 Oct 2022 08:03:44 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003a84375d0d1sm17657403wmq.44.2022.10.03.08.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:03:42 -0700 (PDT)
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
X-Inumbo-ID: 95acdf2f-432c-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664809428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jcy8kZYpXeDbLsYPjZ2qO+Lh7p/Rgt7Xact/w0g7X3E=;
	b=ZNTFGaW5wK0paW+y1ILVjF0YVbycZy3t1+xGtB3zHa8DiobqBqjB71BPlEl/H61zKo19cc
	NUW0Zsd+2N8XoOJuvqQxoHKYP/VFcmU2fDKUuvMoSnqhQA6cASPjLdkH++qdV3EJLKFpxY
	z7WOCUenaINzUdKetLWdTGTUhH0gYgs=
X-MC-Unique: VFdEnWKYMFCP8kgOCb-3NA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zlSyGCvWo5iRyh04tGy8TsPBqO2ZA147cE0Y4mnczLc=;
        b=Zz9RUqzuMd0VwWA9xNN4cFTqlCEkgIXYjj45/VWwru7OdkFMsbquYWPuuKizJuICfd
         y+uabZxSv6hd7xkd+uvKIfaVg0e6t1NGsQhdwCRYactNp6PP//cH5hLw1jM1oGpycs19
         y8UJGLAUv+MnHpl9k0csO72fAkuEaHHmBrit3hh+V+GmmYZznDgwXvqc8LPV9do1Nji/
         0anMCtSPz0cukztuUZVAoQ1CZZ63IOxAJThlUaiz/6qEVwyDM0+vZJ5PvEoyeEKgJ0ij
         jabdbU3T4DK7EewcnU6UbW4RkpFlCeUc5Z300EJagCbaZ5YKEt2plsRyyEH/1W6H8OSt
         goew==
X-Gm-Message-State: ACrzQf1BBsovIoxP+pqRoan/I9Xz6Gp/UEA/YyNFD/sfXsHDj8K1SvXE
	HZYxovD/OLK3q57TNJ2RzInv41zyVj1GrHeOBfPMLYv2VF/vaqhAJ8Ij8oQ7lHJuTA4zP3hEoMR
	RZr+ce/B7UhquyXr3FrNLLF3i4bg=
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id f11-20020a05600c4e8b00b003b4c8cebe87mr7593506wmq.157.1664809423568;
        Mon, 03 Oct 2022 08:03:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sxlC5XJOgl9QDu564seFf1Ssz0/+BFurAjD66iPYPfhV1hEDgomWrdFD2cOYxCQVBT8cYyA==
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id f11-20020a05600c4e8b00b003b4c8cebe87mr7593479wmq.157.1664809423275;
        Mon, 03 Oct 2022 08:03:43 -0700 (PDT)
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
In-Reply-To: <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
Date: Mon, 03 Oct 2022 17:03:41 +0200
Message-ID: <87tu4l9cfm.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ajay Kaher <akaher@vmware.com> writes:

>> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> =
wrote:
>>>
>>> Thanks Vitaly for your response.
>>>
>>> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority'=
 field to struct pci_raw_ops
>>> doesn't seems to be appropriate as need to take decision which object o=
f struct pci_raw_ops has
>>> to be used, not something with-in struct pci_raw_ops.
>>
>> I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
>> which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
>> something like (completely untested):
>>
>> diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_x=
86.h
>> index 70533fdcbf02..fb8270fa6c78 100644
>> --- a/arch/x86/include/asm/pci_x86.h
>> +++ b/arch/x86/include/asm/pci_x86.h
>> @@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *d=
ev);
>> extern bool mp_should_keep_irq(struct device *dev);
>>
>> struct pci_raw_ops {
>> +       int rating;
>>          int (*read)(unsigned int domain, unsigned int bus, unsigned int=
 devfn,
>>                                                int reg, int len, u32 *va=
l);
>>          int (*write)(unsigned int domain, unsigned int bus, unsigned in=
t devfn,
>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>> index ddb798603201..e9965fd11576 100644
>> --- a/arch/x86/pci/common.c
>> +++ b/arch/x86/pci/common.c
>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_op=
s;
>>  int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
>>                                                 int reg, int len, u32 *v=
al)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                 return raw_pci_ops->read(domain, bus, devfn, reg, len, v=
al);
>>         if (raw_pci_ext_ops)
>>                 return raw_pci_ext_ops->read(domain, bus, devfn, reg, le=
n, val);
>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus=
, unsigned int devfn,
>>  int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>                                                 int reg, int len, u32 va=
l)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                 return raw_pci_ops->write(domain, bus, devfn, reg, len, =
val);
>>          if (raw_pci_ext_ops)
>>                 return raw_pci_ext_ops->write(domain, bus, devfn, reg, l=
en, val);
>>
>> and then somewhere in Vmware hypervisor initialization code
>> (arch/x86/kernel/cpu/vmware.c) you do
>>
>>  raw_pci_ext_ops->rating =3D 100;
>
> Thanks Vitaly, for your review and helping us to improve the code.
>
> I was working to make changes as you suggested, but before sending v3 wou=
ld like to
> discuss on following:
>
> If we add rating with-in struct pci_raw_ops then we can't have pci_mmcfg =
as const,
> and following change is must in arch/x86/pci/mmconfig_64.c:
>
> -const struct pci_raw_ops pci_mmcfg =3D {
> +struct pci_raw_ops pci_mmcfg =3D {
>  =09.read =3D=09=09pci_mmcfg_read,
>  =09.write =3D=09pci_mmcfg_write,
> };
>
> So to avoid this change, is it fine to have global bool prefer_raw_pci_ex=
t_ops?
>
> And raw_pci_read() will have following change:
>
> -=09if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +=09if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
> +=09     (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)
>

Not my but rather PCI maintainer's call but IMHO dropping 'const' is
better, introducing a new global var is our 'last resort' and should be
avoided whenever possible. Alternatively, you can add a
raw_pci_ext_ops_preferred() function checking somethin within 'struct
hypervisor_x86' but I'm unsure if it's better.

Also, please check Alex' question/suggestion.

...

--=20
Vitaly


