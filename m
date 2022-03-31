Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E54EE211
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 21:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297078.505929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0ir-0007wx-GP; Thu, 31 Mar 2022 19:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297078.505929; Thu, 31 Mar 2022 19:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0ir-0007ty-Cs; Thu, 31 Mar 2022 19:44:45 +0000
Received: by outflank-mailman (input) for mailman id 297078;
 Thu, 31 Mar 2022 19:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1na0io-0007tr-KD
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 19:44:43 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff712409-b12a-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 21:44:39 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 19:44:36 +0000
Received: by hermes--canary-production-bf1-665cdb9985-85ftg (VZM Hermes SMTP
 Server) with ESMTPA ID 23977df615c49108147ef4bb85ec5bd8; 
 Thu, 31 Mar 2022 19:44:35 +0000 (UTC)
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
X-Inumbo-ID: ff712409-b12a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648755876; bh=rBDEYSNt8gUJ6y51oo238Cpzui22UUlruN7iTW0yM2c=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=UmTCVpzU2tlYbNg1mXOf/p0t70suoTU3rwnKAohazb+M8uKm/HGcC3yySlIkXiM1ajZa/Vk9Rvzr3/iEbxL3k/VmRTV6zRtKW3xy+8pYxoypz8BlYF+x5tTENox6+s2NrdMmT7SPD7ELPckJRaHe7xtV7ib7X46NVgzUpWjBTFwsQpQeVYsFz60/yo2kDltl7qKny7Luc/kQmYRSul5T3EnxRncB3FWANsbGLJLXSBSIe03wjJr+25aG1nBYz5tmz3qMYfh7jHx1dk3pil/lY3Se5r3WhYW+QexlfByDvD3UMQfA3c+5uBaijjQWiiHpbKtQVmnTy+j2XvLs4XpT/Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648755876; bh=vlwBOuNlTY6gR8PB4AbZr5pBHU54vjTI4tlpdPFE/wC=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=M7z465mdt/Ern75FgWXJ9KkLgw3R35RGvt/P0vjaWTWISLtWCQ+ddUz6fJpPjymD0Sqf+5fnCj04cEzc5jioIVNrAGDz0G6UGPSFQUNGRIzCXSrP2Cda+7jXWGXSRIclnhmtYPBfrd8GAB91toqyOpyU7LojFRRgzHCaDJRAMV2G8c3g+dz331MXZGxTzYuU0X4LVb+6eLffZKhWd1mFhvkmDuTrOKWlkbyBfvJBmhCXyJo5zmgIGbYMp2Ms7SnkIs2wjUoSckfAsdF8dMEIrl3GDVWDF7AGnknZyxH2lgsHyf8fGzhaoQok2C6skK08wwj6T2XfmAswmcWHIsLwOQ==
X-YMail-OSG: 4hiE6T4VM1kuWrRRl.PXKuNv50.e8dvQQbyfHqKO5bl69Z4yRpjbFNdGKLATjwM
 SFjvQI3.iz2PcCyGbHZWf5bZAKh8P4qaDWw3xgfyXT26b4KAe2j0tqs6xgwx.9FuvGA2yaBa5TVc
 v1y5cvxeCvTkNZXaOzZNMU_PBSYncAXB3rtUrbvzNzI6b.oXA_vsPHRiD176.fi2Rc84Uh4U0gSv
 KzqtdWc_ssIiUO5nFNqKWQpRrWieuzJY.gQM9K9Ad6KTM09CuHutNTYrokH_FziNoIr_SPxelJQX
 YwhMh_Fn3pB2Rt6xyyNhcID_IyhWJpJdp2mDI0WcvquBm43deavXJVbUshFtw5jAj29XZo.AgUIi
 lcs__g3CZ_SlHyANXhdJH.BsYI2HSvM3uHTIdd40hkBArRfxrpbc9IZVitlf94ZL0x.HosPEDLFA
 ps.TFaBlQijxSsco.TNejoasBGrUO9RT803sWDh9HhN7rEOYUp8Eej._dNPV0s4xELB8iTVkd3oQ
 13XnotpxzaK3iibFN0ISrsdRovrwp.GlSxPJ7zfQP8LeDltJ_2Eday_rKwbfpzdnvrxiwkXXeTlX
 1b2kkc.hfJVd4XONS6HUB3NCfE_l7iLEKG.YbveNQGJIYTcU7JouylIsx8dXTnubHgfwQw_jVm3K
 7BuCu2iYfJfbipmyp.9FjL50v6wjX1pp7VuDAuwBD6uEgef20Y9nXEdnAG8ACHvVmptKRqbmztka
 jmzmQfOu58ovrHcxFXjYv.MfgTKuWRCYIrGZmGWwrLDOsDGu1sRKzulMe55iqjkpwN8wWL1Vtm7F
 hDll4FvOYRDj8O_b8z1Wuaa2nftBh59S76ioJamOI8YgS.6kSRXnDmvk87LGkiJLXzSr.SdgO0r1
 vMGwxiRplMC7N.UMq8U8uvhB2w.n4lEoxq3hQZmh2zLQkvs0R7JvLrSDmKTLfrOwMy8jqJTKyLuc
 ouPbEd7nKoy6J5U.j89UfwnfwQoNS6v6x6ju2ZBgnOUXr4YFqePHfdbkR5Z0CP0ydcupFr9lP6Qg
 wT.WG744rrbhKQAaFBXB7r1UyDrJ8hgN8E7IbLOqeQhVZu4nlNGoYUTydPl0Hk8uxwqCdCOeFpPn
 1FjcagD9cRqJynY2gAv8k37UVcjenREQ81_r253U9KOOzRXJ1RkYtA9wPCc.u7vSIoteqezG9jDS
 1fkbey98NCfm4t0_Qj1.y0qhJVDq30s1J3WdtYcZPq4hNdcsgJBm9Mq1fGpRxHyfE4inPEIMpYwk
 XKpVlml4fpl7LRolQlagW3CnC9MZWRHhZ45pxe3g8dN5smU2Ed1287jDiYBedtxnf5oBa1YkO10K
 NguYM5Rt3Pf.suycGcGyxoISxxlIswXQl_SJYs7YGkBDz6TbJXhaFdlN4P6cLb8p7S9dKmsr7r_l
 hkgeyGWS0R886Io2Nmzx3en_Zf9sQhnuMcp91XQtJ04p5ujLp.JS3..kgsUShuoQ9vP6NDQQFEfd
 2_tYCM.IIPBOrWq0rJSTH_EOhx7RjHVzFMaj.cifjRJ8tFQPJ_YtZ6b1pwAEgYLdAxmNCqBqzOz0
 yK5AgXCmTxaQUlNgB1gwBsWLiW22rOUquVv5yIOgfZHUoeESLSI4Id31RraVKIWYMGK3Kpo_Ew_p
 eJLF8o8jaKYHqyUeJN_c_DsG1gbZPI_MpOflRURHKnHdiO7T88d9L4EUX19i783f8WsqAUpDPlXk
 VD2nZmtpSLBshg4xWh5.cbQ4NShq3dHIelQyI.oj88JnJehVo.3hMWpwp8xUN3ZvaXE3wKvRsjMg
 TjrhphBY1sY7q_A1z1AOcpOb9jBYbuDK9W8z3N4PmxOrMml8DrtOLqNziBzVolweQT_XORMfOMN8
 ntkk5eMbA05YGTEQuCLOGGd2c5cppkdRuSzU.lsJ.ssvIRldJLgLCsvHll7oDkCTLNPSC0KXn3.u
 DeiLogBMBVca7ZtLUAhDuUkddrh_1npDxEpWs2vjci8gCIJTmOctDcBhIFZrd8d4OdqJOrlxrBhT
 dkhd0GoOnMQKo.QugoNKKDGcC191K64VMPq0gLjMNfFYKAlslSoWJODGcc3Xe6h5KFQ_iFFRkuzK
 B25IV0N4LNNQoGCHmSn_5niILWoHZQ5v0N9uDo60_7AqrZQnQzaW5El3tDzfGiw9hQr27EqwoU7_
 3dj0ZV7fn3rkMANz_32yZK0r2uB5VC5BG7KylOKfYqiP8K6gmrDZUCpvx.TCAqCW.cszTPErKJGM
 WNzH6iJMyFfpaKPvx9VE-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ea5c1606-04d3-c847-643e-d242d8f6ba06@netscape.net>
