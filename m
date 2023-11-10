Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36227E7EED
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630726.983860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vc0-0002ef-Fg; Fri, 10 Nov 2023 17:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630726.983860; Fri, 10 Nov 2023 17:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Vc0-0002bZ-Cy; Fri, 10 Nov 2023 17:48:08 +0000
Received: by outflank-mailman (input) for mailman id 630726;
 Fri, 10 Nov 2023 17:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7/b=GX=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1r1Vby-0002aA-2k
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 17:48:07 +0000
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bb2d434-7ff1-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 18:48:04 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Fri, 10 Nov 2023 17:48:02 +0000
Received: by hermes--production-ne1-56df75844-8pvmk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0a3b79c171e09ebe0074a7aee1a6f964; 
 Fri, 10 Nov 2023 17:47:56 +0000 (UTC)
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
X-Inumbo-ID: 4bb2d434-7ff1-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1699638482; bh=vZTMiRT1uxgbhlcpFRXkj0WqH9htkyWIFGtkpXTkCRA=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=tJQyW9mTSjcdl53ck5V9yAGwGnOHTT0Y6YAYN10a7LlVkLS6Xq5+ZP+3877HoWwp+T329TmadKINRCuyEaNOPCEQtAr4oRCQr9m2z+jxmgH0v3gprbHq48fwULAOzoUYOZvgQQyrDXwCHKa0MtsjBONYG+p7o90xit7TaM4P84aZimCe/p07OC/suBhjYEw3BOFBqeHycrJxt6prRiN+HvmrmN42hf9mGyhalw47NAqD+p75vVM+2XnnALThbAD+O6YjPABOlARK3pynimoxKRAP3ZwysFtGiIG6UpITyppPUgGtpT+MNmBHyO6/P5J8GxCF/7M3wJv0aDghuCDztw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1699638482; bh=OcbMuveobC5Y9/jl0pQy9JyFe24RCOrx2ZhVRGS9awc=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=FX7amUjcn3P+RFvtlj7w7VSPru9MoXgTF7MoygyzviltPIL96jEAkA+IB74Xv9v/53pLByJiPzVtnAHl9wXAGAgqR+eC02Zctrruglhv0vHKSt5p5GsFpbAvvKfwJ6yP4Z/pk3hYKthKpIiIv8lvt7CXKGIE+vjkraYI+/zJtzAZPzdXe1kzeIzCud4z0MYqyJNAeJalewk7mOfd7D2piqaJj12rmQUUH8nnM3TloYWSQRwuk1t/061HgllEuYVfAX3oBanOJAmpP93FMyeSjmoHiB62gSb3M+w/liizhEg3OdLwLEkxyqpkCUfJ8gsb2zr08MxUNMg/WUokWn+B8g==
X-YMail-OSG: ..ZAkG0VM1nPpgqu_qlmb_lcpT9c0b_Epkpkp4GPbupL1Pf4F4Gnt89WII29tRS
 wcLILdtIXNXisf5BxXPJx64bA_uIFlXmkmA2BA.5XtUMtCPgn6B4Dy1dhFM48TzRPF_t_MvMgy0z
 o17zg_e1cEcyvCZwKhNe5oDSV1ouuUHVRNQmLM7Bd7pa.9eeL_3D.YHEVtZzmOiuoIBlmqsl9ErP
 thnUOp4EmgGL6.YVuIfVtz0o_B7f.VrZdlyCYysyN4Eclz9O9w.lDJDTsbVr5BpJ2mYFj9pYBApp
 SV1MxvArBSfUoIxswOFH4t8Nqu0bHekxWPM3oID0Xl7Z0nZWer7QP1Jz5g.o.CC3nBW.nft4DiFB
 IZ_m__EF9xf9yp8Ds_mxdfzzJrI.1iI3LhpSH9i.lW5ozwEl9SX.an85440Yp60aRFjPJ0sAGKk1
 LOB2uD1eBQNBf64lpklC9hhWjJ6DtfqM4w4thoOvaxGpgjhr.SBArvRASbFZ3_jsHEDb.VwmmKTH
 BL6yBbsiSWljhFhN6KObau1eu81dM4NVeu7Tda75tj85WOchKyXf_qcXfrJjAMl6VoJs9KWluEnO
 impIXwHAGgrFGn17ynVBWO9tG4FisFaqyxmtyvm8vS5EGGChZNDjtMLV8mfTdzrMdwC41DkY.9Pw
 vjHedLEgrzwGrLJt7EZc.RJRrN.nkQ29znZMqFkbfevO3Dnjd6gwOQTdjWDBEbJXiy34PMk3HEUU
 NJdBAdZ5jgkOVwvHWAMX97mdnUvz7vsvt93NVXSzBZKVRVmR8eCjedf2Hg_CKunLglpT9GIc55SN
 TVcxaOxXvH4ntLkhD4l.1g3kdDfsT2gdaUq6ueI6E1RcQ1N0j8dUFTwG9bCOCd4IQjWPRXVl3HAp
 35RA8uCsLA2.9Cb2JPdCpsqQPKIqsHpaVXGyVrVQNMj3cHgktOoYYCkJ1jlABwIp9_Itw320GTca
 YKt.8LLfrYcaVWB4VAZxBp.T.vOt9dYe9Obytjgdt973NTs.E.QuE0RNk3g08ud1jdtXHb0zcesJ
 fkzUKuF41Ic9Dsp964phV2jeXqJdcZXOGPZ93Lbw.pnhjvp70.IkxH2vvXa.DAOuOEy9Zzxzt4ri
 FHx2X6_XdQtW0kD6FdLmhfSpmlZAsM.b.5zpz6wwIl2vAEAkqvc7uiz7RLfwJzlXX2TAorBz7GE5
 AQgZHPgJ2.68MkD_rphIL8ujz_wXgRw2oikU8c1ezFG2hsrhQdkuWWXlU09XJkNHXy4gWcAtDUUo
 Yz6SBV1zaqn8OVFByvl5r.EHjh8ziBtO70dPcCVqYTHoL3kbcqGtOqb6dTzuUSKy7_85DONTSHkT
 udm8O6RSi08IFvG6AIrFqpss8mHQkt9NU0sJxEf3w24oVYXoy3NE5r_NVcbpDjIcau518rE9j8m4
 KFi2Mdp42IfKbJIcHQnd6Hf7x08ikVCqQc9HuMd86WV3JpfUBWTI4akSnQhuU3tp3Kb4PA1rFzhS
 YWH.vRt1c11aUMb0pYktSphUaQt8xfBhHbFVMmPO3y.wyxjKdYvKEyl1rYw5uaVUgar2w9tyy0r0
 SizQJb90U7.GvWih2WF5NJ6d8GQjnamxpNxB83RU4L1TrHiqXwlWEutB3gN.FI42Fitpv2Y_k2uF
 Gm5WwM58MEN7lWdfOqiqgNSLQ7Y1oafgxRz497_l_M5cLJN_sK6YhTqsP4d8ub51fmPth1XU_7Jz
 KgagFWGqU1llw0DE42aJ5SdRlqFnbFM5ufnZK.p7sMssAlHdTG5ewranKN3eqByjUlBbdSyq7c1t
 uZcOdjclZih30lvtVAGzOkdDSduLw7ObRoPQDoVk_hJ3KDL52XpkXJraPcoL4cZzoZ4xcg1lr5UT
 1nhRserFcFoEiYxQDw8L4j58D2fum29ZsGUuF9KyUKmH9yPbsCqxeP499TcaA7S.CuWo6u3V9zoX
 Z21vV9KoxXY9uBh0v56nrUGHWBDZpzefckQGagMQCxJLHdM6lB7ONo1w2CDOZaPqVL20V1hO14Tw
 oiqHvzoCX5YxTQxRPs85lYuOeZ6OFr5EIEuRSQblY5wjeV1E4Ie5V8hnzVAx52cLKdLvAu5XZdAX
 mpJiX8rX4aRX3PZ5M3R8R3pBCeB7E.y0FMPLdhUle_pye7FOeyX_jCmL.mRZfSmE34CvFahyeK1t
 RrutntSYj5yzDbyNnwyoh8SQIQHkIGtfyqUlWiWtB5pe9yZxNdnpZctNE7k52LHin0nlaW5wdLEt
 eQ0cUrDBqQe1ZtzeXn0A-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: fe504c81-1333-45d0-981a-d9d6ada1e921
