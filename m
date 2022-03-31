Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38F4EDB4D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296989.505740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvQK-0002oP-Kj; Thu, 31 Mar 2022 14:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296989.505740; Thu, 31 Mar 2022 14:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvQK-0002lT-Gq; Thu, 31 Mar 2022 14:05:16 +0000
Received: by outflank-mailman (input) for mailman id 296989;
 Thu, 31 Mar 2022 14:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZvQI-0002lN-PT
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:05:14 +0000
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d2ec0c-b0fb-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 16:05:13 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 14:05:11 +0000
Received: by hermes--canary-production-bf1-665cdb9985-6hz22 (VZM Hermes SMTP
 Server) with ESMTPA ID 21c70eba28f79f7db0140419acc99ea1; 
 Thu, 31 Mar 2022 14:05:07 +0000 (UTC)
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
X-Inumbo-ID: 94d2ec0c-b0fb-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648735511; bh=4vFHWQeclk89GLLGWFTNTvUoEp1u+aqIieD9ED9z78U=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=q/fiaJ+4jdAC84frorA3lu1+tT6qGhtdzbLOyB0kgpmq3g+0QFlWwC4al1fFTth3IP2R/FYqgB1hn9n0jv1/YUZIvsBRtuOZ/0DdNw0CwvHKtYwBjX7mxxusoWOKHjA0mkz0hL8owN4aOyWBYsDeW3mfY8wKzAh1XwWQZR8gxz7mL+5t7Tm2hOociJoA23NdRwQCghLnHf+t59N7Na/rfpQTdQYQDVV8o7wdeGaP0v2R14K2Iy863cqWNxd/xWX5Op9RB8W7ITXMPTNG4/0vZBTlE0R7zyDr/BVhRw2S+dbBBHHbv5Oq9E1PIraky2XVxdSy5W9h3KhS+EX6phhzIQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648735511; bh=0bGbSa7PQmeZx6DTyapQTD3lQLlIqpOdWRv72RS143/=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=RMmJSLT3+gg6TaFaGNYctJg6wd2Q/r9mBKd8NEdGV9IDvt7YGKO2VdGFOs1/XudWrWsUZdGjvum11eCipJdarUKCiAqX/qD1DNoxSMVYZnd1nuSOIqzN8ssCYQQcBxwG76nXJta0VYSYHBfkjzer1NbEj37V4QJjBeUHHgsL+KAXPbuiLySqFF80BA3zNooFc38dvuTepjLAPHXc0nF3CamjQo03bsMX2dtP7g0IKlXID/G1SZ4Mkh8+nL9adgKDHalw14ZCZ2O2ik1Lt2DrlnO8RC565EHKzsKFoMVrTPLSuIYmJZmuK+mu2FJ2tEYXc/l7vJOtEtue9Kt6V1Jh7A==
X-YMail-OSG: XMKe63AVM1mBjKZrfORCJie8UVOSxTNl6L7f7YE5_Haj2mamouQT7Tl1m4KF.FH
 wWRzjQWmlHrMKSo8aBlVvDYVP7nwSS3QNItiTOYFacOOYnO.LbxP08a4Z7.bjPZvRKzXffSbqTG_
 gHoreUSpDA20yJ7iAz_nRXoJpQ3ATzNEVGLRjVbU._AuQNbZrOM9eKfOdEiLPFHMm6iXuSxGw0D7
 JD43mVwagx7UFrNkysSaI0K9tEE9YfBOVXnMLw.uqizpSAPXAGRzBX3jPKeWVg2i_A.eThv6fKO.
 defZ3PNTGIwuyGgzkYSAQ4TZ7WOqAT4Qhu5ZOKARpSFObqJO6_CqVYIpiFIzbyfJhi50Q7tA6dYf
 eyBrI4xfr4bM4DDipfBzzcPcALI4r.0bQV00XPg4gOAsGFdxbrsc4HH8557Q8HuIwVFd5ehqrNgf
 PyckkbVCeVs7ivxgP437.VzvCjbt.Y7dHmcKERVH5lfCfSsg12dj_o7fw4yvLzIxlnmPtf9pm0aa
 DEJ5f1qNqlzoY3hFd.mU0t4DrGTMaLTFDQSTUDBVOuUMPEuXTUcrINsExPv8k3KC1RCnASpkiP6h
 .0zrD19MBc_Nqee2Ur0m0_wRvdlBRbPHU6c1zo.3b60ES5N9W58vdNa0vyBs0HcE1MvnBCgh9PBW
 rtBeI5TSEGQnR9j28Ru8FsSOvUHy27aNazkOHCWDnRqZVbnuS_oJNO2pPUt_b_KCyi4NRm1q.XYQ
 ug8uJna2yMxDNpB5qxY9bsxCZJK9B5npPa64Zs0XbndIRLM5__1m2tg1EaVNuVJHcUL8QtJJhe1A
 Lt8tWeOxWb4xdvDNcO7GcToOZq.6ffUKDQzAoTleSZ2ceBJWGCQrYSyjlF5BSkuPfeBPBulwhhdE
 DEPAPjbf4sIJBGXLV0ZGZMd075mGmraPZyNlhKWydq3_ibF4LqVoagL6sfz9N5ci_6gAoKtMkR_t
 gfzAVUE3RjI2KMLPFi8AQ4ukTttALRXKIyYO7Z7yRjPpGbfprOOSxVHWAVCkvp7R0XLCsOwlFWSX
 rJ1WbU8Rprul7szwlBi62aA6IraaMzwn.3dg5236QFCc.BmZXzYs3hB.u5BjBgjJXOoP72w4FOFp
 ElvCt8QCWSkhLHqlHdJHKymkm0m4YVRYKUSImWo3xBs3JrcQ7h.Ysjjjt5wELr5aVPSB9QmA7bkJ
 RlC1z9nEeFALwjKD4lYnxb.NgTdeQpoajc3WFOMsl2fxYqKblGFEaLltPKFMXJfCMqrQJaMZC45X
 7SGDXs_DJ_UX4jWca3TYcruUHvZ6SgSwbznxHWvJ0SPwWArsFdsL7jKq.UO.qwM0C2Duokhgyj3p
 vnOwti8qpJK4Cvet_aGBddLZQn2BZFOH0L9apAfLjXIV0xK1ZMb3FR4HaEfE2TIn3pwA9L3uc9K4
 wMJojgravH_V3O5pU6JmEKCa9oAKDNG61uWpZF3vhMzYubw5PzVX6F7Xumb7DxNopdbsp.X4vIZw
 jLQ3vnsk68K9el0zRzc56qiuA.tL4okVXotdgjiB.YwJFre.vXnxaEdBr9tP8Kdbq3Kg2aO00lei
 JkFQeDhk7F9_6.eHo6cSAX_xUVtDY5be4cRGcG9oD3nmn5M5jMsk1x22AHuRd.XcYTo0HAOl6nRA
 E_UPV4dX.FlFjkA8GX.3A9cpo7iWHX3Lie.wc0nNUeDh9a6wJY8I9xohkaEWUkcAZaI.WsnVhlU6
 sBWpEONY6oGpCYuk5o1bWhve_EkdeBqJrJfUZE5qYCtB87yOEhDF0aWE9SNnvTZyC.mMc3mi07xx
 k4.MqquUkIbnmd1e8bMNeCWlTMGNRZe4OBQwTRYtfrOUj1nw3Xst9v4klVUy7_nPPJS8jaxwhnvb
 nXzq_J_eLq3pcMwQ_pefHzybP11.oddYTDImrb4jRyvkjhpghQzy_3dtUpMUHCmxI8NX4I2pkCwg
 M86ktv110CB0egcjW2pvTTim9zwqS19cYyXffNHfoY_BVT.ZdAp6i.hJO8vFqA.2G6050OKJgl75
 emAIm7yDkZdhCWwDhQp3d4gBQT.8nEseCVu07jpqBQqxum6jUkBlNoQ5Dya9f5M7o8vdFTjceqsf
 aujK5o39Nt9bz7DNierQaUPb1F9A8lvXQ8FZZz76.LKm9p_.H.r9_923OkEcifYUNn835cqX5YSv
 DtC5oJdtrtDI4Jyjc2iAAHDpf_o949xzHgDeZto_.sbfVrpOGi5PvuV5shYYX_qqiOF2Qc6eXKes
 Tb3ZoGu03OxZ7GeRRUzw-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
