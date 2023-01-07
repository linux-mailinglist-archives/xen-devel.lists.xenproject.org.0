Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B516610B8
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jan 2023 19:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473009.733457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEDcD-00015H-4F; Sat, 07 Jan 2023 18:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473009.733457; Sat, 07 Jan 2023 18:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEDcD-00011q-1B; Sat, 07 Jan 2023 18:08:21 +0000
Received: by outflank-mailman (input) for mailman id 473009;
 Sat, 07 Jan 2023 18:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMsY=5E=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pEDcA-00011k-Pd
 for xen-devel@lists.xenproject.org; Sat, 07 Jan 2023 18:08:19 +0000
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40027ada-8eb6-11ed-b8d0-410ff93cb8f0;
 Sat, 07 Jan 2023 19:08:14 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Sat, 7 Jan 2023 18:08:11 +0000
Received: by hermes--production-ne1-7b69748c4d-pm9xv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 14ccf2a9c0a9dae2713d4c3fcc9e4744; 
 Sat, 07 Jan 2023 18:08:06 +0000 (UTC)
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
X-Inumbo-ID: 40027ada-8eb6-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673114891; bh=Q18RRjMQ2O5Mt1JGmUYM8swg2EPTEvKitcNzVDG+mic=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=fjZLMu/4N+qQkDDgJB0TSZO7e8Pry9AarIVXvSBjVwLKd/CCMn0NwNsZPq8giBgrhn+T72ilBMcxxutstnAM7877zlpi1VVbJdM2G8/bGXaskLoEqb/Mbuy+geuW2zuGJQ49fzWMOrUZS+kDWsptUmiRuusENddhbM46UtEn2rn7fg+i5VyqF+NoLQ2TGZ8tLEiR+NioEXGtLh7mlG6fhj8a2RNMHG5ulyLGnwdz6wSm45u8dHm+dDFj2YGTBp1glgl3dzftnRbzNagMhbKEjPn5RvxMqmubwq5Uzyo8RC8dX3haU6NCldk5CMN8S3VV7zO7BFvEt1PVTBFNVByzPg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673114891; bh=EkH3Ky6RbP270JuPU3dSVegfYzgL45PaYO8+avJ1Ebs=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=RDudI94oDRtNQBMm0MK3ljhj0zRNvrRI5RAxiIrBJh+d1o2YG+hPjCSWs6oou/r+LptAIWF7OLkrOXwwvJBAhlgpkzOBRjYPVgcwDBME0yumrrhPpOj+wy2aLfldcO0GFTFE5m+2GAhS1EqQ3zFsPiqbfubao4+3hhLwxnegkN5+qgwv++GI3l7BC4THGIUIFTCD7DY6MYoAe8L0QuOGg77x3dNGAvqr3dGpUnplFq5i4+oYZ+Y0MRJgW4L00DGV2CokBjKafv4Tq/hmRB8cs1AVqXWtnBxV20Bqxa+WdWCRz5fqL6rjO88k324PX4apJfmBHD/vZjR3NyGnSCoi8Q==
X-YMail-OSG: CxxQpWUVM1ldtrqoR4yjKv3_XMyGb7dsJmacpJpL6CPoJfYMMk4DXun3TyLUOWs
 hz25SdmCghqgAgdhqyles8WsOK_mSTWrD_rQaleE857SNz1CYXNHOePBj_6lzCy9b8pCLYGA3DFF
 pQrPZEXPG9lxylgxVIxi.3XdmSmclk3gxU6qnS0EJe9at4hkko6TtkgBzxSgn5CS7DsgUMK7mVr.
 Hlyk1Intzs2J.AGWuCJL2H4lGohdh0M3XhxXXUQGaauFO.fluYbrs61ef50jWjzZBtvCV1IMparr
 vEokkMk4M6Yw1q6gOF13pL9OD2P9fd40uuPagovNeGSopcly3uSXQFj8PgpCD_ss2L7m2udpxlr6
 y1ZfYepDGv393B3m..oIrOGB8x7M6.MK45MIAn_yq2LTvS0XZZd6Wf56CY7s37pARk5QtakB1USm
 qdNPWW1VrEHYEBdXS64xkk.QZMXD56r9sh7m5Y769baT04XnxU9vbhm3odBZVXVF4jcwWXaJQihT
 dAWv7mdkVwD1Joc4FVoOPAGHBwPo3EGWga5JlvAI7_yOUWMBCz7lGvTvmH071ojJFso9Gl9F3dE8
 VsJxGNtptu50epj8zwnlApvTeow5nRGbaNNtDLAp09TLekdnZWF02OxEehzZdoPNIlhts6sqQqSo
 iSqoHnRSAoYAWyfpwsp_nDe0TZauzRDE8_TyHsL0A.R9A9L2uIweYBNlteFgvNbjAGwp_QozyuZL
 wONCgNDOvEZa5QQDhH_kW3QChgKOb0firteEPIVNGorR5C6y0vGN65TxkA1XfwzORY7R9vZynidR
 lhJtZEb718z8aMBElt1nlFspfMLFxzBNWVWe6uV8h8olY9MUjsYtb5IwaiNc_i8TBU0_xpMUgd9p
 lNUS2kyGJaBX.I696yLnsg2AkMt4D0nr3ByyyA9TCTWK4ZA2r_oXZI6az48vjEvTVq1e0U7LIBND
 TzmdCd0GszoYMXK7ngPH8eajgJIgov1ues_5dA9M.MuE5h49_qntBmuUF_i1aKeyJfPsqebmT77b
 2jc8sB6Dk_WRJsc_qsSktNjp._UN_V0bV71IB3E_Vscs84WM56psutehLVV24TVkDQhR4ZJgDh4b
 7hZ2Gh2wI6oeTt2yC4Ydmx3_O1HfW4ygYf_lbtWxwW3HfwNl.C0sQAmj3dt6nJXayItAYDKlEYVi
 NsGwhW9QAoBncHs_7VJPs2XGfxp78ixi8D5Yb8dCWDGIpX4HohAecZ5p3XHIyvJy5kOO.kgsn1cj
 qomvFvfooFWuztIoVrNTO7zc8lOWbz7_gt85j7mN.8xaLloxyU.9PeSWn1zd6GghONrSNn2FYNfA
 VDB3iPQMw1HAJw94uiBPRtQM3u6bqoqJAsLhFw_rj69FPr1t7BR7pm.CZoEmbkZEw.ajpWTLVK58
 bq4wZAjJ0ufXUS8YPg.bPie93xR4v5kE5_3lRB8HBtRMtjCGxC_iULoOzbdrVCje5F2HHYXI.33U
 Pb9bWu313vbonT3Kc8QyKMRqsJEq8fNhT_zpBTaj96.iRNqI7pn_29pIDAw6UIcCbdlcAVqJC10H
 8O7jstgU9L2Yw4CkniHiTCCmmfcuyWHr.EhTygIEF4Idrq7ZLNBCkiqz.e9rMgEwEXYezKXuA3rG
 a0q48Hn5ogrNg.xHZAAVj46NbezGeJVLWagutBlaa2nO1Sc3ytgOgeCe74eaTEOEMQQ63YRcW9LW
 l1q9xxrFF4i_.1MtGxtgNC6Db3wZGD7b8Oi8LmFgXKMp3fMWhOOiwZduHzz7mgh3PrL8vuUnoZxF
 .Q0bL6UC_BfxRJCoqdpYGZYdql2T.ox8jbKCBhignqkGLo2LdoRx.BEGQgIzsNbOdDl8O7OU0qsT
 9iQ_F_pyOsaNNUPg2k85zIHWuxXR_043uHSwrkQGiA6JedbJRJuAIo8qCtdvltr_GAg4OmtGogJK
 EuY1pmRdCwCu7yhDnU9crRbBYy3rbjUseaMERD_dR_CUGXsI2dPDkbcdWrlaZ9gzMuRIZH.WamKc
 1SlKsuxAApUflAl2aQS4fvvgTFdObwFFEKVbVxvH9Nh.GreI3x65LASYKGHJoC3ITbYQTVZNppuE
 byx4ERQu9pd1nU8S74.rHGOHJIRHh7ZnD5iN4XEGnNEVtcO.VL74pjl6s2b.Pa.jISVcD31DGVYg
 41p0V__VzbDJ5j59h1TTOJy1qKxPKcYhneSo4aeLsY1CDNrOR2bA0RdPbs0hU6RkZdXT4B_1cFP8
 OVqLzLzdgmo_68fm.QgHrEg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <d8bf3a56-6dae-8679-424f-920e792627d5@aol.com>
