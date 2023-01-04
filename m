Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03065DCBF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 20:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471398.731239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9SQ-0006qf-Q1; Wed, 04 Jan 2023 19:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471398.731239; Wed, 04 Jan 2023 19:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9SQ-0006oP-Mp; Wed, 04 Jan 2023 19:29:50 +0000
Received: by outflank-mailman (input) for mailman id 471398;
 Wed, 04 Jan 2023 19:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pD9SP-0006oJ-9P
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 19:29:49 +0000
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24452f5e-8c66-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 20:29:45 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 19:29:43 +0000
Received: by hermes--production-ne1-7b69748c4d-rglm6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6610acf198dd57a5acb45951fb7310cb; 
 Wed, 04 Jan 2023 19:29:38 +0000 (UTC)
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
X-Inumbo-ID: 24452f5e-8c66-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672860583; bh=f38ykNsj5P5917DyUYEqB636yxECNNSILhQF338ksUE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=oskHmGnhbNjCTSYoC2MIf79xuDr6C9L/Ef+Tbju7HlyvAqO67EFex28GmboTCQWrJHmFdUdlHhgxo+dRtqJqbd19qBliT3pf+vURuOAtIAvXoIp0Xv9ptgM0fdRpIigEfJpi23IL6C/Bz6NdSpyH3eXWFUFdP7TUkMydbGc6s1sczjkYzZyzsFh6gYpgj3N9HuWytymGvI0W5f0fAV11Rj0MquVqPXcTr036fT9Nyvju2/tKDkVvZ4XQ55yQPAcn771nMXp78kPJJYsfYaKfMoB/vCjr7SzHaa4dkfGRCdXniPrfqvVp9PC25JBlQ1soisWBnS/5o3bCIEEBCHLWaA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672860583; bh=TTo4eJza70SWteqIqAHCCivI/STyWz6raPujdPpDkaa=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=LfnkBDyJg/pTxw8b94YEMOQZRCu0D3K1Xa8RyqUFjMB+WhGmO+aWeQ+yENtLZ+dVu38S0ZVrg647scpYoagu1jnICr/Jc/mhTW7syQL7hfaB7eqW78AF818YfU1WUF9Xx7dda8bO8Pk2HAVhc8DT9tYPGImchwmkpi+X8Cxerj7IepMDHVxyYI30yklevOydEspX6jp9EtKvtdr0Md8RInw7P3aS3kiNMELLfvceaG89HP738n9wuCgOFwMkd6N2EG/6tashj5HiSJEphyaAo6GB0g7nYQfhXeSc3ZHmm9JOB/ki0THx4PGhWVE+RO09hOqrnSIZ4OmOrfOVlZ3Ggg==
X-YMail-OSG: AYNUE8kVM1n0bruCHoYB.IOVLws3knC5gqJehESqqWC08o0GHu3bTOn0JE.68ZT
 mbWk_64D8Jw6GmRA..9I9OkdsyArBEY3YVrFWG5CwGDcrttgw68n5loH_fQ0Sfkx66GPrv4P0sZC
 C6asHdO2VkZknNwpbjkGw7OPb3Cw82gULXWf.Uj5UraX9a3vBoYq0LF1dsIYsKJP2Teqcw6bCsuD
 HlpI3NB4Y0d0Z2219BZZWOB.xIdR.jpiKrtbybQFlWVYEd1Gg9ErXE8LYwBf34DO2FdOQk4Ut5oK
 geiGkAY8joeWyr_lGKHV.JII28OcCg3tpYu98lYwjjPbrpOaAjxz9PzkZXEfadFsLfvBa_vAp.ky
 TDbQ9LF63wt6Vr596iaes631G.LXmJIJGoMBV0XQHhuCrxEO9iAG3nWJuyGDWYNLhiGQif_XQ4be
 LjAPDUMLeIq6Hd580BEIGUw_DbL0JFRjDZ.Pjr9Bk7Mespxe4WjuBB6s7JKmlAFFQSvCVDjTmr_G
 U7ZvtqpcFoeH6_7MGjyAXPPbM3fIdU3YcnNvQjbmMJojShDzlnygGOe39v.qrbdKA8kC9Pkx.qWJ
 7qtYILJU8Mga1xHV2aap9sKqUPwSApzyHIQqF7B8VSmncfDij27BPiHauaby3tDMEIAZFyjlUbYr
 XsWeKAWZxNIzas99Pag_PxkkVfTFcDry57eHj2nG1e_RkAywZUIlBnPQUvbtBEQYGezDrQJ7pgga
 0hlru888cmjdOLpLZQ5wfXXAtXMmUPq8uW3Z4WPel7ejnt_fKTvv9BAg7x30KxcNRIQmbNn5b69P
 I6lm97257DJhlyQQ6kmbMMSiC7Oe9d8nFLU7.H4iMciRXQkBHRg7OE93TDiKdKtjaAF.CSsNC7fw
 pHKd7CQCvxUv6rH63jlZzsrhasGRJE9EDHJEHTVrQiuN5LQjmfHpbc1iWNsLesQCAeW0g1v2k0Xc
 rTXmqodsgUKdMhX64F_Enbu7rnG8FrtXDYPIGgHO6MMUOJt20GYOhBUYaSIx9lzOxICHu8JjhB8l
 BBrJQY61_n3.DWSezPfJsM0UaDU7cYjojPryDyP2pzdnhi3v0zkMbIovNGSmWz23_2hebNMnD8RP
 _MLh4Xmk7mPzbAhFMxJ95dnRHkDtNTM5QcwfrbxDB3WzbnxrNBKspN648w4y5wsDA5vyiGT0Qfnu
 XU7fiuKeftpByta2nvdVVtWXfFKtWYch82dPlN3NLBrX80Blc.B4P_gCUDbLyTC2IO8grjkcspFa
 hMrblJi_CEkOiybPwQ2VmYEf99bk2BOCKOWkfPTQUV0dc7WEyVGDlk4C9uylC4ZJpy6fDoKCmnh2
 ay7qy.GxbzOB.yUbYJGh4h7kfOkcBOXgGFJPJFWuulgVEYnvXMBFaZgNzUGTlGiz8MmSuhXNhPZt
 DXi3GNLoEp6jxi5KzBmKQ4FNYW2NoQKhrbnrm8sVxzZ_Llsmd2goQeeW9zxtvN8rjvNcoV4R6jUG
 ssV7T6dj6OCblboyS7CcliN80tpppepzyHTUNeM8OZe5YeJCUF3h7xVLh1onukIsLkLsF9.HrCY6
 0cGuRFmmR3LBcWrJ3gfMt2skDyluUiw4ZAS5Kd6PuUnP9Ux6oK.stKkNfRToK.Nbg_T7g_n0Gm_B
 cacRgJ1nm4lX1m6z0KlyQfopoVFKwiqdwpmJM3SHX48pWy2A5wK8JcS7Jf19Og87IVHKMhCh.XV3
 Ejtb_HjsAXyYCtgHbLUnD0dM2oeWtiLsKufzHF.wV3UqLjfq_vHX2Z_ST9fp2Oqrqn6CWkm5bCnm
 zfPfpJqiNCuUVP5b8EvnW8d37p4Y2mqx46_w.meadkhD7XSHAPrEO3XhMkYufO8GfRtUMHRU48gI
 ZhAUGWpMmuGAJ24FtR_zT0w6QAJLrvKeCNTsjjgh_9FPlaUTI8RCOrGn.lIB6G9GSn31y0DOrrlk
 8F0Hx8mbjp_VkJ_jmoG8MG.X9MNTws6PtV0KhK_5GqHJ.T9B6le284N.rXbFW8WXeQc8zfeNk67M
 8uIT1CnZewnDNMICpbpYEMvk4Tmg5Klc425MttS_EpLzavr617uh1R7vkihEs7tgoJZ6sjLphJA5
 GeQWmp8b2w62DyIRnbSAcAWVXFYD9dEbn8NHXgLQvd9BYsB0WkPbZN8Q9a70h197OqtyTLL10.Lv
 VUuTlCqfTKljNlwzUF5mv.XONurczDHfHPe.6jJzOQvhWN31kopHC3EpCqZU4YWx.YbB41sdupog
 EtoozBnGiaz4t3UepihlDMQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
