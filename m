Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57ED6602AF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472734.733081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoF0-0003cz-2F; Fri, 06 Jan 2023 15:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472734.733081; Fri, 06 Jan 2023 15:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoEz-0003ag-VU; Fri, 06 Jan 2023 15:02:41 +0000
Received: by outflank-mailman (input) for mailman id 472734;
 Fri, 06 Jan 2023 15:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDoEy-0003aa-P8
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:02:40 +0000
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 284c4ba5-8dd3-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 16:02:39 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 15:02:36 +0000
Received: by hermes--production-ne1-7b69748c4d-g8q5j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e73641d6e4425e24aadb96822c955bf6; 
 Fri, 06 Jan 2023 15:02:31 +0000 (UTC)
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
X-Inumbo-ID: 284c4ba5-8dd3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673017356; bh=0VDm502ucQEkSIIWDIcrXnsroFh40vokq/Ikx7Y6nk8=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=iyzlupQ0NS73Y5VIXErGypapDPeMcOXKm4mG8BWrz6ebrPUZEc4f2DkAaBV1KGmg2mV+XPANhp24iEXb9SGt/YErUOOqPznQTmQka4Xp+NeTELGnd5KhJhlaI4reTdrQvPuBd0FEEGjUPcTcFvUOVGp4hBjJ8F8pSt+hP59N1L7mTsybJjFkOWz2fFFTXoUwFjo3A3eWPoDJR7AfaMtO2HEgpg6MQjlP/kt1uS51zF3B3veq8uBVtsDWzeDb9nVuPfK8y3b3hcpqKfAgtAOvteeNOYbiNo7MJlvdRWUIR4YybjJll8FHXNBSececiHcSX972vBBuRwZoho4VN6dMlg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673017356; bh=oRw9T96FHEYw+EaVMMY57P6PCdN82bq0am7S/TzbQFq=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=UNjgox1dsuEuzIPLPIC4sZDgSpPa5Etnwq8tiv2rYdQRDgYDfJ7cOPA6AUCF45LcALh1KyTNXv8HOogzllAMSPb6smJAnfO0enrZ5Gfq3haiqAyzO44zc9KMJ+/0qTxrhsVGwwSuWveaaCcaCEtqEvOAiacQ5r3Xi3pJKA8bBmwY+rz2N9g+0vOibsuY2iu9nfEnrtNudlG4XrHmz8K1ur3rGtm8tfR1NKmu0hH28aTXEY9h7s+PflNAO/iWUJB0TiWBRdqfxH9B5yqAFjLQppKJqsUsoQ8jSitgcPycHaTJjTrriBA4ziSmDdasi10pQxzZaKPufiwBPMYUnpteVg==
X-YMail-OSG: .Uqmgf4VM1msNoeUWzjybWiLGsnPNeWKLnowVtNS9ZX9bjNd9b78LRkGTjcqfVB
 575A2Xmw7k5SQwscjnM_GjoW.JV.XkZvtH2.A0Y.iuQkSD1NGfPBJ9.8847ZcKwZbQwh6lSE4iYd
 PMb1ITHJ21KKDdHU6eg2TPKMIiPbvMNMyeQN35NOI5.l2BxfOzCBeHot4j6Xpyeopdc3ci.jTcb3
 7LrAZc13o_AEwnpmumOydFn4VpuFa7H4IqDn0AeL1QnbL7feWGmjfjFWJdT7dl1T_Ryo2fTTj7Lz
 EXbXjzZ0DJ.2JOIb2MBn50UWpQAKDcfhmTi_TR5MveD9cRqjc7kptVtys_t..D4z6JKOpYHKl_MY
 yPg7BSFf2KsVzinONTsKfBLxMV2dqj8rzuuKXr15oczoyk_rq6H1k5peuF.H0D9Q5MxCx0hIEKVh
 fW4j2ZSd_jd_Ft605Gv6qap5IOrxPbO1fl0le_ADwXqbBROycLMdYvImy.OA_KSuhdLBgTdmlDaR
 EkCJkaRBxU4nN9tjYp5EIBKel.rSCheKPV3mdFPYrngGzgZ9KTS3u9xD3SeA9yaEoloG0QKIE5xj
 qCAlXWIdK593knMKdwg8kNJeXVlBNZ9kte5PH7CPIZ5dCGgl.Teq8tzzPI7ShZpbCkk1JAMbqIj9
 ZUGUGJ_T1Bxg3e3NNkkyZZxgD14XdaaeF1Dw7yny6PgOHRMRed6hJW1wFLvFrdqnzSUOCSe8LnD8
 0wdHdzEHUxvCt25FNHHVYPtcs5VsSMBT7o_b2oAw8ZBNIytEB2vKIl4QmAUf9zvl.zMI1O2b8imH
 7Hw7as44Vt5rFbP4BPfOEbc9ys5ojwn_nStmfxMrtXlGWVTMXfJcYdQEXqPMmENf4NSdj2J3zlSG
 K92lo.ZqMDvWlgHGtDdZMbmmODvRpSpt5RQgRORVysAH_El98myuugLUO7SlkbU_f4SQDZ8FKR2b
 5N6ohPKLpV41FXb5U1CuFcdrjQ7Kj4sH07dA_bYPrkkkMYWZhNH28am_ZuOBc_fHhXqH0uPrWaCp
 sMjuHroFNVO0IeV.ZQGroX8dtBAtFKhW988yHl_umYCW50_Qyb6t5jMFRR2kWXtAQc2QBK7GUlXx
 kZchz_tUETzoJnfgu2bMtCtDhRUn4EYuEN1ixTSPjlLi_QBofr5ve.M7rQ1GYIeDG.OefAbmcrR5
 4MXmTSu7RcvJVuhns11yuu_3DcSK8dOxVzPsCBRbAjKpSyQa9u3jbJ8Ifw5GQrbQtyMQetVev731
 lJ4mtSYdF5a0.jbJT9lZFrumznU8eZwtLeKLQWDTuF4rUBfcDgfXQN19Tg49G2nHnIV3SiEb0FeD
 sZbYld168j8m4ELRCH4ddFO_ilHKcWMSSOHnsJ0AjbN.tNuFH3gwtMrGlMqnSHOVyU15NGnEqgPS
 ZM3iheGPNaDpBs9DOD5IjKUvlqoopHmiOFTcu9QKPluUQWXLeljZj7xRlGFLD2PsmVsAj3KCS6JM
 1TBsQuH9TaEYg1QMKvud4JWn6VuUsCPikOhxoXDtwHEC5L9H6kXAmTb_SXNBQF3.EuxxaOgWXG40
 WCCJce.Dy2Cqxd8Dasz8h6_asl5xRLlitnvXw2dD6x7uYGBjZeg_dn3BGLZ1OcntGEBco.oKhry.
 pV1pwXrUDve777MNN4c0FJm2IIsJcuQ6JonANYfaVVqDzwIm9wQVhBr.loGRt.aF8MgNuuqtmuyX
 7_0KqPvZZ_AiYo7KNN9zUrMHZvwtan.3NXbGSj09fDzP0V3OIvC9zQWKy4bnECXkrCrzuZRPbVRJ
 5QD77RLb1U4xrtIEn9fIgUdHNf_ewu1c1xrxJKt1.RwrxXrDPALtVwioVvDQZlvN38La_XV6UIOF
 iwYgb0SWMO2Zo_Yxxe7.oFW.6XFEOH2mKnC_HBvDayQG8Eu7Mgw.Nrf0O0stg8zSD11UrCsDx2Kb
 Kd_qH6fD.WcLZnytzwruDWxiQ1cwO77BBBKFrxrqTTGg.GVgFjHHLDslsvocY2iHo9AGmTZpGKf8
 eP8eVPkfK.7vp8xVMl7bW9wdg3Hs2EZRDUtauj_zvAJQqio3bzl9W91PQ5EhPcjiy2oAWUet9pgy
 uFBH8RxrUeIC.G4au93m6Htz38yxd5He8vwMSJ8XXiPyNq3ymoNPGvVH5xzqvSkbJ0fqwtmOxKdL
 18257Wda6bmLyIwr2h_vKHc91dLtUbclWkO767zayiCyn8N5p._Jd93s8HcmnMW2M7.xZ2i.Spjy
 wSjxa2W7nyg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <6931ef9f-1978-97f5-2d32-003a9e64833c@aol.com>
