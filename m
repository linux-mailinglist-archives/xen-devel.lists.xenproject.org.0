Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79665DAB8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471340.731162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6xW-0004UE-NL; Wed, 04 Jan 2023 16:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471340.731162; Wed, 04 Jan 2023 16:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6xW-0004SH-K9; Wed, 04 Jan 2023 16:49:46 +0000
Received: by outflank-mailman (input) for mailman id 471340;
 Wed, 04 Jan 2023 16:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pD6xV-0004Pt-4w
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:49:45 +0000
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c87c342d-8c4f-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 17:49:42 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 16:49:40 +0000
Received: by hermes--production-ne1-7b69748c4d-9jjs9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f78b14bbe46129161d3132f677ac1e69; 
 Wed, 04 Jan 2023 16:49:36 +0000 (UTC)
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
X-Inumbo-ID: c87c342d-8c4f-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672850980; bh=Uv0BocHD5tWIg18/jevfjehh7q0MhSFzY8Dyf/BXAg4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=JbYYbvz87wXyfJVL0rGXDO37O81ZJSJ75kAmtjzrQ8Ux9WcdgKZsXRjVDE82L/aPd1WGXiR9qkCsQz9ZrvZl2dIBRSW0vkZ7DgrPIf9QKBlVI8syU8XFKJEZZlpxAa5X0bPQggQTuizc2seXsDYMGtOA4BGWvnI26ovQwe1AeIfmaLl0mi6SgPTBxmkuK6g+kE2F9O2OV6ajfslItuTza09LBG7KEgjzwYKrBQjU+I6USPYXWWAYa6DKK0lOgfhRMtlxgllUx4vdRLk4RDzF9/toB46ZKQcob4ejgV5qs9MHu9CGsaIigmrYMonQ/2vDNNxUWwmojvDd0+4bOI94Kg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672850980; bh=FxzOEnvBptL07rvzdDlcQCWQrhGrukvipEJHtDDzfWh=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=OYvHrPLvawpjH0CokBSNIhIygYnWUO1JQgVPCJuD2o9U5nkXiL2AvCIRQzOqEWEkzheTfey8a0nxHhDTULI0JbX8xhWnEbwkBsjXsFwz0vHT0bADsWynNcbVJyTuEsKWG3up47pilbtGN3mZ4M4I/udFDcmG/lOVQ8gpyLYY1qygxYoBTdcgUgqLtzImaa7FZcTXyNwPOArSqa5fWqqiCkfAi8oaRTNKQacYHG7ZmT88eb0DN4C5NbxiOXDixu1t2whaI8+OttmzhLU/rQNvzSPyV9jyBkyv39Aa/PSnHwFTFHo7CHFV+mCFqR96afdNwGrwIzp63lbhk/WxGGPRtQ==
X-YMail-OSG: Y.cY9QQVM1n12rN8bHGsI27Q8vksmGZnxhR.qASFPFpFz2aPufAc26szN7uy8RZ
 RlDLbliSLZ7kWm4a4GWBe.arjJy3fAzPrAp6W4LcLnaEshl3OvFtMBItLq5XfNpgwyV48QJ7F042
 TztH6BRKJG5RwIRzv0GTaOcB96LaltnABc0xhcY32V5DuOYKbvSGRKnjNkL6MChfOjgmMYyR9GYM
 aEod0xGcSVcD6P.b_Cq35fmQWjzay2iPdmYNFDjIFzQxpOGgc5peFNt8QeRwZy3AphQ0QXOxCM2.
 V2M_M1TjOYfavoJeIQoa4VSwg4LbkvaHO7JQRpwplTlapPrTITZuvSlHo__C6T85_np.XiLaKDsL
 qp5GB2GUYoYvxuyMwwyaGrYmzlHBR.6.m7gf8WWyH9LEF_xhvNn.pMb2dpb7OLN0CacdXsmpnvX3
 3uDcCXJHHgPEIU.AKvv5_HtBFPpPVXPajjHYBEWChZv71bAjrFf6aqpsTdVlO8NXI7ncZSnN3.w4
 TFCksh7.OyDy8crk5oDN89TOTxoP2_xqmWG2U0glQ8wnroq3KdOtL2uj0n5wFPCS74aL6KCbzhLZ
 AHNovKeCGqqnSRuAVX1tDwzvyYQpO0mSk07Uv.ncGAXZAxCbgpqALa2KCYm6LLR4jdjvRQfZSx68
 NHOfxrwHW72xRro.H1mskH_5gfRa4k1jF4cNZwP4ZbwBX4khm_s4nwXfnLxwjFGkSR61YVRf2F.N
 Wo60cRmmCMjI2gdrXxyAxFi5NuLg0EJnILFyaI3.gwE0e6EljA4ldjinI1w_9CJPODaeJm_3rFpD
 gCBWFpCq.J6X4yvV1wbAoZUBkcWsDbJQ_HPC1skYB2JmNGoi88rqAwFUCKDKCubfrGSAiFfB8xtg
 kPbPwol7Nc5wF7eLQ1KZ_am1Ne7dbW_61i3hNGV8vXC_iO_Xuo2yBbdwMR_HMbxvF08S6PWXRg7K
 L.4fPq5N1pD_B9qFkwaPc5jQmg.68_bsdAsvxuxTJDGHp.MfnwSUZiW1MqF.dW6K5yn8FjSpMfAs
 2vF3Xx2DCI7MHBP02J4wbZhXmFgnC9yk_gj.kHiLJwK5nKFkn9nnpf02uDpEwYCK5VYhu9gx09fv
 6N4Qc5g4OwCZX2W.7eArebedl1d.5SthtaAT3XIs3Q9aWF8hvE.udbekuB2nXSHlacZhuiRcxPCJ
 3LQSh0FNb23omeCPlkHfVV2zjBj.4fJ0PXqUYDvgV2nnb2VqLhXOL6b6KugV0abri7na7y5wfKIB
 ZAa.k5NibC0RGO70bMCIXF2Z8WdcFQ_NKAeTbAO.vBpJH40fVdfhKDfuqZI2BwsE8ppEp3fGzxvw
 YvZpwZmbIH13FCODp8IyZBMxew9nINe2WIecckS86mKq_U3tYg_TRJ8xO5w4uvWABxYGFHZwplhZ
 p3zCf49QZifHg8juo_QlZnmM5XDuh.tCKQhxiiOSWJDHgvORE2MXq288bJrvSwofCkmTeaHWU.R9
 A_0SkxYj1mmEWfdQ2_mGTjmeWo8JWntBJAg28X6PcPRiveOSeqCffG8alu4kQK314kH1vjm2ByJb
 ZKIqKUBNecy6wPEqAyeFBb.WHGda9RFtBzmiHRQM8nmfNQQL6luszjA7tTOFDlldFugucL.qS0o0
 mIzz85Mkc2FvdTMBI1EAFHb9T4aOuy22ViEKRQjkoIFparniZB5ooS2Iyhon3FMkLXB8I5F2AB6Z
 46KhYPCfz.clEFl3sY0kB8TWRuraitYtXA5aTEYr5oyByVNZG.0XtZi8UP3Qax0uLwUfXOw20d_c
 gaq3LbSXwtUc.lqyU1hU.j.BtJiER4.mF2WZkEzQQvlExvd935oOg7I1HUnmH01oIhoDvCEPQOb.
 MlfiPKcuKlqIAydWmacz.2hjxeRc9OUQIb16B2JiaIXbZJkWS1HPgmALR7jbS_AWENbuesxSm7m0
 cIk4wSgcJJQ6ApgfVa_xq089uNrI4jIb7JAY3vcRMqaQ8V3s3slPU9dBmbhvLAqm8QEkJ9tyanTF
 RFUGMJNrVvqPp.9Q8phM0bkn8KN9r62uBqWeQUFC7qZ7ARUL4XTUYmm7_bLNQdTKF8QagMqc0jnR
 kAVtwoWxZuKmRPYqkcYYwljTm_JeKD9Zo9ETYP1IHnHC3tR8eiq9OCEJe.0J.y7ZFO6DKiQGvSox
 ZO9.h7igNXcBNlBnXxHNiV54wfYs0l1lL0YEklgs6LX263sMaj50wnKLJBeB7cmyalcLzDt3agpV
 JyG.EzTBq0U6wvqy3gf5josIr
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <da0528c8-7260-a1cb-7e6f-3d93493b060d@aol.com>
Date: Wed, 4 Jan 2023 11:49:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
 <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
 <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
 <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com>
 <AB058B2A-406E-487B-A1BA-74416C310B7A@gmail.com>
 <00094755-ca61-372d-0bcf-540fe2798f5c@aol.com>
 <7E657325-705A-47EA-A334-0B59DF0DF772@gmail.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <7E657325-705A-47EA-A334-0B59DF0DF772@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 11:12 AM, Bernhard Beschow wrote:
