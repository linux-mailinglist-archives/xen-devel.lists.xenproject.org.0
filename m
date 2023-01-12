Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AE66875E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 23:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476422.738587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6Ty-0003Zx-2D; Thu, 12 Jan 2023 22:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476422.738587; Thu, 12 Jan 2023 22:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6Tx-0003Xp-V9; Thu, 12 Jan 2023 22:55:37 +0000
Received: by outflank-mailman (input) for mailman id 476422;
 Thu, 12 Jan 2023 22:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b756=5J=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pG6Tv-0003Xj-M0
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 22:55:36 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37696762-92cc-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 23:55:32 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id tz12so48365592ejc.9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 14:55:32 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-135-062.92.224.pool.telefonica.de.
 [92.224.135.62]) by smtp.gmail.com with ESMTPSA id
 g9-20020a17090604c900b0085ca279966esm2907135eja.119.2023.01.12.14.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 14:55:30 -0800 (PST)
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
X-Inumbo-ID: 37696762-92cc-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcBQah7LIkYMj8F1zQ+LBzI0aneJEGKZfwDsIYdF1Lo=;
        b=UsUA5pX1vdg/jHwhIuedEWTeDhL4HsuHBBxu2MOy/ZZHOi6httqHVC1dV6chqa6yKG
         ehfVJkeA8NYLyVsGzaKZ6T+zHH7kHSIwxcrxhlBnt2PCBhWpmmBjZIQVtjv+T3Y1dL/q
         C2U/PX9JJvmjQBmbydRokghip8jXsSGZ3/bGYCHJatLzLmodRBENxhbraHZwQN5+B3Jp
         X0F3VrP4WBAToQQ5Cyt1LdMYJ03U4df9my9EXoYKHUTjwtwBvMZhKtpsv4EZmF/VCBBm
         L8PV1CKze1Uc7U9q43f9N03S88VreZhU4PXtdv1j9p8bDtIBrB/zZx6rlobAv+RdOnmV
         ak6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcBQah7LIkYMj8F1zQ+LBzI0aneJEGKZfwDsIYdF1Lo=;
        b=uflLX5ZiFrJRTii/8+3SjqSTdFeBYyMDQ7X2b/j8Sr3nLGDtOdrDbZMn6E7uS3yZdb
         kkIXBlOO7s+G3Z0w1hXlj38JcNygA+ojJIlU1EmKchxy4xEBnEkAwx7GCNTzGhUDLlsn
         DjYwgoFsDLGOngqp9T6uo2FP6cflkqzOhtPFzonq/F9Heea+dW+CW7EQ1kWlk85ACCs8
         vWwGkzljfvlV5QoVmF8PV54w2p97UV2EHOxmZ1gISk/s9sRc/ZxF1ZhLdW0LoVWUoAHQ
         6NjMvVF4XZ1GlA7KtypJXBRnN606ijIk9rjMD14uLs+6qZ1MwO5Ulm6JKXWcjHoBchb/
         W1lA==
X-Gm-Message-State: AFqh2kotrHDaT/FGAnFp64CqRssEql83YMCJsXHBCbsKELgOzapposYF
	JVIShI37MclBdeOejnStsjU=
X-Google-Smtp-Source: AMrXdXslORGdXnAT5Qh+ZwtZAi1hOcSbTOS/be198kJia8qVDipsp9tC7Yv3brA25lVSSsq4szwbvg==
X-Received: by 2002:a17:906:2dd9:b0:861:7cb0:ec64 with SMTP id h25-20020a1709062dd900b008617cb0ec64mr5950513eji.67.1673564131426;
        Thu, 12 Jan 2023 14:55:31 -0800 (PST)
