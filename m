Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC04DAF82
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 13:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291170.494027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUSc8-0006PK-IR; Wed, 16 Mar 2022 12:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291170.494027; Wed, 16 Mar 2022 12:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUSc8-0006MK-FN; Wed, 16 Mar 2022 12:18:52 +0000
Received: by outflank-mailman (input) for mailman id 291170;
 Wed, 16 Mar 2022 12:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SzCg=T3=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nUSc6-0006ME-4h
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 12:18:50 +0000
Received: from sonic317-22.consmr.mail.gq1.yahoo.com
 (sonic317-22.consmr.mail.gq1.yahoo.com [98.137.66.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a575f15-a523-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 13:18:48 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 16 Mar 2022 12:18:45 +0000
Received: by hermes--canary-production-bf1-766d6d57f5-vvkg6 (VZM Hermes SMTP
 Server) with ESMTPA ID 1f01f6795a4446279f3e878a779a2024; 
 Wed, 16 Mar 2022 12:18:41 +0000 (UTC)
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
X-Inumbo-ID: 3a575f15-a523-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647433125; bh=9nP1084hJi4wGprAACjUhacQ+LJh8avpuJxGyZJ132Y=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=UkTj+ID4dDE5OywjSTasPvHVwxfSc1hDtQUNAfceBbY0YRblJKTs5TjognGZ6b6vi09G4mh48FB/eWod0jcEntoRJ3+mn61p8kmaciYhcU3SUTxaOgJRMOy04F9l4NHTsuNRxEiADfH0JbdnbUZJcOg2wSOJ1SN4DCXTMvRrCFV8OLKcXgkTJbfqpCF6SHetYBIKS+HWilWQtQP8cgt1/bDEOMHIFfBrLkEKlegltgPEgYt1Xk5F9CL1dBomlTDbsUnw5cwNMf+lMrGhYCmuunY0ZzeqWwOI13xm78oOIzfw642ZyLMd+Qaclh9+JiZ0OKDg/kHb6670SdzhcW5r3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647433125; bh=CEzL6TGYtr3wSg6WHBwYGsmTXtKGWVODu8SkScZiYU9=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=n4qDFmg9MIsSFsTTDWuLVtmUYJ0P5x10SGnWJWwCeiJqtkO+0SFnR3p4BWZ1oaB50lTCLf704iuZRLTLo/345++GXcdYwW/Crhr57WqlF3Ws1AYOfYIMcLb+9nM2UMlL15dmbWNjbLvW7GT6JWTBP2/ThgI2oEHupn+4hzvtQviHtRU2kMo3XIcorlIiQ0IvGCFKYEnrxVkdwWcRvTWohRGhywDbhvf/FVrYqOwbcblHrSBaThkJz1G2xKry3dKW1S0vnNSxzrLwQtIh8G1VGQxi591tKujwYNkBAM3Aua+qcKpjUwORjwFeMgX6QygdJdu3+lZSDEAsFdW1ljwFOw==
X-YMail-OSG: 4AN5O1QVM1mv6193izsaxTQNWWQXMS7cUOSslrErdlDIt9xO3nKhNuFBq15LS8n
 FHIWViXTtGV0j.hrMchT6RZxAL5kwzV.e1F7il2mc7ks9e81xDzu2TwrfdjD87xbPJxTW0zDf9am
 VM7ZzdB._Z0O9T3aAoL_WLbNSObbcGly_jPVi19.ahcZYcba2LqkX.iuUvHf30xbTHJr3p0rmzKO
 Fw5z3yWh7ZW85G6VWUP3X.XDzNeQLSHFBYmo8qGVVludHP3dt4JFTKXqLLV9aIbvfIOMH.x1URNH
 ZStg4iVMxMmYPuRRUDWgJ3XTdM4NZ4tZo_2Zy1lh67w49sxisYVzFURu1oFhry0fdT1i83PynDjp
 ZJCW520zm1PHiZqE6.m7wpBAZS9WAbBPI4F732g8ykPn1jy6z1eCqOkbzgZpycSjgEMZ_gO_.iIC
 2.uG5Wmb1XqigmHeIhAKNvExieIHWPyh6ZbskYyOej__KJoZkcIf44TJoXtF5aAbcjgs5Z1ZAXo_
 JyZFssw6BdLAnuITkc7k3sZigdYwV3GSH5g6z.aPlC3SmHQU2az9NCpwXDhREmw3z9pok68FK2fS
 jelAks7fkCF52tRdDv3UTXhvJ0k.yJoECthATULx.p9XAwz1ZXomn3cWAWSOlg96leDCbVvwjkuV
 nkcxMk8RHCfOj3AwO_k3lk5.Vh7WfQasrYSXqa9W.XLYWkJzl9cDda5hMEaPqwucypnQuDeufyDx
 GDodTo56rxxNammCkbXQjwS.5Gr4Zdr_q3xpIxAjO.AdXMXULejSMXBt8_IzHb4kjwrnR1Ru0HdW
 3MkcpswBB0fjIpju07ruI762qeMBSmMtaCdzqItCnK.83obUsEvgvCXSeTCjedMqTqpBkyb3GH71
 IIn8t6o4VibLhfolgO8DisPLfcu6u6Mhn8AsiqkhB_F9ked0RN92E_dfKHOfl9bBT7JRzhJ6cjI7
 CXdt_sgtQvnbdM3_wRpy.cXuqm0LKhB_ve4SzvOH.JJKxuUWrFV5i83HYdLhGNYI_QY2bSi1YQMA
 _ZEj4NcR0dI21cgEV3F5u2vUxgY9vXHgp0uvZseaIFNAqq8jZpfEg12IzXIPUhHMQsX.snxJZoBW
 jxWgoHmepgFJ8aYwRm3p21fzl07YHGvXm62Unz2RH21Q6eeQ8h8JtmYCsf1kqn.iY2KE64jI8TZu
 50T4latDd9gc.6VaiRCAc8RWUxsJMX7qYFiUzTq64nNW2AQRQv1g9zSqULQS5m0XnY_lDd03lQYP
 aQ.5mWC9NrVKc8emwKElX9idO2nxOQQGjVbZ_wnAwZE_1QT37lGjWRUfyUKquy5eKjm1Qk3CARbG
 OA106kmUIaocDiTVKZDKmCximFvxUvZCV8W7ghdhdkmplVIKWlNEZJI0sfBqQJS3bG0boRqAyLcf
 K.crYrAqoR7h3D.GFLajER2jn8HPqoSC3ev0inflPsyF6jcAah5S.IrcD1rpSKBCwDmXTmcjTB3H
 6Lsvrvj4jj_NpuZaLDXrDY0GS8hBNhlqCkfsBQNb.CSWLU61rw48ubev2NoPrWBPSO6prsqjqeYE
 oxM6_sjh7N2e_M.hGa.Rbhpm5bINQn0h8mGmOSV699g2gGS5sUA2bjQCYPk8ewKxE1OCHiv_V4Pv
 nHej4T8lKPijAXnA6fE2KlQqCWjk_75KhhwdmyOmt_rwpZeHWyZb36tPQarEtGm0hO1bhr1NbpCG
 B59kC2IZZuwbhpICw2XxH.J7uTs6n8C2BiDvsx9vCfkNVDvYdsa6eZTmipUuKQgTm.ywBcjKnCYd
 bRuN2eV2fkQgUoYcTPE6M_AkYSsKSxLnfdHD7EiHpdve9T7FgjMqfsLwNIIOrmz6cKdAVGkaH9ZT
 CdTtYo6cTo_yrRt.mqiBiy1jhLpSMN3oPxBzovJZdJli7YJU2pBa1eUAF6nw6XmQj73.cAd1AL.E
 5BJ4hjQTKGdL49S1wXyLNewkaJ8R9cHe90j0GiOx301fytIm_p0mnaBHtTOnyMnleMUx45oXZIGN
 ZKWsCN16xhsIZxIoCauZ_d6Mg3X0zhokaVtYHmzXGN8pW6_KP.vlnBCh1wxIkHymIwCcCk2_w8Nm
 ujfHqYA7zJP5g9mc.jjcLuYojpX9gf.jA.UBIyzRkBnS_NUdnCTFCn2iCLtHUHHgik8QXXf_Vens
 UcCZChq1joWsrUlrt97qaLIWdS.DYuKEg0A.7YC3cklz9r27iBLS3DrSGYawt350vzh7kSM0f0Gq
 ZMr86Vu4DrFlbjH_QtpdW7NQu2s0q6RrntsRFx1t9AqGtpVNInSv7AY_EferhMXbvcKgE1_u2Tk7
 rniPU54i0958.daoHmz6.wq7UWT4EAfk1t6mx_tNVdbhlT12j6ico2oQOIg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <84f852b5-82cd-ae9e-5f31-97b6e8d78f2d@netscape.net>
Date: Wed, 16 Mar 2022 08:18:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
 <da166412-9765-039f-9248-869204d78c36@netscape.net>
In-Reply-To: <da166412-9765-039f-9248-869204d78c36@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/15/2022 9:27 PM, Chuck Zmudzinski wrote:
>
>
> On 3/15/22 7:38 AM, Jan Beulich wrote:
>> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>>
>>> @@ -610,6 +612,45 @@ out:
>>>       return ret;
>>>   }
>>>   +static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
>>> +                                           libxl_device_pci *pci)
>>> +{
>>> +    char *pci_device_config_path =
>>> +            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
>>> +                      pci->domain, pci->bus, pci->dev, pci->func);
>>> +    size_t read_items;
>>> +    uint32_t igd_opregion;
>>> +    uint32_t error = 0xffffffff;
>> I think this constant wants to gain a #define, to be able to correlate
>> the use sites. I'm also not sure of the value - in principle the
>> register can hold this value, but of course then it won't be 3 pages.
>>
>
> I have one more comment to add here. I am not intending
> to define igd_opregion as a data structure 3 pages (12k)

