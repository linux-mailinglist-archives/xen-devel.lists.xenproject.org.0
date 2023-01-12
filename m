Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281146683D4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 21:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476395.738542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG3vi-0001cX-Mt; Thu, 12 Jan 2023 20:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476395.738542; Thu, 12 Jan 2023 20:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG3vi-0001ak-Jf; Thu, 12 Jan 2023 20:12:06 +0000
Received: by outflank-mailman (input) for mailman id 476395;
 Thu, 12 Jan 2023 20:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6pGC=5J=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pG3vh-0001ad-By
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 20:12:05 +0000
Received: from sonic304-25.consmr.mail.gq1.yahoo.com
 (sonic304-25.consmr.mail.gq1.yahoo.com [98.137.68.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f49b8c3-92b5-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 21:12:02 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Thu, 12 Jan 2023 20:11:59 +0000
Received: by hermes--production-ne1-5648bd7666-66bz5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 12a3adf0d72bdac2656bc55e49474b54; 
 Thu, 12 Jan 2023 20:11:56 +0000 (UTC)
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
X-Inumbo-ID: 5f49b8c3-92b5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673554319; bh=T8yzQ0y1veKEWTZ3A4UhAjryizsAbXysdPhGQ1/7fBo=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XaX03yQeRqrSdAIosaWnLf1z0ibVtHfPr1DuKua474PKkL0ej9tjXE0+PoFLHpLTzqdVgYZcLPt4NUwi6jf18f5ynqjzY+ZDRI+D7UZFX8Gs2ncgHdFSee+MOh+/3N2QdmH9Vz6nRMPib5lCM2W3+Wk7Dd9j4mvcZq3z2RnX6YXLHAvHiTi/Yc4AN7s8QoykXyNM91LMGMd+OL7hRsHvRgOJuX9NE5kGi3/xgmgr+bjgR9ANesR9uae7JRojyxcm/KZ0o5fcj0/xlrmZK4654ZAUtkAaAfVOjdW1uVvuTdjlRLVoSLc06FKbx8jHHS0z4ekKXj6wfjC6pzrICHNhNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673554319; bh=pNair6KKPFevlfPd/dWK4VuBrJExe70/lSZOL07NlzE=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ZOReAxUX28BzVbN31laJFQBgRnbmxdXE5j7yXZiyugA8k6Fi3YlU6lQ2P7Z6ngNSoqlUgL0u5GVMHIx3mrwKg0AxIeYF37DffBEpv3paOY1VMwm0wvw5P0PclBC85rk128sLq4zizZWtPL9jZ75JSi0Tez50jBNFIyIoToJIWyJ817CCCT/imeX1o58u+1vjs8lFfANnmgxvkLMyMa5IawLymcJxvabYboR8GCnBwXydL/uVb65kvskC1XqU/rKjBWfKKkSXWbW7CmuweEfZASw3F01OdJYkMt+YmpOqz3YNGDwCgB4ISHnsUjOLfZ9UmHBdgTjjQcPerrTeFOjvUA==
X-YMail-OSG: 6Opf7xgVM1nSwtAsFMugYzGfg803wrYoYYNliXjoiwKBo_ALdOl6Y7ez5G4nTHj
 2CsZfuGmpSbEIDh5SDD8VkTogAYqW6eax_zbIjgqH5TpOclbYgr0lweVZdG.A6Q1WN6.HBB37U2D
 NEU4oDsiXZQxZvpm..0MflPm2WRNzA854jRok1HOk8Zswss9vDAiGL8ErrOLjDNRCgh_99OSA4Wk
 V6MPWPe_93ngABL52XlBveJVjGKJWqOiFB5V0qhsdtIFOsGV6WGZnuxi_qhboaykBT9d.6xtMC1p
 sw_Ekph8bMyEGEToDDlrQQZaxJJncZM5aQ1P.rFhtFS8MYl8dgbAlryxWzhsH_LIfhwuUqrLmG8f
 i5q09bG_If.Gp9FONlhcalgO1B19uvaAzamfYld_J4FNWarUeHEySB3qHWulEYV5R57kSTzdkt9K
 dNjPdNQ7r.BL._tND9wrvLx9wma_8L7D881h7GbgQnbCPN_ricAsO7JA.w83ot5oHyWtXcsRf8e9
 AGvnLuFHo_o6agntTCdM9HeRb.840oAKFxqv2WCvmm44JhmIWIDa86KAUfA5lLZ1qBTN3WADIM2t
 S8TFpkKY3rvG9Xuz9tbovg4f0JxKYvMolR1sHwIeYxH1guRmklWyHWVouCu350_gcxAfodeLxswK
 ewrov0oDulU5bqfXN1KMhWwe1HM0gpUyAAuwQtJOdDPSdLkcE3_gKIWtNKLEaseevRTq0wBYYMNf
 DylsqFuI2ZQjR17oDir8YBs4j.DqVWXTWJm.l.oSqkvpCJwn6DgFYwNiVtIhOj1P_LrN8f8cSEN5
 av32KFCfTcCtrsKsIjN38KOW0Yva4r9MV0GwXErrR6tkf_Q1D4x2mk1mRhLEDH5D2WMtQ3vOdc0v
 RHFgWJrEBWOa9CjgKSK0x8pqddrpod1iEIptYVhBTwP3z2pObEPw5.FC6SvhLaelopJwel7d0paR
 KbdRANZu1FmSZB2N5OA1EsOZFxwgxcpgyQeHgXymdCnpHnMpseYOxAre2gfrMgsex8uwPzBXxeVt
 X8uTpChvF25SjxWk0TfVHAgGl494EkLv4mO9DL4lp7x2JEPBZnblNifpqrl04CwpfCuJUAEMmiox
 st1G48U6T8K8DImPGIvRUfMWsRVXsqzJ_MSfjbx7VVmEmbivJcKVvQkPDzoar21Z5g..vGuU9fww
 YgPXY3rtKhylbPOCVRm52TvJiPNSgyuj7u42Utce5EsZbrdX3pJA5qwVMDNUzYplNuHUd_BQXQUy
 wmpkllkmBguStRevHrc3_qztkIJDgha35uzhsDqG0eQtKn59subMgaxFRw8ITvv9jf9F4gVa9UDq
 IjfVOU3317gKF6YSqYy70lXwsuI3CPrAKWGI0XvuwbXv9BK12Syz5SDPoF38Wgn1OexmHffQVBPu
 UPcMMt9ka2_nHHRyOya5DpStOCbXhFKMNjgT6YtZ7jqWkiiZO3LeLys3JKF9UafpJZHqkVgwKUQ6
 cC_qxvA7_6qdi9ieq6cTl.MhxS3QKKFslLmM6s_tVSo4l5AjamtUec9RmWZaBCs.t34Rlv11pNSp
 VlJbyvXqa3NTOgZAba0rvumZfGrRG5Sw2Osw.9hIWLHvNfCbVrsPYba6ITOwvhHwn3Xmv3Hpdl4K
 WtZIedUB3NSdFI04O1Ao12ebLgm5JbnqVSu5iRCD7rEg.zc.oKqQ8Vqn.P2OalAARoxCCbtgXROe
 rpM.cskUOGB632N4_dDm6DNqWfCXSXigiyGOon6a41Zth.Cdv41hHCGPvxU8gN8eDtqXV11vcq2L
 4Xm9wmndhp9jtmbTNgyZ84bKYm8.w97dAHrxgqmpWxvvhdXg3aAcw6l1OKhPa6HI2GxswdlvfGO8
 Eou_JmquymjorBbOS90hnBEYDEOUWjAY4MsYC.JQZvdRcgifZyuFETo2A.VkqcICuT44rNNDQm7_
 B286OPeVfe4GJqqqJX3JBkfN6jQ_Nir2EOHgZKnkZdSqkcNqpH.QbRl8hmLrwIMp7zR0ow5525Rw
 e1M9P6tRZuLa4NwmeKg2r.TkrxWSAmdF1Qk.ps1UlMhqyTcbiL.F8nRiG7WKqP5xqn6d4Zb7OoDv
 P1pMtqQD0iqsu_4nSlMbd7CcwBdSrvB91RtYYTco.JjPt3GhyKuc9JgK9AbUonWgze7diQP4FMVT
 WWsI9UrGnvkOj61dpNHSO6XmBTy.EqlaBWEir3JN2_.EGyOgG_u2Trhy3w.MvGSVwKSTmg3MvjuV
 6u6Bkiyh7byMf.vcgMFMx3lM-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
Date: Thu, 12 Jan 2023 15:11:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/12/23 2:18 PM, Bernhard Beschow wrote:
> 
> 
> Am 11. Januar 2023 15:40:24 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>On 1/10/23 3:16 AM, Michael S. Tsirkin wrote:
>>> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
>>>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>>>> as noted in docs/igd-assign.txt in the Qemu source code.
>>>> 
>>>> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>>>> Intel IGD passthrough to the guest with the Qemu upstream device model,
>>>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>>>> a different slot. This problem often prevents the guest from booting.
>>>> 
>>>> The only available workaround is not good: Configure Xen HVM guests to use
>>>> the old and no longer maintained Qemu traditional device model available
>>>> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>>>> 
>>>> To implement this feature in the Qemu upstream device model for Xen HVM
>>>> guests, introduce the following new functions, types, and macros:
>>>> 
>>>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>>>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>>>> * typedef XenPTQdevRealize function pointer
>>>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>>>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>>>> 
>>>> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>>>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>>>> the xl toolstack with the gfx_passthru option enabled, which sets the
>>>> igd-passthru=on option to Qemu for the Xen HVM machine type.
>>>> 
>>>> The new xen_igd_reserve_slot function also needs to be implemented in
>>>> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>>>> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>>>> in which case it does nothing.
>>>> 
>>>> The new xen_igd_clear_slot function overrides qdev->realize of the parent
>>>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>>>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>>>> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>>>> 
>>>> Move the call to xen_host_pci_device_get, and the associated error
>>>> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>>>> initialize the device class and vendor values which enables the checks for
>>>> the Intel IGD to succeed. The verification that the host device is an
>>>> Intel IGD to be passed through is done by checking the domain, bus, slot,
>>>> and function values as well as by checking that gfx_passthru is enabled,
>>>> the device class is VGA, and the device vendor in Intel.
>>>> 
>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>>> ---
>>>> Notes that might be helpful to reviewers of patched code in hw/xen:
>>>> 
>>>> The new functions and types are based on recommendations from Qemu docs:
>>>> https://qemu.readthedocs.io/en/latest/devel/qom.html
>>>> 
>>>> Notes that might be helpful to reviewers of patched code in hw/i386:
>>>> 
>>>> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
>>>> not affect builds that do not have CONFIG_XEN defined.
>>>> 
>>>> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
>>>> existing function that is only true when Qemu is built with
>>>> xen-pci-passthrough enabled and the administrator has configured the Xen
>>>> HVM guest with Qemu's igd-passthru=on option.
>>>> 
>>>> v2: Remove From: <email address> tag at top of commit message
>>>> 
>>>> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
>>>> 
>>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
>>>> 
>>>>     is changed to
>>>> 
>>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>>>         && (s->hostaddr.function == 0)) {
>>>> 
>>>>     I hoped that I could use the test in v2, since it matches the
>>>>     other tests for the Intel IGD in Qemu and Xen, but those tests
>>>>     do not work because the necessary data structures are not set with
>>>>     their values yet. So instead use the test that the administrator
>>>>     has enabled gfx_passthru and the device address on the host is
>>>>     02.0. This test does detect the Intel IGD correctly.
>>>> 
>>>> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>>>>     email address to match the address used by the same author in commits
>>>>     be9c61da and c0e86b76
>>>>     
>>>>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
>>>> 
>>>> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>>>>     for the Intel IGD that uses the same criteria as in other places.
>>>>     This involved moving the call to xen_host_pci_device_get from
>>>>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>>>>     Intel IGD in xen_igd_clear_slot:
>>>>     
>>>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>>>         && (s->hostaddr.function == 0)) {
>>>> 
>>>>     is changed to
>>>> 
>>>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>>>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>>>>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>>>>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
>>>> 
>>>>     Added an explanation for the move of xen_host_pci_device_get from
>>>>     xen_pt_realize to xen_igd_clear_slot to the commit message.
>>>> 
>>>>     Rebase.
>>>> 
>>>> v6: Fix logging by removing these lines from the move from xen_pt_realize
>>>>     to xen_igd_clear_slot that was done in v5:
>>>> 
>>>>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>>>>                " to devfn 0x%x\n",
>>>>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>>>                s->dev.devfn);
>>>> 
>>>>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>>>>     set yet in xen_igd_clear_slot.
>>>> 
>>>> v7: The v7 that was posted to the mailing list was incorrect. v8 is what
>>>>     v7 was intended to be.
>>>> 
>>>> v8: Inhibit out of context log message and needless processing by
>>>>     adding 2 lines at the top of the new xen_igd_clear_slot function:
>>>> 
>>>>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>>>         return;
>>>> 
>>>>     Rebase. This removed an unnecessary header file from xen_pt.h 
>>>> 
>>>>  hw/i386/pc_piix.c    |  3 +++
>>>>  hw/xen/xen_pt.c      | 49 ++++++++++++++++++++++++++++++++++++--------
>>>>  hw/xen/xen_pt.h      | 16 +++++++++++++++
>>>>  hw/xen/xen_pt_stub.c |  4 ++++
>>>>  4 files changed, 63 insertions(+), 9 deletions(-)
>>>> 
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index b48047f50c..bc5efa4f59 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>>>>      }
>>>>  
>>>>      pc_xen_hvm_init_pci(machine);
>>>> +    if (xen_igd_gfx_pt_enabled()) {
>>>> +        xen_igd_reserve_slot(pcms->bus);
>>>> +    }
>>>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>>>  }
>>>>  #endif
>>> 
>>> I would even maybe go further and move the whole logic into
>>> xen_igd_reserve_slot. And I would even just name it
>>> xen_hvm_init_reserved_slots without worrying about the what
>>> or why at the pc level.  At this point it will be up to Xen maintainers.
>>
>>I see to do that would be to resolve the two pc_xen_hvm*
>>functions in pc_piix.c that are guarded by CONFIG_XEN and
>>move them to an appropriate place such as xen-hvm.c.
>>
>>That is along the lines of the work that Bernhard and Philippe
>>are doing, so I am Cc'ing them. My first inclination is just
>>to defer to them: I think eventually the little patch I propose
>>here to pc_piix.c is eventually going to be moved out of pc_piix.c
>>by Bernhard in a future patch.
>>
>>What they have been doing is very conservative, and I expect
>>if and when Bernhard gets here to resolve those functions, they
>>will do it in a way that keeps the dependency of the xenfv machine
>>type on the pc machine type and the pc_init1 function.
>>
>>What I would propose would be to break the dependency of xenfv
>>on the pc_init1 function. That is, I would propose having a
>>xenfv_init function in xen-hvm.c, and the first version would
>>be the current version of pc_init1, so xenfv would still depend
>>on many i440fx type things, but with the change xen developers
>>would be free to tweak xenfv_init without affecting the users
>>of the pc machine type.
>>
>>Would that be a good idea? If I get posiive feedback for this
>>idea, I will put it on the table, probably initially as an RFC
>>patch.
> 
> In various patches I've been decoupling 1/ PIIX3 from Xen and 2/ QEMU's Xen integration code from the PC machine. My idea is to confine all wiring for a PIIX based PC machine using Xen in pc_piix.c. The pc_xen_hvm* functions seem to do exactly that, so I'd leave them there, at least for now.
> 
> What I would like to avoid is for the Xen integration code to make assumptions that an x86 or PC machine is always based on i440fx or PIIX3.

