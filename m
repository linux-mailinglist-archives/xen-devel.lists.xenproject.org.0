Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A64D70DE
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 21:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289540.491119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT8MP-0000Jm-GW; Sat, 12 Mar 2022 20:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289540.491119; Sat, 12 Mar 2022 20:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nT8MP-0000HC-DY; Sat, 12 Mar 2022 20:29:09 +0000
Received: by outflank-mailman (input) for mailman id 289540;
 Sat, 12 Mar 2022 20:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5kzO=TX=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nT8MM-0000H4-Ge
 for xen-devel@lists.xen.org; Sat, 12 Mar 2022 20:29:07 +0000
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c5d9592-a243-11ec-853b-5f4723681683;
 Sat, 12 Mar 2022 21:29:03 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sat, 12 Mar 2022 20:28:58 +0000
Received: by kubenode500.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 73ce19a3450832609b15371a3ed11189; 
 Sat, 12 Mar 2022 20:28:54 +0000 (UTC)
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
X-Inumbo-ID: 0c5d9592-a243-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647116938; bh=WFwzecQuG0wiUElFD96EX2UZi7TR+5rSnQIZKRtTotE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=MFg1o/bh/XfZB9npug2LlNl5k1Gzw8lwFnQgs0zt8AMoRRk/6RUmrMlWQIz+IXuy9tRwowG63/nl5vF9s6QDYbCluw7hwc6cOmbUxptXtLcq8wX1cJH0N4HwepSyMihp3eVhLSri5jpKn1QVkn/mExb95Q3WCcXOngkNWZ5+H1FBAtjLvRpp3EWVoi7UBddSAX06WCaU/qR2rNnH+nCFvMxXRMKhW4EcbUC0qn0nyqJ55R9jtW1vfpUwJFYyIrGWaXD0JBHNwt5liN8Y5ZL3ddRsDy0+ZU8cNtFmLnlkMXDxzFjgxuR3TzjrV9Iu88Ams2HFz+4HIjYIbhRk4fjo8Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647116938; bh=6DN6dZg0glyW93NF4AybwnJDFJyftFi1Oyws2ooJIvZ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=QSPcT+4IevZ2tPn9Q/9Be4BrxYsFV87HxvZBDhcc8zPBHefcJ8fmMoo+11HW+njhVWj05FfUJX7UICO0RAE5Xy9z7EHrOahF1wDTrrdRFrEKfwn6qc3Yc9j2U8t+6D/bLgGubySlz6dTb7++F9x84sa2ncwSQitMDOdUZuoPe431tm+2E9QmGbt3xotAwDKEGO8qXFamUNFrvgMg1aUxgVnrQJr1W8dHTI+bf05ENerTpee9TjVJSjPXWdMULe5ua6Ahu0h5ZzMIJODGP4EB2/iCQ0bfbH9CJX2Wepp8tJ1yAFFpx19TCXrlMDPvSNszfxf3frOSIqs+mmSbes7ELA==
X-YMail-OSG: UAkn4T0VM1lrcRuI4kX7JOGNzlLF.eZDPFj4ZHuW_cyZAcrQY2Xj6NXdlF0n6CC
 UhmzFK9OQ_qsZ4kVULe.ifSD3yn5CgCa7MpXq_sMziRv0ChJ4JrTryk2MhNR6xTCig3CKvQJsAqd
 XZqgGHM_W2s9Gu7qVqzYEqN3pa4GoiC71cYnxRq4WZL.q7ziCYmKH.NGKduT1lGEfTbyY0cEcBnr
 63U55eP9LQwWFhZLpKa5prljH9lXi8JEzAO9ccSI.vBvy6lxo5Ewc6PlWAriCZjFdsre_64SUgXg
 jDKRh5ZDM4JAYeZA41XmNzvw1s4ii1zoVQRUx2yPgI_11Y3mGIEZGt86BFfn2fOYpvv1DstwCQcc
 ZDEoe1b7R3.AxVXMKFjRUSs2NbSdQBWORb.OlNTOJZW1EfEbdqX166KyijE3OsdCjfhB_XISXh2X
 FmKcBy3rnP3LqzMb70m3xhQZoOLk_IuXnBjh6WkzKpP.uHhOwk.UDjHr56g.cyKS3EbSpSi8uKj_
 ISTIwzVx7EfaMU3Wx1nCyT9EXZg8abLpHKvVryAK4AsGtJ.H_qbGHOlj8AhBP_u9UA5545bfRfqo
 rrYbpsw6DqdP1DVzvpA3vqKfFyczrLQR7.JDAxVJ5hMvQF6E3cLm0SJpf_sR.ATw3Sge1.gC8g9_
 mTWd21yXR0s_h2nzT4dOQdNXypKQ_VSdBXkvV2k88npdtwt0OTNieEn9Ij1L8nkbokJcNbyBjhA7
 KEDrz8pVcGrTpawy.twMLTuEmSGaz4ABqCALnaHiqoX8u2MxGicNhDxOju_hRKYbBlpa4TQ2cCTt
 0CHHf9hpN65Jh_7LRVca0GwiUMT1wJJDX9KfRezVy4h0IHPoNY8IrNB5bN3oS.5cpYt0kJJniEDe
 5NE9eOFIaUGVCdcwKWcADK.qkbopkV3b8pJOdVeoTDSe7EbEAisnylrsPxThUdMqTaY4MhEvaVuV
 Fk5mZIR3Rk1Sd643D6BOAlCrvGdzYEHyCI4opVYcByZesZxlIqFerfUHlbkpiW8UkBYnN2BAa78j
 75aIG7Q2hLNKUWfZbTbAcXMlbZwg0_fbbVp7IkJQwNDSm.dqwCbjsKFiNofhgu6Y8cVfIbdMHYKy
 OjTxtRJpnkb97Xy0w6ltdjbJ3FkUwcgnGZOU9oKIi1iXHltuxiPoSBwxhnv1AeQqRCPhQwm0TZGi
 _ET0OCrUaCbN4MFH1ltvn4WycAlbUGIyV85k53a6hewp_Vq9ejfEQKa9tJ.o3EVU1A.49DwdSbk5
 45s5R96f_5OP4SELmhe3W0WngmovfF2be8zgUgidOExPuz8A5bitMkPi_sbT3gkgFPZ97iOVEgwj
 jqdw2nTLuu1xRdNWiRi7W1pNa.tlYuQn3V45dQZ1hkogK5VAU3vQYX9obE9h.aL.nbr8n7lIEf31
 afp.CAY3tsHFVow5SCG38x38XM5wyctBfD_TkPJs2XDpzVeVwsSVbcfPr1z7hiDMI4q9T.CDkprb
 JtOg1AJOijiodCjuw7b6pltxIgUm5FhZHLSCjaBRA90znFjWBlNZKTFBaMDVj21yknT.guts4eJV
 uUIE7Pjo3G2xEr7XKZ7oDQR58cYgKbbuzqbYqWEImPhWzmolDJ1MNaTZk4dyc4Cz4UEzxVAPRSrk
 A5G1n_e5exyP0.CAMvCPg6OFCBajzymb4SsgPdbVjc7C6VAnxIkF_GX4GxweVPFavRmNMqK6Gzlc
 DwBPLFfVWv2fayZhOS6_7wp.lAa6wOj_1LAWqDV4iqD4KbJNmd_TMRC1OQTEBsjhak_wlLylFc0g
 N73OHyf_9Ouwvz9GJrIJ4_vS5afluj5sjRb2hrvNidxP6YxgIBM1PoWKiSbappPyI8Jw1Bwyhz91
 baXpnTNxge8QoePBuMyT5DZ0jjd07ONPBHNiZwLGjU5tn_RnAq3oqYCBTLZ5PMBOPhDyC3PUgOc_
 v.YeUnQKLaFuqYPsq9peGcy_BvpjUdTt2quf2ID6YERPN8ix9QS7.xr9T7d7OGV1ajujagRsQKV.
 y3rc1rkIyQG4jAvY_EUpXR7QDQ2c7oDQwOM2o4D.jK5QEF3lFnxe_HsxAXBCDjgosNUoPlT3_945
 bDn_RDDZIrOTQ1axatI95GMMI7e_UTmI3MXYtS9GprwWQ8hvO_oxLfCLjGWFTQAcUQ5gBV8ihfOi
 GSc5__jVroJVKsWL4a72NQhu0uwNq8hC6GTo6ORhyomX3VIY2butvRRZ1bIlzHQZHLSjiA2Q1Vcu
 Wl5d9Ix0-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <f6e946d0-01cd-f369-3da3-54836d37f05e@netscape.net>