Message-ID: <acfab1c5-eed1-4930-8c70-8681e256c820@netscape.net>
Date: Fri, 10 Nov 2023 12:47:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
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
 <5b3f5d86-1499-4dbb-934e-2006a3dc108e@netscape.net>
 <ad8c3c99-135c-425c-a0e9-f74c6cadbc78@xen.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <ad8c3c99-135c-425c-a0e9-f74c6cadbc78@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

Hi everyone,

This reply is intended to clarify the latest test results and bring the
clarifications and other relevant discussion to the xen-devel mailing list.

On 11/1/2023 5:14 AM, Julien Grall wrote:
> 
> 
> On 01/11/2023 08:45, Chuck Zmudzinski wrote:
>> On 11/1/2023 4:27 AM, Julien Grall wrote:
>>> Hi,
>>>
>>> @Stefano, as you pointed out, there is already a thread on xen-users for
>>> this discussion. Could we use this thread for any discussion? This would
>>> make easier to follow.
>>>
>>> Some high level comment below.
>> 
>> I agree to keep the discussion here and not at other places.
> 
> I was meant to suggest the other thread :). But either is fine with me. 
> I just want to avoid avoid multiple seperate threads for the discussion.
> 
>> 
>> I just want to add that the best results for Xen dom0 so far are
>> by implementing Marek's suggestion to disable these two settings
>> in the 6.1.59 kernel config, but leaving everything else the same,
>> including keeping the EXYNOS_IOMMU support enabled:

I got even better results with a small patch in arch/arm/mm to disable
the overwriting of dma_ops with xen_swiotlb_dma_ops for a device when
the dma_ops are already set to use the iommu_ops, otherwise, the
current behavior of overwriting or setting dma_ops for the first time
with the xen_swiotlb_dma_ops is done. This totally fixes the error,
and also allows the HDMI port to work with Linux dom0 on Xen!

> That's good news! I would be interested to hear how this works once you 
> start to have PV backend in dom0 (I expect that the IOMMU will get 
> confused with grant mapping).

I did lots of tests such as building a kernel in a domU with PV block
and network frontend drivers connected to dom0 on the backend while
also building the qemu device model in dom0 using a Linux kernel in dom0
with the aforementioned patch to not overwrite dma_ops if dma_ops is
already set to iommu_ops, and on this Chromebook IOMMU had no confusion
and the feared DMA errors and memory corruption did not materialize!

So I am preparing to submit a patch to lkml to fix the exynos mixer.
on Xen. I just finished testing a version of the patch implemented as
a new config option that is set when support for the device causing
the trouble, the exynos mixer, is present in Linux and EXYNOS_IOMMU
config option is also enabled. I think this is a conservative approach
to add a new config option that can be set for cases like this
Chromebook when the devices that need to use IOMMU are behaving nicely
and do not cause any trouble on Xen. The default will continue to be
that Linux will overwrite IOMMU dma_ops with xen_swiotlb_dma_ops on
Xen unless the new config option is set.

> 
> Also, do you plan to passthrough any of the devices protected by IOMMU?

No. On this Chromebook, the only two devices using IOMMMU in the system on
dom0 with the soon-to-be proposed patch are the exynos-fimd and the
exynos-mixer, which support video for dom0. All other devices in the system
are using the xen_swiotlb_dma_ops. These facts, I think, explain why the
feared DMA errors and IOMMU confusion with the PV drivers for other guests
on the system did not materialize in this case. 

> 
>> 
>> # CONFIG_DRM_EXYNOS_MIXER is not set
>> 
>> Disabling the mixer also makes this unavailable:
>> 
>> # CONFIG_HDMI
>> 
>> With this change, the GPU is working well enough to allow the display
>> manager and an X11 session to run normally on the built-in display of the
>> Chromebook. The Wifi also works well.

As mentioned earlier, these settings worked also, but with the disadvantage
of disabling support for the HDMI port on the Chromebook. My latest tests
indicate we can fix this on Xen without giving up support for the HDMI!

> 
> I saw your other answer about the Wifi not working when the IOMMU is not 
> used. I was about to reply there, but instead I will do it here.
> 
> TBH, I am quite surprised this is the case. The only difference with 
> baremetal would be the RAM regions. Do you know if the Wifi dongle only 
> accept certain physical address?

The Wifi device worked well enough to associate with a Wifi access point
without EXYNOS_IOMMU enabled, it just failed to get IP addresses from
DHCP. I don't know if the exynos Wifi device requires a certain physical
address for the function of acquiring IP addresses from DHCP to work. Marek
might be able to answer that question.

In any case, since the Chromebook works fine on Xen, including Wifi, when
the EXYNOS_IOMMU is used by Linux dom0 as long as Linux does not overwrite
the dma_ops with xen_swiotlb_dma_ops when they had previously been set to
iommu_ops in arch/arm/mm/dma-mapping.c, finding the answer to the problem of
Wifi not working when the IOMMU is not used is not essential because the
default for both exynos systems and multi_v7 arm systems in Linux is to use
the exynos IOMMU when it is available, both on bare metal and on Xen / dom0.

Cheers,

> 
> Cheers,
> 


