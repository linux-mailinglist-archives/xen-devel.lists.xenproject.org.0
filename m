Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DF65DDEB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471507.731376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDApo-0005sC-EY; Wed, 04 Jan 2023 20:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471507.731376; Wed, 04 Jan 2023 20:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDApo-0005pM-Bc; Wed, 04 Jan 2023 20:58:04 +0000
Received: by outflank-mailman (input) for mailman id 471507;
 Wed, 04 Jan 2023 20:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDApn-0005pA-2M
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:58:03 +0000
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d6bbaf-8c72-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 21:58:01 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 20:57:59 +0000
Received: by hermes--production-ne1-7b69748c4d-drrwg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c018152b0879594142c30836da56166d; 
 Wed, 04 Jan 2023 20:57:54 +0000 (UTC)
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
X-Inumbo-ID: 78d6bbaf-8c72-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672865879; bh=MwqxqmMf18MOAgnCK181pLsHPRDudVx5Vcx25bazdHY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jF8CsG9yyVzc/LfhMgmjumRjssA7XyT7Lmr2xT1z+IP7YOi6Tnxf1D9l+S0TkQ5XY5neasaWRQXKh6OmBCBENtGYszgxsr+tCWA5twvDOZHKeJVdGgATPZBprlz4PSYgb3d9LX25EO+jJkb5x5TluDRFME7QoCgXQCZ9rKmVToi+8TMczNlXRtTby1xK4C48uKmQxCLEj/mQ4dRJRuQgkBux6y2Q7i9fW/23m7Ry5v0m+PfFvo1pm5rut817HuCAPj+hteKVMk8O5S0UXqlPU5LCY5hKDh0o5DSK8J+jMVbFHEpyYmbiJWZmTE47c9zOfTboTymlvczvVCOmHhTF9w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672865879; bh=2Ropz9OOjxUP5aP+emjrqR06SAJW6JbpIF/9X9NCbbZ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=WFWWD1qzqOIXvwmXIMcgxWPR8KqiFcGRlf4sACs3LFzfpU4Tz4nGWvk+VXERK3FRmywWmQcfFotrphCLTT+PwrRRLEsJa+FLu35T2fiYmIqjz1RIEwXUAx/sVOmjHrYPTozE07/7paBTDVuVpp7J3Xt2nnVPCtA5ajFJb6zNx5Te3/wBuVYdOzyMQDQPLsxQky7GKZqJ0WBzQtVk0g6hLkO8H9NAl0jI7IiBEbrpYNldyo1JlyCutKMVGNFRA6DsY3FH+oFKUsVaIfgMRxYsiRWlFZl0CjVDGfqZ3NTMMJs80rfDPrZG+RNyKV+ac7qPi+l0DV0W9cJf8xyEql/ygw==
X-YMail-OSG: fsn.Lh0VM1mJv879NPieLib8bbgxISTRbyYolGsULGeNjvftgMlIzOkVnfvZm5Z
 3rQXoEOI_2TVq.wD7nOBGLRIBRqYLYGszRd44dfj8JwxgwUXf8BJ0m3tYviqk4UkmEBlaESc4pdr
 kl6wZB3bTnQiHFrrjS7lW4NxCncBP9CDq3k1rkqsP73DWQ0IveKwyPLGJ55YtkmkmMXiMn4YiUw_
 UdqVogcKlhKPPqG6BHKGiDFQwcgzlWa7iJdvn1GrvA17p3TUQ7AvQrl5rky2weI6r7bWcnvLOWwF
 K33VZ0kyH8wO7wfpGFiRTgGYxTwHytJjBtrtmzhvD9CiiI2f4MGAuEq1ir42WAJGcMPBcVM6tTQS
 dzE6iuiV4hEJIpdivPEB42tFQHJMnkkJLcyzrXYWA.7RjmDPLsyp6p31Le3o593PIsvAtHSI_cwL
 ff3ZjGIYBarimFdgGEtofJ6yvsasMeg8KvqmlThbzNXHLKuCaOAVIhC5cAosfpjCa_uhM7s.nFhZ
 UZq0MDBUVhIO5IHoJLKzT.bydQOZyqt6W.ied_U1HsdHnVO0j4u3R34TaFFlGMtykE2W3AZm0602
 FVqcH1xBhyKkjtibsagqRXql6YNbEIjmHvU4h5RPE2BqDPSojL_n9dcSxqZBfndA0a5Oc7aVOgzu
 YSpl6xEhgWLcnt3jzOX3DGlZT.YuAh0BiJ.Aru1rgptw1dBuzDvHPKNC7uxJnWs7ZBHV49ISNI0f
 BCH6XtJTpa.KVQfwwAJOfPOQ6SuhgkZZXN7vcQEQ3B8QzRKNbbMsMMtrDOCAtwpEecrLe2q2pcwd
 keL7wjbA4KtzixTIUcRtJ2S0eTcWa_vR2j9TfJxv8y7d_wiu8LN6BVH16xD5Qnaab7srR1aUoLU4
 1Uw65FruC1qWWsQTJDx_7oaByX77BR2C8GIsvxM31_TcZt8ThuW3DFAD_C8C2WE18WwMb647cdrr
 bR1yNq51OyH3HYzcUtvnPej.Dssig_2m.ai8caAcd8YtXddznK9tzWCyHMhHh4dbpgKEM4T5j7BQ
 NT11iOpIOPj_72Swf_.m_z6TmVOEBbUtR0gUkounQ_le64rMBPMsOJaVfxxQKT5bGeb750ekGJXE
 lA7nQeZZojZCN4J6Vy7eSxh3kZQEWesx0gMtYQxECqN5HsSc2E0OTFn4o8Nm_8LjNyFxk78_zAuo
 nfrIW_Peud28klRsn2iYcT6WxeVj5WVlgTVH1VsmcheW2rWsv9iLe4mno_44ovLD9vW1N1f5meeF
 rSLuadXq4grgwTLb6d6wY9nCJBxWvo8aQv_2CVlgT6PS6725_ySi6_kPJ51_nsdxHHNtg_0_a0GN
 UlN6cZkP6XoOJOA18fMR07kWOMzhEYbiGkW73vKe7F1g3kJMPABpUxkGmY8I4ssZcaRlkyqvucIl
 Xbe2f2GY1EPxJOySjJ3ccUf.a28HE.8ThyZlLhJlXWAb0g9hRuig9_9MIECjZki3fgMiA_ZAwT2z
 Qrj.BxJNVnNUepnvSehmFqikrM8sjb3AmmjOXXmqRkDsmgaw_fcZy7bQfyQSNrh9gqTDMTXxTUxH
 .FcI3FNtmSh1iAiiZ0dBsbl9b07NDjnsPOUHtFoDHFjra8jACLXINTUNX362mc9Se.9WJeJoWmaX
 mLo9923QIFqOJRzrqL4VUshFz2V0zL_C5ZKw1u.hp5P15XjuctUBNxrMLiRDja2KqQq5fxpl48Fk
 l87BGMi5j_67b_pEA6wPH7PGp0Dhb.ARAFl3mVLJ_12lI_sixyMU_IWc7WwNm.5QkfoxqsS7FkrH
 9DnoAR4VoK09rmhYc7Kcf7AWvleFjXsYtPIW6sjZjiZvCqAquR0flyukq93VYj1.Xdw6MabSo3WY
 NXQ3Z8_rBZx7O0DfOME_ScQwObHBDLQWSgnYbOnjPyad1e9.jDajVhHtCk924DalLobsDj0aeKXX
 mWSMhfVzmd_ePmXKLok8F5SswczNNsIOz20EmpAowbQBNpNfGzXL_lDjPkNAy3IGrZaNhkheZGTX
 LBGMJX0M45lLkYysQUdbXHHpNJj4_DSoTkBjfaejHkV53y9aWDPBP7lzKuaCsEYjQJsKVcIS2ijU
 HKrUjacjNgGWT_3iH4pRYfNYVzJw1EDEuqr0qNQ4yqz5ghUoke__vU6sAikjExA8qK01DlJThFUR
 5LKZU5XmnXpOmLwHtRXCC_vHvPQRDtmS.Z_UDa4TUvL49e1cbZDSmdwbgWOu.Ia65TB5OAF8AxC_
 cXEz1SYuAYx8lbT9PA7gx5wcXzzk-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <f6817652-8748-53e0-7ff8-505fd0a98ee3@aol.com>
