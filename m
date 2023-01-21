Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3736767F5
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 19:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482371.747831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJIGQ-0001BF-G3; Sat, 21 Jan 2023 18:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482371.747831; Sat, 21 Jan 2023 18:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJIGQ-00018P-Cy; Sat, 21 Jan 2023 18:06:50 +0000
Received: by outflank-mailman (input) for mailman id 482371;
 Sat, 21 Jan 2023 18:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L7i5=5S=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pJIGP-00018J-GV
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 18:06:49 +0000
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d619a92-99b6-11ed-91b6-6bf2151ebd3b;
 Sat, 21 Jan 2023 19:06:46 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 Jan 2023 18:06:44 +0000
Received: by hermes--production-bf1-6bb65c4965-7k2xj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 933f982256ad66195c1bc98306f1939a; 
 Sat, 21 Jan 2023 18:06:42 +0000 (UTC)
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
X-Inumbo-ID: 5d619a92-99b6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674324404; bh=GzDM3shPM+0VlMkN3ZhiZfEOMRwJWSsmB8h8wEu9+b0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=reHbeeTReM54qAWIqOwYO8gO/WT8qDVTxkXpY5v4+9xYlKy0exUzvyOvs18kXBDk1129CLNZKKfedETSaGxNIQ/UMkZGHz7/JL2dD4v55mX4zmE5fwdAUOEPsSN/xIQAWupkfansaqu3bTV5fE70qKVoC0YMLtW/avw4IBFLAR27LcTFa2/dYM7MmDtJFlyZn3Ci/OXQ+MGbXGRdlwhN/xtgo8yHNfET6b600GHdSPuWfKvpkL/Pe6SGiCAbtXlewog8uqPnU9u0GdL0KwfUNtw/gyt8IysMq+hNsc8XFU5GSSAtCoK5nv0MC9cGlvkRiFelobleKF/G57NOCwisRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674324404; bh=+Aiu4RNLmeWPZZqKWZgfwjWfst/rAYAa8ttrT5buLqc=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=KpUOfm4vQy+OfeFrRZsBcGG24UiH/XxU5Eeizf6XMTzhxq4C2TzfGwyFe5zd25Hi8ieFbMT173324DLB0J8X800NThCY62NIogisO9qPb6Uk/vJ35OsLMWu4K0F/jGRpBwHDkOJRU5T5jWRch7mOsRvBR5jG54I2ZPEdmUgjwqQp/S9ndDS17ktZ89hUIqed/1fWKAW6R+pdi0AYHM6tpGCcWwS2r28FLypk/D18IR+uTccdcluKAjFLOIchBaI3xhtP1/q1XlTJrkhzpHd+eKcDMEUUxAOmgDshvpuY4yZ03/8r8KzBFzwfmEAXCu9AeP8PnY8bNy3Uio+6Z/bGHw==
X-YMail-OSG: Z8rqCdYVM1m8DRiBBCrtes5ktRs4bL1jTcvO.gGFc7LXmWwbbjw.2TuS45m71wi
 w_C.9WLcHesjYZA70xSDQIA0fLwyM.wxxMo8qE8JNJnBqkvRE6HYLR3SQ2SkHiz85d.xlmjWf6El
 9Lwyc.TDA7XRkO9ZqXR97V1aEnWGXBf3Kqe_8.5KYaUAUF_5Ms7tkRlHPslmGV3bdYTJgEo9O8sS
 GGDNUCEtbfaM5DRTtE_z88IEqjOaO0VKjhEMvNgshGCP0FOkVVojoXAJ5TgF6g5j8F6T5Mym5WHe
 QM9vHNxfW54OueXos9xxOgnFu02EuAQSJBJKdoaQWFn9faDIK8do6iDLdL1MEZZlIe1n0sHl2f8E
 yfSkr2rKO0UIC8Shufly.NNa9SClhQ3T6pKEtfzhW3cQaBpiTyaoAE30fpDwFUB4XfkmqaxgPkSO
 ypIXK39S74J4_2o1ghLefyOlsbTc79Uq_eN2tz0ePdAV9C954A1Bi4aYHpQKt.tsczjQkNYYMYoH
 wAIzGKcM.x.RZX5bDQa3RCMMVmi5K_IzQ77uqZ0gyK6tpCLy6tzmTtZHGdma_78p0btLHo10uIEW
 RBEJ7Imax6YkjAzEOpYq1xe1MnJtrEpgurXBiPcUGtx.t.yhRKw9ikU1cxVNKPLvSxH2uNEn_Hgh
 z5T.eQnjJDXwJik0fOtvMeTPdsNrNZWQhLFd.WgBGoquenJnjkH7gbsS6mhiWsbwyFyHLU9ZmRz9
 2dY5XXvaVjzbU95xmqQGZdp5bNNZE9xA4U.dWk7XK1Jx7x.t97U1cWSLrpzZd8rO6A6JSY7.M0WD
 v2q0jo0w0V_YsZ2wvRi4RFhEOtD0pt7VmFeMA.MYO4gFWqjam6sa.5kewiYPzpcYLn0hLQkYex6x
 dY8_8dg8DNRdcmYEGFlEsP7KSnsXDHBNTl5p7cE2b63aLGuElTxOz30..vSI9yHfDVci34pGEj.i
 _Hu6V7eU3pSDi9fhjRcOT_O8W92eFolM1aInYPDxxXo07hsC01I99h4WYDmR39DhbOeWSfudRmbK
 VxYQseGyDQT9LM2APFun7G9vv5EbDJaHCljtGiPcXCvxMJ0zT9Uc1ZbdAWjsiivmT1HCB75tDNM5
 LaU4rDmjip9WBkZkHRVbuD0.NBIA9B2.My0C9anlH.ru2KaDPyc6b60beriiFEJRcM0NJGdcsf6G
 czNIQ8wWKL.ndH5rohQKp5kvRQJxxg7vukIj.rUdNXm9Zhgmck2LNVXBhhN9dErMLg6wsMn_GNZn
 Szk9ZnkmMK93ILw7.Rc9w.rfmSWFg8V1Yo1nM73.i1yIYs7hd5qsUUnRiHvUr7kPs3E2UsiAvcKL
 ZvVRrtATYpmzfftz7GIptP5THKMsFriPt.j1IzRbWAAnYuq6efAe74g4eQFVOeMGjSP.Sfe9iA6f
 3jyayngOAEJ.zIIsCfzUdHHEd_8cMfdXmg3q5fVlOI3zlMkcRPw93eNKcVrKt5m0_RjumhOR_DhG
 i4DJDNwNRBaqRxZ3JJklqylaV6hrwTeS2Fbe0VGZpI_heFO4cmiKHPyw2HOcLiT.6syQPl.VfMKD
 wi5nvukNKy9AAANFE8m9zDQqoQZBXWg5HGUYCEbIDAv1lBdUhKQ3w9xQYWWlONWIDLHwV4xsw6Mb
 Yoqu3l9z8WTOJMp7YJ4WXN5dLnsDNTH22NHk4hDrm3eriHlk0Tmpw6ZCjIuGZEiu.z3PAv7fJypQ
 FHOeXLiDx3E3BkJcIfHTn2sXYNssVc9KEdk8TYuMEhMzZ8fo8nLVb15YYXvgr.NNbvT_vAoxxhCW
 T_ZkHBshdcd4GHTzU2UlgBqjjtuB81JDxWEJZoMkqKew_5IdmUCZPhoAWLS8lgwHvBvHbfIFu_P.
 C3cO4CthzbWa2HhM9T9yioMGYz_kqj1oU1nglAf3sDYarS9RUzIR_5CNU3mnUtMHQL3aqS5GbKs_
 TOB7_MBEAz4O6MnOqEc.Uz3w9ONK2j40H5PJKEmrUGH_6AfoqXbnRU3OSjpKfxiOXOvxNZ6Ooa_F
 JLcw3ToELnG9U1RJ60VtsrTDgwDRD4Wr2xe3XdV0ynbCVfjAP.OiTeXFsmRR3.caepiHZjOIqpIw
 MwaNN2Rni87D6ydktsQpQI5KOolQYrCSzP.tf9__W4BLYzCPIN6hugJdnVR67K.rmiwsmklmaDSr
 T0J859mZRLP8vSbOdo.VMeetS.UsYKl4LYLGdI9.IAkMgCgmuUBkGSAjNlU7Frt2a_.ouS4_mA9K
 W4adMarT8NdFXNQI7Zw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <420b03de-3b1a-2096-529f-d18bfdf0cf53@aol.com>
Date: Sat, 21 Jan 2023 13:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21096 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/2023 9:03 AM, Anthony PERARD wrote:
> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
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

Hi Anthony,

If you have been following this patch it is now at v10. Since there is
another approach of patching libxl by using the "pc" machine instead of
patching Qemu to fix the "xenfv" machine and there have been other
changes, I did not include your Reviewed-by tag in the later versions.

I presume you are not interested in dealing with the technical debt
of patching libxl as proposed by this patch to libxl:

https://lore.kernel.org/xen-devel/20230110073201.mdUvSjy1vKtxPriqMQuWAxIjQzf1eAqIlZgal1u3GBI@z/

because it would be more difficult to maintain and result in reduced
startup performance with the Intel IGD than by patching Qemu and
fixing the "xenfv" machine type with the Intel IGD directly.

So are you OK with v10 of this patch? If so, you can add your Reviewed-by
again to v10. The v10 has several changes since v6 as requested by other
reviewers (Michael, Stefano, Igor).

The v10 of the patch is here:

https://lore.kernel.org/qemu-devel/d473914c4d2dc38ae87dca4b898d75b44751c9cb.1674297794.git.brchuckz@aol.com/

Thanks,

Chuck