Date: Fri, 6 Jan 2023 10:02:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
 <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
 <882652f8-ddda-a7d8-85b9-da46568036d3@aol.com>
In-Reply-To: <882652f8-ddda-a7d8-85b9-da46568036d3@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 9:31 AM, Chuck Zmudzinski wrote:
> On 1/6/23 9:10 AM, Chuck Zmudzinski wrote:
>> On 1/6/23 9:03 AM, Anthony PERARD wrote:
>>> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
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
>>> 
>>> 
>>> This patch looks good enough. It only changes the "xenfv" machine so it
>>> doesn't prevent a proper fix to be done in the toolstack libxl.
>>> 
>>> The change in xen_pci_passthrough_class_init() to try to run some code
>>> before pci_qdev_realize() could potentially break in the future due to
>>> been uncommon but hopefully that will be ok.
>>> 
>>> So if no work to fix libxl appear soon, I'm ok with this patch:
> 
> Well, I can tell you and others who use qemu are more comfortable
> fixing this in libxl, so hold off for a week or so. I should have
> a patch to fix this in libxl written and tested by then. If for
> some reason that does not work out, then we can fix it in qemu.

One last thought: the only donwnside to fixing this in libxl is that
other toolstacks that configure qemu to use the xenfv machine will not
benefit from the fix in qemu that would simplify configuring the
guest correctly for the igd. Other toolstacks would still need to
override the default behavior of adding the xen platform device at
slot 2. I think no matter what, we should at least patch qemu to have
the xen-platform device use slot 3 instead of being automatically assigned
to slot 2 when igd-passthru=on. The rest of the fix could then be
implemented in libxl so that other pci devices such as emulated network
devices, other passed through pci devices, etc., do not take slot 2 when
gfx_passthru in xl.cfg is set.

So, unless I hear any objection, my plan is to patch qemu to use slot
3 for the xen platform device when igd-passthru is on, and implement the
rest of the fix in libxl. I should have it ready within a week.

Thanks for your help,

Chuck

