Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33065CE2D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470934.730607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCyzR-0002oV-7l; Wed, 04 Jan 2023 08:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470934.730607; Wed, 04 Jan 2023 08:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCyzR-0002lz-4R; Wed, 04 Jan 2023 08:19:13 +0000
Received: by outflank-mailman (input) for mailman id 470934;
 Wed, 04 Jan 2023 08:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCyzP-0002lt-4d
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:19:11 +0000
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741a636f-8c08-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:19:08 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 08:19:04 +0000
Received: by hermes--production-bf1-5458f64d4-rkcp4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c7ed076b62267adadaa8fddc1f12ac2c; 
 Wed, 04 Jan 2023 08:19:02 +0000 (UTC)
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
X-Inumbo-ID: 741a636f-8c08-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672820344; bh=jItkp3Ywrhodg9IS7x5pkpdm6AjC+m6vJyEcdHBOpiU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=R0dkFiTFtn40tuRMVlNGzdofL2Lt95wFM25rBh1mdMpO7n88cuIwpQGTvHLt08TTDqYNl/9ycnCrDPtzK6GFyBH0q7KrXXgmTVLrnZlolzgeCZBa1FfHqMlkA16lU4GVlK/FHJNbhYbv/nzTs6As0p84Rvzvi4qfj4SnOBO0PRiP4AVIYxFNFwbNOeaBf+GAwlHwtJ9j+TwS3MpVHE15yDOd3v2p+OvhPsqxIaTbeXS/4/j9Q/pqq+TxpjwWGQF61K5bzSMGpGRAevYYErQm/haAncRIZX6rYKdLpuoRg69EbUWUj1phnXTtX6QppsecHVXRJBDl26cBlZnyEwSa5Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672820344; bh=7hgLgK60MMH0sdqTp22ESPXOA7a2xV2NLOYU1/ccyc9=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=W+7gxxwUWLe9DWK7TCCV7Kj2Ru3dwKsB7QMCTFx6k4cq0j+lReoursm950uVpho3KMki3iHxsvmevlg4AmBSGq9MJxNVNIeWmjHYfQ8FnilFJDSGy1GDiT50TsEXldBsT1yFZJxYjyYfROZOh/wFjXwMzhApjSP/2IhgyqfZFSoZVSkQHVtiKuTf8gHWBEwLiX4Nxdw3Nofa2r3Geeef1UE94y9VRekxvu0WC/Ghi0z/l9v16AaG0sOimRu+xoFGf7BK1fRfCY9MKFuFjVrhmdTovRMrOayoY2mUoJVuaDLyZc+E+1KpsBQWlpNS+PoH5gkUWQOE1QS9zI1cHIrWjw==
X-YMail-OSG: EFRbsZcVM1kycu_tVwkZa8YorSJ.0VupyH.WmI86cP2UGP_8F1MD0ctMb3h.Cl3
 BSiL3iWc9.j4Awwxbe0ni3pOHwXBcRg__QKKlcWqTWXrmiWdmIC6cnXXLxMtLJztXCxim5SJp7a3
 Iy7dHw8tG0sfVn57FPhydkaMpgOctrtT458QnHjePK1B3tEcuPHsU.qThFCfqIaK6j9kn1q2bsnI
 CtbkrZwUpmrXELKMWowWsw38LR8m8BSia5wopoxoZ6SPNWT4pF5x_HerYEvE35TBhg6P6jYLfqmX
 soKpiAI04X2ajYBd.UsTcyqePzMH9vw6zhO8NoZtBZbb7VbAFAs4nUJnd3j8HgYUusf7j.7rCpHM
 XyqHy338tKG.yZrzMnbT2OnYoX0VA_t8SMQQ_cuTvaXysa_To4tXsS_B7Oj8Qi1yGVlhEfT953Ru
 WHgNkDDms7MM5OWgVokzumIri4InTnSPGKSGPgTP8maNky0Hp7gyR6RdWGCsleYVdaGAsQ1qeoYr
 7YL7zTndySyTHFDavpg4bwdvL7o3UDa4SaZfI4kDqsspfJBreT1r13.8wrEkyNWiSsRlZd_e9jDA
 _JKue73h00sgDlqzhnP0dpNSwi8tDoCoYK.93F3mPumZ4Dk23vUmKmv_oU33OypLTHmXtzohZgvt
 Qvtvtwai4_sbgOpq42ibWTOUc5QLi_5ARES1BlYCotUcBGTR4uEGul36FUVHUB1lNTCqd1hpP9oW
 OtSWNjvs276Cr2xNPaK0fzTFpiCxqIHhipm8GBDHjUUazL9AZX_2YB7kMW33bbTOvbKInmQUD83o
 64bTY5AckLzeU5N0KgnL2W2X9qbO3ITnbVYhz.Qf1DuVAAmIiC0aRGdHcBrcY54oYHxQTCcV5_pC
 .hNIj4tWc4cAL2G0xgbM_HEKyCHbW5AqcvNHkDtak2QjtdJAgk3JQXQGVFRoJ9ZubdcuqksNwi0V
 A9ptTT11noqBMma1VtDS.24pfTI8AWiq_ulT_1f8iTBbHd0qT2jBeg3pC1ahDtzSxA_UIl7PBe1m
 iQ.XhpUggqbKJ6bGUClwaX_vji3rZ1SCU69Y2X.Z9ETDILMbgaU08FY_CUB7OEtip1wTHaSFXAdt
 naLTlwOjqk54MrOE6z624Ue6gQdZI_brLyQ6nb88mH8PrCXUkkFXOyeBQu.b_aR7SJNdGq1CYQaA
 oET4_Gqh2FUYAUYqZwx3S2ouDBXQIGN1ucikG8bP9Cwx4zf_ONu6V7exlLAa746Kfirc.Kdcont_
 gb3Xoz5D8klhWL4paq4DpJItmWZatesgmG4Njo23s5Nzw7_pGXrlvZo2U.dqVJrfEorDafltK5H5
 av6eSAapz8XY5ihOtSG_0TIHBVr_yNWEBXS3dXIaZFJ_jRA3iBxh2wYbo1Gl9UkRLT41sohS5i_9
 GGkc7QDLdVv1239T0_MSTA9eOQKBgXMWW6rtIPNj_hkoMgcGE_6SKYy7nF036J3UcmFK.2nJGjqL
 su26fCX_viP87c7P8K3uLUsvkGqS2quhHr8xZl8g5KDOgiWrJWtIoupKtMfLbTdtKrh0uwe1LRq6
 h6B.qzaIpKUPGBEnhGR61Tf72pPzDdlD8eMRlMAZ__uelm07BW.KihWJKjF9CY_fvIcEImJfT3pw
 F5AZTLvph6B8ivOyH5.PYvob96N.k2vQcUDffQGemIqI6v3DKDWN01_XWsWPki1FELppkuv6Se9W
 1Op5kHBFLc4c2Un0x0LzQI8rkFNeXPBz7QQZNp0_5FCE6bQOMpQul_yC7ECXHyNZN4z_u8wfgvrt
 0bXXZ_ef_B3OPiAj6rAIGdhOCEiz5Sru.qB3Cz_VfXBD3AW.nmC.tJtedP7bxp2.nxIwGNS7pfg6
 CfzJHBPiTmTUu7hT_eRsB3mpF4j1W09Sz21582ELRXMF5.TRHwHdzOMcTtOWMs5aHre54l0qtUf3
 kg6CAHhZs0BpU6YIWK62X7YR6r.wydoeqMNVb95fNM3tvgq6WAn54t_EHRDAL2TikB5P8ijgk3aV
 c679_jV1I29kxOKi.7mfVZmS35WjoutTF0Wag5FYQ8G8AZq5KDR9OrrIssQes2Yb8DrRi.LFMDz1
 Bf71VHxT8Sw7tfBn_8X1Sx0GcvW12opvBnlJNppzUaZgfGavviXdI4Zx37gR_nr0dcNFXavbJbF8
 K76kryuS7ewg_4ETxjuiKxMhqwJQUIRNYuMUXJ6FYZ_A44wIGwYYGpMAs.sCkYm9G2NmEKAId_DS
 BoFmj2yyfdUv75V0TRxxBc3ec
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com>
Date: Wed, 4 Jan 2023 03:18:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>
>
> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>
>     Hi Chuck,
>
>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>     > On 1/2/23 4:34 PM, Bernhard Beschow wrote:
>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
>     >> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
>     >> machine agnostic to the precise southbridge being used. 2/ will become
>     >> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
>     >>
>     >> Testing done:
>     >> None, because I don't know how to conduct this properly :(
>     >>
>     >> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>     >>            "[PATCH v4 00/30] Consolidate PIIX south bridges"
>
>     This series is based on a previous series:
>     https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.com/
>     (which itself also is).
>
>     >> Bernhard Beschow (6):
>     >>    include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
>     >>    hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>     >>    hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>     >>    hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>     >>    hw/isa/piix: Resolve redundant k->config_write assignments
>     >>    hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>     >>
>     >>   hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>     >>   hw/i386/xen/xen-hvm.c         |  9 +++--
>     >>   hw/isa/piix.c                 | 66 +----------------------------------
>     >
>     > This file does not exist on the Qemu master branch.
>     > But hw/isa/piix3.c and hw/isa/piix4.c do exist.
>     >
>     > I tried renaming it from piix.c to piix3.c in the patch, but
>     > the patch set still does not apply cleanly on my tree.
>     >
>     > Is this patch set re-based against something other than
>     > the current master Qemu branch?
>     >
>     > I have a system that is suitable for testing this patch set, but
>     > I need guidance on how to apply it to the Qemu source tree.
>
>     You can ask Bernhard to publish a branch with the full work,
>
>
> Hi Chuck,
>
> ... or just visit https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.com/ . There you'll find a git tag with a complete history and all instructions!
>
> Thanks for giving my series a test ride!
>
> Best regards,
> Bernhard
>
>     or apply each series locally. I use the b4 tool for that:
>     https://b4.docs.kernel.org/en/latest/installing.html
>
>     i.e.:
>
>     $ git checkout -b shentey_work
>     $ b4 am 20221120150550.63059-1-shentey@gmail.com
>     $ git am
>     ./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mbx
>     $ b4 am 20221221170003.2929-1-shentey@gmail.com
>     $ git am
>     ./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the_piix3_and_piix4_south.mbx
>     $ b4 am 20230102213504.14646-1-shentey@gmail.com
>     $ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx
>
>     Now the branch 'shentey_work' contains all the patches and you can test.
>
>     Regards,
>
>     Phil.
>