Date: Sat, 7 Jan 2023 13:08:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
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
 <30337c62-a938-61c8-3ae5-092dbccf6302@aol.com>
 <00ff4875-62e0-05c8-a13e-5a52d4195cc2@aol.com>
 <01A7F932-0DF1-4977-A111-0907A7FC6FF9@gmail.com>
Content-Language: en-US
In-Reply-To: <01A7F932-0DF1-4977-A111-0907A7FC6FF9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/7/23 6:05 AM, Bernhard Beschow wrote:
> Am 7. Januar 2023 01:08:46 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
> >On 1/6/23 6:04 PM, Chuck Zmudzinski wrote:
> >> On 1/6/23 2:08 PM, Chuck Zmudzinski wrote:
> >>> On 1/6/23 7:25 AM, Philippe Mathieu-Daudé wrote:
> >>>> On 6/1/23 12:57, Bernhard Beschow wrote:
> >>>>> 
> >>>>> 
> >>>>> Am 4. Januar 2023 15:35:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
> >>>>>> +Markus/Thomas
> >>>>>>
> >>>>>> On 4/1/23 15:44, Bernhard Beschow wrote:
> >>>>>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> >>>>>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
> >>>>>>>
> >>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>>>>>> ---
> >>>>>>>    hw/i386/pc_piix.c             |  4 +---
> >>>>>>>    hw/isa/piix.c                 | 20 --------------------
> >>>>>>>    include/hw/southbridge/piix.h |  1 -
> >>>>>>>    3 files changed, 1 insertion(+), 24 deletions(-)
> >>>> 
> >>>> 
> >>>>>>>    -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> >>>>>>> -{
> >>>>>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
> >>>>>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >>>>>>> -
> >>>>>>> -    k->realize = piix3_realize;
> >>>>>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> >>>>>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
> >>>>>>> -    dc->vmsd = &vmstate_piix3;
> >>>>>>
> >>>>>> IIUC, since this device is user-creatable, we can't simply remove it
> >>>>>> without going thru the deprecation process.
> >>>>> 
> >>>>> AFAICS this device is actually not user-creatable since dc->user_creatable is set to false once in the base class. I think it is safe to remove the Xen class unless there are ABI issues.
> >>>> Great news!
> >>> 
> >>> I don't know if this means the device is user-creatable:
> >>> 
> >>> chuckz@bullseye:~$ qemu-system-i386 -device piix3-ide-xen,help
> >>> piix3-ide-xen options:
> >>>   addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
> >>>   failover_pair_id=<str>
> >>>   multifunction=<bool>   - on/off (default: false)
> >>>   rombar=<uint32>        -  (default: 1)
> >>>   romfile=<str>
> >>>   x-pcie-extcap-init=<bool> - on/off (default: true)
> >>>   x-pcie-lnksta-dllla=<bool> - on/off (default: true)
> >>> 
> >>> Today I am running qemu-5.2 on Debian 11, so this output is for
> >>> qemu 5.2, and that version of qemu has a piix3-ide-xen device.
> >>> Is that this same device that is being removed? If so, it seems to
> >>> me that at least as of qemu 5.2, the device was user-creatable.
> >>> 
> >>> Chuck
> >> 
> >> Good news! It looks the device was removed as user-creatable since version 5.2:
> >> 
> >> chuckz@debian:~$ qemu-system-i386-7.50 -device help | grep piix
> >> name "piix3-usb-uhci", bus PCI
> >> name "piix4-usb-uhci", bus PCI
> >> name "piix3-ide", bus PCI
> >> name "piix4-ide", bus PCI
> >> chuckz@debian:~$ qemu-system-i386-7.50-bernhard-v2 -device help | grep piix
> >> name "piix3-usb-uhci", bus PCI
> >> name "piix4-usb-uhci", bus PCI
> >> name "piix3-ide", bus PCI
> >> name "piix4-ide", bus PCI
> >> chuckz@debian:~$
> >> 
> >> The piix3-ide-xen device is not present either with or without Bernhard's patches
> >> for current qemu 7.50, the development version for qemu 8.0
> >> 
> >> Cheers,
> >> 
> >> Chuck
> >
> >
> >I traced where the pciix3-ide-xen device was removed:
> >
> >It was 7851b21a81 (hw/ide/piix: Remove redundant "piix3-ide-xen" device class)
> >
> >https://gitlab.com/qemu-project/qemu/-/commit/7851b21a8192750adecbcf6e8780a20de5891ad6
> >
> >about six months ago. That was between 7.0 and 7.1. So the device being removed
> >here is definitely not user-creatable, but it appears that this piix3-ide-xen
> >device that was removed between 7.0 and 7.1 was user-creatable. Does that one
> >need to go through the deprecation process? Or, since no one has complained
> >it is gone, maybe we don't need to worry about it?
>
> Good point! Looks like it fell through the cracks...
>
> There are voices who claim that this device and its non-Xen counterpart should have never been user-creatable in the firtst place:
> https://patchwork.kernel.org/project/qemu-devel/patch/20190718091740.6834-1-philmd@redhat.com/

Of course, only the xen variant was removed, so only users of the
xen variant were affected by the removal of the device. Any affected
users probably just substituted the non-xen variant for the xen variant
in their machines and didn't experience any problems.

Kind regards,

Chuck

