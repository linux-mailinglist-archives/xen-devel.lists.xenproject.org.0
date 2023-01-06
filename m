Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290116601CD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472662.732970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnR4-0001Y3-KH; Fri, 06 Jan 2023 14:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472662.732970; Fri, 06 Jan 2023 14:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnR4-0001Uu-GT; Fri, 06 Jan 2023 14:11:06 +0000
Received: by outflank-mailman (input) for mailman id 472662;
 Fri, 06 Jan 2023 14:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDnR2-0001Um-TU
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:11:04 +0000
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e92323-8dcb-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:11:01 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 14:10:59 +0000
Received: by hermes--production-ne1-7b69748c4d-drrwg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 75201934fc037ba28ec21f3880c24bd7; 
 Fri, 06 Jan 2023 14:10:57 +0000 (UTC)
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
X-Inumbo-ID: f1e92323-8dcb-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673014259; bh=xZI1yY4P5g0p968nUuIlQk/jsifkHbagJgWbktARJJs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=lR0BeB9Tn7zcvH0HFlBbQLMP47nxkx3bpuNUBpb/CRKm6KYDq2LmrmxVmuisubjdkLDmRiKQM3fVS3N0+RYI0sCd1KWMHBjhdpNk4Ibd8x6ixs3l6Z9QsVkqQKPymjRNL9vIpVySXsAHGJ/xtBK6eR8i4yQaFIsed4RfZeH5mGs5F7HivoowFs6QVF+pegV2Bqu1xOI7ZbYHfAxqVxRuyNpTc8PMzbWnAkSdNbqjQpBbTC7c6YPI7WT1R8GP4oZmq6leFlRM80ZiWd730atom8/D5kYNqvKAGuMr8ltB/zQg5pi+x5lI5unN65Pc4IMG5qk7Mk7lOkM+YlfAGKjA5A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673014259; bh=4l8UCGyy/Qck99GFchfUmSKlEoCFcyg2e9lXbploMDp=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=bVAgo5krm8BjB3DF7tEI9BWpA2ME3BtDZsxWOI5zHEFGxahdosrYxX/0tJbJdaTzoe8iwoHnjH2fxDW5mQg4VotplGgqbr5W5U3dfGglVCI7RD6nyhBT9wgoNRLkM17nD1GZYAD6qYpcq4vF8X7zA21wNmTnq3nnHu9VM80D0rHp3eFmofpnPwZjYNMKjLCrvmcm9vUd9UdDI8sc2TM4nl1cSmf9BElmf07JDJNx+RNUe0uoHYfnHrJ9FPmWpKF4A5FncU0lvR0+wbe1SSpiVBa3HK1UWbQnXJVqW0UPVls/OpwFn7xR25wgbn7JDvxONf5f10ZcZK0UtR5Y+PrKNQ==
X-YMail-OSG: 0OFH0ewVM1mftW2s2coCmnaLRsU0Dhyc8.M9VsbDNnBZkYxz0PWBssajaKQeqPW
 QxMvj.gd6PxIigg73v8abgaT3E0g1sd9DNMNLSdrsGUky6zzoruHxaUwpdSeh3SuTzXWEKxW8tjL
 N8FXCYRMa3ITayDWYnY0ARXc9K7DtHGoCBbl.jFcj9dfllN6Evh4J1FuBGTcHUz50kP8pMx_zWHt
 P.2_.L0zUB5uaan0L.94pa7LapxPM1Wp7xTPFkGObwc7GkUjDH9qKHyaTV7dFdQqfyDYJh.uL8hI
 _toph2f6V6BXy9bp7.juYqRDUPfpYeurpsaIqHtvrmVCX2WB6uOU9BSP1zoVbFZF2RqSpuuwpRAw
 M8edg2RHk6jgUpHeRm1SXj4NFyu0ouRH4OoWsNPlTrjOFBZBrOOIjtZwJlT8JIKDCHDLVmstPj3J
 OHMkAE2T85feZT.apQK1OcDfwc3DOYS.lpqDTlZmlk4eP84W30WI2IArPuht2Lm5f4zyOkTFYwqq
 b_Z691WTWgWxLTZnIbneNG1U3P0qm0E1gh_mPkN1jqWtjblbsOOukFn0QfJZhqdmiW4QAn_sXZpG
 HUIb3WkjRhJuvRpsZUAzMAlJD.wgO0vUqrgTOhbFCjhOWRHUob.AohyND_Ue8knNfaaeiQ3WnzoC
 4UAuAwXGA5OdJ1DoFnUlC3hnDzcyEKr87DyL_2JH48wU0sZnXM0RrSyH24q0SUQUgGnxMF1qWj12
 V.OZ9V6RJhpzMCAceS6xUyhGtp_FFGmkY_g2ev_NWZWjauhEgSi6QdI7.LTxtV0.Uv_PaUprsyiA
 9xLeiKnt0PpDU_2aukW8nqlghceLtcc763MUorxONgakXuil9p46KegJ7F6xEaXwJqyD1vYF5sPg
 j4BqjrAPgAOhsyjfIp0A88Q14_S5NvOFWbjjYtwmqT0fNCzK3cjS5lU_mKgpiV6KqFDhPWYYGxB7
 lVj_998vL2GGzysHLJ29GmsIRh6NU1c9WVJRGWeY9WWXa8XUuL3BD2UMUP6CdMjgFRWTwelQ_JZo
 dFGtMvLB8Y94Qgyla4FREJ1CZN0VLKmrUSXjBi6CrNXQsWd5u1p6hahYnb0aBEgmtH1m7cF5iaLD
 1WvDweiD1HiyJM82sqBPsayddI7uzbHNiPYf3ssWoEPu3RPuBpq1rrvJA2FitkwFGLGSdxhOTahT
 VQ_dKcHWSWjKs4QqN57g4MBo_bpg1KBzWKi53M8ooZIkNyEXlEGOfrdOH2rGKq2BzYXXGE408s9Q
 Ho3OWejwKeU.wlazhgIt6HqyuNJymQh_ZRpoNuHbx6TSM9CgtdYQxeDS.cymE5IB9T47ruQr1iTQ
 BX27eL9J9KfyJKFV.kMfs6n_tMoG8ecoKp4TTX9PCsdE05EK2a0G9k.y98pMi.HVAvXG5.Fit_Vc
 MepzWz8zxvK_Pk7AV2DX_uIUgAEURFTfSE2_ngGKi_Q9tKeZNu5BjTWwr9KuVAjX1iK7nNZXYEuc
 m6SIxSQd14mVMsZMX3JA2UDkSipVYg6ztngUbKhud99..GJbgcKdiJ1XOhqjbBbeCBLJBatTAImo
 lp8_HdmsvIDi182HzhoL2kgzOVLzrhgr6sOr__v7OWMLJ5CQlFO8IpKTrafMte25yhmbmFzsXlGR
 2u7pQJFejp8NhgBfkR2Vq9styImQmBtvECpnQxxeREwvBXdnq837wGfbVu.Aa8BjNKVG11BeanBm
 oRYKLxECr76s858b17b5Iseh_c8_eFrpT70Arp3d2uCnXhxeaMyPrNyVTfH0QNX33mrnGnenWbYw
 d38wq0SRbbjB4AMvfyHnlbeu1US2QahPviWgZk1ZB45qz5Uk9CeuPuEYqqgfgevFM_NSZrwuNDp2
 2zNyEdM8NrhLO7NWb6qXp9fFYwrzvLn7GTdTzazHNNLtqhFIhIS0.rwRJ_gh6Yn9wAd6FomCm6YC
 SoDdVybM1jk8R5PsG3Iqi6chFHSmulNc4yVEcX7kH9aMSfk8_A8g4m3CB2coSq_xW0U591uaonkH
 FMB_lZ1bCUjEZylepkNHNkRjmiWvPU4dFdxwrl4Io7yCb7UAKsbsE8WR8GeNhXxRc5Kee066pGRq
 xKo5xR4Yg7JS77W0_6ydCh2o5KTMq0PolaUa0bJf9GPPObz02MSyEWgw.QKelLXx_saKbqIU6MaM
 B3QxQ_ERfvKDh30WclrVO.3DQptRJfYpRfy3LVOvTqyg5gGC7lTaUYgJ4jXGmn8ogA8d.H.Ce4X5
 j.hiX6gSlXQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
Date: Fri, 6 Jan 2023 09:10:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 9:03 AM, Anthony PERARD wrote:
> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
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
> 
> 
> This patch looks good enough. It only changes the "xenfv" machine so it
> doesn't prevent a proper fix to be done in the toolstack libxl.
> 
> The change in xen_pci_passthrough_class_init() to try to run some code
> before pci_qdev_realize() could potentially break in the future due to
> been uncommon but hopefully that will be ok.
> 
> So if no work to fix libxl appear soon, I'm ok with this patch:
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Thanks,
> 

Well, our messages almost collided! I just proposed a v7 that adds
a check to prevent the extra processing for cases when machine is
not xenfv and the slot does not need to be cleared because it was
never reserved. The proposed v7 would not change the behavior of the
patch at all but it would avoid some unnecessary processing. Do you
want me to submit that v7?

Chuck

