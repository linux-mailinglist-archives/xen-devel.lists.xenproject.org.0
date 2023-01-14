Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B338766A8C8
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 03:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477612.740393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGWhi-00073s-Rj; Sat, 14 Jan 2023 02:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477612.740393; Sat, 14 Jan 2023 02:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGWhi-000715-NH; Sat, 14 Jan 2023 02:55:34 +0000
Received: by outflank-mailman (input) for mailman id 477612;
 Sat, 14 Jan 2023 02:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NrQy=5L=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pGWhg-00070z-CR
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 02:55:32 +0000
Received: from sonic316-55.consmr.mail.gq1.yahoo.com
 (sonic316-55.consmr.mail.gq1.yahoo.com [98.137.69.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6cfb932-93b6-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 03:55:29 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Sat, 14 Jan 2023 02:55:27 +0000
Received: by hermes--production-bf1-6cb45cc684-d6p4g (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 340913b5a67483ed7fa44c35b1b92259; 
 Sat, 14 Jan 2023 02:55:24 +0000 (UTC)
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
X-Inumbo-ID: e6cfb932-93b6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673664927; bh=W4ww9r92ugp2cxRbQbcbEV49GmNwOMWVB1K8QEPCsI0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=kEUGN7N3/Qi5ukviC8yOit8lP3fNZYl4CvdDfw8mL3G2PYhlFasztSLtd6kruTfDUU/TmI9BydnjQj17/US19D5kHT1sbkpzrUpYwJKI/agFvbnlhh+SpTErQPCdH9LlZwtUkBVtD6YYjcZ6tfNURZX7n6sz0im37Ex/XzdsLVVoZbRnTEcMiNO3/cmZFwePMiA/imhS5VR2ZWvO5V+PTcxrntvnAwerjmObuiRnKPRDhQSCA1d5WGLJ2uJWXrEp8QDcRsi47VEyPOqNHgDVrQHNY0Nd/IIfMQlGmWCojG5+swQWI+kpQrxf5j2G1mgMy5yXJ2JxYWlv4EZm42KVdA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673664927; bh=8nX+spAkZp20GYsxVlKzNUrwe7wUYdgux8hTGQ1uK3Q=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Ikelonbm7C5uj80pz5SV7CChaHqAg+aKnqHrAVp3qoh24GYteJWPopqeygCpmSwtNuOrVwmZiDpZL4d1vhZgYTcS9yMRFiE3gpFaMhkUpTzzqO2drqXdS71e98za6j6/0D8w7qOSAFGBoN5sU423mMfiUClKv0bCnL3fPefqDkUgfxirWmkurM+O+QEFTuF9nCR/e0VRLT3nhELuKNw0bv9TcUxvC1O0/Mzhqdy6TFTtNNyKobcM8/Oe/lFV4FwN6u9aC7XkkBagnzrtVXFUDCZQ7HJIJh0OA9jtaIoVKQQGPwp6wBuMS2SHkuWo6Avk63U1h7d+X61pOYX0X78iKA==
X-YMail-OSG: 5a4QQYMVM1kM0Naec5AEtslyX34kNFKFdgn0TFYZD6psKz.H5UpUeMRhSDJNT02
 oXad5OScV74TSFgT6u5GX9gR2.I0QQJ.ufVXGiMyjaG94vsdBWGJs7c94URGCfTrn_4RYuowO3kB
 vcH55bV6d1ALtldzZ.QsS0Frizvwg2Ee5ymGjsaG2vS3WoMLKgukUv.kKjteusPAN.IWmVpfWq4o
 py2EY6p93WDFJ8ZrIoS0q0QYq6ajUCfISrFvbeIQp1eyCARZC2ddL368AGFAl.bP.xTi_u6O9C4u
 dhp3Rcuzt6S.vU0eW59DkHpa1G589GEj4UnwXse8LAEzU2JuXHZYCqY46tkCNN0wtMnCRwmwK2GX
 YZ3hRoK91iHRcYeSKdVKwiiEVZyt2Gdj2h.H6vN_5VDxGMykXiPFZift9gWW4D2z2.juYW3ZCiUM
 pXtOwsNguR2AXOc47PjuRRd6UNEzosmH.xGfNSgPuiLOAYKLW5Ibs0v.HPbj8cI.MuSANBYF_u.j
 dgk.WV4V0j4pKYGZ9c7IVjrzVJoMHVCUlqqmklqFliOewEZrZZJRVRKYMaWVnf2Nw5DyBpNDWojv
 JIgC.Gkg_zCq3JKYcuCof0IKM18SFQ3brZtTNQ_gAAE3RMd_InHvogYim9xKRUwxlLcsE1eytWAC
 nRS.7lUKdfIuqn4XYqG4qFtLv3Qdf1WNog7YHlp_oUkKjRUMNXE7lgjbmU_IocEOyKBAOPh8NyNU
 6dRjo1F11j.jt4_QhsNTVDg_RRvzw8aFYt4CXh2ssBJTr0zMbosYiqkm81NzAF69o13t63MP32Gm
 ZErhivsCdQcmPVAglFHFCnCpos_5blxBxL1OUmvHh3lCOyFaJDmXU8XekZKRiExBLZB0H7U50Vnh
 TYF5TuXZZ3KuQ96oro4ajx2fKc8frJVOsU72cfaLu__tR127SolZrbFS9kOOI9erUkHos0C2OMyu
 qyI9TaFNDwvgomhE1zYP2SlyBcecdhwdbSFgrfvM5Ev6Ix6lTEme5MceocZe861vSzQwKNGl2i.s
 PcvDeKVS6CtyKpd9A3z2w12vQgMtgkYoBR2o6dIlEY5WcZcZvCdt.AkIileDcYebHHq.YBMpRyoh
 2Fexkm9xi4.y2Y2wcC2Q96tRkOcSXO7gE2a4WkXMyxDB8hi0g3dFMMprQDgj3DKJ5pASHEZCGoSt
 CBzMiNJo4QrGCOSz..8kATr.HJ4DRGVoFyKmdvy9JTA33dOseA2OOTiRViD9ygcNUXcWoGnqImrz
 2YMU7MC3OOeamtAZgBWpv4aAHvLxWir_C6gm2QqlX.QvraGD8pdZvULVXAPvOAMZDfGE62GrIwUE
 Qb7bSz6IZ7O3IhzY86AIyA2JEUtGOhePp6.7aTAKP5DgtQIvsg5iJj7cg0bpri54n2J669amrsQX
 cF_g7ok3IyCrMNBxim7W1EuF0dv8cB__HQzazmrLXGG6IMcmpJZMWwPvf6wYhQeye5Cb3AzQKsp9
 Jwe7g1CLlvfFPIJO8N74hbUCXs5uUWMZnWtSMZxHxLwVheBZsjHdaDHrje_8.to8B5DeHRILeAh4
 _8.Cosqei1wLHxr__SPPhVw_VpycjJj0TVVq5eiC5hDaR7aKPfy05.eNRKx1vSrsYJvjMI.B1EDU
 hev13nDFkbP.1IN4y.okQ2QlQX2MB5oIyCQep6BZaOs1jfE8D4HMXZwPJlyHjmzzLPtWh5RRmmib
 DCokj7G8.tW2o4.ZRsVMjg7LVlXVM59zxaG_imhT5limdRDxxKh0w70Hj.uy9whRXOfbmvZv4hB3
 qTX4xkFiFHjDOcC027wHcoKOPIsBSa4wMQAiTLalpY_Rb42NqHMLl8hYLdTJu13Errolu.WMq99.
 Bmw1ARbYOIP1GFtW_.0rtZ8KLDr9cGotL3I.mW7wB5qoCIzdauU9BdD67_CmrNO0TyXCSx6zwMLL
 k3C7yeGx8WAH1ngvf6_xPqmFZOKY0zv3dYnlFvcytOQaiyh3K56S51Ary6FqGgVlrT.itXNW3dJA
 gd39v0KsSxQhHS9PizWpVLuTYkWEiQ_kNdQuPYc26VyJZeKPyRYbGZztQg9_76G2FwbGRtT6up9R
 a_ZlS.1WbZOwnU2SeMyYYsH_ZkfM.0dgl9q8nIY3eqwSPF2.uwp2BqK2macpN3lOAO2XjOoet3a6
 OQ2lmW91.0LRX_PqK_ywplXVB_xGNEPWZ1ocD1BxinCwQ.OYkgXoploxDyBf2Bi2gvvtPQ28C5sV
 IK6QIxegUPo90F3_DmA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <87b831e1-6646-fd9b-2b5e-be61b9ec527d@aol.com>
Date: Fri, 13 Jan 2023 21:55:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230110030331-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/10/23 3:16 AM, Michael S. Tsirkin wrote:
> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> as noted in docs/igd-assign.txt in the Qemu source code.
>> 
>> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> Intel IGD passthrough to the guest with the Qemu upstream device model,
>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> a different slot. This problem often prevents the guest from booting.
>> 
>> The only available workaround is not good: Configure Xen HVM guests to use
>> the old and no longer maintained Qemu traditional device model available
>> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> 
>> To implement this feature in the Qemu upstream device model for Xen HVM
>> guests, introduce the following new functions, types, and macros:
>> 
>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> * typedef XenPTQdevRealize function pointer
>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> 
>> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> the xl toolstack with the gfx_passthru option enabled, which sets the
>> igd-passthru=on option to Qemu for the Xen HVM machine type.
>> 
>> The new xen_igd_reserve_slot function also needs to be implemented in
>> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>> in which case it does nothing.
>> 
>> The new xen_igd_clear_slot function overrides qdev->realize of the parent
>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>> 
>> Move the call to xen_host_pci_device_get, and the associated error
>> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>> initialize the device class and vendor values which enables the checks for
>> the Intel IGD to succeed. The verification that the host device is an
>> Intel IGD to be passed through is done by checking the domain, bus, slot,
>> and function values as well as by checking that gfx_passthru is enabled,
>> the device class is VGA, and the device vendor in Intel.
>> 
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>> Notes that might be helpful to reviewers of patched code in hw/xen:
>> 
>> The new functions and types are based on recommendations from Qemu docs:
>> https://qemu.readthedocs.io/en/latest/devel/qom.html
>> 
>> Notes that might be helpful to reviewers of patched code in hw/i386:
>> 
>> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
>> not affect builds that do not have CONFIG_XEN defined.
>> 
>> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
>> existing function that is only true when Qemu is built with
>> xen-pci-passthrough enabled and the administrator has configured the Xen
>> HVM guest with Qemu's igd-passthru=on option.
>> 
>> v2: Remove From: <email address> tag at top of commit message
>> 
>> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
>> 
>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
>> 
>>     is changed to
>> 
>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>         && (s->hostaddr.function == 0)) {
>> 
>>     I hoped that I could use the test in v2, since it matches the
>>     other tests for the Intel IGD in Qemu and Xen, but those tests
>>     do not work because the necessary data structures are not set with
>>     their values yet. So instead use the test that the administrator
>>     has enabled gfx_passthru and the device address on the host is
>>     02.0. This test does detect the Intel IGD correctly.
>> 
>> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>>     email address to match the address used by the same author in commits
>>     be9c61da and c0e86b76
>>     
>>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
>> 
>> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>>     for the Intel IGD that uses the same criteria as in other places.
>>     This involved moving the call to xen_host_pci_device_get from
>>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>>     Intel IGD in xen_igd_clear_slot:
>>     
>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>         && (s->hostaddr.function == 0)) {
>> 
>>     is changed to
>> 
>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
>> 
>>     Added an explanation for the move of xen_host_pci_device_get from
>>     xen_pt_realize to xen_igd_clear_slot to the commit message.
>> 
>>     Rebase.
>> 
>> v6: Fix logging by removing these lines from the move from xen_pt_realize
>>     to xen_igd_clear_slot that was done in v5:
>> 
>>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>>                " to devfn 0x%x\n",
>>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>                s->dev.devfn);
>> 
>>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>>     set yet in xen_igd_clear_slot.
>> 
>> v7: The v7 that was posted to the mailing list was incorrect. v8 is what
>>     v7 was intended to be.
>> 
>> v8: Inhibit out of context log message and needless processing by
>>     adding 2 lines at the top of the new xen_igd_clear_slot function:
>> 
>>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>         return;
>> 
>>     Rebase. This removed an unnecessary header file from xen_pt.h 
>> 
>>  hw/i386/pc_piix.c    |  3 +++
>>  hw/xen/xen_pt.c      | 49 ++++++++++++++++++++++++++++++++++++--------
>>  hw/xen/xen_pt.h      | 16 +++++++++++++++
>>  hw/xen/xen_pt_stub.c |  4 ++++
>>  4 files changed, 63 insertions(+), 9 deletions(-)
>> 
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index b48047f50c..bc5efa4f59 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>>      }
>>  
>>      pc_xen_hvm_init_pci(machine);
>> +    if (xen_igd_gfx_pt_enabled()) {
>> +        xen_igd_reserve_slot(pcms->bus);
>> +    }
>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>  }
>>  #endif
> 
> I would even maybe go further and move the whole logic into
> xen_igd_reserve_slot. And I would even just name it
> xen_hvm_init_reserved_slots without worrying about the what
> or why at the pc level.  At this point it will be up to Xen maintainers.
> 
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 0ec7e52183..eff38155ef 100644
>> --- a/hw/xen/xen_pt.c
>> +++ b/hw/xen/xen_pt.c
>> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>                 s->dev.devfn);
>>  
>> -    xen_host_pci_device_get(&s->real_device,
>> -                            s->hostaddr.domain, s->hostaddr.bus,
>> -                            s->hostaddr.slot, s->hostaddr.function,
>> -                            errp);
>> -    if (*errp) {
>> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
>> -        return;
>> -    }
>> -
>>      s->is_virtfn = s->real_device.is_virtfn;
>>      if (s->is_virtfn) {
>>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
>> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>>  }
>>  
>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>> +{
>> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
>> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
>> +}
>> +
>> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
>> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
>> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
>> +
>> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>> +        return;
>> +
>> +    xen_host_pci_device_get(&s->real_device,
>> +                            s->hostaddr.domain, s->hostaddr.bus,
>> +                            s->hostaddr.slot, s->hostaddr.function,
>> +                            errp);
>> +    if (*errp) {
>> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
>> +        return;
>> +    }
>> +
>> +    if (is_igd_vga_passthrough(&s->real_device) &&
>> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
>> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
>> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> 
> how about macros for these?
> 
> #define XEN_PCI_IGD_DOMAIN 0
> #define XEN_PCI_IGD_BUS 0
> #define XEN_PCI_IGD_DEV 2
> #define XEN_PCI_IGD_FN 0
> 
>> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> 
> If you are going to do this, you should set it back
> either after pci_qdev_realize or in unrealize,
> for symmetry.

I presume you are talking about the log here. The clearing of
the bit must be done before pci_qdev_realize because the slot
is assigned in pci_qdev_realize. If the bit is not cleared *before*
calling pci_qdev_realize, the igd will not be assigned slot 2.
Doing that would defeat the whole purpose of the patch.

I suppose I could move the log message after pci_qdev_realize
for symmetry, that would not change how the patch works. 

> 
>> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
>> +    }
> 
> 
>> +    xpdc->pci_qdev_realize(qdev, errp);
>> +}
>> +
> 
> 
> 
>>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>  
>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
>> +    xpdc->pci_qdev_realize = dc->realize;
>> +    dc->realize = xen_igd_clear_slot;
>>      k->realize = xen_pt_realize;
>>      k->exit = xen_pt_unregister_device;
>>      k->config_read = xen_pt_pci_read_config;
>> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>>      .instance_size = sizeof(XenPCIPassthroughState),
>>      .instance_finalize = xen_pci_passthrough_finalize,
>>      .class_init = xen_pci_passthrough_class_init,
>> +    .class_size = sizeof(XenPTDeviceClass),
>>      .instance_init = xen_pci_passthrough_instance_init,
>>      .interfaces = (InterfaceInfo[]) {
>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
>> index cf10fc7bbf..8c25932b4b 100644
>> --- a/hw/xen/xen_pt.h
>> +++ b/hw/xen/xen_pt.h
>> @@ -2,6 +2,7 @@
>>  #define XEN_PT_H
>>  
>>  #include "hw/xen/xen_common.h"
>> +#include "hw/pci/pci_bus.h"
>>  #include "xen-host-pci-device.h"
>>  #include "qom/object.h"
>>  
>> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>>  
>> +#define XEN_PT_DEVICE_CLASS(klass) \
>> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
>> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
>> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
>> +
>> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
>> +
>> +typedef struct XenPTDeviceClass {
>> +    PCIDeviceClass parent_class;
>> +    XenPTQdevRealize pci_qdev_realize;
>> +} XenPTDeviceClass;
>> +
>>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>                                             XenHostPCIDevice *dev);
>> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>>  
>>  #define XEN_PCI_INTEL_OPREGION 0xfc
>>  
>> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
>> +
> 
> I think you want to calculate this based on dev fn:
> 
> #define XEN_PCI_IGD_SLOT_MASK \
> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
> 
> 
>>  typedef enum {
>>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
>> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
>> index 2d8cac8d54..5c108446a8 100644
>> --- a/hw/xen/xen_pt_stub.c
>> +++ b/hw/xen/xen_pt_stub.c
>> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>>          error_setg(errp, "Xen PCI passthrough support not built in");
>>      }
>>  }
>> +
>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>> +{
>> +}
>> -- 
>> 2.39.0
> 


