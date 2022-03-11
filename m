Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7B4D6987
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 21:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289240.490754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSlzl-0002uj-4V; Fri, 11 Mar 2022 20:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289240.490754; Fri, 11 Mar 2022 20:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSlzl-0002su-11; Fri, 11 Mar 2022 20:36:17 +0000
Received: by outflank-mailman (input) for mailman id 289240;
 Fri, 11 Mar 2022 20:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7gA=TW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nSlzi-0002so-EK
 for xen-devel@lists.xen.org; Fri, 11 Mar 2022 20:36:15 +0000
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd648cf1-a17a-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 21:36:03 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Mar 2022 20:36:00 +0000
Received: by kubenode526.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 237a08bd678e6c7a92e7645b27bc741e; 
 Fri, 11 Mar 2022 20:35:58 +0000 (UTC)
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
X-Inumbo-ID: dd648cf1-a17a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647030960; bh=83Qq5LTx2nwUKD6FV6iPsPmfwEwD8QTSrGJI3T917Z0=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=jaI4TmQ5aMJ4wplvNvxBgnJBr/R8pNxw/PhvLM5XmwwhSl43ZUTpygjC/U633EDG1bLGJt763Ruuie1YFaCJzc1UuseVsumP8w7iFLL6NLzMpN/Gm1ejYwmDa/N0eixpSB5Z/cDIGUEimrbpW3EmhQJXvDKQXRLSfRDRMCsWGbxj6euDpt9IdOaB+SV/n0tmo6v5ZqERTZTdW60XOhhzlmcs1tfc3zBRIjRLKXH/0BwhuEbvEAoYeYlfJzUryHNVtRDBpF9UQcXyrAGaafzw+KljTzmzQvSW0hxZw5FBW2EA/Jp381wq+7mHGrTiwSfdojfqPzzcU7s0GGgxhhApYA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647030960; bh=vqZ3YuXc2KukjaMzzzFQFT3YQBSz9+HWDAM4QpVqbF4=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=bibihrIWg041qrJ8bkCI5ZED4ZGsVttIyncNqV9LmOjfJ60cdvb3Df1hvDJ03tvQg9er6qU7kTrRItT0xJz6tK1RHiPNWBJ8xCifqX5MiRDR9+H5nQIk8yvRePYuWmqw8WhyJ4MywFSgCiOnJdxrJmGhD8Hmt6B+L3hCgALMNhI6IbHHSvrCw/4qPJ+I13IPmUz3d4CPtD/02r/lfv5PYqt1F5WQ0Ng4dNQII9nH2ge/TgxCKxzFgMKNijO2I5q3Vk2UAiqyP2/ViZYSv4x7gwbOESu8et6bMwVHKjCQnlix/9WLFZJFrMtFzjez2GtSfJ39FKDgKPcQNueV4nvmpQ==
X-YMail-OSG: XLjFt3kVM1nXy3RP7h.g2zVQPJEu7zjTdnjoxgWv4x6PrMthCtVrnavEnrIu_z2
 U.5hQuJAsO1trRCdldVmzf.HKkgg0amgoJPf_JL2hy4tdTofsojJ1TQS7alH.nOzCpqN2UOYDWDO
 uVpY38Lncm.EbyPAxn6FiOKqP_T8yAvIemXDujYKSYyycseynhty4n7s9OZNXH7U8RanUOg6N0W.
 2sHvVwWJoe8gLs7czGkiCNyal3wLcHHrk6H_8EVvWkuz57LSrOugv48cHyiCyE_OBjJqJYwG.G_f
 _eLhMDFy3ioQuus3s1POJKblbYpxdKpjDHSkTvJFr.IA3C6oHQtTsNVso3CBJItfA8OdnN8wRIhR
 .cWE9KCRX5Cbm1Y5Xl0x_.aVHjUcZ4j12U6QcuWvqDWQ5GKYQthTjaXGXYTIXAgZr85o8Mo8S0Ip
 .9uVeJsRTwdzB71H2qbMIAtbocPnjwSK4GuajBq8enQAeuGNW_Kn4kTdeg.GZAgchnQg1eQot4ol
 GBCUiTBioDWTTMPweXE2KO5Ksohu.FE1JgdAuI_H__3EA4w2vB.p2qwbXYE2RAlH9VW4Il4twfnY
 4n8gRzpFgjSoRTGDYWFGQ.YLazwEtc3ui5tyZ1_q1hsCBzxsQyGWJ03ERD672OlrBM723rFf1OSr
 4ccVEgVAgsNgTHfROVUBv2zsGMxdjQSbqW_KGiXJB1vEMKwRuMNaIxxeiR_9IWCjBgawNH8FtrJF
 A4q2fyGf5UNXPt73YIYDs.qA5WaHyMvCGrB0_34HEI2DK5mQVs0qMU4VBhQzq_57ds8mGL_wUo2l
 kpe9uABQLnUf9gkxSgCHtQV6Kjn5s4tJEMvS5Nyp7Mc9DWmTAgZWifa7SAO1RyySwQf2L2qGgEDZ
 tFq1qKY8pjuGe9KVtKaoHwZ9v7urcI_AKdrrVmm1JZgccs4vpX33C_ojw8_ifmgco9mN4mya22N2
 sRVYYuLDohXNc29iDhsdU.AyM3z63hPUMSrOu2DpN6UIOttwvP1fuV_mF5VBIsTYQs.AlTKoLE8z
 x1or50XYLM9b0otJEjsI.T7rtlCFow2WlCCBza79yNxIKJCkYQmeYIQCdsDhnISZ9wiI8v1NwnBP
 p4oVH9qjLY2AB1P0iV0f9Rx8ueTM7gTtfPYQstKa6hf1S1BZJVa23z2.stL7OlgCwJ4Vmf4EUclj
 _CLcPLl3N4fJpIqsnBzLp2_tLtU7vTpjxnEGHgB81kbuVqgLny75NKbRT4IQiFowPgR1B3p2LfgD
 2Ds3T.mEaZeYmoIIEy2qrAkgprYa8k71VvZP4e1ivLlxv5Wlzxlyoc0yr43gEe0pf_vt0o9dctqc
 wVYiN2KIF4B3E47ctBn6rDbQjf0K0ev9TEBBIDigpFG84sjsc9FZJ_OwGubR5bWdtZ3ofFArWHLM
 dU9yRzJLJtRTRmpdZgOcLSq4wS0A5iy5smaaBAP_ILrFczxyDpwoFBNCRJubtxfJ7XETcgSPpEvF
 xPH4_5nqbzIVzE3hWEefXvKADUzpbT4NIlCLPnPgsxCPQFKiNMFTAzM.XtEEi.SOKIuZKIScnDLU
 UgjBVlbf4_3Q4kaSwnEr2LXngyCDdxbx1CZ7ReSgEfjg_Pf70LjsHnEADjj_9kyPr.GtGN4H3Dfq
 LDRE3VdVbuaosD3Zy5CDnXY1qg6fT.vSJXvxOJrGGKVNE3mc0NSWUyrTK4YpwGMNJk7lnWpVJwvZ
 WGZ6Bwi_Db7j96AeKCorhCixnR0SkySMbMi8yuS2qwEzFKZ4RUFitDEh06JjiMzaS56WGpgZJ0g0
 07FamhKFeG0Wf2sgPVd.kp_MwLud7pJRADLrWj2bME8GHxqOnh_1cyS_BLzCQWkC2cKhkMkXpUyD
 CvkgJOMojT8jZP8A18elgkPqdpB7wyNwJSz1WjtP0JrnMUR1CaiYQFlOU4yFQAhIurfeXDrtEV4g
 DN0yMggTS9hzULXtVcNNbUZH2kbqmdqgaQ_kJ2AHV.wIcpMRgIycVK7J2jq4lO.dDR828YH3Dy6C
 A2UEVU2u1yCabl72f_Uf5DcVRjpV4gPJ.Yj__xJ3b0GF0XggPIaqImkqAarv8ITpY3Q42YcLnXx8
 2kOOiuqe_uvsUSMcV0ehnQnLxpj9Jfnz3n4WWoiTphbKNMhLMsa_euo.X58cABLpa1V82..ihTKs
 dCQRORTjRDgn3tlniu5HOUJeapz8IC3mVGE16eotMHDVLSRalEmvGtAbrcKakREbxGZp7DFRq83s
 T2.HxtLREdmAOMB8TvINLIx456WRz3SKrSTJGKnem2eCWWvhymkt91.CrBsUBhky4yS02dFV0wz3
 .gCHcTN6r4wxQ2DAVww7Pzr6RVKYNJam9ZOgAJBoUtlRHcemWCqH3hv1LpeG9Zfn7wY3tALaBy6u
 uzUBl_MT7dhhVkcZOf4YzNqAxPcdFqIjbeEnnCTPlaFQLdZrYkLl4dVunI.8i_Qk-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <e0a49022-097b-b9ae-eff9-eb2111e7acb9@netscape.net>
