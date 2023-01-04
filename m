Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9265DA44
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471329.731139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6qu-0003LA-Pl; Wed, 04 Jan 2023 16:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471329.731139; Wed, 04 Jan 2023 16:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6qu-0003IR-N0; Wed, 04 Jan 2023 16:42:56 +0000
Received: by outflank-mailman (input) for mailman id 471329;
 Wed, 04 Jan 2023 16:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pD6qt-0003I0-7c
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:42:55 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38d321d-8c4e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 17:42:52 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 16:42:49 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b97eb870a99459924a5a879746b40ce5; 
 Wed, 04 Jan 2023 16:42:46 +0000 (UTC)
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
X-Inumbo-ID: d38d321d-8c4e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672850569; bh=gkECN0M7dTCv9hA50jRyxlhxwaSHqhYobw90TKq7mWM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=h8oY8n4lLbImB1k6gMs4kYXc4cNXruE9QK7kq7ctrtMOTKcGEyQR3UEhj1g9LiQW8G8HQ215zzdM1N3uYxFtojKOPkWG6aoUCpE+ZdjEGE7kD3LqmIDu0NiG5wSqJryzR1V0IWBtCiAjPvlXh/7KFvC0kLfkLQ4hneRcZsgVZz1TSG2/vbRJxSRxO+JMFySsIDZBFnREiFfwaWs+gLyKVPsTb4IqcJHEANa1a8t2MqaCCJ5N0UOPql3J9Anje6DeTiSnmhZw7IFJqURXiwctYcmAlO7SXYWXDweeOSxrFeF1R68P3uB69xG+zHu6uacNG5wEKOJBQSYcZYsvwmnn4w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672850569; bh=02o3orJMLFp/E0j67fA2cazTjOZU8h9oAObFnE24cw2=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=lkkqrk2W9BhxIhO66ofRokPWnaWMyJ3Ygie8qiTAKKM7GtnrbV6JtfdjM0+EH8f5ioGJKOiRFZHQ/3U6Id7sI/N/GI9/GnuU716vvxg/eJBkeGc/jlLnOpqH+rXNWi40e95rbxsJI6KS7EFq+mTs3CERXL2kOOca527EXRWVXpL3bszjreGg0tlrCHYkfXeZb7JDQxnpcSPWxb7PEwAtghnbTZWaNius53k009QGyTLPKvnO/PnBtZaeT24SdUz5YGVhHYE1MyLhaAGnb5b63zE/qPI2zKHigsVI6SHkmK/Ozq78LjIIDfKQV8Km0dvyyRSGn+tmqgBIsxU1sBIraQ==
X-YMail-OSG: vknwtRAVM1l1uz1Q_nHZbH.B8L8gyl.qQ.KBCiCZrU_RCKZy0AnUDBa42P9Tzru
 iXAXZJghdT5Gr6nTd95_2CNoTsA.SvwRJjoUWPYxjLAM8zoyq0Sftla.zHqD5U3_jIQxpGgWReks
 m4iCgagvyS96mwvKkE6OoObuSyqoJ9.cbmHGU.IDplR0uX2upFsq0OxzzGF6m9Vlrta_uzNZ6Y32
 ZSzit1PdsgbIO4mZyf_d18Vwrjb2oHQ.8terXvT8KACy9Sf5sdSlils4Snk8oQIcH4CMy43hUFpB
 .Gfi3OtGCB4aiik236yGWOgJVNWUeNLvS3BQCjVIdO7SeE4id3cMAqp3z5R84bjUfktHEFjA5Mtj
 r2YVQGwdllrd2d9CJ_O_KV_Ipanu5viRC4VUl6.8nW.itbEHQn3.5VQuKscFo52kX3D2WjTAxrrz
 lNhwT1DBHsqRT3oELI23i_G2d5pl7AoBYssEiYeJWBu1.RJ8.cJ1LQtuDE.gRhu6N_nA19bU38PM
 8sX5eo8x7PXyPemEtXz1tfrBe1yJxjZqnuTYslLGWNZT1zs42UsQcthR9ZCI6COOJeUhZJUP5PqJ
 N5nvfZxg4mO4XRzbMI0IxxWP.SyHTwDD3FjmuPAKI2KfUYF8i8wNT0xpzu52fYOF01N771kaG36M
 lHgXM8WQrNHocPLW.W2dl78JPjtxgOOLeFMu0Xpl3wZ3OfH.itcTiaskB3z7.iKH2sI.uuCm4oxF
 LCttbeR92n8eF41rLX3jYVGmpdX9V3aZ2wytMm0J2lxM_Vle4sXouGvuVoe1Zf5hNSCogsegN_vj
 ljmGMXb0V4HHhqAjdYm9tuM5_8P5jgAm1wFOpOIUgu2wHKkVgxIWpGZDLBvJQm6UDNHYeq.u1QiL
 cquBrZjXaKtM8ws6DjuvTv3mhguu8qXGRC.k7b4vaV_7XfWdMsjGn3PWFRV68gTGAvYKLygWv3Qv
 88_vieb4xNpIjUdGjZNs3fUTWNDs90b8ebVChnkhZlTa3.LbOHYupm3BJrPvNN9cTvzu9F.0gKHl
 v55ufBNyKa47L9NwwdTzOgQIOzF_bG9TCWmJKYJ2QOt5wiwoEeu8APYbbVY5pliyDGipzXRXgPEZ
 akot0gTNo58w3LHV2IM0ycODKBXCkRSNv1mMoJd1omQITPAGGm5pwxC3OeLal7jEFZV.KiE.4ncz
 7ydc1i4rHU.45Ez0sno7tMlJnmtm23n4yWRobmc57yHrKvi8GQi3r7zVXVJ65lchQhygU83s7f17
 DafsXn608z0Hk0KOC56QGEcysFYRuDMz3Ly7dw99EiOmpmXSUEM.zwJETceKuz89keWBxJgio_Kk
 V1S_5OYaHq3ckztTMBe_68OfMBQPoafkosXYdVbiwMvrg3sdtwayGCHWr9ZaAjG2HHccypxywy6b
 OZ4KMMuFUeMa5NN8LZgDvzTPqOy9hVMJBvDPz_knuf1eWyi0hQTjGvjHA.kllO63kCu6g4BZGjEE
 82rGQ0tM2lqSSTznD6tf871ijV2mwNijMI_hpAIpylW2KqxZQfP9SwyxBLR1CFa._bpNDHND5u1k
 oayEKK0sz8blLKg7SJTrQNNN9xL5WW5BUHuc7AU5JBPBzVm5aICylhfgdByJg0shVSK9l40ID_cL
 AAkOETf4ddNcfhYA4YlfqiDptlRX52tH6EzOTk.F8f1w3WbCkf1EzP_Bm7QTlLXWqTkLspnyzOze
 AS_vTi6DYOZ_N1csoX._HWEqQMHoQpJCVJY8G4NMm7PwlATHw7CceuwmBweGeHjCpOhrXPH2NIFG
 B7im88usBn0wHgjb24nZrbCQ0rwJnQ8KZiJGEw6G.YDNn6.sQqPYV37IqFzmu.KTryK8CEWwbYSr
 XrYFaF6YmyL7u2tnS33ZvPur3CQpqY5_cIxQDVvMlxWJUzfbPJ5E3Y.j_4_pbjbiXQp.7R8geggv
 IKu9.wyEvLN8R3nK8Vj_s6TW1oF5ZsvpkMtFGyZbiF.RHm9MoE35LeCg1Ju5pSmqv8NenFrd0axY
 nlwlPXOMzXo2vqBHhyrWhCgEMfqJuAqaiv2O_yQ3q6ADJ6DidlfuKyj.HD9R8vRNzQFk6y5pKab0
 tQOArth2F3MVhO4HQA7oEWNBrxk7U9OGJT1MdRmFm84Mupmn7Q.OyFyIaY4u4hKAivSpxkKj30WT
 irJnBuvWUmIz35PJLqwhK4Z5I.P20Ex3zOiFBa6fVC8wxE0q105DsBQxTTj6BTvVshDNKuFSMKcT
 J3nr7F4iEZpwQNQUsf5JXjHo-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