Hi Phil and Bernard,

I tried applying these 3 patch series on top of the current qemu
master branch.

Unfortunately, I saw a regression, so I can't give a tested-by tag yet.

Here are the details of the testing I did so far:

Xen only needs one target, the i386-softmmu target which creates
the qemu-system-i386 binary that Xen uses for its device model.
That target compiled and linked with no problems with these 3
patch series applied on top of qemu master. I didn't try building
any other targets.

My tests used the xenfv machine type with the xen platform
pci device, which is ordinarily called a xen hvm guest with xen
paravirtualized network and block device drivers. It is based on the
i440fx machine type and so emulates piix3. I tested the xen
hvm guests with two different configurations as described below.

I tested both Linux and Windows guests, with mixed results. With the
current Qemu master (commit 222059a0fccf4 without the 3 patch
series applied), all tested guest configurations work normally for both
Linux and Windows guests.

With these 3 patch series applied on top of the qemu master branch,
which tries to consolidate piix3 and piix4 and resolve the xen piix3
device that my guests use, I unfortunately got a regression.

The regression occurred with a configuration that uses the qemu
bochs stdvga graphics device with a vnc display, and the qemu
usb-tablet device to emulate the mouse and keyboard. After applying
the 3 patch series, the emulated mouse is not working at all for Linux
guests. It works for Windows guests, but the mouse pointer in the
guest does not follow the mouse pointer in the vnc window as closely
as it does without the 3 patch series. So this is the bad news of a
regression introduced somewhere in these 3 patch series.

The good news is that by using guests in a configuration that does
not use the qemu usb-tablet device or the bochs stdvga device but
instead uses a real passed through usb3 controller with a real usb
mouse and a real usb keyboard connected, and also the real sound
card and vga device passed through and a 1920x1080 HDMI monitor,
there is no regression introduced by the 3 patch series and both Linux
and Windows guests in that configuration work perfectly.

My next test will be to test Bernhard's published git tag without
trying to merge the 3 patch series into master and see if that also
has the regression. I also will double check that I didn't make
any mistakes in merging the 3 patch series by creating the shentey_work
branch with b4 and git as Phil described and compare that to my
working tree.

I also will try testing only the first series, then the first series and the
second series, to try to determine in which of the 3 series the regression
is introduced.

Best regards,

Chuck

