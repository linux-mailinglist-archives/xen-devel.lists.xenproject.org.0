Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECD6606EB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 20:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472890.733299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDs4b-0003nc-GZ; Fri, 06 Jan 2023 19:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472890.733299; Fri, 06 Jan 2023 19:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDs4b-0003kA-DF; Fri, 06 Jan 2023 19:08:13 +0000
Received: by outflank-mailman (input) for mailman id 472890;
 Fri, 06 Jan 2023 19:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7eG=5D=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDs4a-0003k4-Ti
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 19:08:12 +0000
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 751bff22-8df5-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 20:08:11 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Jan 2023 19:08:08 +0000
Received: by hermes--production-bf1-5458f64d4-kq8fm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 462c69a279a2e24d2afd89e95d1e005d; 
 Fri, 06 Jan 2023 19:08:05 +0000 (UTC)
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
X-Inumbo-ID: 751bff22-8df5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673032088; bh=bGPA4yzFOwZB3mapZnZRp7YkIuMge68eikWnzp8C73A=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=L7ms3qqlnqmOSxzPL4GJR/DSQWufryfaP8W6xkdRkr8E0itME7qaaojNIvJvdlwKN7rI87ITSOfPsxwlTCr2iFgaykM56PEwcxwtUvgBUrltH3i0G4RRXCQKm1m1wO+qwxZzeMxGyr/wgIrYJkI3J5fJi/D7mQDX2BhDheR+AjnPbN9B3vWLCXZ3NEkdWb/8rGuj9y+BqHT7+OyGweW8PKWgWDBBM2fv/knyZg4G07JubdyZsdVxXP2p88XoUX6w4I5GakjiziOGPOjy0o+vdVVDBN4Im1RYIBmRuKDYumjgLRiIclVeqp2309SfF/UZiTZj/AOeTi0sgOh9Iasg8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673032088; bh=W828f11+CRPmLujnXGHcpkkrKCf9aA7T0guyPLYK0YX=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=mgikH/Y55awpAMVoWqhvsi115jC2PtamCU5BtL15iF3FFG3QZPnN7Ymks0PuFn8kM4A71L9KYvuq2WyFUmQ5sEVUiGldgSulVCPxdnYgN0wMQ1DooTW8mGViPcZrbtrwupEsR7puMD0zFnkdSQpzIBxcbOFQrINFXxmNLGtxQVHovVTeppqU316rKTZ0CaPrA+KTgRzNtxWcFc8yZhVB/naBT7Qpydl/rgC0MA3f3Bim2ab45YOpzOR1XC7S+aTs1Z1ggUQWp5yhDC5r0mORLG4c3a41/hePdewsoOLZBFqiITUcI2EDUGO4GWXQWG8FTbm3yDy503LHNCA+Q1mgfg==
X-YMail-OSG: TPustp8VM1n2dfKzoFYbXatnxmVYHD5VeyB1Pji9J7P.xLMjLELOyAxIAzXR.2e
 RVnvJHEmjufCpvav5UjEplhwOImdMeob6iaAg79.UXL_jFjoSkQXGpCchi8eZeVb5NXVLJRSr094
 ofeTmcVjrUxAauhrjtTi5lQsoAsd7xWOYXvYbgwFYqwl7hbxzS4kx9qRGphIZKt544OKEWJxOGUs
 BNtBj8P10jOGgLZISdgJxIDT8p.GccYmQvVoiex7l6i0gCH7IHhEV4smtxt64yLApVSxrc0k1mvi
 WDGxjbd8iOsrMrmXz8TCP_guJkNPQ9HLZOkb.Hy5UwmcraW3807fC8lEDX9Fb72LmM9q0D55tNUR
 Xb5YdnSpZN1Tcf4XE0p_n9Z1pvYX0uELCM6.TbwWCxOiVjyKivkOVP8OhpqAzz_WiJJpIJZzCHeS
 f6Slsxwx2aXseNZakxS_.cjGh5mapfJv07c0O2bg3BFduPkh7zY.ZsjVbduAJ0IgrHADwOdhkz.H
 hMxfuupb9eBqFirHKckw5jeKwnRzYbkrmRMSFeEGM3fnnonFBkPF0oUk5QzQACyr1YII61umIbm0
 A3jLiWmg4KzBSBqQvRSqyJOfziqPKDEv3mOe7BMmUW89eMtePhCMPeKPN5.8OM47WOcmDov9kEuj
 klInieFhbudKyJmtZ6qgG4pDxNS0E.An0oKc.mNsR9cchxgG4WQHqLcEiXJkSBCkIcmzR25vVPcG
 Ky.Y9S0pkhbELfEKTghh7NWHyV7lJ9cI6805KBv.T6FUdwlesvA_kVa7erbpxlpcT5nbMCoGF6ff
 G2f2mr7k80GYkwYwJqxVGyC6bJIteIWSwmPVk9.xYpwX5KwkpRBQkb6JRnUkxIZFumzg1dkIuUBa
 TG_6Z80tv0jfkTZM3Osr1kmsjTDKNwEe5s.w7yyevjk4Uh2_Duhg5FefQ6Y6.jMGviYmCqHWhaHP
 uoYFB5FKmh.oStx0g0X.Rf9Yhnw1HHeV1.09pX1ENk9GokQdmUgHfs_RFzUcaYw161fsgIVw2Iew
 9Ku.IgDBCJ1HNgfbtWkQP_J7hjqSeYOPODlVjAeCX_hTwhCKF4OpApCz59wxHDvy2I7AFYUP4vDb
 Iod3.suW.QvtBCFrwdBEqBVZjOsi1tQgpAh2mKMJAbmcrEhfzInPNdY2BoAmHrcclwE1CSDJgSvF
 VbFNRsEGaZ_NLNuEdNKP8nwj7ViVfyt9qB.3DzyhJYLT8mJMcf5k3E_5xd_apwfsRyGGHYPqRF7z
 nvdVY2m40FgJumaHROGyrWOlKkbTC4yghypKhtqGHE1DjMm55rcC7RWwsbAkDbnJDLRVy_NXNpB2
 bPkNc58AJAR9i2Sl67clenKqFnDcDRhG_EBqbWpN57GBY16VjO6j2TBCA.OxNUvhga.xIwZxT1Fm
 02kX.ttrniZodyzpDAs._uwC9UYVuKqxME_PgEay.Cl5mwD4fUK1LhmPD.gX1S.b5dnLtZcTvOJ2
 bd2S5o6KEO4cv.o6FQR72hO9sTG0Akt9hzy01bJqLcwJK8YfxhEUcVh7oiiPPdwTy5R6bk2F_5PU
 1Gb9pxAE6G77ZpeQJHSr31NFAk5oGSz20mLmSALvJmYaMxT3Jw8hg_Rt6HGX6HTLCyuMdQQBzfmy
 3WOqbM9mDTVXG6BI3gA1JsMFzqD6xf7AuD9vM.7f0J8wKMKgthlRqNGSs3jIgHMFFoR2iwROgCgX
 XlOYlT8OlQ7l9O.o7FbN0pNmUlKinzDML.dILkYVnTb8i1ivp4UkLx1f5tCA4WhFFHiMISy2hn4P
 1N.mjdMX1SIWsLewN7XMV5aNwyQHgnqqCaj9H.XrpF_oLPI7hQ29BDNN1uKt9ks7KWU9qduyZRfp
 gxTqQUB2ck8kYejXb7KGiD4FdhF2qPyXoHiZnxzxH6xV43tk9_BIO_fY21iyRsKC4Lapevmdbpch
 ufTx6gJ_3hqZpIPxDxJyAt73ErICChmmL7naMyiOx7sTcipoNq01OSnP.2tLDXGh86vatQC.b8vs
 J5tPsPzEime6sDYIkhIPz6cII.iWoRv7TmzOC28LJHHP_.4vTaKpBINBP24lSf5qiic7WwgODs2.
 BfCKfyvaw6JfwY0KZkC4.rTAJR4PZkZ1tIc8mAuoqgFggA9WMQOtcM5jsE2Qrf63zTZ06sO.EbiB
 51GwfSWeZJxBb.zVKeYNGd82MyAqs7GH5ah_MKfDsKWUQ6OXZQqWRZcQbp_nt3Z3ovHHBNEZ1JHK
 MOfdPK46i_M9ZMJsBVVyA
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <d9e2f616-d3bf-fc6c-2dc5-a0bf53148632@aol.com>
Date: Fri, 6 Jan 2023 14:08:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <6a1a6ed8-568d-c08b-91a7-1093a2b25929@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/6/23 7:25 AM, Philippe Mathieu-Daudé wrote:
> On 6/1/23 12:57, Bernhard Beschow wrote:
>> 
>> 
>> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> +Markus/Thomas
>>>
>>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>    hw/i386/pc_piix.c             |  4 +---
>>>>    hw/isa/piix.c                 | 20 --------------------
>>>>    include/hw/southbridge/piix.h |  1 -
>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
> 
> 
>>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>>> -{
>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> -
>>>> -    k->realize = piix3_realize;
>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>>> -    dc->vmsd = &vmstate_piix3;
>>>
>>> IIUC, since this device is user-creatable, we can't simply remove it
>>> without going thru the deprecation process.
>> 
>> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
> Great news!

I don't know if this means the device is user-creatable:

chuckz@bullseye:~$ qemu-system-i386 -device piix3-ide-xen,help
piix3-ide-xen options:
  addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
  failover_pair_id=<str>
  multifunction=<bool>   - on/off (default: false)
  rombar=<uint32>        -  (default: 1)
  romfile=<str>
  x-pcie-extcap-init=<bool> - on/off (default: true)
  x-pcie-lnksta-dllla=<bool> - on/off (default: true)

Today I am running qemu-5.2 on Debian 11, so this output is for
qemu 5.2, and that version of qemu has a piix3-ide-xen device.
Is that this same device that is being removed? If so, it seems to
me that at least as of qemu 5.2, the device was user-creatable.

Chuck