Date: Sat, 12 Mar 2022 15:28:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
 <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
 <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/11/22 3:09 AM, Jan Beulich wrote:
> On 11.03.2022 06:01, Chuck Zmudzinski wrote:
>
>> Here is the patch that fixes the bug on Debian sid/Xen 4.16:
> As to an actual patch for us to take - please see
> docs/process/sending-patches.pandoc for the formal requirements.
> (Note this was recently introduced, so you won't find it in the
> 4.16 sources. But your patch wants to be against latest staging
> anyway.)
>
> Jan
>

OK, I took a look at the process and I also studied this
issue more closely, and my conclusion is that I would not
recommend fixing this old bug now until we have a better
idea about how good our current tests for the Intel IGD are.

AFAICT, if our tests for the Intel IGD result in a false positive,
then hvmloader will map three pages in the guest for the
IGD opregion, but the mapped memory would certainly
not be the expected IGD opregion if the device is not actually
an IGD or GPU with an opregion. In such a case, we would be
mapping three pages of unexpected memory to the guest. So before
proposing a patch that would fix this bug but have the unintended
consequence of allowing access to unexpected memory in the case
of a false positive detection of an Intel IGD, I will first spend some
time deciding if a more accurate and reliable test is needed to
determine if a PCI device with class VGA and vendor Intel actually
has an IGD opregion. Once I am confident that the risk of a false
positive when testing for the Intel IGD is acceptably low , then I
would consider submitting a patch that fixes this bug.

Our tests check if the PCI device has class VGA and that the
vendor is Intel, and we also check if the gfx_passthru option
is enabled. Those tests are applied both in hvmloader
and in libxenlight to decide about mapping the IGD opregion
to the guest and informing Qemu about the mapped address.
I don't think these tests for the Intel IGD account for recent
developments such as newer discrete Intel GPUs that
might not have an IGD opregion, nor do they account for
older Intel IGDs/GPUs that also might not have an IGD opregion.

I think some time is needed to look at the i915 Linux kernel driver
code to more precisely identify the devices that need access
to the IGD opregion. Other devices either are not compatible
with the feature of VGA passthrough or do not need to have
access to the IGD opregion.

With this information, a patch can be developed that will more
accurately determine when the guest needs access to the IGD
opregion. With such a patch committed in Xen, I would be more
comfortable submitting a fix for this bug.

Regards,

Chuck