Date: Thu, 12 Jan 2023 22:55:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
In-Reply-To: <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com> <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com> <20230110030331-mutt-send-email-mst@kernel.org> <a6994521-68d5-a05b-7be2-a8c605733467@aol.com> <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com> <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
Message-ID: <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 12=2E Januar 2023 20:11:54 UTC schrieb Chuck Zmudzinski <brchuckz@aol=
=2Ecom>:
>On 1/12/23 2:18=E2=80=AFPM, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 11=2E Januar 2023 15:40:24 UTC schrieb Chuck Zmudzinski <brchuckz@ao=
l=2Ecom>:
>>>On 1/10/23 3:16=E2=80=AFAM, Michael S=2E Tsirkin wrote:
>>>> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
>>>>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus=
,
>>>>> as noted in docs/igd-assign=2Etxt in the Qemu source code=2E
>>>>>=20
>>>>> Currently, when the xl toolstack is used to configure a Xen HVM gues=
t with
>>>>> Intel IGD passthrough to the guest with the Qemu upstream device mod=
el,
>>>>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will=
 occupy
>>>>> a different slot=2E This problem often prevents the guest from booti=
ng=2E
>>>>>=20
>>>>> The only available workaround is not good: Configure Xen HVM guests =
to use
>>>>> the old and no longer maintained Qemu traditional device model avail=
able
>>>>> from xenbits=2Exen=2Eorg which does reserve slot 2 for the Intel IGD=
=2E
>>>>>=20
>>>>> To implement this feature in the Qemu upstream device model for Xen =
HVM
>>>>> guests, introduce the following new functions, types, and macros:
>>>>>=20
>>>>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT=
_DEVICE
>>>>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CL=
ASS
>>>>> * typedef XenPTQdevRealize function pointer
>>>>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve =
slot 2
>>>>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>>>>>=20
>>>>> The new xen_igd_reserve_slot function uses the existing slot_reserve=
d_mask
>>>>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured=
 using
>>>>> the xl toolstack with the gfx_passthru option enabled, which sets th=
e
>>>>> igd-passthru=3Don option to Qemu for the Xen HVM machine type=2E
>>>>>=20
>>>>> The new xen_igd_reserve_slot function also needs to be implemented i=
n
>>>>> hw/xen/xen_pt_stub=2Ec to prevent FTBFS during the link stage for th=
e case
>>>>> when Qemu is configured with --enable-xen and --disable-xen-pci-pass=
through,
>>>>> in which case it does nothing=2E
>>>>>=20
>>>>> The new xen_igd_clear_slot function overrides qdev->realize of the p=
arent
>>>>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI=
 bus
>>>>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus w=
as
>>>>> created in hw/i386/pc_piix=2Ec for the case when igd-passthru=3Don=
=2E
>>>>>=20
>>>>> Move the call to xen_host_pci_device_get, and the associated error
>>>>> handling, from xen_pt_realize to the new xen_igd_clear_slot function=
 to
>>>>> initialize the device class and vendor values which enables the chec=
ks for
>>>>> the Intel IGD to succeed=2E The verification that the host device is=
 an
>>>>> Intel IGD to be passed through is done by checking the domain, bus, =
slot,
>>>>> and function values as well as by checking that gfx_passthru is enab=
led,
>>>>> the device class is VGA, and the device vendor in Intel=2E
>>>>>=20
>>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>>>> ---
>>>>> Notes that might be helpful to reviewers of patched code in hw/xen:
>>>>>=20
>>>>> The new functions and types are based on recommendations from Qemu d=
ocs:
>>>>> https://qemu=2Ereadthedocs=2Eio/en/latest/devel/qom=2Ehtml
>>>>>=20
>>>>> Notes that might be helpful to reviewers of patched code in hw/i386:
>>>>>=20
>>>>> The small patch to hw/i386/pc_piix=2Ec is protected by CONFIG_XEN so=
 it does
>>>>> not affect builds that do not have CONFIG_XEN defined=2E
>>>>>=20
>>>>> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix=2Ec file is =
an
>>>>> existing function that is only true when Qemu is built with
>>>>> xen-pci-passthrough enabled and the administrator has configured the=
 Xen