Date: Wed, 4 Jan 2023 15:57:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
 <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
 <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
 <A4B4B1D1-B466-459C-8A30-E79DACB14094@gmail.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <A4B4B1D1-B466-459C-8A30-E79DACB14094@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 3:31 PM, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 19:29:35 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>On 1/4/23 1:48 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/1/23 18:54, Chuck Zmudzinski wrote:
>>>> On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
>>>>> +Markus/Thomas
>>>>>
>>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>>>>
>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>> ---
>>>>>>    hw/i386/pc_piix.c             |  4 +---
>>>>>>    hw/isa/piix.c                 | 20 --------------------
>>>>>>    include/hw/southbridge/piix.h |  1 -
>>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>>>> index 5738d9cdca..6b8de3d59d 100644
>>>>>> --- a/hw/i386/pc_piix.c
>>>>>> +++ b/hw/i386/pc_piix.c
>>>>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>>>>        if (pcmc->pci_enabled) {
>>>>>>            DeviceState *dev;
>>>>>>            PCIDevice *pci_dev;
>>>>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>>>>> -                                         : TYPE_PIIX3_DEVICE;
>>>>>>            int i;
>>>>>>    
>>>>>>            pci_bus = i440fx_init(pci_type,
>>>>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>>>>                                           : pci_slot_get_pirq);
>>>>>>            pcms->bus = pci_bus;
>>>>>>    
>>>>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>>>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>>>>            object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>>>>                                     machine_usb(machine), &error_abort);
>>>>>>            object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>>>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>>>>> index 98e9b12661..e4587352c9 100644
>>>>>> --- a/hw/isa/piix.c
>>>>>> +++ b/hw/isa/piix.c
>>>>>> @@ -33,7 +33,6 @@
>>>>>>    #include "hw/qdev-properties.h"
>>>>>>    #include "hw/ide/piix.h"
>>>>>>    #include "hw/isa/isa.h"
>>>>>> -#include "hw/xen/xen.h"
>>>>>>    #include "sysemu/runstate.h"
>>>>>>    #include "migration/vmstate.h"
>>>>>>    #include "hw/acpi/acpi_aml_interface.h"
>>>>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>>>>        .class_init    = piix3_class_init,
>>>>>>    };
>>>>>>    
>>>>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>>>> -{
>>>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>>>> -
>>>>>> -    k->realize = piix3_realize;
>>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>>>>> -    dc->vmsd = &vmstate_piix3;
>>>>>
>>>>> IIUC, since this device is user-creatable, we can't simply remove it
>>>>> without going thru the deprecation process. Alternatively we could
>>>>> add a type alias:
>>>>>
>>>>> -- >8 --
>>>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>>>> index 4b0ef65780..d94f7ea369 100644
>>>>> --- a/softmmu/qdev-monitor.c
>>>>> +++ b/softmmu/qdev-monitor.c
>>>>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>>>>                                  QEMU_ARCH_LOONGARCH)
>>>>>    #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>>>>    #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>>>>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>>>>
>>>>>    /* Please keep this table sorted by typename. */
>>>>>    static const QDevAlias qdev_alias_table[] = {
>>>>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>>>>>        { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>>>>>        { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>>>>        { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>>>>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>>>> 
>>>> Hi Bernhard,
>>>> 
>>>> Can you comment if this should be:
>>>> 
>>>> +    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
>>>> 
>>>> instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
>>>> replaced them with PIIX. Or am I not understanding correctly?
>>> 
>>> There is a confusion in QEMU between PCI bridges, the first PCI
>>> function they implement, and the other PCI functions.
>>> 
>>> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
>>> south bridge chipset, which expose a PCI-to-ISA bridge". A better
>>> name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
>>> device is named "PIIX3" with no indication of ISA bridge.
>>
>>
>>Thanks, you are right, I see the PIIX3 device still exists after
>>this patch set is applied.
>>
>>chuckz@debian:~/sources-sid/qemu/qemu-7.50+dfsg/hw/i386$ grep -r PIIX3 *
>>pc_piix.c:        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>
>>I also understand there is the PCI-to-ISA bridge at 00:01.0 on the PCI bus:
>>
>>chuckz@debian:~$ lspci
>>00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
>>00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
>>00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
>>00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
>>00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
>>00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
>>00:03.0 VGA compatible controller: Device 1234:1111 (rev 02)
>>
>>I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:01.3.
> 
> Yeah, this PIIX4 ACPI device is what we consider a "Frankenstein" device here on the list. Indeed my PIIX consolidation series aims for eventually replacing the remaining PIIX3 devices with PIIX4 ones to present a realistic environment to guests. The series you tested makes Xen work with PIIX4. With a couple of more patches you might be able to opt into a realistic PIIX4 emulation in the future!

That's exactly what I want to hear as a future milestone, and thanks
for your work on this!

Kind regards,

Chuck

