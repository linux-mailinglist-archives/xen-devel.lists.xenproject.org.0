Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F565B9A6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 04:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470472.729990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCXlr-00013D-CD; Tue, 03 Jan 2023 03:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470472.729990; Tue, 03 Jan 2023 03:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCXlr-00011V-7b; Tue, 03 Jan 2023 03:15:23 +0000
Received: by outflank-mailman (input) for mailman id 470472;
 Tue, 03 Jan 2023 03:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Awo3=5A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCXlq-00011P-1M
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 03:15:22 +0000
Received: from sonic310-22.consmr.mail.gq1.yahoo.com
 (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d84929b4-8b14-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 04:15:20 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Tue, 3 Jan 2023 03:15:15 +0000
Received: by hermes--production-ne1-7b69748c4d-8kjnk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a4e7c13e8efaf23c69e74dbbd036ec23; 
 Tue, 03 Jan 2023 03:15:09 +0000 (UTC)
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
X-Inumbo-ID: d84929b4-8b14-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672715715; bh=mUvEtjv/I8yLh91vV87I0a3FTB0JyYixbRRmZITWn+U=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Rszazt7e+Bzxyiv4od/qkS3bXTWNb/x02M884X0I00UJRm8xuIFfAhFKBVAlLdSqEqSXZsjFWsuSwCWHgZO2Zqmq0C3v6YfbR/OanmRrYcTIMM55BhpdsXpFxDvjp3RuhLnZF85P5Lx6nO4R3AvpF7rMynXKT6RLCKEtYr5qLo8WLwFZpDkXfTpfinnGHIpl8GsiOmZQkDE2sxiN8Lvbkr/y+Y4mS1h4iw8bov6tANc8v3+sRRlI9YXCJxTn8Ip4DetYzW4fiKwIy8yT/LO/ZeVCgEVvUBM5/cYANcrBvJZb/mFtih5QF6JzpOmsbyHbMfiQIOEcpO7HlQ08pl0u1A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672715715; bh=lYJfJoQuxGxXFN6h0u7dbEyN70Bc3LSevVyoVriBqCD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=sehfmdw8c2IZH7yxVsapPdyC5oZk8E9C8HG+RZlHweyTRT01NJXlGl1iSkBcdmKNSAvEE/1ffIB0aIHVFuf766DnCOnlbVQZPa40CKhW6Ej8xZHlok+XK5Wh3Etcf4lOTUMQlIsHpDym9nK6BCeIOhX70DK+orIkPdY1Fx82vY+fCRzaFzX/Jvz4D5y+Xc+mwvKd/3PP89Dnsp948+ybPy2HtCV0WJGsX8ARvxzpCrseLx3nHig1Kg898sWGib66rqMseYrfb5GQrzI5ew4OWat4mBItgYYoBggl3G40JmfQaWF/hk3KcR0HNcxqF8eKDhfZ/IJY2h2wWBrkkiOK2Q==
X-YMail-OSG: lCVByNUVM1n9wslqYSg4OXTvsdTRZ9_iuMTmzMW9dTREhHpL_UOylw05Cz7exkl
 Z5ljYFmVFCILlOFzUUr52ffQahGqKRKFSW_e.1IxBKheaSe..uR.mCsgd4Zzwbmj.gFsBav0HFj.
 dKStrESxn_aXF8JxMNE1d8Wxhsdmu8VENtmyq6g6T_Z88.RsjV8B9cXf..gvYgzqskiCNfPyrWgd
 GTGH_JGI0ZeVIiczSvmIrZnEc.2enwHsdFntOagaU3KPKalav98xS6M36QDnT20djOsRM.Ggt19H
 njBeoFSAXTGwE6yrODnAH6DcHRz0HUa_It3aQwqQ30GBhxHPktU5jHnjJUMXIlOUeOUdfy3_1TlW
 LR09f.yR1smbw8x7B.k02yzzO..7FQ_NZDfberb74CivbkqvqznI3CQUVcbGnOWhcmqss7kBu3S.
 2bCyKfPJIJw4etb9dv3sp.88kg2QORspv3HQ_Aln_cHonT0XT9yk8bzhQ2rOU5SOCFQMoZGgC_PE
 3CR_mAgs1_5g0qSd4ldP3Q3bj0NRcPy.n115m52vgTaghoM5GUKEbR9mvhK8BraD0ifqnrFL_kz.
 XCYPbCdMSM2DO2mOVDyRySzh4PLDLr7a07LXhmdHhOgSiK45BmqAvWcOOeRc.4VT0TAd79kqfU5.
 IcziZdxEcHsasp8rapBpIGkJ.GZAkGVhejkDvr16X4ceNSvIIhmoAWPzIZQtmDlmbeP9lXCvE4Pv
 CxqJHTIe1ocQoQbjhQ.jeIJcPyFNBXOVpiHeV4rVHLSIJjRzWJ8OZy.4SbiILz35xcATpdRLkOvZ
 Bxj9p81S.HztznklXUHBuYjFPg3RaEI_bWETggJ8OEnOgRdJhFh2ZvfVFJV9d7MzvYXdjmhPlfjJ
 655osScA4NmCcn9YBEFecN82TIKxFTnzFh_fJwjPZrkNsiOcF_oHp_a7_he4OxcDXZ9Dk0s9oRHb
 1DfyjPX7.qCSc7kK9bEE.ckWXkQE9JxHYFsPBzrL8PDgnTLB3Oq.1WRxeloHpPirqi_UkAUB7oO9
 FwHrcew9dluUAKfNnhG_8.utzChEsv2jhocIU5cyu6.C8qsGOZKKSU0j5ctTtJKnvH_iV9aW2j9Y
 ijOu4CK_B2KEYCyHp1AqekyWvvKRbpgEQsD6aUkA_hX.hhaS14H5FgNID20.DXw1dRiHys2cKBiu
 _2iluXRh_Xwuw1yumac92P3.TSNgfj6sPnMTg.tSKHYOJB.48WjdgHEk4OMTXh9W_FotUqHzPMng
 KdFKoV8s7yxGnC5BNlhKugrbvJhqrhpTV5skZBG.tR54LjQ.O8HbwHNE33p4fBIy.ctdRXVlyykr
 pyXmz4bn377tu0Pd2Te53a.MK72k6R.QYv7vwGDoxsQWDuwU6kQIPAOCb2gOyADp7Lr76eVN6Q9O
 ZvsVjbUw1qLUAHGZDa1.SISq47XkkBGKEP6c0_6ssR8DTBx84xxt8miA8WS_9ub.LxLjmQq6HT5L
 yDK8ljvXxbS5PpM1AOU.CMDQ3dUrOINXyPYW4NcRlcbqTob3LwJ2BrShjvRFNjYVHWKpw_sLokX5
 fWDVGxmfmZVkdZDBYtWJsNaOFcpviFO3cVu75eYRtwcHs8nvRNWW05zNEZ5PirJ3R3Y2QzuHt7n4
 uDxgBxWMemJfV6s5zzH95.iVKZR5saoT1WBWJpwGjyqhgjkEA7mFSbfkbbYJD0T3XCZ.HFRO9WX5
 fXtTXwOvXRvM3Dcj9tuq_2.Fs2hB3B5Vd1K0DCo6Cyp5rlpLC1zEA8S3Sk8wVDavi91C63GBCZj2
 _gIwiN6RJrwvEZTetXmpyjB34RP9mRaoUsgEJsju.M288S4RdsTye_yXLGKpfqh7EvOLpzZlle.l
 Pv55CFZs3ch8jkYkYvOkmZO4RSmPQ8kwjVO6RzPDczr_JjzLYFm0dh3BAnmxpPC7qkV0lnkgki7.
 cwViyU4OCEfAOky1t4gr8fTVE2S_DAT_fatW4C_DH5XKrDevZ7q67pAw2LQZZUubwYhcc71BrgKI
 0I4LWAplQzaZOUZNW8kU76eyEsYaacFsCEiNKQ2O_kU_uoZ0B89NoTzZRkIIO_RnrK6PUdTlrC9X
 r5lw7ebYBEk1eUDBfU6K9bDu6gvbhlz0bxGoo7PLgMlj7gB389sIKtgUYylENK.orwl7pd5jFLOF
 6i.s13qkMAAQFHwDiUyk3O.xqoTFRFFuTYkrgW2HvQs92ylDoYy24Jvv8nBd8ExGljETdrUM5dqV
 tEqm5pDVYa7cAvIlC1Q_m78E-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
Date: Mon, 2 Jan 2023 22:15:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/2/23 4:34 PM, Bernhard Beschow wrote:
> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> machine agnostic to the precise southbridge being used. 2/ will become
> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
>
> Testing done:
> None, because I don't know how to conduct this properly :(
>
> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>
> Bernhard Beschow (6):
>   include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
>   hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>   hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>   hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>   hw/isa/piix: Resolve redundant k->config_write assignments
>   hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>
>  hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>  hw/i386/xen/xen-hvm.c         |  9 +++--
>  hw/isa/piix.c                 | 66 +----------------------------------

This file does not exist on the Qemu master branch.
But hw/isa/piix3.c and hw/isa/piix4.c do exist.

I tried renaming it from piix.c to piix3.c in the patch, but
the patch set still does not apply cleanly on my tree.

Is this patch set re-based against something other than
the current master Qemu branch?

I have a system that is suitable for testing this patch set, but
I need guidance on how to apply it to the Qemu source tree.

Thanks,

Chuck Zmudzinski

>  include/hw/southbridge/piix.h |  1 -
>  include/hw/xen/xen.h          |  2 +-
>  stubs/xen-hw-stub.c           |  2 +-
>  6 files changed, 40 insertions(+), 74 deletions(-)
>