>>>>> HVM guest with Qemu's igd-passthru=3Don option=2E
>>>>>=20
>>>>> v2: Remove From: <email address> tag at top of commit message
>>>>>=20
>>>>> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
>>>>>=20
>>>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>>>         (s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL)) {
>>>>>=20
>>>>>     is changed to
>>>>>=20
>>>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr=2Eslot =3D=3D 2)
>>>>>         && (s->hostaddr=2Efunction =3D=3D 0)) {
>>>>>=20
>>>>>     I hoped that I could use the test in v2, since it matches the
>>>>>     other tests for the Intel IGD in Qemu and Xen, but those tests
>>>>>     do not work because the necessary data structures are not set wi=
th
>>>>>     their values yet=2E So instead use the test that the administrat=
or
>>>>>     has enabled gfx_passthru and the device address on the host is
>>>>>     02=2E0=2E This test does detect the Intel IGD correctly=2E
>>>>>=20
>>>>> v4: Use brchuckz@aol=2Ecom instead of brchuckz@netscape=2Enet for th=
e author's
>>>>>     email address to match the address used by the same author in co=
mmits
>>>>>     be9c61da and c0e86b76
>>>>>    =20
>>>>>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
>>>>>=20
>>>>> v5: The patch of xen_pt=2Ec was re-worked to allow a more consistent=
 test
>>>>>     for the Intel IGD that uses the same criteria as in other places=
=2E
>>>>>     This involved moving the call to xen_host_pci_device_get from
>>>>>     xen_pt_realize to xen_igd_clear_slot and updating the checks for=
 the
>>>>>     Intel IGD in xen_igd_clear_slot:
>>>>>    =20
>>>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr=2Eslot =3D=3D 2)
>>>>>         && (s->hostaddr=2Efunction =3D=3D 0)) {
>>>>>=20
>>>>>     is changed to
>>>>>=20
>>>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>>>         s->real_device=2Edomain =3D=3D 0 && s->real_device=2Ebus =3D=
=3D 0 &&
>>>>>         s->real_device=2Edev =3D=3D 2 && s->real_device=2Efunc =3D=
=3D 0 &&
>>>>>         s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL) {
>>>>>=20
>>>>>     Added an explanation for the move of xen_host_pci_device_get fro=
m
>>>>>     xen_pt_realize to xen_igd_clear_slot to the commit message=2E
>>>>>=20
>>>>>     Rebase=2E
>>>>>=20
>>>>> v6: Fix logging by removing these lines from the move from xen_pt_re=
alize
>>>>>     to xen_igd_clear_slot that was done in v5:
>>>>>=20
>>>>>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x=2E%d"
>>>>>                " to devfn 0x%x\n",
>>>>>                s->hostaddr=2Ebus, s->hostaddr=2Eslot, s->hostaddr=2E=
function,
>>>>>                s->dev=2Edevfn);
>>>>>=20
>>>>>     This log needs to be in xen_pt_realize because s->dev=2Edevfn is=
 not