I think what you are saying is that if I try to move the logic of my patch to xen-hvm.c, as Michael suggests, I should not move or copy any piix3 code to the Xen integration code, but access it via an appropriate qom interface to the code in pc_piix.c and only move Xen specific things to the Xen integration code such as the content of my patch. I can try to do that for a v9 of my patch. It might take me a little while (I am not a professional coder), so I will just leave v8 of my patch as is for now until I have a patch ready to move it out of pc_piix.c the qom way.

Thanks,

Chuck

> 
> I like Michael's idea of going one step further, both in terms of the approach and the reasoning.
> 
> Best regards,
> Bernhard
> 
>>Also, thanks, Michael, for your other suggestions for this patch
>>about using macros for the devfn constants.
>>
>>Chuck
>>
>>> 
>>>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>>>> index 0ec7e52183..eff38155ef 100644
>>>> --- a/hw/xen/xen_pt.c
>>>> +++ b/hw/xen/xen_pt.c
>>>> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>>>>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>>>                 s->dev.devfn);
>>>>  
>>>> -    xen_host_pci_device_get(&s->real_device,
>>>> -                            s->hostaddr.domain, s->hostaddr.bus,
>>>> -                            s->hostaddr.slot, s->hostaddr.function,
>>>> -                            errp);
>>>> -    if (*errp) {
>>>> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
>>>> -        return;
>>>> -    }
>>>> -
>>>>      s->is_virtfn = s->real_device.is_virtfn;
>>>>      if (s->is_virtfn) {
>>>>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
>>>> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>>>>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>>>>  }
>>>>  
>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>>> +{
>>>> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
>>>> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
>>>> +}
>>>> +
>>>> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
>>>> +{
>>>> +    ERRP_GUARD();
>>>> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
>>>> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
>>>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
>>>> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
>>>> +
>>>> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>>> +        return;
>>>> +
>>>> +    xen_host_pci_device_get(&s->real_device,
>>>> +                            s->hostaddr.domain, s->hostaddr.bus,
>>>> +                            s->hostaddr.slot, s->hostaddr.function,
>>>> +                            errp);
>>>> +    if (*errp) {
>>>> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (is_igd_vga_passthrough(&s->real_device) &&
>>>> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
>>>> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
>>>> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
>>> 
>>> how about macros for these?
>>> 
>>> #define XEN_PCI_IGD_DOMAIN 0
>>> #define XEN_PCI_IGD_BUS 0
>>> #define XEN_PCI_IGD_DEV 2
>>> #define XEN_PCI_IGD_FN 0
>>> 
>>>> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
>>> 
>>> If you are going to do this, you should set it back
>>> either after pci_qdev_realize or in unrealize,
>>> for symmetry.
>>> 
>>>> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
>>>> +    }
>>> 
>>> 
>>>> +    xpdc->pci_qdev_realize(qdev, errp);
>>>> +}
>>>> +
>>> 
>>> 
>>> 
>>>>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>>>>  {
>>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>>>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>>  
>>>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
>>>> +    xpdc->pci_qdev_realize = dc->realize;
>>>> +    dc->realize = xen_igd_clear_slot;
>>>>      k->realize = xen_pt_realize;
>>>>      k->exit = xen_pt_unregister_device;
>>>>      k->config_read = xen_pt_pci_read_config;
>>>> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>>>>      .instance_size = sizeof(XenPCIPassthroughState),
>>>>      .instance_finalize = xen_pci_passthrough_finalize,
>>>>      .class_init = xen_pci_passthrough_class_init,
>>>> +    .class_size = sizeof(XenPTDeviceClass),
>>>>      .instance_init = xen_pci_passthrough_instance_init,
>>>>      .interfaces = (InterfaceInfo[]) {
>>>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
>>>> index cf10fc7bbf..8c25932b4b 100644
>>>> --- a/hw/xen/xen_pt.h
>>>> +++ b/hw/xen/xen_pt.h
>>>> @@ -2,6 +2,7 @@
>>>>  #define XEN_PT_H
>>>>  
>>>>  #include "hw/xen/xen_common.h"
>>>> +#include "hw/pci/pci_bus.h"
>>>>  #include "xen-host-pci-device.h"
>>>>  #include "qom/object.h"
>>>>  
>>>> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>>>>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>>>>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>>>>  
>>>> +#define XEN_PT_DEVICE_CLASS(klass) \
>>>> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
>>>> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
>>>> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
>>>> +
>>>> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
>>>> +
>>>> +typedef struct XenPTDeviceClass {
>>>> +    PCIDeviceClass parent_class;
>>>> +    XenPTQdevRealize pci_qdev_realize;
>>>> +} XenPTDeviceClass;
>>>> +
>>>>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>>>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>>>                                             XenHostPCIDevice *dev);
>>>> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>>>>  
>>>>  #define XEN_PCI_INTEL_OPREGION 0xfc
>>>>  
>>>> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
>>>> +
>>> 
>>> I think you want to calculate this based on dev fn:
>>> 
>>> #define XEN_PCI_IGD_SLOT_MASK \
>>> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
>>> 
>>> 
>>>>  typedef enum {
>>>>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>>>>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
>>>> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
>>>> index 2d8cac8d54..5c108446a8 100644
>>>> --- a/hw/xen/xen_pt_stub.c
>>>> +++ b/hw/xen/xen_pt_stub.c
>>>> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>>>>          error_setg(errp, "Xen PCI passthrough support not built in");
>>>>      }
>>>>  }
>>>> +
>>>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>>>> +{
>>>> +}
>>>> -- 
>>>> 2.39.0
>>> 
>>


