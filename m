Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5D65C501
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 18:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470688.730267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCl2r-0004TS-Td; Tue, 03 Jan 2023 17:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470688.730267; Tue, 03 Jan 2023 17:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCl2r-0004Q1-Qm; Tue, 03 Jan 2023 17:25:49 +0000
Received: by outflank-mailman (input) for mailman id 470688;
 Tue, 03 Jan 2023 17:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Awo3=5A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCl2p-0004Pv-9n
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 17:25:48 +0000
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a64ebdcc-8b8b-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 18:25:44 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Tue, 3 Jan 2023 17:25:41 +0000
Received: by hermes--production-ne1-7b69748c4d-7hwnr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 82ee4ab4f4bd9b6bcc4691c031bc8c2e; 
 Tue, 03 Jan 2023 17:25:36 +0000 (UTC)
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
X-Inumbo-ID: a64ebdcc-8b8b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672766741; bh=BQrajt4wazRs/IHuCnNgKkNdztR9Jg2pmYu2J+B7rHE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=MWkZBW23xhtaKL1h1Y0DanzZgzC9tYI/+m4L8tapKm3VckHEyr4IKBKbt2karoTLcVff2Rzi4Y5XNLNCb0bPm5I+ipKxq63QIYuHQbEGlxZ6ODcsmt+WA6z2clSqp73iNijF2uZjEdOOfjJo53wsQkAIWwKhpYFjyuCNrO9SyqAAl1SoBdpgAJSSmKRCFCcAz/91QXdhjtMO4aD05AV0jbdhtMuBxFwVCYQGwUefbBxB6fapNDZZJDoypx8Qys8rFkCCUkA62AXAei8GDiCDpfxTdubgFKOJfKSHYEZFqzb04k/Sx1upwmzdmSbnm2Hp6mHQV4hc1gmsV+jCs8NpUg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672766741; bh=Q7Gnch2KYK2DKvvEQImsPlGPBX0A629TKeRg29/A8EE=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=mof7SKRASPArXL2gtemBJPLd0mREs96QXV1acGqUuAHynSzRDGaw8Wu+EX7leobknIu7iKptkgx60XyiDLy1OPhgHAIjnPNDMNWGidPOd4yBAoG1Al0u/gojbvZGVe5R1Lya/ei+RnmXHiMlFCS0h3K13/XUrXBZdfKuRXEkXE3O35E5NXnmvzLfcd0baS06B102tjQPpyfiWI/dHTgVXZbyvTwBdkyb4YD0tjXXqG4HbUJTsAarKTd/BqQYuc+0P6NgweedkzHN5/DlJFbFz9bVhqqCpns2WgWH6HTf8tBMRqwx6sGC7sr7DKBHplQtcaR0bp1sByimvapXoqxsqg==
X-YMail-OSG: ny44inEVM1l0o89yZjgXBU7LE7onIq0HkXAJb04On7SUMzGglQaXKHGEWbCdbXB
 pmtWDTz0hbtpwQwDQdKrNh39Zp5m.O4Fj8UzgRiJNrfoovSEieMGvk3PRI7G3OeyN1wf8dtCb2fU
 lIuCZdt_FzLFBPLLUQKK59mu6QyzsjiQ.MA2CL3GglAx.pHzyz1gcWtEF3E4A2WERHEiSN47ztBk
 vA_nx_mve0L1iBQviDPoysrv_Dv6A401Z8nWr08svddzs6_Lbc3pcpi5dSvqxavNRMcSCwLT6poG
 AP8fUICvBp50lOthZFFZwQT9ULK5rEKLCmhYLV2nEPEM4uKz2lYveZQqHEEj3Se9MCm0fnHQX.Av
 eWxHZi0ci1N63I0ZQpHBUrUiZ_Ja89TIIUj1IHi3fXG_ezTJAjAitU4dDn9DtPGwQzD6vpIwP2dw
 Mz1rM9mIMFjcEnTil.iLvPnDm27rD0FL8NU43hlzh7Rn3Cs8Vpg_brBeuqS4tLGq.T0XgmW_LUlj
 MevjUuIOwAkBlZ8WQuQrAww71HAQa_q.vTJmZbIu1W4Wg_Ap5WYnvl6iA.a4YWu5nl1O5.za1rX3
 3JVeLg8e9wr2tPg4s_QOLwAQ4JyTLH_AH4mCZZEpycm_06_Lw.k4VaNKKziz1pOP4mFi8B8XIbgt
 nELLx6LD10127YlU9Kz.me5IiFC_YIY9c6HsK3.YiNVMVuN1QO8YELfEzOGiCjJ29E.FgOz9vPed
 QYiGVNmRS_WJAUzg.lUxZX_YW26wLaPeaw8.Rdn.x5oud2.cy7khkWsEr7os2WMeeKimm2ck4FYs
 AI7TbzN0qkHZ5seroGCG1CNnQU1gcgKw8SR449tFz4nhp5Bddsv7VL6P54ua8QrBoxFh28hhZgo1
 84zal0QCIM6pbyIff8BL_zRFnbW56PZ2bHmLrUBoraOTaVcEY2p1WO0iE73_BBuSCSWHPOOhRG49
 1ugaJ8SlzuHlnSGLcFGsHI1lEGwVwwcoqdYyHk4AbvqVtHhP1F7kml8h863Z7yrJIg3JInK.eb5a
 RMfNR9VhhyQDPVHbGL7SLhEx27Zdy6dVmGmv96OFZ29gdGXhOBGKuvmpiIOgBPxKe5WKKl3Mn6m_
 B8CosT0xV4IIk.Q2v1iGJSm0J7P881Eehr52j5K9QwkILs.9tvkeZJ8xwcOB53xoEEHUiCFNJdki
 1L.Rx37MYVoMi1FLKWMoSdGjvaa2ffAfLsO8gtL2SujvwD6jiiJQss0.MYtLUI3MaxKUHwiw4V9v
 Q6UxoStJG_8xM_JZWD8vVxkPl6XGC_NWumKgLxTFHHXTR.45Fddbn.89QpWmAFLUeHr85dLo2VDu
 iz1KPlb8jKa5EoksQuGN2dHhBxqdhyLfgoACHqXeMzzWik65x51kBk9zSDNJee2IMP6upuDjt02_
 TO9owR24rQbCtO69dUSaizmN60t.16Yr3_iX92NOyQcrLhlD6CCgAvUYXKpSRBBoNSY26Q.oCjEx
 JcrZDLz0Akcy1PD.RUGB8ujrQaJSP6GMa1dMSm5r94wWzaXsY8a226lrtxxhjCvFfihStkYhfk1s
 _rlgw9ThgSZJinU2JZp1tEtglK.ZJwHrkKaf0Fk8IcannH5gJtR2lAPx_9Z2lvTRbj1DeiUQe8I5
 rGUnYmhKPYL7TLLzZjoQ_2aClfkGMQj5QHf57B7oTlWIX7k4TjpgfXduxedaXrr8CriQ993AgjdN
 BAVE.9._rB1T_pyKSznCLu1DnLcmko7VBnPRjF3jsMW_nWKeMPppVnytd56NF4yRAWJ35Tf1KCUZ
 jt046_JMEx1MpFLgf5QDmbZXH6kj8.H95aTch0Gg.UA0nXWUo5TTQLGAx6DpJ0HKtmn.WQehXQWv
 au0g7rUxzWEkHDVJrwGKKFspT8Xfw._VxuO1cqNzagTcIbI3KWHVrFj759GdWobklFaekSZQ8Jh_
 oztf0Nx7QIN2vk_KPhcQhHONf0tNJlpVcy9KZ97EQmpn4tLeLipY5cECcRpXk0cxUGb.a05t4OvI
 wk.Dy1tethPFxK.DsMSnkmepWfMc4Vi7uJeYastmy99mgOvSmAkN1WixcIEjCYgazYqG4eJ4nP.a
 rSEk8helJW93kYoS2hqPQoBHB4Q0ocIzic3jIEZ2mfmqvGCfGCk_B3Nuz1T7TWEwIHjlKtfvtgUA
 k8i2n6BqQ2XazK6JaY7DqSKtrd6xbIBKMdt6CvizK1vkCsjEL66UVJXyZPJg3rhYfI_rHcCZWZGD
 w1XDPplRRvqzeXI0s.GhMng--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <6360e4a1-dc2b-685e-5e19-62b92eec695b@aol.com>
Date: Tue, 3 Jan 2023 12:25:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
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
Content-Language: en-US
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

OK, I didn't see the "Consolidate PIIX south bridges" series is a
prerequisite.

I will try it - it may take a couple of days because I need to test both
patch series in my environment and I can only work on this in my spare
time.

I will provide Tested-by tags to both series if successful. Otherwise,
I will reply with an explanation of any problems.

Chuck