>>>>>     set yet in xen_igd_clear_slot=2E
>>>>>=20
>>>>> v7: The v7 that was posted to the mailing list was incorrect=2E v8 i=
s what
>>>>>     v7 was intended to be=2E
>>>>>=20
>>>>> v8: Inhibit out of context log message and needless processing by
>>>>>     adding 2 lines at the top of the new xen_igd_clear_slot function=
:
>>>>>=20
>>>>>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>>>>         return;
>>>>>=20
>>>>>     Rebase=2E This removed an unnecessary header file from xen_pt=2E=
h=20
>>>>>=20
>>>>>  hw/i386/pc_piix=2Ec    |  3 +++
>>>>>  hw/xen/xen_pt=2Ec      | 49 ++++++++++++++++++++++++++++++++++++---=
-----
>>>>>  hw/xen/xen_pt=2Eh      | 16 +++++++++++++++
>>>>>  hw/xen/xen_pt_stub=2Ec |  4 ++++
>>>>>  4 files changed, 63 insertions(+), 9 deletions(-)
>>>>>=20
>>>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>>>> index b48047f50c=2E=2Ebc5efa4f59 100644
>>>>> --- a/hw/i386/pc_piix=2Ec
>>>>> +++ b/hw/i386/pc_piix=2Ec
>>>>> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machin=
e)
>>>>>      }
>>>>> =20
>>>>>      pc_xen_hvm_init_pci(machine);
>>>>> +    if (xen_igd_gfx_pt_enabled()) {
>>>>> +        xen_igd_reserve_slot(pcms->bus);
>>>>> +    }
>>>>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>>>>  }
>>>>>  #endif
>>>>=20
>>>> I would even maybe go further and move the whole logic into
>>>> xen_igd_reserve_slot=2E And I would even just name it
>>>> xen_hvm_init_reserved_slots without worrying about the what
>>>> or why at the pc level=2E  At this point it will be up to Xen maintai=
ners=2E
>>>
>>>I see to do that would be to resolve the two pc_xen_hvm*
>>>functions in pc_piix=2Ec that are guarded by CONFIG_XEN and
>>>move them to an appropriate place such as xen-hvm=2Ec=2E
>>>
>>>That is along the lines of the work that Bernhard and Philippe
>>>are doing, so I am Cc'ing them=2E My first inclination is just
>>>to defer to them: I think eventually the little patch I propose
>>>here to pc_piix=2Ec is eventually going to be moved out of pc_piix=2Ec
>>>by Bernhard in a future patch=2E
>>>
>>>What they have been doing is very conservative, and I expect
>>>if and when Bernhard gets here to resolve those functions, they
>>>will do it in a way that keeps the dependency of the xenfv machine
>>>type on the pc machine type and the pc_init1 function=2E
>>>
>>>What I would propose would be to break the dependency of xenfv
>>>on the pc_init1 function=2E That is, I would propose having a
>>>xenfv_init function in xen-hvm=2Ec, and the first version would
>>>be the current version of pc_init1, so xenfv would still depend
>>>on many i440fx type things, but with the change xen developers
>>>would be free to tweak xenfv_init without affecting the users
>>>of the pc machine type=2E
>>>
>>>Would that be a good idea? If I get posiive feedback for this
>>>idea, I will put it on the table, probably initially as an RFC
>>>patch=2E
>>=20
>> In various patches I've been decoupling 1/ PIIX3 from Xen and 2/ QEMU's=
 Xen integration code from the PC machine=2E My idea is to confine all wiri=
ng for a PIIX based PC machine using Xen in pc_piix=2Ec=2E The pc_xen_hvm* =
functions seem to do exactly that, so I'd leave them there, at least for no=
w=2E
>>=20
>> What I would like to avoid is for the Xen integration code to make assu=
mptions that an x86 or PC machine is always based on i440fx or PIIX3=2E
>
>I think what you are saying is that if I try to move the logic of my patc=
h to xen-hvm=2Ec, as Michael suggests, I should not move or copy any piix3 =
code to the Xen integration code, but access it via an appropriate qom inte=
rface to the code in pc_piix=2Ec and only move Xen specific things to the X=
en integration code such as the content of my patch=2E I can try to do that=
 for a v9 of my patch=2E It might take me a little while (I am not a profes=
sional coder), so I will just leave v8 of my patch as is for now until I ha=
ve a patch ready to move it out of pc_piix=2Ec the qom way=2E

I think the change Michael suggests is very minimalistic: Move the if cond=
ition around xen_igd_reserve_slot() into the function itself and always cal=
l it there unconditionally -- basically turning three lines into one=2E Sin=
ce xen_igd_reserve_slot() seems very problem specific, Michael further sugg=
ests to rename it to something more general=2E All in all no big changes re=
quired=2E

Best regards,
Bernhard