Date: Thu, 31 Mar 2022 10:05:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <amc96@srcf.net>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
 <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
 <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/31/2022 8:29 AM, Jason Andryuk wrote:
> On Wed, Mar 30, 2022 at 11:54 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>> On 3/30/22 1:27 PM, Andrew Cooper wrote:
>>>
>>> This has been discussed before, but noone's done anything about it.
>>> It's a massive layering violation for QEMU to issue
>>> xc_domain_iomem_permission()/etc hypercalls.
>>>
>>> It should be the toolstack, and only the toolstack, which makes
>>> permissions hypercalls, which in turn will fix a slew of "QEMU doesn't
>>> work when it doesn't have dom0 superpowers" bugs with stubdomains.
>> How much say does the Xen project have over the code
>> in Qemu under hw/xen? I would not be against having libxl
>> do the permissions hypercalls in this case instead of Qemu
>> doing it. My test with Qemu traditional and this patch proves
>> the permission can be granted by libxl instead of the device
>> model.
> Qubes patches libxl and QEMU, and they move the hypercalls to the
> toolstack.  They are using linux stubdoms, and I think it works for
> them.

That still doesn't answer my question - will the Qemu upstream
accept the patches that move the hypercalls to the toolstack? If
not, we have to live with what we have now, which is that the
hypercalls are done in Qemu.

Regards,

Chuck

