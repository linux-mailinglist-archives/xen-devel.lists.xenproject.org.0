Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733B7DDDE0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 09:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626137.976096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy6rZ-0002Uy-18; Wed, 01 Nov 2023 08:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626137.976096; Wed, 01 Nov 2023 08:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy6rY-0002SQ-Sl; Wed, 01 Nov 2023 08:46:08 +0000
Received: by outflank-mailman (input) for mailman id 626137;
 Wed, 01 Nov 2023 08:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HZ0A=GO=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qy6rX-0002SK-FW
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 08:46:07 +0000
Received: from sonic307-54.consmr.mail.gq1.yahoo.com
 (sonic307-54.consmr.mail.gq1.yahoo.com [98.137.64.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15657b9f-7893-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 09:46:02 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Wed, 1 Nov 2023 08:46:00 +0000
Received: by hermes--production-bf1-5b945b6d47-dfjn7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID bf0e8f3c4377c3bc098dc9ace9221901; 
 Wed, 01 Nov 2023 08:45:56 +0000 (UTC)
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
X-Inumbo-ID: 15657b9f-7893-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1698828360; bh=eQWuhC3PEpHQoyROxkInbEFUdtvEYRT4uUXiLG/iJcM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=NDZDMZ9kp2PohU9vb5UsX1zPR0wUzqB0Vl2ohJnLF/FMKV6TVUxyxyoqzA3AmXihiIVzzK/OmIAFe6Pn6Yac1HMiM8/inQv6jpcZvncRW0LAFvlOOArycEcaX+akvDfRWvSuCDH9lOruaQd2C9kdXTc0MDXwoO6R75ml96OE6dAIxh21r2gTlOKHOhxHFEJl2HudJnRTNkjQwyY7R5EEB6/AiXMtBKctbHnQ3WWaIDGZtRiLWcws5eV/o8YOkJ+/LKi9Ac9cCGS4ji1w/n/nx0PpDK8nfxuPGygoAQe1t0lbWBgBX1j+20sYsqEERPwWMg7lOJ39Z774SRL1tZtefA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698828360; bh=8wHMwd1nTUH7Bk3NVbMX/b171IvWAKlKoB363Wd+3aR=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Gd8lgtTZnFGW57ReWgTNC9t06hDHE4A6qqaHyRuU0pduSMI8CTzUfmM0d8LUFKVe8JMYYSWmBftfLyePrcirA2+VVIVjMTNfM4blWCO3P/twabpW0CAf7VZ6oR8GgGi/ZhNeUR64ov17meu9nDcbl8Dp5nJRhemNWIYAWIiQEXFnMBDJWO16V/y/Ok3pZAgVwrCiGmC0C75To10WCnnPR9c5ICrcqZ5In5GeA1dWAveDvVx05/QEQG+vH/FqROXsHNlWHzovVHt4i/KuZUUCMhwK5yu/+du5tOv/9TwgeEXejfeGnCtUv7U/9QuAuZfWbQgFDvkwU5jAp6Dw6uwwHQ==
X-YMail-OSG: eHWikGYVM1k3gQa62n.ySzWBfPqo_XVvkxqBTs26vc3wlx_4v3mmqvooselvog3
 TAsDUHFwxGHsXsUzx5ACyuvvjxeyc7XE4gJtAQ9YpIAI2F7CuXCTCt7Bq0V2MwzOG0P9cWCHWC51
 PGLTpVvCbwwJCrpO9bBr8Lv_6AS_dD7CbEM2_eMB1UUI4ISSisiFbyyw7tVuWRI64oX50.RB7OxT
 A6XI5eHObJsRi3RvjoacdSBR.TLo.y8J1cE2DY.8N.wFyJnWue437J4uf6dbIl1q1NEVgWVmYHgl
 5RrtkAt2EbInSrZy3wP_ExFawbJBnI261Osx0iTbWUJli9yjXQCdTWPFK4cGDkAKJcloIz_KZdMA
 EP.nG9aqPOYWNKSJgiP6j27G1n6rY8Rc9bF5D0RRp4STBSI2V3RDg1QIl0eHf86aeNV.1s48h6r3
 whdPCjGHJrUeIsQYP_HsN2ZBu52ROgg07RN2Y1sAR92yBlNGf4PwDW5NRO5EADfNheaji9ju4UdY
 eYV8HJBr7sEmd2_wPP6XYiOaqURirTbJzJGqOcHxs9QMvrCn9hfBF_Toj5ESNt9gFhdKbg0yy_un
 QZSXQa9WiTeTiXtC.E3HNYB.bBwfnqSCBVHxQ0tifPO9mSQlqPQxDxXOunP0rb6iusGcH2eUSH8l
 2eAdFNeEzDBySXW1U5A8k6ux_sCpISKqiNZo6lwrdgUaxFkNk4SmO9nutH_IazaZ8AdV96M1bN1R
 t4rRO48BXUKIZ9lGQasSoU3lPz2eFMGO8D_t2_MN1xDM5A_RYLL3GS8UgjKbmbG8ja4mWQ7KAuzF
 xf7Si.db0ndnJq94SbqZehfEMJvRidBTUea5jqB4GgRyg37TPeVO_7GMOhUr0BkZnZd..FrDSCBW
 4Ha.0pgFwGisUTMaS2QWDjJ06CL3ySDIBGrbrf.qmaWwfKsA1WbeQI3xe3dXX6vTfZAK7Oqc4kLM
 ro78N.__.ZxKuwvwdkpvqh0LDHeB24Lqv8z8rr_LcpBBDxoAa7cPvBUOnVUF.OPyuKjrzTGvSSkt
 EOlfF0uuAR9eDGKqSZpT3q5jchvcf0T.2DSr_9s4Y3XMtwCWJKa3e3lqh4tXdFFAFCDIxsZX28q9
 4fpJ6_JTZKMxG_pM_qKNmwRifJttZxgIQosygYdDpTxkLRAyLE5XSvoWmK2ncZ9lb5fCnEjI5bU.
 wi39BAULsXzg0oElr3N_sYVyjOQ1wzQzr7ZBsp_0Lqs9aQNrhmY5sfAEjBIPwiT0t_L3heMl.eHR
 eg_U1EPw6EFgnP9I6drn4KuKkfIaaYAct3r268oegYhP.m8L2l2Oh__zTRywWWT4vbT6n_cGbq.F
 F0wHTu0GCa3N3g0tDSURjLoXp6I1cL5_SJPIEhZ5_l6JgLYWMS8fzB_N21lpnKWRI0pNeF4VZk7_
 wUzy6f2ChrV1RvlftXfTxlNsRrChRV8Z6y3VLQKh1yjCYwFsgvo3YfHUQro36rue2p_6ZE6e3a.N
 TKWDuPoSh73yKz92E.L2OtsHwO4Gad745NtePxHopASW5OZdWEtqC7sZrxex1htVp8wRm.UvBKLr
 Mxe1pwbUEVYuCUr_F1sBHon4whmIR_mF3foSZ95Psw_KRWUWhFAeJ1.kKvRDjvUHlSd2SgJsXrvD
 V066g2cieIbx2q4F4vOMJi03Cc9EvKt6miqDp7KoK9aOYSlHrhL00MNQ.NuMcta2f0alsgQBYmab
 NQr_dCDesqNmQcLZdesmYufolLZUpYNIDTOUwdzzyGjH25grYDMh_NEkEBGtzwWgqwNXuOP3J69l
 F3NODX6L6jWmpFuoswuuuvGkvib51RoDau8gOfZ9S3DHUni6c1OTNyOq2.VS64hctyxHhHSgb8IH
 9ZgC1emVsz1qpOsn_aG60keBlN7Wxszs_Rco8LVCve__d5AJje78JLETx0gj2bjqd8Mh4MERsmN3
 .8YCaQahAuzkCsFE4AS7LgyaCcVnAT3.yOzgFfg_MH9xGawdpcmhO5ySEizm1t0.g8TwBrYaMtYX
 mRt.a4cbmFVOTHF7yJ3byFo_8ExqBQVH5ZK2oQLHX27_CPVPIG1pNUkmFxCeJEGclzH_o1.HrNFP
 bD3aK.y_7nIT999BP2eZlOUWFiMDmTN0NBiGsR0.GITnVF_jO6fU.eq9bn7xOEKtI93_xwiSpXgT
 cOdBxl20h3nznykd1Pma3h.yH2jkH8wssbcygO1iRrUbXFXWe5_kgHtSv32OSx6e5eRBlbJdLnhY
 VLS6ChBrG3ZJyF.QyMkQFfYKUz.I6Rnh4RA--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: e506bb59-db26-400a-8ec8-4f017021db84
Message-ID: <5b3f5d86-1499-4dbb-934e-2006a3dc108e@netscape.net>
Date: Wed, 1 Nov 2023 04:45:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Mario Marietto <marietto2008@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
 <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
 <d7d353b6-8d98-4bfa-8f45-1cb56fcea1f8@netscape.net>
 <08d50d8e-00bc-4bd0-be64-49639028eca8@xen.org>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <08d50d8e-00bc-4bd0-be64-49639028eca8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21890 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/1/2023 4:27 AM, Julien Grall wrote:
> Hi,
> 
> @Stefano, as you pointed out, there is already a thread on xen-users for 
> this discussion. Could we use this thread for any discussion? This would 
> make easier to follow.
> 
> Some high level comment below.

I agree to keep the discussion here and not at other places.

I just want to add that the best results for Xen dom0 so far are
by implementing Marek's suggestion to disable these two settings
in the 6.1.59 kernel config, but leaving everything else the same,
including keeping the EXYNOS_IOMMU support enabled:

# CONFIG_DRM_EXYNOS_MIXER is not set

Disabling the mixer also makes this unavailable:

# CONFIG_HDMI

With this change, the GPU is working well enough to allow the display
manager and an X11 session to run normally on the built-in display of the
Chromebook. The Wifi also works well.

The patch from Linux 6.2 and above that fixes the exynos IOMMU initialization
did not help at all, and the same error is reported that the mixer lacks
support for IOMMU.


> 
> On 01/11/2023 02:50, Chuck Zmudzinski wrote:
>> On 10/31/2023 7:45 PM, Stefano Stabellini wrote:
>>> Unfortunately there is no easy solution.
>>>
>>> Do you know the version of the SMMU available on the platform?
>> 
>> I am trying to discern, but I doubt we have v3 because we are
>> working on a very old chromebook from 2012, and I am finding
>> patches for smmv3 in Linux not starting until 2015. It is good to
>> know about this option, though, for future work we might do on newer
>> devices.
> 
> The chromebook is using the Exynos Sysmmu. So there is no SMMU.
> 
>> 
>>> If it is a SMMUv3 you can try to use the nested SMMU patch series to
>>> enable a virtual SMMU in Dom0: https://marc.info/?l=xen-devel&m=166991020831005
>>> That way, Xen can use the SMMU to protect VMs, and Dom0 can also use the
>>> SMMU for its own purposes at the same time.
>>>
>>> Alternatively, you can dig into the details of the exynos-drm driver to
>>> see what exactly is the dependency on the IOMMU framework in Linux and
>>> remove the dependency. Unfortunately none of us in this thread are
>>> expert on exynos-drm so it would be difficult to advise on how to do
>>> that. For example, I don't know how you could debug the x11 problem you
>>> described because I don't typically work with x11 or with the exynos. If
>>> there is an open source mailing list for exynos-drm development they
>>> might be able to advise on how to remove the IOMMU dependency there.
>> 
>> We have received this message from Marek Szyprowski of Samsung:
>> 
>> https://lore.kernel.org/lkml/7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com/
>> 
>> Marek recommends this patch to possibly help with this issue:
>> 
>> https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d51489c0506547f
>> 
>> and also these kernel config settings:
>> 
>> On 10/31/2023 8:08 AM, Marek Szyprowski wrote:
>>> If not, then as a temporary workaround please disable
>>> CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel config
>>> and check what will happen (You will lose the HDMI output, but maybe
>>> this won't a big issue).
>> 
>> Mario and I have preliminary evidence that applying both of Marek's
>> recommendations to the 6.1.59 kernel have improved the situation to
>> the point where now the Chromebook can run X.org on Xen. We are doing
>> further tests to see how Marek's patch and/or the kernel config settings
>> to disable the mixer and the HDMI affect the behavior of the GPU in dom0
>> on Xen.
>> 
>>>
>>> The final option, which is a gross hack, would be to let Dom0 use the
>>> IOMMU for its own gain. Xen doesn't use the IOMMU. If you do that you
>>> lose freedom from interference between the VMs and you cannot run driver
>>> domains or directly assign devices to DomUs. But if you are running a
>>> research project you might be OK with that. To get it to work, you need
>>> to hack Xen so that it remaps the IOMMU to Dom0 to let Dom0 program it
>>> directly. The attached patch (untested) would be a place to start. You
>>> also need to pass iommu=false to the Xen command line to prevent Xen
>>> from using the iommu itself.
> 
> This is actually one of the reason why I am suggesting to do all the 
> investigation in one thread. There, we already discovered that the IOMMU 
> was assigned to dom0 because Xen doesn't have a driver and we don't hide 
> them by default.
> 
>> 
>> I am interested to investigate if only the mixer and the HDMI is causing
>> the trouble. Based on what you are telling me about Xen not exposing the
>> IOMMU to dom0, I don't fully understand the original log messages I was
>> getting when I followed Julien's suggestion to find the symbols associated
>> with each address in the original message, and those seemed to indicate that
>> the exynos_drm device was using the IOMMU in dom0, but the mixer was not,
>> and the fact that they both were not using the IOMMU is what caused the
>> test to fail and Linux refuse to initialize the GPU on dom0, whereas on
>> bare metal, the logs indicated both the exynos mixer, which I think is a
>> sub device of the exynos_drm, and the exynos_drm, use the IOMMU on bare
>> metal.
>> 
>> I also found this patch which suggests if we can get the devices to work
>> we will be compromising the security and isolation between guests:
> 
> If you don't assign any device to the guests, then you will not break 
> any isolation between guests because dom0 will own all of them.
> 
> But for passthrough, you would want to the IOMMU owned by Xen rather 
> than dom0. Unless the Exynos sysmmu support 2-stages page-tables, then 
> dom0 will not be able to use the IOMMU.
> 
> Cheers,
> 