> 
> 
> Am 4. Januar 2023 13:11:16 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>On 1/4/2023 7:13 AM, Bernhard Beschow wrote:
>>> Am 4. Januar 2023 08:18:59 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
>>> >On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>>> >>
>>> >>
>>> >> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>> >>
>>> >>     Hi Chuck,
>>> >>
>>> >>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>>> >>     > On 1/2/23 4:34 PM, Bernhard Beschow wrote:
>>> >>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
>>> >>     >> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
>>> >>     >> machine agnostic to the precise southbridge being used. 2/ will become
>>> >>     >> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
>>> >>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
>>> >>     >>
>>> >>     >> Testing done:
>>> >>     >> None, because I don't know how to conduct this properly :(
>>> >>     >>
>>> >>     >> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>>> >>     >>            "[PATCH v4 00/30] Consolidate PIIX south bridges"
>>> >>
>>> >>     This series is based on a previous series:
>>> >>     https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.com/
>>> >>     (which itself also is).
>>> >>
>>> >>     >> Bernhard Beschow (6):
>>> >>     >>    include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
>>> >>     >>    hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>>> >>     >>    hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>>> >>     >>    hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>>> >>     >>    hw/isa/piix: Resolve redundant k->config_write assignments
>>> >>     >>    hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>> >>     >>
>>> >>     >>   hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>>> >>     >>   hw/i386/xen/xen-hvm.c         |  9 +++--
>>> >>     >>   hw/isa/piix.c                 | 66 +----------------------------------
>>> >>     >
>>> >>     > This file does not exist on the Qemu master branch.
>>> >>     > But hw/isa/piix3.c and hw/isa/piix4.c do exist.
>>> >>     >
>>> >>     > I tried renaming it from piix.c to piix3.c in the patch, but
>>> >>     > the patch set still does not apply cleanly on my tree.
>>> >>     >
>>> >>     > Is this patch set re-based against something other than
>>> >>     > the current master Qemu branch?
>>> >>     >
>>> >>     > I have a system that is suitable for testing this patch set, but
>>> >>     > I need guidance on how to apply it to the Qemu source tree.
>>> >>
>>> >>     You can ask Bernhard to publish a branch with the full work,
>>> >>
>>> >>
>>> >> Hi Chuck,
>>> >>
>>> >> ... or just visit https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.com/ . There you'll find a git tag with a complete history and all instructions!
>>> >>
>>> >> Thanks for giving my series a test ride!
>>> >>
>>> >> Best regards,
>>> >> Bernhard
>>> >>
>>> >>     or apply each series locally. I use the b4 tool for that:
>>> >>     https://b4.docs.kernel.org/en/latest/installing.html
>>> >>
>>> >>     i.e.:
>>> >>
>>> >>     $ git checkout -b shentey_work
>>> >>     $ b4 am 20221120150550.63059-1-shentey@gmail.com
>>> >>     $ git am
>>> >>     ./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mbx
>>> >>     $ b4 am 20221221170003.2929-1-shentey@gmail.com
>>> >>     $ git am
>>> >>     ./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the_piix3_and_piix4_south.mbx
>>> >>     $ b4 am 20230102213504.14646-1-shentey@gmail.com
>>> >>     $ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx
>>> >>
>>> >>     Now the branch 'shentey_work' contains all the patches and you can test.
>>> >>
>>> >>     Regards,
>>> >>
>>> >>     Phil.
>>> >>
>>> >
>>> >Hi Phil and Bernard,
>>> >
>>> >I tried applying these 3 patch series on top of the current qemu
>>> >master branch.
>>> >
>>> >Unfortunately, I saw a regression, so I can't give a tested-by tag yet.
>>>
>>> Hi Chuck,
>>>
>>> Thanks for your valuable test report! I think the culprit may be commit https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00102.html where now 128 PIRQs are considered rather than four. I'll revisit my series and will prepare a v2 in the next days. I think there is no need for further testing v1.
>>>
>>> Thanks,
>>> Bernhard
>>
>>Hi Bernhard,
>>
>>Thanks for letting me know I do not need to test v1 further. I agree the
>>symptoms are that it is an IRQ problem - it looks like IRQs associated with
>>the emulated usb tablet device are not making it to the guest with the
>>patched v1 piix device on xen.
> 
> All PCI IRQs were routed to PCI slot 0. This should be fixed in v2 now.
> 
>>I will be looking for your v2 in coming days and try it out also!
> 
> Thank you! Here it is: https://patchew.org/QEMU/20230104144437.27479-1-shentey@gmail.com/

That fixed it! I added my Tested-by tag to the last patch of v2:

[PATCH v2 6/6] hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE

AFAICT, v2 is is ready to go!

Best regards,

Chuck

