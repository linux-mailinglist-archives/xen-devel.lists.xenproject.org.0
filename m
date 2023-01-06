Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC348660232
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472684.733004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnkv-00058E-Sq; Fri, 06 Jan 2023 14:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472684.733004; Fri, 06 Jan 2023 14:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnkv-00055i-Pv; Fri, 06 Jan 2023 14:31:37 +0000
Received: by outflank-mailman (input) for mailman id 472684;
 Fri, 06 Jan 2023 14:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDnku-00055c-HS
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:31:36 +0000
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d035499f-8dce-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:31:32 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 14:31:31 +0000
Received: by hermes--production-ne1-7b69748c4d-pm9xv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 99343fc4f63f4df1a7ca33195a3121cf; 
 Fri, 06 Jan 2023 14:31:27 +0000 (UTC)
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
X-Inumbo-ID: d035499f-8dce-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673015491; bh=y6zkYfIxxD5S/JDQeE4SivkZD5jJU4lvdvq0QEx85Mw=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=gMJWL0CifJBv4PIXb85oKrIf4K47Qac2HcIlDOncDX8HEZIWNdy9TIQRqiIA3b5XATpkMM1hJFLWZpqB4uqaEauoXAlyrpzDfMQCkrCet7AfV9T8iGauEUSqsA5Y/wVbYQh3ZH3Gn8bJDa6DzwsTP/gM0CpHouMKL/lzHff06fdHPvR9l7an1tC0Y1o3Mh8pAbNCM9kKPZcHNLNsHpEdNLgOYuXGft14bJtr1etvZuOgdyhQfjxZ1HuPfacxPdpUoKKcT68seumGyFufEpJq2nXUBU4jPupyARgBJ/jOs9o+yquV6F6jPmlZmEIVHnhgEeJEtk627NFbF2w0Bv6oGQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673015491; bh=ARB2ekFXVfL0AnjnYt/lBtyXroynDuu7XYPBY3z8lhu=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=nh3kvsIQY5F6Di+rurJIEsQyEaONX+TWAgLdWkJ9aiHCUmGmEgHhPbiHV97/JP0yB/MEma9xQl/lcj7EL+tdNwutgOrlS/EiLbgAT1Oz1opwHx+MFWagI8uEiaEYk61OSwAUdszBo9hjYLCHQArn9JzsGwaLqzpWEYFFsVEpf2eW3fg+AEKOLc5LYVkBolgrlI3kpJLEE/GNzKPn4SZ2Km4E42w01JknPXE5HuaMqqwFFApwupZ4nh4+d3sqHy/gcWsy0bKZtAE9vKMVdf5nmFqF7OAjRvYsrIOCNwzqQ0y8jZgW8LcW4yGHgViORnmi0Kzn5rtPB3v0l0PnkfwnHg==
X-YMail-OSG: JX18UQcVM1l7cWKjfZWdrumO8AgdUDt2Esk5Ipbgv8k4TYiXRbvlKzHJO.VrKu3
 pr1CX43aD0bmKvPtGTeWKwYF.ml1B.XHdkDWqcSI2GsfZbuIb8Gw9Oi1trCtdDkJJekqM7VLrl89
 _wUesm_hKMO7FdJxMrmZqExO6CWfmE7mmy38NNt77FSQbZ1X2WbcN5xzqGtYItnXIdXZskAEDpxb
 U5ahzAAJ52c.0aOLX8ROf8hbvCMOJFulQbW.yTfvfu3ldOAi3wPpVqm_OjCCuN4wDUf9sFjKXUuW
 c1F0BpLcwGZWjjbuKMMd4MBLDvp221CAgkKzYvL4rjZ0W0UBH2CRRX.zcMyXtaoCoVukDJiwkg7C
 7TANBIVg.qPmyc1uxUnp517HRq.0Hgd9fv45L8dmOedJ6yXtG6TMu16w1yMsEga3dx2NQzzZJQws
 mCWcF_29NfkgbBkUkLb2GAEzaVoaugW13pxytYicJRsjCajzes_.3TNr0Iv0JnvwG9elgj5iyuBY
 G_MSkGgkQtORlow2rLGkATJ4qx4C5p93ctcYP8G5jbyiU13BoGxRebuKJMOdJT9wylyAlX1r6M1.
 7WKcVz5FPdKC_tc1PSWJGuK04MutTBRP5OadYFYbYU77nP_3Ur4hKrC9Sc.ZhWKyJHLRpBFgegqy
 6.9Lq0cxvrRHYvpttLd5lPLqKPjd2wLsr_OE9a6sBuS0YsY2JeIsO9Bty2hO2razoA57xxUKw.EG
 j6D9dnrWjb_v47U0dPClyaieYtef6E8eoreZ10szXskmYoZQXj1M93cS7KGgLjv4r2FR.1TYta.K
 .xq3D0OhHK6xWEFN3YS11vt0KPHSiUtuG4437kkuDOXS_UC92r1LIdvL7b46KUqvhLrkx369OuRP
 Ap65gOCh21Zj_as27WAsR47qc0txlmPBrFPGsWXgvAvtWQNCKK_j9Ibc2YVnKvwkGgF__bvpA4my
 voquMG2xxFPF7W8A1YH9ViPP.HmaeggD1z7BRKGSbAWKP66AQX21JRUCOD0dxW8mL.miSJ5YibHg
 8iTINMCXOO1zRn_ggdg6YsGllXcavf2N42If_DPdjB3k6kVliqmqMd.J6K91M5rnxpZLeVgEWp0j
 juzKfgKgOsiIWVWFZZolaGaYGrD3mpT836.eZJEXtspHeh9pgqew9TC__sbQz65ityswhmm5XHOa
 sqLLFu2KYiW2323ZuFza18M1nWAPLRm9IEVAyRHTXqXg.zWUQtw6nJNswPW1rMoS3lFyXUJyqP5w
 8QA31EId4H3IPUCLQOnIX_eeerjOnnNxHw59PN2tAsg7MVg9CpoyaVIABqj0VaesaAhWbs9j4MnO
 9ri30WMYiTMyIR1gOdaDbLgI_f1LfRQj4bZqctOy2OiLXMQ2OtxgLjU5j_ImU8LmKll9CgU_NA9B
 ZRWCyInmZOopens1mAT6b5jjH8GK11HNxNELkLDbmOtsrFBGWvq1OjC4YriFy._uL7UD4KC2e_0n
 LkXAVaLG4mPi_nTgCmcoeV6RSmYbgK1XSjuQzCKptThDWUlckyhkG0PKkQHT3.7SLhBQBte7KGQK
 ux6pXK98w4U8frPPby1EqoR.Vg6QSZJ84e0pKYeynMPlOvoNEgsw0I0x6oR52P5klQQwW6OyfGpM
 j1HefmkNGNmqPP_M7WiRDv5Ft9aY.elN6jmpGkfpREB3EhstVkDXhuVBz0zYJrGh0kzmSisXA0Ec
 Q2s7adhJieyZ1R30ZmBjP0q7SStBXqcHYUxl4tocWZRqMcWrKhhJ0eXxappDJqySE3HjTWfrFOah
 WeaQO0f2.ikNMWUgPjNVoCl3RXxKVaL9JQldMsd0QuS2RxuzmJv1Lk.ULEGauJ9Ae.hov9UR_zBf
 5WRXyWv4aU3a1DbIvoYyqWrsE.U1TxLGGFg9lyo82tcDwm85D63snpc21U6z5ktEoxtMhcOpimK9
 awAFVRvj8S_alux4..DwyrD8SXfaVKiu3.DbCEzcg_X9rj_dpSQgAFSCDFmreTaBIS4VZ8uRhq03
 dYD9ZYWCr1WSGTFHjO8eTToxq5ezYJgpN16mVJSHfJp4XZauCzkXv6qc.AWeYVSiXzyXf8mJ.Ytk
 ESEhJgampBejPnxAbRiUqF6y2GYEZZ5voU3DzCTejkTwgaUfHENvpkL51RxxTbbiVYoOL70EE57u
 Qy2c20k6eumDqNoTJKX.gQ4Bee_j7p5MoWu1cfIdNBtcNyDxDonzDX2t6IwzbgncOadIKHx3ncwc
 9KkhzjcjXWA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <882652f8-ddda-a7d8-85b9-da46568036d3@aol.com>
