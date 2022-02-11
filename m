Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E854B1DFC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 06:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270146.464347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIOmn-0004yu-O8; Fri, 11 Feb 2022 05:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270146.464347; Fri, 11 Feb 2022 05:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIOmn-0004wo-L9; Fri, 11 Feb 2022 05:48:01 +0000
Received: by outflank-mailman (input) for mailman id 270146;
 Fri, 11 Feb 2022 05:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r224=S2=yahoo.com=akm2tosher@srs-se1.protection.inumbo.net>)
 id 1nIOmm-0004wi-3S
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 05:48:00 +0000
Received: from sonic301-57.consmr.mail.ne1.yahoo.com
 (sonic301-57.consmr.mail.ne1.yahoo.com [66.163.184.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e8efed-8afe-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 06:47:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Fri, 11 Feb 2022 05:47:56 +0000
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
X-Inumbo-ID: 29e8efed-8afe-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644558476; bh=NJUsUfy1KsoFeXHdLDpt06Pj9Ne6C/vdf87oFv7YGys=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=gOP2E5nqruk3uVj2VwEtnJt3KygDm/SJgt1ZiwAUMTrDT/4r1Ar9qIuTy5fum6elW9amPycYKfT58V6Zax0jIA14cag4Gv8+udDU2U0760sZnNFRHuw7tmCH141kjtWMReuZ/EBDw2SWB98NP62BUxBemfr8rlw/EGEyeRJ8WuxuFZrDpWaEqg3csi/qFJ3GzMnTwGJGCqsdeIKm+HDe+j5UZdlLW6dSRRnb00qSMI7jjpRTvPHMKGDfgmdpB1Zy40Mr/Pyr/J37xxgKFCyWA0XmBl8NreqMJ12oOoPQBwVBS7neg/5LZ2zGfmuYnvC3Fzy7yzUl0T/940ue7gkRGg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644558476; bh=DKo1hy9Kzmup31vQEJ8THfXnIQUNSLLt07GgSVPRMxO=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=HR+t9pgFCzrY/VaAJALzNzBPIA8VTSp43MHLTdyA9+BzWCEQxwIe+GWNctIXUPt9/AlGzu9A62ts+4pXKsjjy3I6SgbZDNoybdNy9UOW2qgxZOTj52Y8qrVY7B3WcvVUaiOsFQAmVkpOwNVvgbyhbyK1VqtYa0BdEqZ00oNAZry0HgS0H0saOGY1BuluCpZoP/ng/Rs4WVdT9Z8vTlv87ANFPbvOVRhEV3dBWlXajlrUI3YgAUue8QOIYdE+b+YGM2Ke7YRdd+piN/xnfcFJhCi4daALomb/yndZBMj0ICH7BSDii6tFp4CvbGdAMCBG0hrkG4IHAXJqKkdlVuwQBg==
X-YMail-OSG: XZwBRokVM1mz1CW9dEJH5.UZsx2gipk3lw9Nd_KfBiexxJk9NN7GtUsdIgeblS3
 LKgTTQISh7RKFmM20y.cddZUtSCgTS0MopU7IizU_WuyfeKN2xELwXnvI7ubcNKMvUGdy1yWbhtp
 NoPfxLrNFJayvXPYAGDNQXz95zkDcrIYyMbD8fsFGaBSHeLsifC30kO4c5qrDL9Jk5z9A8UxKqNM
 FcZbFGmuXvsGmjU.q1NtPWPWhrqVGUwOpWWqt3I.x30TEZJzBVjkvPo95Ac61faCqDGqRtaE9CFe
 Tl0_px5SHhdamH4pPOoxpR2Op_SwIg5t_CIUYi5EkGTDTxAaAX8Iz6DQF1heWeKjfAVXBqOBsrvN
 I8W4Z5hrteUwQLX1C3j9F44dGW44aCsKblKAPW9QLMeZkdad1g11_3IFWDHLCbgwDAaq2BWH2rO_
 YGvkn0LFTKkxhbEFdgG9981rg_eB91TQr4u27rf.hpM5SH86vEJe7XPWrVgEtkxTWW3r7.b9oW6Y
 Zz8Ema.Uz_rMV8aCl7O0CEL15WXm6OPgWST2JjXIEIKJOQdoQf3x6dZRVP1rfjnOfWoGhNcOkJwD
 iWBfPON9UD1BWohbMCuCXHP052Kdhf4_p.gXSLlRHXjfpdkeDIfi1nxtM4whqYDIHVWLBmL9SjKu
 2eJyy.afrzlheUE2yBs7PSPq_o5goF3QbaSx5beiurpG59gEGYnd1LTC22ch32SAjJ0Gb3kOrDaH
 sDTMuAy2cZ6gbp5CSNACn0vPHi6BOyV5LbOKrFtZ1qxXebq40Jx15LA.Dmi.8uN4Ur5DFfWW.YZO
 B0gn9MUJaDcO4L.N5g98YGUXfZ.Z9nEufFNbG0N0eODSL2HE3wo8wJ_nixTzLYWh66najArnm7DG
 WH323maAJXk2wR10STP960FmOcMiFIQnl99pabtYDpFcVyCq1khKP2bUnXG4RqjaII_7MKlVrNdv
 PQRbK_wkeIYHCB6VLdWDROhf0258BWbaJUvuAnm5MamqkSbI.d6cQqmh3Mh4IAYcdevbTj3Ghyeh
 rTfQSYtwR2LKHZo1WJ8PewbVIOCSZA5fBxtDeqMm3qXKfFKnu.gaAMbpyyv7brR9L7olDIt19Fg2
 MMWJFMTuwobd3QoOniknxkvKLcR7v9QFQ_VUk8aq.5a1rCtdPJZW0OBntNkRHblDcaksRuEXEhFo
 ZE09Pz4Iv_lMx_aZzNR68sdcJpASZT_Bg4RXDq8XPgL7ywS4nj0sSP0bLhMpWedMjQd.sClcYlK0
 RrwMOY7QNBICmZLMr9yDIen9VBHjsu_CnXrWLXRVXvIvDYQV8q1PVWOByhn6jxmHDxmQQbGQKPxv
 GHuvgE8IKCVAzRyLW.tOm90R52DenGctJvnR1FmgRuIYWRnOVUT21sY0HHxhFqRIKdnMEJS9.l3x
 6snsuEH7yfOwQCT4e6HzShrANmQGpn3_eBXxTaJmAkUu8Yeb_6dmgE.tK_eDzPeodjj_3Z3WJH1M
 6IlM7k9GA2.i3ZTzldxNUr3ELHAuoqV8PYeO7clC.Ju_6eKuOJVwmu14HqK6lf0GlH.sQBdxkmHh
 ZAYUP.0ivpJb1XaQZfwjp9zK6aCzd63jU.vyjOhlDhylFWt_i91.sOlicfNJcKkdhL3j_MTdknm8
 LbQjUES6nPWy1SzdQR74Sn28VFBVuIhvhiIyeIdkWp2k1swe1kpcCYGfUC4SNHHNqvFZuS3FiPRi
 Jq7SD6d7GBR5n92X_JbuXHwI.UwtpQiuvvC1U6yZA6wvmHkuqv1x.Eb9UCHOyGE0OOu0uVDgs5Ng
 1YqpeUu1A29UXbNbJSp_Bc_bTSzREULPUckUlqz1pGTbNkfU4E07Pd_uAODCcP2qoTjeCfR8Kq1F
 Vv5mZGbXeDGPJUAyp7ms54gdu9Hxz7wkCyy47vmwcH1WEMnWiAsGg.1TK6qQgL02c4NEwQOKXTc9
 8KbJC.Nm06UAobbQSEPoMjKhoSOfBIAJ0uenQwrbK_4RmVyC9UH_Au8X0PITHeo7FGCiTn54UuTY
 ICYE5yu7Ai_0m3gCgo5g_sT4B2.MSiXs.1hqiEfSOJO4g_zDCzGWJjAelUiDH073TJI9t8eTURgg
 3G7TbZkYM68Ctq9I6kgvNVc2FTYav5hhVJVv7VjPTK.8y0EQ1umPdN3b17PimGr7Eu2nHSAhgcV7
 USEmhsivHFbrbt83hNHDYO1T9enZwybRvl3DuHeDi3mZxUS8ELWfAnb4AA1EnIuDymVzeXosDRpf
 kNDoero_x6hp_9LrTioRmaX33gok7vjyrQYvPVa0HYQeg
X-Sonic-MF: <akm2tosher@yahoo.com>
Date: Fri, 11 Feb 2022 05:45:55 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>, 
	Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"roger.pau@citrix.com" <roger.pau@citrix.com>, 
	"xadimgnik@gmail.com" <xadimgnik@gmail.com>, 
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <181735623.1079390.1644558355560@mail.yahoo.com>
In-Reply-To: <8706c283-80c0-5fea-2834-1bf574e75470@xen.org>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com> <709142925.628001.1644127197288@mail.yahoo.com> <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com> <303292590.682317.1644477758255@mail.yahoo.com> <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com> <8706c283-80c0-5fea-2834-1bf574e75470@xen.org>
Subject: Re: PCI passthrough support for PVH mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19724 YMailNorrin

Hi Julien,

Thanks for the clarification!

Regrads,
Mehrab






On Thursday, February 10, 2022, 06:12:53 PM EST, Julien Grall <julien@xen.org> wrote: 





Hi Bertrand,

On 10/02/2022 08:32, Bertrand Marquis wrote:
>> On 10 Feb 2022, at 07:22, tosher 1 <akm2tosher@yahoo.com> wrote:
>>
>> Hi Jan,
>>
>> Thanks for letting me know this status.
>>
>> I am wondering if PCI passthrough is at least available in Arm for other virtualization modes like PV, HVM, or PVHVM. For example, is it possible for someone to attach a PCI device to a guest domain on an Arm machine and use that domain as a driver domain, like we can do with the Xen on x86?
> 
> On arm there is only one virtualization mode which is equivalent to x86 HVM.


I would like to correct this. Arm guests are more equivalent to x86 PVH 
than HVM. For more details, see:

https://wiki.xenproject.org/wiki/Understanding_the_Virtualization_Spectrum#PVH:

This is also why we need a brand new solution for PCI passthrough rather 
than piggying back on what was done on HVM in QEMU :).

Cheers,

-- 
Julien Grall


