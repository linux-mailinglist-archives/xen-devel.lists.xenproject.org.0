Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91165DDDD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471500.731365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAiu-0005Cf-Lw; Wed, 04 Jan 2023 20:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471500.731365; Wed, 04 Jan 2023 20:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAiu-00059c-J7; Wed, 04 Jan 2023 20:50:56 +0000
Received: by outflank-mailman (input) for mailman id 471500;
 Wed, 04 Jan 2023 20:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDAit-00059W-Eu
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:50:55 +0000
Received: from sonic315-55.consmr.mail.gq1.yahoo.com
 (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a6e7fc-8c71-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 21:50:53 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 20:50:51 +0000
Received: by hermes--production-ne1-7b69748c4d-bmdl9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 48efc7ae25fbebe2e93c90ab59b9c6eb; 
 Wed, 04 Jan 2023 20:50:46 +0000 (UTC)
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
X-Inumbo-ID: 79a6e7fc-8c71-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672865451; bh=/7FmWC3We4NIkOcuub5MeTdLnF/yS37TemzpFMKai2s=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=r9jLsBPhibNqyy9S+gbD1MR5HeKsI7U6hTi83h06dg669hvFOrc+dnCfNupsO/fCXZo2ahfsKirc/I5LOxk4APzMFxpben2smQlWtFsmQCmXzyT34VdYaPrzBpPta/3rZMEy+tQTnLhQGHkgA2PJZz5JOKYBgURHjSMhYF+K9OiguB+ETO70q8prQqkT/14bWGJw1llRdG04o+x2TVZuEBUxnkgPPTAjMQkm3HFu8hEAL5V3Glvl5SStazzZhXPAl3j+/eotR7OfBZMOwF/S0HM0ckmProVICrZg5ndtbBurLHan/rz3Zu8jmuO6upN0B+wQBo2m78RO7wkJyWwqxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672865451; bh=4u8K/39RqcAwmuB+QplqjOBExwC5vcMH37jYFoiYHZ6=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=gBUvRYv/eanwhFcA710YtJukZoktcIyKyss284FcbyYyOSXx7I58IitWB32S/pfnfZ1m19MkZC+Xk13AJ9usvRCe+rMpKWUtfYkLuTvvj1q5mT+Gxk0C+vfxnsm8KSxgZh93Rcm4p5n9XiNAvE304y+Ik9y4/xuwg4/qHnrCVVV7waj8xhp17cGeCyFoq8UIx2D/QAvRZSSS91zLzDd8G+TJGghA/VgRCSWe6paIplay/ZMJxtxNtcPRIagkoQqeaa2CItkS/6vWE3Asnxt7QJnCLBr7O+cKJaGrRQLiadnLz7EFza+V7ttoAODgs6vdemIVeL1txfdiu7ljpkoHYQ==
X-YMail-OSG: ZBIrh1kVM1k5EftxDLIx1GLNYz5JBJm0sGOynMCGSfr2OuExkOJuJ7okeTaXXUi
 2gzoumf5Y2D5hu1ZKHNZTHL6ZQJRdCkN8a.VYuyoso4WNXsDaVp2qA4BMVGGLQp7bxCM9I_XKY3p
 iu9NoBGq_PPmUjw0.kThe9BjQT9egrdC0WA4vurL6JUT_NPmtVmS7eL5XmQPi9HshzacUlQH73Dd
 xqABGR3c5XxA8RyJhUkpkp09Wr_cxcKT_4uFLx.K5ufcUa3h8T2PUE7zuU_I5b8oOGJiOClZz6gd
 XocOO6wWWRAgKDvKbaysp2MFy_BK9vpijMEr2CTRske4k2Eigl6EF3_thpYXgxfhUgEZLJD6UJ8s
 jydPaWs7EwsBZXAsDzsjTNa.qbaWEpkNzOgvxBEwTeUa33GnbArfIyWy3Czp1PDqJ9j6gyCYgo86
 nmkpT_uid1ST1CPajhMy5HVzBMqi3TOzqpmKL_lZCeNiMfDQVltf_UQttAh6gIyGLiDBhYGF8221
 75IO2VYJiV4SPLDReSIsW5pu5gW4p8OUWWSbEiSB0NmIfOqksJ.XtaYgF8RaplOqNeF0fG1PzVN6
 iOZUwrmhtmcxYJ7HYei2VxSsgmgQpYOxBYnxFAI2X_6DFcqlSL3c8JeBZ9xkpken3071nMtvJMMZ
 PQ0sTaZgpZGnGGPo8OPeD6341BQLxU1gki_uaDWsoHRT1CR5eXo4gV87zpFZ9E.JI29mzr5rodbc
 QBSsxu38WzcVhB1mfkPKIgeWzRJPRjpNVeCfbM_LPC2YFWP0VtD1LhsXlmWXkuENhaUjLs.3yU_5
 Tx25TefAdqxHFb.VeCB7gD8FQIqrs7bT_vZfSQv9L7TbZIDTixuE2q7HLT9E9mcq4JlaWicyMkcY
 2umAV02Cth6fDWv7.w5In1xXTukO0KNND.t5fG5A70jcB.bycf8ioAyA4lFUD77iss8ohQU6Rjvg
 zM3jP1cTCX_y9_I.0SXdWMcNEIeqyqaahcuGhst3RWyQgiLuMXgINgSJukiBgfMd7DScJAzyzRn.
 dkU41aC6OVTIXDImX0NpnGMAAmR6Y4KDOAvvzqO1xcjMrLWubw2CBgzeZqi5.7Mles1NVlq2JPZi
 KY_qicZg2_VGP89.C6.tA_k82SbnW8TKKejqXJ8sM0VKd4qZ8c07Fd92Igoqpp_LoIcYHigqTI3p
 iMqznn5a1j88GSCbUmpYaR_fnlPWr4NRozScdgURpenZLl9wSFNhv05uk.2jPgwreIxgwFORwtv4
 H2HzPWMlyMyui6GT8yqGd3XEYxcr.T8jozql16d.msQ3EbdkClzwRtBJqirkS8p9PDjXpVrEfWft
 73MsBPaYigK..ag_WmpMja96XTFv.7rYdVESuZPb6RhLTwQJ.fiQL0Wo8FksbLFR3zAgsw9tB5Fn
 J4_ecW5H3B0kZJcDhHsOhQPbxOsWU_Bdcojfv6x3Cl_FkpTv6iNsAedf2Mp49q1KpCqszDv4IPSn
 cI4T0zIP.ND13vtRg20trtz16RY9rv.bDWeRtMNp1MxG4z0vVgq_YnisDseGb0HLje07lxW7H9iw
 c6cZkMfOZkK4L.RnKtq3lRd9T2vER0HwwiXsFIdnIpypyv.ao.wImx74C9viWjCsULhGmIxpk5Q6
 e_tBNynJACMdMd6kdWdJFp3cZ8NhivMztyUAVwjhpX4rnROixmdD5Un_8NhpxAXagxHg39XVb9JY
 9_0u7IGGJR6pTkwPsmS.rA5oRybbkvxcBiOLJmIVRNrZJJE0S8kbmyBvWBgLsSZ8LDB6_V6fjNgi
 acRzqBKjECkRS.xX3SHNNdQ1klsDfoatNUjQgwh_TxupSSbu4k8FStYiA6GdTTcDdcmLYEpJ2wfe
 nbPJhBwg38vY_Fux7ZMm8GoVKXznu9wWoSq4bkH6_FE4hrIVELSkQKGYEvMepxNzvfgGFO1wXVtw
 Wzwt7HpLpHa0zTJcm_0EY_dcxOuiN9PcuNQl1E5BH1Ap0vmJuU6n2KcZvcbqPlvLWR0z3QEYVeJP
 wx8Zzh.9z2RIwMHo1bolZOCbHaDYTEe.gVPvtulml5EnH8SLPBQpAJakwOBnEh4ZAk1UqSP2O2gE
 AQBuydAk.KHb6Jau3zqVjeKwlZsIbZ8w5R5wMUKlsfMZuriNAPyLIkX3vMiqQvs42iHTWDa6RHKX
 y.fsLMSZVRIlmVrXttGFhMYQv56bDJZu7yvAMWr1_YL86_4pE.YAllwMSXoEC_YpvZjs9Cat37JE
 eG6wEvz02OaW8G6KLgx.v4WYqlA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <38e0ba3c-1914-9148-0541-e2c28efb5f87@aol.com>
Date: Wed, 4 Jan 2023 15:50:44 -0500
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
 <E3E983F2-0FB3-4F6B-B2D6-ABE7E021228E@gmail.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <E3E983F2-0FB3-4F6B-B2D6-ABE7E021228E@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 3:44 PM, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 17:54:16 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
>>> +Markus/Thomas
>>> 
>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>> 
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>   hw/i386/pc_piix.c             |  4 +---
>>>>   hw/isa/piix.c                 | 20 --------------------
>>>>   include/hw/southbridge/piix.h |  1 -
>>>>   3 files changed, 1 insertion(+), 24 deletions(-)
>>>> 
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index 5738d9cdca..6b8de3d59d 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>>       if (pcmc->pci_enabled) {
>>>>           DeviceState *dev;
>>>>           PCIDevice *pci_dev;
>>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>>> -                                         : TYPE_PIIX3_DEVICE;
>>>>           int i;
>>>>   
>>>>           pci_bus = i440fx_init(pci_type,
>>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>>                                          : pci_slot_get_pirq);
>>>>           pcms->bus = pci_bus;
>>>>   
>>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>>                                    machine_usb(machine), &error_abort);
>>>>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>>> index 98e9b12661..e4587352c9 100644
>>>> --- a/hw/isa/piix.c
>>>> +++ b/hw/isa/piix.c
>>>> @@ -33,7 +33,6 @@
>>>>   #include "hw/qdev-properties.h"
>>>>   #include "hw/ide/piix.h"
>>>>   #include "hw/isa/isa.h"
>>>> -#include "hw/xen/xen.h"
>>>>   #include "sysemu/runstate.h"
>>>>   #include "migration/vmstate.h"
>>>>   #include "hw/acpi/acpi_aml_interface.h"
>>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>>       .class_init    = piix3_class_init,
>>>>   };
>>>>   
>>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>> -{
>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> -
>>>> -    k->realize = piix3_realize;
>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>>> -    dc->vmsd = &vmstate_piix3;
>>> 
>>> IIUC, since this device is user-creatable, we can't simply remove it
>>> without going thru the deprecation process. Alternatively we could
>>> add a type alias:
>>> 
>>> -- >8 --
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index 4b0ef65780..d94f7ea369 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>>                                 QEMU_ARCH_LOONGARCH)
>>>   #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>>   #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>> 
>>>   /* Please keep this table sorted by typename. */
>>>   static const QDevAlias qdev_alias_table[] = {
>>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>>>       { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>>>       { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>>       { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>>
>>Hi Bernhard,
>>
>>Can you comment if this should be:
>>
>>+    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
>>
>>instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
>>replaced them with PIIX. Or am I not understanding correctly?
> 
> PIIX3 is correct. The PIIX consolidation is just about sharing code between the PIIX3 and PIIX4 south bridges and should not cause any user or guest observable differences.

I realize that now. I see the PIIX3 device still exists after applying the patch set.
Thanks,

Chuck