>
>Thanks,
>
>Chuck
>
>>=20
>> I like Michael's idea of going one step further, both in terms of the a=
pproach and the reasoning=2E
>>=20
>> Best regards,
>> Bernhard
>>=20
>>>Also, thanks, Michael, for your other suggestions for this patch
>>>about using macros for the devfn constants=2E
>>>
>>>Chuck
>>>
>>>>=20
>>>>> diff --git a/hw/xen/xen_pt=2Ec b/hw/xen/xen_pt=2Ec
>>>>> index 0ec7e52183=2E=2Eeff38155ef 100644
>>>>> --- a/hw/xen/xen_pt=2Ec
>>>>> +++ b/hw/xen/xen_pt=2Ec
>>>>> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error =
**errp)
>>>>>                 s->hostaddr=2Ebus, s->hostaddr=2Eslot, s->hostaddr=
=2Efunction,
>>>>>                 s->dev=2Edevfn);
>>>>> =20
>>>>> -    xen_host_pci_device_get(&s->real_device,
>>>>> -                            s->hostaddr=2Edomain, s->hostaddr=2Ebus=
,
>>>>> -                            s->hostaddr=2Eslot, s->hostaddr=2Efunct=
ion,
>>>>> -                            errp);
>>>>> -    if (*errp) {
>>>>> -        error_append_hint(errp, "Failed to \"open\" the real pci de=
vice");
>>>>> -        return;
>>>>> -    }
>>>>> -
>>>>>      s->is_virtfn =3D s->real_device=2Eis_virtfn;
>>>>>      if (s->is_virtfn) {
>>>>>          XEN_PT_LOG(d, "%04x:%02x:%02x=2E%d is a SR-IOV Virtual Func=
tion\n",
>>>>> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(=
Object *obj)
>>>>>      PCI_DEVICE(obj)->cap_present |=3D QEMU_PCI_CAP_EXPRESS;
>>>>>  }
>>>>> =20
>>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>>>> +{
>>>>> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
>>>>> +    pci_bus->slot_reserved_mask |=3D XEN_PCI_IGD_SLOT_MASK;
>>>>> +}
>>>>> +
>>>>> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
>>>>> +{
>>>>> +    ERRP_GUARD();
>>>>> +    PCIDevice *pci_dev =3D (PCIDevice *)qdev;
>>>>> +    XenPCIPassthroughState *s =3D XEN_PT_DEVICE(pci_dev);
>>>>> +    XenPTDeviceClass *xpdc =3D XEN_PT_DEVICE_GET_CLASS(s);
>>>>> +    PCIBus *pci_bus =3D pci_get_bus(pci_dev);
>>>>> +
>>>>> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>>>> +        return;
>>>>> +
>>>>> +    xen_host_pci_device_get(&s->real_device,
>>>>> +                            s->hostaddr=2Edomain, s->hostaddr=2Ebus=
,
>>>>> +                            s->hostaddr=2Eslot, s->hostaddr=2Efunct=
ion,
>>>>> +                            errp);
>>>>> +    if (*errp) {
>>>>> +        error_append_hint(errp, "Failed to \"open\" the real pci de=
vice");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (is_igd_vga_passthrough(&s->real_device) &&
>>>>> +        s->real_device=2Edomain =3D=3D 0 && s->real_device=2Ebus =
=3D=3D 0 &&
>>>>> +        s->real_device=2Edev =3D=3D 2 && s->real_device=2Efunc =3D=
=3D 0 &&
>>>>> +        s->real_device=2Evendor_id =3D=3D PCI_VENDOR_ID_INTEL) {
>>>>=20
>>>> how about macros for these?
>>>>=20
>>>> #define XEN_PCI_IGD_DOMAIN 0
>>>> #define XEN_PCI_IGD_BUS 0
>>>> #define XEN_PCI_IGD_DEV 2
>>>> #define XEN_PCI_IGD_FN 0
>>>>=20
>>>>> +        pci_bus->slot_reserved_mask &=3D ~XEN_PCI_IGD_SLOT_MASK;
>>>>=20
>>>> If you are going to do this, you should set it back
>>>> either after pci_qdev_realize or in unrealize,
>>>> for symmetry=2E
>>>>=20
>>>>> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
>>>>> +    }
>>>>=20
>>>>=20
>>>>> +    xpdc->pci_qdev_realize(qdev, errp);
>>>>> +}
>>>>> +
>>>>=20
>>>>=20
>>>>=20
>>>>>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void=
 *data)
>>>>>  {
>>>>>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>>>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>>>> =20
>>>>> +    XenPTDeviceClass *xpdc =3D XEN_PT_DEVICE_CLASS(klass);
>>>>> +    xpdc->pci_qdev_realize =3D dc->realize;
>>>>> +    dc->realize =3D xen_igd_clear_slot;
>>>>>      k->realize =3D xen_pt_realize;
>>>>>      k->exit =3D xen_pt_unregister_device;
>>>>>      k->config_read =3D xen_pt_pci_read_config;
>>>>> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info =
=3D {
>>>>>      =2Einstance_size =3D sizeof(XenPCIPassthroughState),
>>>>>      =2Einstance_finalize =3D xen_pci_passthrough_finalize,
>>>>>      =2Eclass_init =3D xen_pci_passthrough_class_init,
>>>>> +    =2Eclass_size =3D sizeof(XenPTDeviceClass),
>>>>>      =2Einstance_init =3D xen_pci_passthrough_instance_init,
>>>>>      =2Einterfaces =3D (InterfaceInfo[]) {
>>>>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>>> diff --git a/hw/xen/xen_pt=2Eh b/hw/xen/xen_pt=2Eh
>>>>> index cf10fc7bbf=2E=2E8c25932b4b 100644
>>>>> --- a/hw/xen/xen_pt=2Eh
>>>>> +++ b/hw/xen/xen_pt=2Eh
>>>>> @@ -2,6 +2,7 @@
>>>>>  #define XEN_PT_H
>>>>> =20
>>>>>  #include "hw/xen/xen_common=2Eh"
>>>>> +#include "hw/pci/pci_bus=2Eh"
>>>>>  #include "xen-host-pci-device=2Eh"
>>>>>  #include "qom/object=2Eh"
>>>>> =20
>>>>> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>>>>>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>>>>>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>>>>> =20
>>>>> +#define XEN_PT_DEVICE_CLASS(klass) \
>>>>> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
>>>>> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
>>>>> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
>>>>> +
>>>>> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
>>>>> +
>>>>> +typedef struct XenPTDeviceClass {
>>>>> +    PCIDeviceClass parent_class;
>>>>> +    XenPTQdevRealize pci_qdev_realize;
>>>>> +} XenPTDeviceClass;
>>>>> +
>>>>>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>>>>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>>>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *=
s,
>>>>>                                             XenHostPCIDevice *dev);
>>>>> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>>>>> =20
>>>>>  #define XEN_PCI_INTEL_OPREGION 0xfc
>>>>> =20
>>>>> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask=
 */
>>>>> +
>>>>=20
>>>> I think you want to calculate this based on dev fn:
>>>>=20
>>>> #define XEN_PCI_IGD_SLOT_MASK \
>>>> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
>>>>=20
>>>>=20
>>>>>  typedef enum {
>>>>>      XEN_PT_GRP_TYPE_HARDWIRED =3D 0,  /* 0 Hardwired reg group */
>>>>>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
>>>>> diff --git a/hw/xen/xen_pt_stub=2Ec b/hw/xen/xen_pt_stub=2Ec
>>>>> index 2d8cac8d54=2E=2E5c108446a8 100644
>>>>> --- a/hw/xen/xen_pt_stub=2Ec
>>>>> +++ b/hw/xen/xen_pt_stub=2Ec
>>>>> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>>>>>          error_setg(errp, "Xen PCI passthrough support not built in"=
);
>>>>>      }
>>>>>  }
>>>>> +
>>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>>>> +{
>>>>> +}
>>>>> --=20
>>>>> 2=2E39=2E0
>>>>=20
>>>
>