Date: Fri, 11 Mar 2022 15:35:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
 <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
 <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
 <ed955608-9c62-3dc8-fbcc-df5b4d3c5e46@netscape.net>
In-Reply-To: <ed955608-9c62-3dc8-fbcc-df5b4d3c5e46@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/11/22 8:47 AM, Chuck Zmudzinski wrote:
 > On 3/11/2022 3:09 AM, Jan Beulich wrote:
 >>
 >> Thanks for this analysis. It looks quite plausible (but the question
 >> of 2 vs 3 pages of course needs resolving).
 >>
 >>
 >>
 >
 > After resolving the question of two vs. three pages, I will follow
 > the process for submitting a patch against the latest staging.
 >
 > Qubes OS has a patch that uses three pages, and the
 > igd.c pci file in Qemu's hw/vfio directory also specifies
 > three pages, but if two is enough, that seems to be safer.
 > I haven't checked yet to see if there is an official specification
 > from Intel. I will start by looking in the Linux kernel i915
 > driver code which might give a clue.

It looks like both in Xen and Qemu, it is agreed we need 3 pages

In Xen, we have:

From: Keir Fraser <keir@xen.org>
Date: Thu, 10 Jan 2013 17:26:24 +0000 (+0000)
Subject: hvmloader: Allocate 3 pages for Intel GPU OpRegion passthrough.
X-Git-Tag: 4.3.0-rc1~546
X-Git-Url:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff_plain;h=408a9e56343b006c9e58a334f0b97dd2deedf9ac

hvmloader: Allocate 3 pages for Intel GPU OpRegion passthrough.

The 8kB region may not be page aligned, hence requiring 3 pages to
be mapped through.

Signed-off-by: Keir Fraser <keir@xen.org>

Also Qemu upstream defines it as 3 pages:

https://xenbits.xen.org/gitweb/?p=qemu-xen.git;a=blob;f=hw/xen/xen_pt_graphics.c;h=a3bc7e39214b3d71c32c8386758fdef6ced5c0df;hb=a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42#l242

In Keir's commit, the OpRegion size was increased from 2 to
3 pages, so I think it is correct to use 3 pages in a proposed
patch.

In tools/firmware/hvmloader, there are header files that have
macros setting the address and size of the Intel IGD opregion.

So my only question is:

Is it proper to include header files from tools/firmware/hvmloader in
tools/libs/light/libxl_pci.c ?

Chuck

