Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1267674C
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 16:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482346.747789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJGEn-0003fc-Aq; Sat, 21 Jan 2023 15:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482346.747789; Sat, 21 Jan 2023 15:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJGEn-0003dr-6B; Sat, 21 Jan 2023 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 482346;
 Sat, 21 Jan 2023 15:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L7i5=5S=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pJGEl-0003dl-Bw
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 15:56:59 +0000
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a16a039-99a4-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 16:56:56 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 Jan 2023 15:56:53 +0000
Received: by hermes--production-bf1-6bb65c4965-lwg94 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3b42b4ec092870dceab4c344b0b1924d; 
 Sat, 21 Jan 2023 15:56:48 +0000 (UTC)
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
X-Inumbo-ID: 3a16a039-99a4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674316613; bh=WU8FP7owwX+CycfOFbHvgnjn9NginFB8A8uVIaqHxNI=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XKfVBNYYZULrrGbIiTQRukYmbY11GF8PLjjocwyyimi/yMbqNsfMm3+j+E73a9QSx0qhTldBnGXPKEewzVsI0CtNhRZGFMq/ZNYu20JL0uB/g4p9y/ZL/tV9AeUxqdQtuPBbkAuqM+X12r8n4cwF/yqyOrIHurB798ngeOGIKTdSU3GFbjYj02Wc2PgteTN0zC8t8frivykcewxyuPmdTDmPo688B/1nwtH9v2NWM6K77BMhIoB4pmQVFBCGrmUwa4d6JCnyM2+2vkanpRgle3kKjZcmwjJHWpttocfmb2Cor8ppEWcq8lhNRQUS5b3/H3U9J06cRdn9AxxUFwSdPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674316613; bh=dWTfVFhHGIBFuo+Yur0KbTA7NHI539FuYle6e4ppJfT=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=lJ8eXPCqNecWRGQD1sXIItfLaitU83ooB/vQP7ZKXVSvufdPNURdo1CQP0NOMVgK6rc1sPtlg/yrqTWfa8aehCvEFo7+nfZ/eRJP91L1e543viJKeYGoPbIAblYQz5rhVZy3DGdJ5RppDL3hoG3RTsOktZwEj+xb3RcoEfQ1eplLC4Jm4R0Kq11vGgG+TEMFMnRQBzmwYc2iz5ciI9EToznbf4P0BKTmv0dzI+/XFq/L7IqG+x9pY1PUvmXNl45wIWSExqU3ZCJc+Qu5hZLXnbhhoQHskKlMnT04tSGEnEekCetMUY0vDf98Vr3pGNmJIEG384dP/sLPyPEEfPSzvQ==
X-YMail-OSG: gzT12XcVM1kOReKgIIC0dYJdfiTPAobDej4LN0jQWw4wbYP16MA_S2Dd9RZSmFR
 VJbyq1lTPdi6fA9K7rdruXAmnfVPENc.p1UGAzJCA4yEk4eGZOI0qc3XZ1tq_Fz02jCImXaVSBis
 PvflD7lBx1jVaNiOi91GzZ4FRKbAODrDqupz7sxsLRknqt_6BNpxpshEhrBgFwRGrlb.hKfZs8u4
 dRegf9lYvDzvtK535FO_nWwc_dqGuwr8s8EJe.8lhcp2VeRSbOKi0ezn.PAVBPW6HvDB7q5.2lih
 WWhOuQ6.tokBpVB0Pxtk76QMvF34exN36lkcauBDCOei4ETcyHYtB6lrZlFkWjpvn4LBAvdYqPpq
 Vx2aEvE0OWQBqHCQQ_hxj6vYiZaNycoIEJ1wRoZ4mFqSAUStEXgCVpkj.4Xu.5pBfNaL.yJZx89C
 B_B16nJUuQ9DXpNghL1TSG03CRVQmGJX1c9Gd7vjkaHms7HsKMpRqz4R5Xhbq_lboeADfVJKqrDQ
 H2yJLVkRZ5DMCpHkgqpFWtXQ0cKgK5WkL92LVatyi8Pi05g2wf5ooQcOFi2DvudUbHcbSj_VCzWo
 ZUHbNIPU_YW930Ll_eEq82g.JAXWWq3wrCeIQ2aXp934wLXV805OyvNlnupOYHWsOZ5dco88eumR
 nZ8VwlXxJ3fH4Kfm97S4bcjDGu97fRP1l3dnN_XRsjxiWss1aPUw9Yj3VBY15RuJDg8WDVLFPoUc
 ibnQMW2_ok3.xrQZZIoefo65AYvFRm4l_Y5ioRp9j2mThSFIPIVSp6QJ6XayH6QgUD0ueTJM7rgF
 hy.VQRJ10kEsPzm26KaL.zdHjz55LiFwUbQqXmalFPYregWmvgF8vlAxSsuS8fna3rfzlko.yILp
 S39z_HgJLH9dHc6y.GV2nGKK_mWN.d7AS9EHyhjPhLDv8nq4oxjueacgsgk7napvM9HzfajQjSkD
 j3tpwHQKHpJrmvNrofjekBBHiCXrqIPa67KpoauysCkhrzyB1Cx4VoKKGaynEfa2J2a_Foqlutdt
 7Lb3Ngj5E2CWYLpOVFMzNJ4grbVlSE33US0OJxSZSknhOIcOrUnmo1RYKzJgDltdOOkpWiHpY9MJ
 7mtxX6zVHr.ro6cJD4wq.pG9.M99GlZAsimmBxzeAory.chjdOF02ORvrf4EV8nQhCWm5FwexD9w
 1vm_zD3pI4tlpTg4cV1lnhfPHi3ISHczT4w3ieGRCQHcxDToVnUUwAk0If8NzoHP1wvzHWom.uIB
 AwhL8YX_.brDZ4XIdcr_QV7zZtl2uy10uo2sl2bKMgVxnTNjBuF9QIEBnwpmqo.Z459bYSKRMkd.
 dPA6yfQEfX76lzJYAG9SIy69kQ48EA9QY39gmgZZygIjKA2A7nwogvIlG02wdSk87bTaF5liMchU
 Kf8kR18NmD0JBBKCY.44nWbteAYCXZWeJj9twbPmloGCqfBCegh2OBZTeROP4fzGX76vvcOvL0jL
 jYhIwb0vIrybCiHLu29Uu5Q9HfpE3T7YN1P9Zae.WP9mot7HpA_gFvr6I9.0MZ.ULrARt52GA_47
 lbXsCKBAirRXUZgbsoLV_zuZ3kHBsK2n36z.9Nmm750S1jWhqtO0jB.b67WP0dQB8ETxKwJIf4t7
 Gi7D8Mvn9nQzIRlvBj2rImtaX9lSTD0eWnLUpNEWxb9UPIkq7DD59Mx06IivXYqp4.MhDsGSYbSO
 VLupxo2zagW2dIQpsHS3jJmG9Kxbgabp9Uzf1X3RD4mlVI19vtn1z7.LX1yX8kLjtaO9SfyknNqV
 Uw813mpqgfHJiQe517eWEtx6eiDsGRZL4E6HYnrMUuJAuRUaGrOZUJUf0.j4niugnuRoXngzJjLK
 wSxN2DPlKi9Y0Ejkj9YNqCr.L1Q_olMc9x1r.jPwU2X0LQ0M7rKKPKzCHIHoZ0XABdz78cNYGUra
 mvUDVGcJXJ6Ll5iZUWBRt2O210m1t.YKeP_T_6IvCu81xJHg9xp6Xdk55cnh21MfnqI5gooFoFdf
 VzQK3Av02DfHdv9XiSLoDPSCgP.IWxEGasJq_b21UjDfp1vk.Hs4eNYibHI1e0AaRZX.zZ2RR6OH
 RHnyksen8ghjXpeFl5eA3YsgEhMPo16vxjwst_WhojiXoCnRrSnMWPvbEI1ImP9lDjGPICsDiA9h
 cyyWpPkDOFh_pT_PeRd1lWG_d1_Q1fzEVWJEKBnm_4zMN7TxA_HDTQlaRam7VQTTdd6_deQ3NFGs
 B89RbzPgYcl5rdEzLIko-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a679c956-5609-553d-ebc0-f6e4b22b70ac@aol.com>
