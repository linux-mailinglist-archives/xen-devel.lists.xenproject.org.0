Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3ED5F376B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 23:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415021.659492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSZw-0004vo-N5; Mon, 03 Oct 2022 21:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415021.659492; Mon, 03 Oct 2022 21:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSZw-0004tY-Jj; Mon, 03 Oct 2022 21:02:20 +0000
Received: by outflank-mailman (input) for mailman id 415021;
 Mon, 03 Oct 2022 21:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGPN=2E=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1ofSZt-0004tS-Vx
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 21:02:18 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f24fa8-435e-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 23:02:14 +0200 (CEST)
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293L1MEs3109337
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 3 Oct 2022 14:01:22 -0700
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
X-Inumbo-ID: a6f24fa8-435e-11ed-964a-05401a9f4f97
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293L1MEs3109337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022090501; t=1664830885;
	bh=5zHAz69mkxip2bzOLRJ4yt3No7BYKjAs2m4UMY86+jU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=oykLJvyx1Q7ObEI2DH5ERO/25eTiZzFZJgvAbC877waEJ3rI15d4aEdEhxqbJeO9A
	 9mAtYzKq8KzgRaHdsZgLzcZ2FyOyJwtGOC7Mz+CWLiAoLfbb5WWY5pApSxlkZqx2kg
	 +jdO0xgF1Zn08mAVfDnpAfBMkCcXHyW5VxanswAVTHLqQKoZ+Zkpg3OXttXf7gowum
	 15bO9ANhBUQRzE2ffGGoHuLuA3pDNZDMyqSFToe9GidZCxmVEF1Y4Vhvw77jGJ5haa
	 Ryz+0xxNJVgfA4mrSDmKj9XJmZNlHN+9On7utZ6oZSi0H5AyXYqm2nhWCl+Q2Kqooh
	 0qiZDnZqQsadQ==
Date: Mon, 03 Oct 2022 14:01:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Ajay Kaher <akaher@vmware.com>
CC: "x86@kernel.org" <x86@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        Srivatsa Bhat <srivatsab@vmware.com>,
        "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
        Alexey Makhalov <amakhalov@vmware.com>,
        Vasavi Sirnapalli <vsirnapalli@vmware.com>,
        "er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
        "willy@infradead.org" <willy@infradead.org>,
        Nadav Amit <namit@vmware.com>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
User-Agent: K-9 Mail for Android
In-Reply-To: <87tu4l9cfm.fsf@redhat.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com>
Message-ID: <E522EECC-D20D-4A69-8A44-9CF2B36E2A29@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 3, 2022 8:03:41 AM PDT, Vitaly Kuznetsov <vkuznets@redhat=2Ecom>=
 wrote:
>Ajay Kaher <akaher@vmware=2Ecom> writes:
>
>>> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat=2Ec=
om> wrote:
>>>>
>>>> Thanks Vitaly for your response=2E
>>>>
>>>> 1=2E we have multiple objects of struct pci_raw_ops, 2=2E adding 'pri=
ority' field to struct pci_raw_ops
>>>> doesn't seems to be appropriate as need to take decision which object=
 of struct pci_raw_ops has
>>>> to be used, not something with-in struct pci_raw_ops=2E
>>>
>>> I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
>>> which are called 'raw_pci_ops' and 'raw_pci_ext_ops'=2E What if you do
>>> something like (completely untested):
>>>
>>> diff --git a/arch/x86/include/asm/pci_x86=2Eh b/arch/x86/include/asm/p=
ci_x86=2Eh
>>> index 70533fdcbf02=2E=2Efb8270fa6c78 100644
>>> --- a/arch/x86/include/asm/pci_x86=2Eh
>>> +++ b/arch/x86/include/asm/pci_x86=2Eh
>>> @@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev =
*dev);
>>> extern bool mp_should_keep_irq(struct device *dev);
>>>
>>> struct pci_raw_ops {
>>> +       int rating;
>>>          int (*read)(unsigned int domain, unsigned int bus, unsigned i=
nt devfn,
>>>                                                int reg, int len, u32 *=
val);
>>>          int (*write)(unsigned int domain, unsigned int bus, unsigned =
int devfn,
>>> diff --git a/arch/x86/pci/common=2Ec b/arch/x86/pci/common=2Ec
>>> index ddb798603201=2E=2Ee9965fd11576 100644
>>> --- a/arch/x86/pci/common=2Ec
>>> +++ b/arch/x86/pci/common=2Ec
>>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_=
ops;
>>>  int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>>>                                                 int reg, int len, u32 =
*val)
>>> {
>>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_=
ops->rating))
>>>                 return raw_pci_ops->read(domain, bus, devfn, reg, len,=
 val);
>>>         if (raw_pci_ext_ops)
>>>                 return raw_pci_ext_ops->read(domain, bus, devfn, reg, =
len, val);
>>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int b=
us, unsigned int devfn,
>>>  int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int=
 devfn,
>>>                                                 int reg, int len, u32 =
val)
>>> {
>>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_=
ops->rating))
>>>                 return raw_pci_ops->write(domain, bus, devfn, reg, len=
, val);
>>>          if (raw_pci_ext_ops)
>>>                 return raw_pci_ext_ops->write(domain, bus, devfn, reg,=
 len, val);
>>>
>>> and then somewhere in Vmware hypervisor initialization code
>>> (arch/x86/kernel/cpu/vmware=2Ec) you do
>>>
>>>  raw_pci_ext_ops->rating =3D 100;
>>
>> Thanks Vitaly, for your review and helping us to improve the code=2E
>>
>> I was working to make changes as you suggested, but before sending v3 w=
ould like to
>> discuss on following:
>>
>> If we add rating with-in struct pci_raw_ops then we can't have pci_mmcf=
g as const,
>> and following change is must in arch/x86/pci/mmconfig_64=2Ec:
>>
>> -const struct pci_raw_ops pci_mmcfg =3D {
>> +struct pci_raw_ops pci_mmcfg =3D {
>>  	=2Eread =3D		pci_mmcfg_read,
>>  	=2Ewrite =3D	pci_mmcfg_write,
>> };
>>
>> So to avoid this change, is it fine to have global bool prefer_raw_pci_=
ext_ops?
>>
>> And raw_pci_read() will have following change:
>>
>> -	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +	     (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)
>>
>
>Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>better, introducing a new global var is our 'last resort' and should be
>avoided whenever possible=2E Alternatively, you can add a
>raw_pci_ext_ops_preferred() function checking somethin within 'struct
>hypervisor_x86' but I'm unsure if it's better=2E
>
>Also, please check Alex' question/suggestion=2E
>
>=2E=2E=2E
>

Could this be ro_after_init?

