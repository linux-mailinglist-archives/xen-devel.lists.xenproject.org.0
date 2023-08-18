Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD577815D7
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 01:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586621.917899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX8zh-0001dP-BV; Fri, 18 Aug 2023 23:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586621.917899; Fri, 18 Aug 2023 23:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX8zh-0001aC-8N; Fri, 18 Aug 2023 23:35:05 +0000
Received: by outflank-mailman (input) for mailman id 586621;
 Fri, 18 Aug 2023 23:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Vht=ED=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qX8zf-0001Ao-Un
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 23:35:03 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7882cd8-3e1f-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 01:34:59 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Fri, 18 Aug 2023 23:34:56 +0000
Received: by hermes--production-ne1-7b767b77cc-6vm8t (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 94c293947b44544087d2078bace9953b; 
 Fri, 18 Aug 2023 23:34:50 +0000 (UTC)
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
X-Inumbo-ID: d7882cd8-3e1f-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1692401696; bh=O1Ir8W49uM5Bf6Y3rDKdVh7p6b9EefDHPDluFpH9mPY=; h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To; b=Ld8oVD5yGngELdWXJnhQbe5Sb2Us4c4GUyFv60nDFamp3Qeg2HlYDjg/uJx7H84oZM6ctBZMx6E1tRMEIM619JjOWtyRDdaFdiYfQ5604o7uKkQAq0lLmgvAA5zbUTO/FXBS75R1uPDr4gfRSA9FDvj2NUGHHH6tkLVFfR3GIa02hubukvoxb7bb4PnVI1wgEpMK23PrGh3QN8/mXgzNzT2kzPkzy/E++YhVGglrENEEYSRG7QWk2LNyRmxclRBBCAs+7rQpYKJUvngR3zywUzmdWjVYtZ6n4Pap8VbSgcAb48S+hpxMcKFJF5wjeFbNB5hFk1y0A53c342lMC0ILw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1692401696; bh=Xvp1XBeItR2QYcKITmpE0diVDBmsIESbALjD0k7Ok1F=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=XyS2ss9ck+JWyJLlY/tGILzimzITTJiCN22u37yi6VSvLkG1o24jcdDTlYe6w7krqhNGXoT6O6x89AwCSS8Uq+CVu3NA99l0aMsH18f7BmpQ0t+KmIjGG7IKft3RU460fEsbgkHee2Lxu2T2J/NJQTqwt+eWegrNOg84ku/0fW/N1hyk4jmcdGM8Uix+zMQQCQzZJi18ykllv81XflG5lMjnf8yRR1jBCL/PqTNZQnzQcAwHJM8pi+HE8z3bOzeFO6OVSNaT12YSoyWjtA37gk4l9Q4gpb5IUHYJcgLju26OIXITWtV/ifhpxzqKBlX+M9i/y5TsiUWxl8axaIrbvw==
X-YMail-OSG: 9hFPjNEVM1k0G9EF1RhjOo8GKwhrIB1eqHiB0ozXMi0rb8WbUrBcN9UmxqSrdq0
 65n4LroPho4e5Re2n3JoF30DfEvD.RtBfR8L_A58HCxseCSjrljhHCDHNvuL76oZM.Q_HJiqPINK
 dkHIxebXgJFoLnvxSauEwottTNhBHFf1rhSMfcF1P.WZgQ4jaVYtnD_88iy6VzIihzOPFdRQFnRG
 mhHGhiBKSYjxJ20h49L_XDTYWCvl9VxhE4l2JuHLOBe41lh8jkAjUZtjB_4xoyMaFhKlRA25k82P
 OJSUKLo7uUVgFJidXjwOVrUC5sDND8PhtU7j3xAofXG3SP7FtP0L.Qu6OXfmrzgIcnZsi9h5kT1d
 TvDtm8FvkHbHPmH60gsABIrmlKW4r275EccmGSWH2RZPUdbaxV7OX6paSPeU5V.heXyxC_k4g8aD
 jehHVLTCFS1I8LQy37924j3HCoSHd6uDr11a.GnL6iqNlDaCsaywD2N7NG.f4oiQqD8y3uuY1Sbi
 sxJEe8EP34Uk6r7bz4d0pEf5Eln5L1tyhLBFCDPuml2MiMUu9S8RWPI54qc_dT3.72DLlVUTQB1Q
 QRZhKQoli39HKiQcvIbWqk8iLyJpZGAPqyWKuky.aT8_wi_oyiNHRNDdIAE6Zi36oBVZHttq7R6j
 PsqZwHJCkAdXoY7Hu.CFoaOKkGZSna2kSXDzviC5w.s8yVd.n6SYF3iGo4MCgxpWwdKl9UwEl3Vw
 nrm5vFZ9.7aI8cw2iwo1VDIwoRt08DR.bYqrA2vrHSRH23OvkHikkaD_knJKv7szTgQym0KUljbr
 X9MORJ4YD21GUAdVa6o6ZgTt_jkBCWqoHcjsZkjBcOgZuVyN6rdtSNTpsJQghYCWV8_Pprb2m20M
 CvsjDFMDBIYLrMj7ZFfu2TG8euf.lmM7DDGUaTm9U.fDrA5K0fjai5MNdSy71nniLeGhn87PrLVr
 zrsEISs8oEtflh2VAcQZ.qBCMoRQfUW3lscKtw6oJ313zxW8tEgKjglNvri7jpfWwOYZAT_S66r5
 irGnOuzEKbnrA7oFmyX8tmpoQwWnWeiKoruA6aPmSOTZi566FZBYMxzBNRmOLFXvoUd2cKJBp4u4
 Vj_SNeUnCKYBPB5F8WrvJE9VhioO49eDOTO9iRLgZvBusOeuBGEd5FsjRDhnYNMYAHD8GDnwEDRg
 MTwZvFf2K4CKD.w3O1JmwMpO_1BoKHPtGEiqUDxYuJubVfeNj3F_vRaG_9gd.Tbt9QmOpuBkti61
 c2FRNfmsWbBerr93jLykXARVapRqKip6yXqPm3.KOvc4uEMKbCmj8BcZ4GaNZQZZhtm5XRBvpMt6
 V7DrBLQm.jDEk1qNtvYoEDzbdxljHKZIq3De5zU8W9Ngj7udzgt_rog23MhjSjuIpGMnmTcm67vl
 BdmsTjCRQBSxNiwz738g.M9BySueCYUhzz2PHFeQehvUrswdEOzFRMzkDuViJtUQCD1Lcni5dlXF
 6Pa8RXHWGNOHOiu2xm.Xxws2RKLtKzhjcr42_FYd_RNBwWCM.P6JsofNCxt1fv35fzIJDKhd1nzF
 cDASyPwC3iDDnUV0v5k1bed08WTZrGS6Gg4ID1feoUfIp52dCT6FXEoYyu3xHhp3yGIvfsrpCJlK
 4dMlx74VbDrWg9PkoU9u.OW40kNye5oR7Zjrww8wfOXXluRPThFFFu_d8ToBCenRKeRildHyIKga
 VzgNFswfXx0dLiV_DZCXPczLJCQ4rQ1Bl4poIOXRKp7LU86q4gVQNTlUBtbcU5tsQZZfS4arinrT
 BYmTISRVCxOlmZpMX0C0mMFGcLPAFAqKC6bHXYAELDbd.c5Z4qHCSjDZrrfiN_kcbEV4BBwUZ16Q
 8FOn4mv63n78..FmN.JzfGZhFqK1jT0reZVWR4Yr52avb2mJxKtwgh0RyqpH48tUK2n4MoLJJQNH
 SUuf0gOERmzKJ2fGBrZNWUDO.Emyc8uTPQuJ9tBYaSl27WsqRA_HYpe9epAITOJ2Ok1.MmfyyTny
 yb0U_FicjkR3XLSWex8_2Iphq4wNIVevdXAikIBaIqI5LgPL8_tvA3HVIFLvoUSjUQx3EIhZFL.N
 KaQf6OzH_n8ywBCBrEofxrJNkpAWR46UGIKo_pzHHGVKUwaKHrHdVjTCcyMXScQbJCCvYovOtsRt
 cFwXB4PlkgXQbfttemagHuOotZtunY_LQ3tsxJqsQLT05_Dn5hQ3cZ8bZtATFe7Kea4KGxQUg37c
 gP8BlAiw2DeXpaAmX
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 5590ff70-b934-4e4a-8f60-50d4c78bef49
Message-ID: <ca3df86a-2204-441a-1b75-406f166fdf2f@netscape.net>
Date: Fri, 18 Aug 2023 19:34:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Community Manager update - August 2023
To: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org,
 xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org
References: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21732 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 8/18/2023 6:55 AM, Kelly Choi wrote:
> Hi everyone! :) 
> 
> I hope you're all well. 
> 
> If we haven't met before, I'd like to introduce myself. I'm Kelly, the Community Manager for The Xen Project. My role is to support everyone and make sure the project is healthy and thriving. 
> 
> *The latest update below requires your attention:*
> *
> *
> 
>   * *We will be moving IRC channels fully to Matrix in September 2023. Once the channels have been created, further information will be shared. *
>   * *New Mission Statement, goals, and purpose is attached to this email and will be shared publicly.*
> 
> *Should anyone have any concerns or feedback, please let me know*
> 
> Many thanks,
> Kelly Choi
> 
> Open Source Community Manager, XenServer
> Cloud Software Group

This looks good, but I thought IBM rebranded Softlayer as IBM Cloud several years ago. Maybe IBM Softlayer should be changed to IBM Cloud? Thanks.

Chuck