Date: Wed, 4 Jan 2023 11:42:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230104144437.27479-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 9:44 AM, Bernhard Beschow wrote:
> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> TYPE_PIIX3_DEVICE. Remove this redundancy.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/i386/pc_piix.c             |  4 +---
>  hw/isa/piix.c                 | 20 --------------------
>  include/hw/southbridge/piix.h |  1 -
>  3 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5738d9cdca..6b8de3d59d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>      if (pcmc->pci_enabled) {
>          DeviceState *dev;
>          PCIDevice *pci_dev;
> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                         : TYPE_PIIX3_DEVICE;
>          int i;
>  
>          pci_bus = i440fx_init(pci_type,
> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>                                         : pci_slot_get_pirq);
>          pcms->bus = pci_bus;
>  
> -        pci_dev = pci_new_multifunction(-1, true, type);
> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>          object_property_set_bool(OBJECT(pci_dev), "has-usb",
>                                   machine_usb(machine), &error_abort);
>          object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> index 98e9b12661..e4587352c9 100644
> --- a/hw/isa/piix.c
> +++ b/hw/isa/piix.c
> @@ -33,7 +33,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/ide/piix.h"
>  #include "hw/isa/isa.h"
> -#include "hw/xen/xen.h"
>  #include "sysemu/runstate.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/acpi_aml_interface.h"
> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>      .class_init    = piix3_class_init,
>  };
>  
> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -
> -    k->realize = piix3_realize;
> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
> -    dc->vmsd = &vmstate_piix3;
> -}
> -
> -static const TypeInfo piix3_xen_info = {
> -    .name          = TYPE_PIIX3_XEN_DEVICE,
> -    .parent        = TYPE_PIIX_PCI_DEVICE,
> -    .instance_init = piix3_init,
> -    .class_init    = piix3_xen_class_init,
> -};
> -
>  static void piix4_realize(PCIDevice *dev, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>  {
>      type_register_static(&piix_pci_type_info);
>      type_register_static(&piix3_info);
> -    type_register_static(&piix3_xen_info);
>      type_register_static(&piix4_info);
>  }
>  
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 65ad8569da..b1fc94a742 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -77,7 +77,6 @@ struct PIIXState {
>  OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>  
>  #define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>  #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>  
>  #endif


This fixes the regression with the emulated usb tablet device that I reported in v1 here:

https://lore.kernel.org/qemu-devel/aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com/

I tested this patch again with all the prerequisites and now with v2 there are no regressions.

Tested-by: Chuck Zmudzinski <brchuckz@aol.com>

