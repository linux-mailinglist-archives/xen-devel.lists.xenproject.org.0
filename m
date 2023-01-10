Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3180664151
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 14:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474678.735971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFENX-000601-QM; Tue, 10 Jan 2023 13:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474678.735971; Tue, 10 Jan 2023 13:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFENX-0005wr-NR; Tue, 10 Jan 2023 13:09:23 +0000
Received: by outflank-mailman (input) for mailman id 474678;
 Tue, 10 Jan 2023 13:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pFENW-0005wk-BM
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 13:09:22 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc845035-90e7-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 14:09:18 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 13:09:16 +0000
Received: by hermes--production-bf1-5458f64d4-x4bxm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID de83800b43f3da3b8dbb82366d9f0a6c; 
 Tue, 10 Jan 2023 13:09:11 +0000 (UTC)
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
X-Inumbo-ID: fc845035-90e7-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673356156; bh=xPxK0N/c7OIZ3S47koGswtv5h8DdNmsgPJE9fA0o+04=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jGCO6TUPD0nJtcyssryZVuYZtFVJcyPjBUjNQT2g7xLC4oLXqjMybRn4qd/7D37CoVgs0Dhv1euZ9rIocRF5JlwC54GWuYDgUCYnIjzM176wJC+W1dfuZoBiJyZWIkk0aVuTamKTLN1rXbNwKQAPYTyuPdwBBw73u/ZuQ3i36B43ggLVFD6cvrbGjwxbtkQ1GKwQXl7DXHzMXmU/PhfE0GygtLnXFNug6aW5rsa6d5FSLbN5z431GJKyle5qRwDDBEdt59yvGyrR21qkmdbjKhO7ynWowRAfWYip7n3gf/c4n7irg2qqt4Tpnf3mh8ckBX0z1JfkDi1rkQnbVpoUjg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673356156; bh=xZ1//y5QUMtnD0uQm4jIk+IlVK2ENED2z9z6FebXnH9=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=r9Vbs1RUBsIabd6vbS/4QDcb0iSI/TLZ5RvUocmMd3Btbu/t6nY6iyjKpxs27H4riOjC2kaxZuU7lqa6EUmtlCwhnDhgFZbvNwtfh1/ohzamU/xjU1y7z/94/9VGO1BNq9u6LeG/x7mUb28XfenQIljEyQdFIC737lK4aN2kiWYhXFN1ef32LziyfPC9q9K7+eHFgJebRprPWjkRP9Xtsmbqnyk2oGZGouKGVkBC/uYBwgTl47PuqAt8PQkChp4jIFSQOJ3abl1zX6TpIwNagMCQC5ZGp/t+a5KK5LewiskqphRQ8HAKdpI0p3znMDtWG67IliEZ601bNgsoU8/oMA==
X-YMail-OSG: RRrQYqgVM1mtJQxO.V8_ljUdVLqrV67aiRiAzws5CkNAmmdaUhLwgx9UveX7Net
 6Zwx0BawIRZIBqDZlsBk.wIDsbPzVheKuBawppBV81QJA_qAjT0Z1ToE3qSUc1MCBlCj7I8gj9af
 j_RgWHN.LmgPDrNt5Qkz1pKwl.r07OJV7BqvYNyyg788KZcL2lz_dt38ph7lLt6CwbPE3K.zI4DW
 doCnmgK6dI73IWfTzvDqWpstamMDc.tAD8Nmo5WIhS43YfcEGws9OjUYEjzh2ayvy3jZG4lFo8eG
 GKWoT50mrYkZYhKL3KSWDBzoU7yCMU_Jvl96ncRjnJQq7sPaLaodHqccRcfidYUFP34SzD4b4iBM
 mh1FNcC6Zj7kWND00EqrnuyBTnCIPTcRB7G5cHBQL4sinM5VI9euuE13zLfYHI4cS24RIHw5LmLG
 jyv7KDg9MIWa04Zp.feFDHb1Y8FPEvd3YKc732OIUyYcw7prhufXohDTNGoELoun2LJmfADlUPVD
 MfFqzwNPrE4HrD2_C.9OtLCa0tUxwDQB10QwyXGQ_uRpM1MhTcYvyh5xFCubli3rArINChPWf47a
 Plic6roXX348LITPuz8sEzXDp99qoe0NDAPwwSOmn7J1e0FvL4svGV2j.L1ldENHZzsE3MUa8lgr
 pA.TRs2Bsa36r3W8msi_QQprxFdWLsENZSOOkD4WyBOcpLIZ4neZC5VjpoQWPQf0ZEG67J8MnQfm
 iKekUH0ZJCd6nM2JEQ2Vs_zmxB_VR6g_3Y0nhrg8C4sPbh_C69xfQI8x542J86Xze.GheW1JazQS
 0Se3JC4cAWvc25NZ5eXVN.9lbC6b7JIuRPdHBKMuSS_yA.VmqrYzyMx.a_y.EMwCM3yhWG5jqIKJ
 7Yi8kqmLzPbhtI1t.J3Ep_xWQCnbv5ugF8aGzbtQPy5m7l5ZgqrATtVdOXwNFfH1PsmIxNPAH6XH
 N6_DPXLwg2xQcrIx5L4RM470t934eTbu_L06PReFP4DjQnwJ8N1w9k4CtlTYFDzo06Su0N6PZq6r
 Z4qkuue3x9RyuYwaSVKE07OmFnA9cUEGy_5RYDn3nZl6DL3xNuRxeZ5d6SF6t7fZmrsyRgWC5Lkl
 g5E7EjcvLW2mcOZaVa5HntrfokQnfTxk6lM.pJPOXUtcuwuZR12UmdiwNNta1gfogDIXaysjBs0s
 E8aUFeNRufVyID2_KWVy_9iHoZUnAEOvauWdD8FlaIlKIEmUj3i37uhyCvcGmnFUy6ExiY1_ct3e
 bPut9_stPl6g_hFf4O34GutT2HtZ_6QaBDmcC1B.dmGZNfcN0N_VBa5JurTl1GGFzg76kUHAPrtT
 tZtyAKFQQwrCPxyVffIIpEHISSItbxFQTUY8Wiz_IknzMATu822uumUxQEDP4Ls8B2ryvY8StuTr
 cRZ_Ra6AaZ66ZrG8pQJa8UGKNog4t.8wEy4j0RCD7WtVWT9iRJ9.rXM5bomkGxXv9OZugVjsaL7U
 1TMM4Qujkorv0zOeVjHhANwU_C8xpWSIx.1Oe8te8twG.tYSH6ch8uW.PyJKg_czkJUGj.bII3wr
 Vl.F9Tp9PyjF3MV0J_iwAHR0dXZXOs9k5HcQff62SMcLxXJ4nYU47O7RzefTKx83AVkxVrPDFjrW
 gGoifTRJjOXNW.Yf6tmjZyBkvJPZaZqUonPkNia2EOX0pEVhwIiTuTs14peZp5Eq7q.Kll0az7Be
 L8rQd0O.s8Z9f33TysA3bJMj129c2QLNmQ96rKncqHH93R.ZCO.lYmv2S0JWI2Co95yUuOkzCiOC
 lklZcL57zEIFCE.JWJdgAD3m2AIw.HLIY18iOpgHe2M_j3qKdukq.hUrLa0wbk2_i9TuDaNj6ymp
 CbFKn27R5n7q9ysQcwZ2UcRhQG6PVXErb3abD2fFK9mkRnED6pz9D945DheYOdXtLXue5kkoDPH_
 Rxtsj4u04OVlLz84Huva0wF81XfZb8IkySR4vcRRLKwBtyDmdp.zpQJSGRNgxFUOuseiAdXwwOcl
 Obkep2oAWPtI74GevSoG5w6IFDDnSq8kMuR7cXr7bi4LmGnBUJ7FW1afQETD5VMCiFM_XBY838jT
 f1GsSnXQnDLC1roS9J_Wbwbzv.rXVSIFadzhTJiIJ_0H53TVrW80LMN0yBoG9k0u6x7vyhqYaWFU
 dpQpGfYjinLETlu5BlACbDOU_tbiucSFy.BIsA92v7v973E8aB5iOxkh6flSkUjNlPTh2EyBErj9
 ZeLpYzDnoLEG53BsQZ1qyrmI-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <8d5a0277-cfb0-169f-671a-0437118f7afb@aol.com>