Date: Thu, 31 Mar 2022 15:44:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
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
 <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
 <CAKf6xptZ9g79MphwYPAGq6ATBtCrW+pCd5+NYJPdFniW+tFzPg@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xptZ9g79MphwYPAGq6ATBtCrW+pCd5+NYJPdFniW+tFzPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/31/22 10:19 AM, Jason Andryuk wrote:
> On Thu, Mar 31, 2022 at 10:05 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>>
>> That still doesn't answer my question - will the Qemu upstream
>> accept the patches that move the hypercalls to the toolstack? If
>> not, we have to live with what we have now, which is that the
>> hypercalls are done in Qemu.
> Xen-associated people maintain hw/xen code in QEMU, so yes it could be accepted.
>
> Maybe it would need to be backwards compatible to have libxl check the
> QEMU version to decide who makes the hypercall?  Unless it is broken
> today, in which case just make it work.
>
> Regards,
> Jason

I know of another reason to check the Qemu upstream version,
and that is dealing with deprecated / removed device model
options that xl.cfg still uses. I looked at that a few years ago
with regard to the deprecated 'usbdevice tablet' Qemu option,
but I did not see anything in libxl to distinguish Qemu versions
except for upstream vs. traditional. AFAICT, detecting traditional
vs. upstream Qemu depends solely on the device_model_version
xl.cfg setting. So it might be useful for libxl to add the capability
to detect the upstream Qemu version or at least create an xl.cfg
setting to inform libxl about the Qemu version.

Regards,

Chuck


