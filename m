Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FA660A0F
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 00:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472908.733322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDvlB-0001qe-Ja; Fri, 06 Jan 2023 23:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472908.733322; Fri, 06 Jan 2023 23:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDvlB-0001o1-Go; Fri, 06 Jan 2023 23:04:25 +0000
Received: by outflank-mailman (input) for mailman id 472908;
 Fri, 06 Jan 2023 23:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDvl9-0001nv-BK
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 23:04:23 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c0f768-8e16-11ed-91b6-6bf2151ebd3b;
 Sat, 07 Jan 2023 00:04:20 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 23:04:17 +0000
Received: by hermes--production-bf1-5458f64d4-s52fb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 73550f2f3ad1d326fe382ae3bf119149; 
 Fri, 06 Jan 2023 23:04:16 +0000 (UTC)
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
X-Inumbo-ID: 72c0f768-8e16-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673046257; bh=5EDETl/Bn40ksYDdHxFQPm8HxH4mlDcmh7uTqfmAZxw=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=uUot1KD7m/rROeXRXcAneoVytEcn/YyvQzAOgceGEzlR5k3liW6unrbm3A686MBXXFJgkJae9qamIQpPVf/ZbpPhw1XIiG2aCA3YhZ9m53OgKMU15PfVBG5y8t2RHn3JnAy1bqj/Fz7d3ri5OKfPAeNWraQEiOaPbFV/kAAKLNdh/b0+F3VKrYc2yiS63riATrVqRxoSw0zWkQtKilHjfIhLMonWJd+bMDUASt7L95qJwm5cqIrQEHGGdtaqQeLH5NtgFZJVX4+VPhM+IvOA2PL/mTVWT/4RQIvLNoSNPXKpX6H7TwfTJv06JR9M+MPcNYXXxZAYiNWUKoBWk5Q9ww==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673046257; bh=H8pCqt53rijduXGA/ATbxaUuckY3oh3NtPO5R2CHj6a=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=rWOpOIPg20sdwrwQWuAaLDFreFKshWlhfOfGWduypNVPkV94j/o/m4wIRKiNi30MP3aH492/+3x6lY/wqtVzhvwwrGpGsqMerYJuiFw93tA1BjOXetVaM54UqRS95PDhNR99PqXznrgLvsnDWpDdBNlti8S7ozZ0Rr1KdV43F+ZVtUULpq7lGV1k+BjB+BPjVORO5urC88/12GC9R4TJwcaVfXe0DZQ9yaFUgzcdK0a9LkuYFOa/a8VrqZlvaatQin+lkmmrRxnmzpyc1CSIlrKbZQbA9xlj2j0KH3gW2RchBCzmrbL3SdDXsjf2QDhp/yHCOH1qGgmfzPg3AW57Xw==
X-YMail-OSG: w5.iMUIVM1l0eqGZQfenJKq0f3WWOoVU1G_PwzmLYayjTCdr5p_EL6nBnjFJgqa
 rDA7tjOPnqDGyMB94mV.fxfplHns2lCUBZRAg8osRBZaM.WwdM7Jpd2Ss2YHoI1IzlfFKvkSy9K4
 A4wvuHYlJQ73AyvAB_n7XKjVl1OevIpQ2Jh5NZfPhnwzPm_0pa6FiOxyTJ8AJ.jB6vChfIqZm.Qp
 O7vaX.ubl.X9Ses4q082Eg3okm1J9MbLtOmM2h_nCh9s_T2mupXc.4ujZXmpheVkpqQwc5vOM5RH
 hYzPObcAS_v9RyuDTDDP6V869VHrJ6JBuT2g430TxIYovuuYa51an7ridQK22eo.Cv5npxcSrUw3
 t4aOq_rcExrMjreScMYx0BFY6ccJYcAvrPq_ZBOwhgbl4NNikE.LIVWleYqi1fTmRbePh2t7NflP
 rDIprbzCihTdFc6X6h8KOVSRgKsPLNGidtawWu315IfQYrWGuhDcWDxt4zRSGY8MaLUcpXZUWAgv
 Kjfpqv8DXkpotVssAulyhrZKXGwI9KKONjuFD0uQmsQhcZeAeKXeJhxrcRXYucQDiqjgctOw.NZh
 wrSLgVUJOeUTmHncgyi4tm7nxb2FEKA47ZhppgoDGFRJhy5463d5QWtxzh1larSaiexRTpLgY4WM
 PQ_AMwXD8fDggq.XlnjWSLGg4_IFChEKzg7YgRtqj0GA_i0ey8kHTglvAqUg1Wn2KU2JWfSvQTyc
 iYroyzWpfvItkGx2ZeH6_XXbVQpUDAqsP2BdSVnt4fJ.Ct7RKwH4Jq1K_iby9zjIj7ZJsYfhCdFW
 2xsRWJyxKeebG3.QIgtJARqrFmxdIzJRk0wdoW1rNwz1WHKEiVsN.7dQpSgUHdpuwZ4YaefdlVvZ
 SXVzqQLOevHZjrJ_gFI873PK.JHKFyMWfUxkdfVQLol73f93DNkSbrl0ClCDXATsMgp5_BCxhfGK
 h_4w0916KfWFkOf5kGaddnM7V_bAttxjCBOz9vq2EDHsHU0jK6AP76Q7a9_2cR3E.xRGk9fXCCaB
 bXGzu3q2i748rbm3mwcWvPJicS5DKi.MInmquPmkYkvSYy7Zd7S9FrHKY0tqzvI1Xe.VjycytL80
 JdrkkB8vAIX_DL0YcIbF4NnDIlL.phu5kO1j6_MOjG1nf7OWhSoesUyognQYge_u76YpQ7DJKcOo
 kMDI8SK8g5gpw_pAMMpafG8tod8yDCD6XjJ0YlzHDr7iicYthWcQSXdedOtf9ooBYZsJqNZw3v9A
 wgJu45w40Lo_0RdkXsL4L1FzOaHqwXZqcbC4aXuOs8NfrmhB_RpvVKsx0Lhev1nNdIQPKS32X7dJ
 NgiKhA5b3L0HsteXprIGKyLxlEd6mP5_nnkL2qgVF9qE.vshx0c1wKTKsH2aCbGu03c._oqPoTWG
 GrBS_UK7A_U2XDU63.fq4CbsF57b0jbJH44rbNwZSMWXh5ER.PCa0p3U6ErCCgAhhFeX7qE_4vas
 QcRM3ZdRkXEZDXU8.LEfUQWoxKJetCOQF6.o43qJQEy8iBaLH09jz7uCZnOtd_dOHakcAzcjLXV8
 XzQQbMnf5pxEhdFi7n0.cHixRpESkdUGX5dPa2_ofEaP1qcKrXkKqH6zj3xrlBSpqzn5EwVW04eb
 67avXN5m_RVI0FUJgls0aXxF1MD.fRBhu1Pkpm5U7MERwU00XJircEYOTIdqueXUdGtHr2YolXWO
 _CiiVuEpVSJPJZ.c6QtdXUH3dO._5kAQ5MIHPcYI3FY0FFxCVmNBoEGFJxsOhymy5uUwPOtTLQG5
 vOJVOBFy.yCuvtyaCJQN6Uj.47AdTOZd22p0MMIlCDhw1anAeTPIivksbwTX5ri8DWgYjzi6prX_
 xyAVQ3neeiCvUJdxvXnjgspq9SFj6hcQgnAE8X5kT7icqm9tUiordUmXgm6jL.lK1P9S0au2YAzE
 QVP1vSX4wK9IOwjRb1HkZyTTxEYdrmJVoT59Kf1NrXRRic8.Au8JAsflprYiPFuo.c2U4C.QwnBu
 fB94511G7U.deu.EI4asowZUUXhuGvxg.iznHm2NlxOzJOIoL70.9BworJTQiO1QOiKgFheTN.dZ
 dQCiNXbk4A6YcpGHPviTW_PfSj2lLn589dJ4w2Zvmpl_ceC5aCmKFiQ1Uc6dQpujyp5VZZDRFEvr
 fCP_ZZG4cxQuNzlTavIuLKnFwfVA5NbqyH4Arl9fvPCX1aqtMAfgZccXJQnYZ9iMeFE4YTaEkkPO
 YkZxbL8J7RGaOGNUGZuU-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <30337c62-a938-61c8-3ae5-092dbccf6302@aol.com>