Date: Sat, 21 Jan 2023 10:56:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-stable@nongnu.org
References: <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz.ref@aol.com>
 <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz@aol.com>
 <alpine.DEB.2.22.394.2301201334250.731018@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <alpine.DEB.2.22.394.2301201334250.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21096 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/20/2023 4:34 PM, Stefano Stabellini wrote:
> On Sat, 14 Jan 2023, Chuck Zmudzinski wrote:
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
> > Michael Tsirkin:
> > * Introduce XEN_PCI_IGD_DOMAIN, XEN_PCI_IGD_BUS, XEN_PCI_IGD_DEV, and
> >   XEN_PCI_IGD_FN - use them to compute the value of XEN_PCI_IGD_SLOT_MASK
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
>
> Hi Chuck,
>
> The approach looks OK in principle to me. I only have one question: for
> other PCI devices (not Intel IGD), where is xen_host_pci_device_get
> called now?
>
> It looks like that xen_igd_reserve_slot would return without setting
> slot_reserved_mask, hence xen_igd_clear_slot would also return without
> calling xen_host_pci_device_get. And xen_pt_realize doesn't call
> xen_host_pci_device_get any longer.
>
> Am I missing something?

Thanks for catching this. With v9 guest creation fails when the bit in
slot_reserved_mask that reserves slot 2 is not set.

It fails because v9 not only fails to call xen_host_pci_device_get when the
bit in slot_reserved_mask that reserves slot 2 is not set, it also does not
call xpdc->pci_qdev_realize either. So I uploaded v10 to fix that here:

https://lore.kernel.org/qemu-devel/d473914c4d2dc38ae87dca4b898d75b44751c9cb.1674297794.git.brchuckz@aol.com/

Tests with v10 show it is now working for all cases.

Thanks,

Chuck