Date: Tue, 10 Jan 2023 08:09:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/10/2023 3:16 AM, Michael S. Tsirkin wrote:
> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
> > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > as noted in docs/igd-assign.txt in the Qemu source code.
> > 
> > Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > Intel IGD passthrough to the guest with the Qemu upstream device model,
> > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > a different slot. This problem often prevents the guest from booting.
> > 
> > The only available workaround is not good: Configure Xen HVM guests to use
> > the old and no longer maintained Qemu traditional device model available
> > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > 
> > To implement this feature in the Qemu upstream device model for Xen HVM
> > guests, introduce the following new functions, types, and macros:
> > 
> > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > * typedef XenPTQdevRealize function pointer
> > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > 
> > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > the xl toolstack with the gfx_passthru option enabled, which sets the
> > igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > The new xen_igd_reserve_slot function also needs to be implemented in
> > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > in which case it does nothing.
> > 
> > The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > 
> > Move the call to xen_host_pci_device_get, and the associated error
> > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > initialize the device class and vendor values which enables the checks for
> > the Intel IGD to succeed. The verification that the host device is an
> > Intel IGD to be passed through is done by checking the domain, bus, slot,
> > and function values as well as by checking that gfx_passthru is enabled,
> > the device class is VGA, and the device vendor in Intel.
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > ---
> > Notes that might be helpful to reviewers of patched code in hw/xen:
> > 
> > The new functions and types are based on recommendations from Qemu docs:
> > https://qemu.readthedocs.io/en/latest/devel/qom.html
> > 
> > Notes that might be helpful to reviewers of patched code in hw/i386:
> > 
> > The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> > not affect builds that do not have CONFIG_XEN defined.
> > 
> > xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
> > existing function that is only true when Qemu is built with
> > xen-pci-passthrough enabled and the administrator has configured the Xen
> > HVM guest with Qemu's igd-passthru=on option.
> > 
> > v2: Remove From: <email address> tag at top of commit message
> > 
> > v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
> > 
> >     if (is_igd_vga_passthrough(&s->real_device) &&
> >         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
> > 
> >     is changed to
> > 
> >     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
> >         && (s->hostaddr.function == 0)) {
> > 
> >     I hoped that I could use the test in v2, since it matches the
> >     other tests for the Intel IGD in Qemu and Xen, but those tests
> >     do not work because the necessary data structures are not set with
> >     their values yet. So instead use the test that the administrator
> >     has enabled gfx_passthru and the device address on the host is
> >     02.0. This test does detect the Intel IGD correctly.
> > 
> > v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
> >     email address to match the address used by the same author in commits
> >     be9c61da and c0e86b76
> >     
> >     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
> > 
> > v5: The patch of xen_pt.c was re-worked to allow a more consistent test
> >     for the Intel IGD that uses the same criteria as in other places.
> >     This involved moving the call to xen_host_pci_device_get from
> >     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
> >     Intel IGD in xen_igd_clear_slot:
> >     
> >     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
> >         && (s->hostaddr.function == 0)) {
> > 
> >     is changed to
> > 
> >     if (is_igd_vga_passthrough(&s->real_device) &&
> >         s->real_device.domain == 0 && s->real_device.bus == 0 &&
> >         s->real_device.dev == 2 && s->real_device.func == 0 &&
> >         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> > 
> >     Added an explanation for the move of xen_host_pci_device_get from
> >     xen_pt_realize to xen_igd_clear_slot to the commit message.
> > 
> >     Rebase.
> > 
> > v6: Fix logging by removing these lines from the move from xen_pt_realize
> >     to xen_igd_clear_slot that was done in v5:
> > 
> >     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
> >                " to devfn 0x%x\n",
> >                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
> >                s->dev.devfn);
> > 
> >     This log needs to be in xen_pt_realize because s->dev.devfn is not
> >     set yet in xen_igd_clear_slot.
> > 
> > v7: The v7 that was posted to the mailing list was incorrect. v8 is what
> >     v7 was intended to be.
> > 
> > v8: Inhibit out of context log message and needless processing by
> >     adding 2 lines at the top of the new xen_igd_clear_slot function:
> > 
> >     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
> >         return;
> > 
> >     Rebase. This removed an unnecessary header file from xen_pt.h 
> > 
> >  hw/i386/pc_piix.c    |  3 +++
> >  hw/xen/xen_pt.c      | 49 ++++++++++++++++++++++++++++++++++++--------
> >  hw/xen/xen_pt.h      | 16 +++++++++++++++
> >  hw/xen/xen_pt_stub.c |  4 ++++
> >  4 files changed, 63 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index b48047f50c..bc5efa4f59 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
> >      }
> >  
> >      pc_xen_hvm_init_pci(machine);
> > +    if (xen_igd_gfx_pt_enabled()) {
> > +        xen_igd_reserve_slot(pcms->bus);
> > +    }
> >      pci_create_simple(pcms->bus, -1, "xen-platform");
> >  }
> >  #endif
>
> I would even maybe go further and move the whole logic into
> xen_igd_reserve_slot. And I would even just name it
> xen_hvm_init_reserved_slots without worrying about the what
> or why at the pc level.  At this point it will be up to Xen maintainers.