Date: Fri, 6 Jan 2023 18:04:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
From: Chuck Zmudzinski <brchuckz@aol.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <B207F213-3B7B-4E0A-A87E-DE53CD351647@gmail.com>
 <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
 <d9e2f616-d3bf-fc6c-2dc5-a0bf53148632@aol.com>
Content-Language: en-US
In-Reply-To: <d9e2f616-d3bf-fc6c-2dc5-a0bf53148632@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 2:08 PM, Chuck Zmudzinski wrote:
> On 1/6/23 7:25 AM, Philippe Mathieu-Daudé wrote:
>> On 6/1/23 12:57, Bernhard Beschow wrote:
>>> 
>>> 
>>> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> +Markus/Thomas
>>>>
>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>>    hw/i386/pc_piix.c             |  4 +---
>>>>>    hw/isa/piix.c                 | 20 --------------------
>>>>>    include/hw/southbridge/piix.h |  1 -
>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>> 
>> 
>>>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>>> -{
>>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>>> -
>>>>> -    k->realize = piix3_realize;
>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>>>> -    dc->vmsd = &vmstate_piix3;
>>>>
>>>> IIUC, since this device is user-creatable, we can't simply remove it
>>>> without going thru the deprecation process.
>>> 
>>> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
>> Great news!
> 
> I don't know if this means the device is user-creatable:
> 
> chuckz@bullseye:~$ qemu-system-i386 -device piix3-ide-xen,help
> piix3-ide-xen options:
>   addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
>   failover_pair_id=<str>
>   multifunction=<bool>   - on/off (default: false)
>   rombar=<uint32>        -  (default: 1)
>   romfile=<str>
>   x-pcie-extcap-init=<bool> - on/off (default: true)
>   x-pcie-lnksta-dllla=<bool> - on/off (default: true)
> 
> Today I am running qemu-5.2 on Debian 11, so this output is for
> qemu 5.2, and that version of qemu has a piix3-ide-xen device.
> Is that this same device that is being removed? If so, it seems to
> me that at least as of qemu 5.2, the device was user-creatable.
> 
> Chuck

Good news! It looks the device was removed as user-creatable since version 5.2:

chuckz@debian:~$ qemu-system-i386-7.50 -device help | grep piix
name "piix3-usb-uhci", bus PCI
name "piix4-usb-uhci", bus PCI
name "piix3-ide", bus PCI
name "piix4-ide", bus PCI
chuckz@debian:~$ qemu-system-i386-7.50-bernhard-v2 -device help | grep piix
name "piix3-usb-uhci", bus PCI
name "piix4-usb-uhci", bus PCI
name "piix3-ide", bus PCI
name "piix4-ide", bus PCI
chuckz@debian:~$

The piix3-ide-xen device is not present either with or without Bernhard's patches
for current qemu 7.50, the development version for qemu 8.0

Cheers,

Chuck