Date: Wed, 4 Jan 2023 14:29:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
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
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 1:48 PM, Philippe Mathieu-Daudé wrote:
> On 4/1/23 18:54, Chuck Zmudzinski wrote:
>> On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
>>> +Markus/Thomas
>>>
>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>    hw/i386/pc_piix.c             |  4 +---
>>>>    hw/isa/piix.c                 | 20 --------------------
>>>>    include/hw/southbridge/piix.h |  1 -
>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>>
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index 5738d9cdca..6b8de3d59d 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>>        if (pcmc->pci_enabled) {
>>>>            DeviceState *dev;
>>>>            PCIDevice *pci_dev;
>>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>>> -                                         : TYPE_PIIX3_DEVICE;
>>>>            int i;
>>>>    
>>>>            pci_bus = i440fx_init(pci_type,
>>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>>                                           : pci_slot_get_pirq);
>>>>            pcms->bus = pci_bus;
>>>>    
>>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>>            object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>>                                     machine_usb(machine), &error_abort);
>>>>            object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>>> index 98e9b12661..e4587352c9 100644
>>>> --- a/hw/isa/piix.c
>>>> +++ b/hw/isa/piix.c
>>>> @@ -33,7 +33,6 @@
>>>>    #include "hw/qdev-properties.h"
>>>>    #include "hw/ide/piix.h"
>>>>    #include "hw/isa/isa.h"
>>>> -#include "hw/xen/xen.h"
>>>>    #include "sysemu/runstate.h"
>>>>    #include "migration/vmstate.h"
>>>>    #include "hw/acpi/acpi_aml_interface.h"
>>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>>        .class_init    = piix3_class_init,
>>>>    };
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
>>>                                  QEMU_ARCH_LOONGARCH)
>>>    #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>>    #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>>
>>>    /* Please keep this table sorted by typename. */
>>>    static const QDevAlias qdev_alias_table[] = {
>>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>>>        { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>>>        { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>>        { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>> 
>> Hi Bernhard,
>> 
>> Can you comment if this should be:
>> 
>> +    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
>> 
>> instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
>> replaced them with PIIX. Or am I not understanding correctly?
> 
> There is a confusion in QEMU between PCI bridges, the first PCI
> function they implement, and the other PCI functions.
> 
> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
> south bridge chipset, which expose a PCI-to-ISA bridge". A better
> name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
> device is named "PIIX3" with no indication of ISA bridge.


Thanks, you are right, I see the PIIX3 device still exists after
this patch set is applied.

chuckz@debian:~/sources-sid/qemu/qemu-7.50+dfsg/hw/i386$ grep -r PIIX3 *
pc_piix.c:        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);

I also understand there is the PCI-to-ISA bridge at 00:01.0 on the PCI bus:

chuckz@debian:~$ lspci
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
00:03.0 VGA compatible controller: Device 1234:1111 (rev 02)

I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:01.3.
I get the exact same output from lspci without the patch series, so that gives
me confidence it is working as designed.