I will try to do that for v9. That would reduce, rather than increase, the
technical debt. I actually wanted to move all the xen specific stuff in
pc_piix.c to xen-hvm.c. That would reduce the technical debt that
has accumulated over the years. I just couldn't see how to do it easily.
It looked I would need to do violence to pc_init1. But, I suppose,
pc_init1 is the kind of function that has accumulated lots of technical
debt and needs some violence done to it! I will give it a try, but it
might take me a while. I think if it was easy, someone would have
done it by now.

Thanks,

Chuck

>
> > diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> > index 0ec7e52183..eff38155ef 100644
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
> >                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
> >                 s->dev.devfn);
> >  
> > -    xen_host_pci_device_get(&s->real_device,
> > -                            s->hostaddr.domain, s->hostaddr.bus,
> > -                            s->hostaddr.slot, s->hostaddr.function,
> > -                            errp);
> > -    if (*errp) {
> > -        error_append_hint(errp, "Failed to \"open\" the real pci device");
> > -        return;
> > -    }
> > -
> >      s->is_virtfn = s->real_device.is_virtfn;
> >      if (s->is_virtfn) {
> >          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
> > @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
> >      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
> >  }
> >  
> > +void xen_igd_reserve_slot(PCIBus *pci_bus)
> > +{
> > +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
> > +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
> > +}
> > +
> > +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
> > +{
> > +    ERRP_GUARD();
> > +    PCIDevice *pci_dev = (PCIDevice *)qdev;
> > +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
> > +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
> > +    PCIBus *pci_bus = pci_get_bus(pci_dev);
> > +
> > +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
> > +        return;
> > +
> > +    xen_host_pci_device_get(&s->real_device,
> > +                            s->hostaddr.domain, s->hostaddr.bus,
> > +                            s->hostaddr.slot, s->hostaddr.function,
> > +                            errp);
> > +    if (*errp) {
> > +        error_append_hint(errp, "Failed to \"open\" the real pci device");
> > +        return;
> > +    }
> > +
> > +    if (is_igd_vga_passthrough(&s->real_device) &&
> > +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
> > +        s->real_device.dev == 2 && s->real_device.func == 0 &&
> > +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
>
> how about macros for these?
>
> #define XEN_PCI_IGD_DOMAIN 0
> #define XEN_PCI_IGD_BUS 0
> #define XEN_PCI_IGD_DEV 2
> #define XEN_PCI_IGD_FN 0
>
> > +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
>
> If you are going to do this, you should set it back
> either after pci_qdev_realize or in unrealize,
> for symmetry.
>
> > +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
> > +    }
>
>
> > +    xpdc->pci_qdev_realize(qdev, errp);
> > +}
> > +
>
>
>
> >  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> >      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >  
> > +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
> > +    xpdc->pci_qdev_realize = dc->realize;
> > +    dc->realize = xen_igd_clear_slot;
> >      k->realize = xen_pt_realize;
> >      k->exit = xen_pt_unregister_device;
> >      k->config_read = xen_pt_pci_read_config;
> > @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
> >      .instance_size = sizeof(XenPCIPassthroughState),
> >      .instance_finalize = xen_pci_passthrough_finalize,
> >      .class_init = xen_pci_passthrough_class_init,
> > +    .class_size = sizeof(XenPTDeviceClass),
> >      .instance_init = xen_pci_passthrough_instance_init,
> >      .interfaces = (InterfaceInfo[]) {
> >          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > index cf10fc7bbf..8c25932b4b 100644
> > --- a/hw/xen/xen_pt.h
> > +++ b/hw/xen/xen_pt.h
> > @@ -2,6 +2,7 @@
> >  #define XEN_PT_H
> >  
> >  #include "hw/xen/xen_common.h"
> > +#include "hw/pci/pci_bus.h"
> >  #include "xen-host-pci-device.h"
> >  #include "qom/object.h"
> >  
> > @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
> >  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
> >  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
> >  
> > +#define XEN_PT_DEVICE_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
> > +#define XEN_PT_DEVICE_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
> > +
> > +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
> > +
> > +typedef struct XenPTDeviceClass {
> > +    PCIDeviceClass parent_class;
> > +    XenPTQdevRealize pci_qdev_realize;
> > +} XenPTDeviceClass;
> > +
> >  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> > +void xen_igd_reserve_slot(PCIBus *pci_bus);
> >  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
> >  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
> >                                             XenHostPCIDevice *dev);
> > @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
> >  
> >  #define XEN_PCI_INTEL_OPREGION 0xfc
> >  
> > +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
> > +
>
> I think you want to calculate this based on dev fn:
>
> #define XEN_PCI_IGD_SLOT_MASK \
> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
>
>
> >  typedef enum {
> >      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
> >      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
> > diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> > index 2d8cac8d54..5c108446a8 100644
> > --- a/hw/xen/xen_pt_stub.c
> > +++ b/hw/xen/xen_pt_stub.c
> > @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
> >          error_setg(errp, "Xen PCI passthrough support not built in");
> >      }
> >  }
> > +
> > +void xen_igd_reserve_slot(PCIBus *pci_bus)
> > +{
> > +}
> > -- 
> > 2.39.0
>