Date: Fri, 6 Jan 2023 09:31:24 -0500
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
In-Reply-To: <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 9:10 AM, Chuck Zmudzinski wrote:
> On 1/6/23 9:03 AM, Anthony PERARD wrote:
>> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
>>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>>> as noted in docs/igd-assign.txt in the Qemu source code.
>>> 
>>> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>>> Intel IGD passthrough to the guest with the Qemu upstream device model,
>>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>>> a different slot. This problem often prevents the guest from booting.
>>> 
>>> The only available workaround is not good: Configure Xen HVM guests to use
>>> the old and no longer maintained Qemu traditional device model available
>>> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>>> 
>>> To implement this feature in the Qemu upstream device model for Xen HVM
>>> guests, introduce the following new functions, types, and macros:
>>> 
>>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>>> * typedef XenPTQdevRealize function pointer
>>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>>> 
>>> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>>> the xl toolstack with the gfx_passthru option enabled, which sets the
>>> igd-passthru=on option to Qemu for the Xen HVM machine type.
>>> 
>>> The new xen_igd_reserve_slot function also needs to be implemented in
>>> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>>> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>>> in which case it does nothing.
>>> 
>>> The new xen_igd_clear_slot function overrides qdev->realize of the parent
>>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>>> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>>> 
>>> Move the call to xen_host_pci_device_get, and the associated error
>>> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>>> initialize the device class and vendor values which enables the checks for
>>> the Intel IGD to succeed. The verification that the host device is an
>>> Intel IGD to be passed through is done by checking the domain, bus, slot,
>>> and function values as well as by checking that gfx_passthru is enabled,
>>> the device class is VGA, and the device vendor in Intel.
>>> 
>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> 
>> 
>> This patch looks good enough. It only changes the "xenfv" machine so it
>> doesn't prevent a proper fix to be done in the toolstack libxl.
>> 
>> The change in xen_pci_passthrough_class_init() to try to run some code
>> before pci_qdev_realize() could potentially break in the future due to
>> been uncommon but hopefully that will be ok.
>> 
>> So if no work to fix libxl appear soon, I'm ok with this patch:

Well, I can tell you and others who use qemu are more comfortable
fixing this in libxl, so hold off for a week or so. I should have
a patch to fix this in libxl written and tested by then. If for
some reason that does not work out, then we can fix it in qemu.

Cheers,

Chuck

>> 
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>> 
>> Thanks,
>> 