Correction: Actually, the igd_opregion itself would be 2 pages.
The three pages comes from the fact that it is not guaranteed
to be page aligned, so it will take three pages to ensure
that it will be fully mapped to the guest. From the commit
message in hvmloader that increased it from two to three
pages:

From: Keir Fraser <keir@xxxxxxx>
Date: Thu, 10 Jan 2013 17:26:24 +0000 (+0000)
Subject: hvmloader: Allocate 3 pages for Intel GPU OpRegion passthrough.
X-Git-Tag: 4.3.0-rc1~546
X-Git-Url:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff_plain;h=408a9e56343b006c9e58a334f0b97dd2deedf9ac

hvmloader: Allocate 3 pages for Intel GPU OpRegion passthrough.

The 8kB region may not be page aligned, hence requiring 3 pages to
be mapped through.

Signed-off-by: Keir Fraser <keir@xxxxxxx>

In tests on my system, this is true. It was, IIRC,
0x18 (24) bytes offset from a page boundary.

This has an unfortunate side effect of granting
access to one page that the guest does not really
need access to. My well-behaved and trusted Linux
and Windows guests only request the two pages of
the igd_opregion, but it could have accessed the 24
bytes before it or the (4k - 24) bytes after it. I don't
think that greatly increases the security risk of including
this patch, because I think with passthrough of PCI
devices, it must always be to a trusted guest for it to
be secure. I don't think an attacker who gained control
over a guest that has PCI devices passed through to it
would need this exploit to successfully attack the dom0
or control domain from the guest. The damage could
be done whether or not the attacker has access to
that extra page if the attacker gained full control over
a guest with PCI devices passed through to it.

Regards,

Chuck

