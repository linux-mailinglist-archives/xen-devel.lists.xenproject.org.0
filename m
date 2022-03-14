Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4154D85AD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 14:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290236.492181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTkO2-0003WG-Ck; Mon, 14 Mar 2022 13:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290236.492181; Mon, 14 Mar 2022 13:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTkO2-0003Te-9m; Mon, 14 Mar 2022 13:05:22 +0000
Received: by outflank-mailman (input) for mailman id 290236;
 Mon, 14 Mar 2022 13:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ga0j=TZ=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nTkO0-0003TY-P4
 for xen-devel@lists.xen.org; Mon, 14 Mar 2022 13:05:20 +0000
Received: from sonic312-23.consmr.mail.gq1.yahoo.com
 (sonic312-23.consmr.mail.gq1.yahoo.com [98.137.69.204])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649bcbea-a397-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 14:05:18 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Mon, 14 Mar 2022 13:05:16 +0000
Received: by kubenode500.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 2e193dbbba14615f6983e46b43673bb2; 
 Mon, 14 Mar 2022 13:05:11 +0000 (UTC)
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
X-Inumbo-ID: 649bcbea-a397-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647263116; bh=0t02d+58EaghGfC/9KD+R1B9d9MUI2zCPgUOGNTnFLY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=k8jeuIV1XOzWHaqLfMD2yn8hXAMgKNvbTjR5TZhFuMFLvRsZD9vipgiPlat6uzhwNxzvEOgPqQTeKLZ1s5CDHIx7zErDou1nK3PsqQ/Bqkpi+7JLaodCdhES0x7R6eWDUwv9MOdOP11jOp5zJS8iXWTZiPkZMKOKDNNSJarimUJW4xvZYL8aLqEQFWr8YOAFGLJXcxUFYf8cPWx0K0CnQS6sLcxQmXLDtszI/eyw8TChB+D7ElU8/wPSPFmhZyf2VjRO0f/QWN+ovyLtbRXEZ2sPKsxUPZ+U4mGbV6BalHsnbj/8du46CdpOKGhMwBX8Lc6cgdFPizRecQHzVuCwjw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647263116; bh=a3jlBYHu7A4kaOOjoCxaFZbOGq6wgAIk+UYiDUabWET=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=qlITPZxeYbc9bJ1/5WdYBnrNe6nJG/dfY/Ybppqmmy3d0V0scG0mDC29rab/090eZUn1ixKkmKmogjJbTp8MKNaonrAy4dVRLOaL368AZhAVrlYkF0MudToH6+gp/K+lY3vsCuUZvQ0a5V9sgilueDFSpyJEzbc+T0s/7JMqwb1ZO8NZnab7mR0jbZZI6XPTzN64dxAngvliU+Wdq60kMLcF8q+kisovaIhxAKc0ncjX33jc8BhJyBf4ZCiX6EEozUP7rFh6q0rL9CHv9ir837V33t21FZMtZsJS0+6JZxgw0wJyTunkXv03Zg7qv85PCyDJeIDLwwqglNLGOejMIA==
X-YMail-OSG: lZlEVRIVM1mFSyc7w1eeMBgR6JGVJfaNbiAAC4z9ePD4X.XhTCULLwrg2WJDF1a
 .FcB5jwwwcMywuA1kObcldGU4MlAGq2WHCcybaUmfencAH8Kk1mkC4E6QT6Xq2tJi9ErvYh6jNDl
 zCz2qTt27Vq3tFEFPKp0lrIKkWvRt14xf5pNqXLorYqqrp.kFU6vLTqOs7pvTUwDmz4xkOHVxqjV
 _Bm.2RF9iOh4DmIZCyipp3S1jq7bP6tuThPgCcK9zcOr0HP96D75BkKvS2d0ix_3DYVKo6t.P38d
 5XMkpqpCYu1vJg8KF4JKakyj1EIA8N9Lsffqe5ywvYR8X7.JKtQNK_.WMfqkhsjG1hOGEeRtJaNp
 ZxTVDfGr20veHS3ziaWTLg63e_4MyX42JDEp4NLA2T1q2a65LJg_dMeaAFkHU902qpbfvNPZzkH0
 dTRCdFX5TIcm8oONG.74EiNIizsxXLStzDABcZcQlp6tWGti3RBGumVtP7n2zZ1KtpHLdi2y0y49
 aL8SLWtCRULdVrcl_2Wq_lKnDZ7kqyYxRLqsgUXaXZRRQGfeu.s0I._MgQxDkm7lxtVmhNCv5Dsg
 XWPstmaF2HrO0mJJP7lC2jGV17qdbovrbbfpPb7SsRDF_fCL1SSG8BJKZqab.aOnisKlRkxgQ1UJ
 VzUUU9ndccXmbeAqufxZhc.J4MO_hnLPFk8KcfGZSEItDIo0Xi8ZtrnzeC4GtTjUiBLslHzmCSxW
 GtImaHgluXImdOZoMaSeeR7j9CHUr2CuaZ60J1UGx2EraaNpxMnz9ivmkLWFLQwFiymMwxh8sVYY
 8Os4o3s_cdARINklPDb6M5nYi9hrUCcIG7DnZcB3u8TrTcGHwAClkELp1nJFOjIrVpvnwQGzouYP
 n4MK.giaWNW59DWYDDMR.U7DuexbJ88HzBZFEolXdEEeIYKrtSAfF7vSY6gd9ifsN51i.rZzDlv1
 eh.7DO796m9W7LHoKVgNVttMEztBUcpA1_I4wxCacZwrUSN54sdpC_E3aaOClJfaHWuOQ_4XVjTj
 7qbaltDyBRpau2vjgdzQt4bJ8koglQRgLt9267VLIHS_t3DzreEAgimfhyDMPw1Oi2jwiLxWmN5J
 LMdUdyFbdQK7WUdDmztWKM8ZiFEC7zRkNcFz3_ZDpGqUfiXPgXm2ojaJWhaB3ZzT1d17vRBCgZn_
 6SrutesrTaaShI9TVpiWXXqFzWPzzdK0B4I7Tkbd1uNMtQzNK6Q5q3dUwqoomfoLDmC6rU_Vcd20
 fosqrbY6P3cpDfVx3CW1FwlNuTE4k8oyZbTQBslfY1ctAsFw4.egz5tibsBP7w3HaGHtZiOpu7CL
 5S9BEBO9TnDBjqM8RVLQNF0MDg_hLeUqd8rQ8XlrvZgiOfG5a6fsGxKkucyNzo8saLL9gvXHLQUZ
 wbVx95uxyoCJXFdHwRiTyFo8xi2o6Z5PnzIa84QKE5tmWOiYntS_5fjmvrJoj9uFMTqDLmOHubPo
 BOEbSv9s37mpB3dgZ6bjbHJGijbZU7og8cUkKPA6c9Fscfz_3BxoHgM26OR4JleqcwHuI4.PlT7O
 pSV1kOvCUDhfJFdc9stCbBEODPEDIaAQx3Udb3P4jHGXyeJZCDU0g01v_9oaWBwoqFr7nNL2TLz0
 zxaExBkiTUeWOZ5MISN9a35WJ5boV0kcY0sQIrEUmAlWpY4DqtzXSr.06QtbpXuiLZk1MqKcBd7t
 3hj6Gnh4ko8vT_lYv3RUWCJD6Yh.PVpmkY6gOadEgHcRvXqW3mFZk.A5RSzuJMw7JcVSx_CzXU5z
 Fh_w75jSOPOypQHpmgpNTF0QrCromYuVxAwAnNolSYBUwChxofFy2b35LrXdO1GYMOVEkilGpSmK
 iaogWqlJ00A9.dhf5MbWq8_zTEQExsCBS528W9Yganicf.xncFSlCFzVJihssbZY.biCRfmsFgJ_
 cJ.cKEN0V9bTNuwbiJIrOdPoxD.Wsp.A59Id9TEOrvkux_PZW.qmnxukmwMn1Voin8VLVsMxX5ob
 C.5CkwmNQq_I6.Bre5k7gOd2B68rXIpP479wLJ4n.A.iLFTn1PMJ2Dt2ai81qEW5ZSLReRmFTEhK
 kKY2EUvnS4HhfI5ae9JWNSu8NHXmqSv.utJhJrdU9XS1MW5eLBQmPSx7f11E38QG6IeDHI._t9FD
 xnMF1RmeJxXeoy4davF8ZTr_UwicEdVgLRJTxlE49XxPZQt9d4Qj8EqwPdVJtKzAwC9A_RiklXu.
 dBkbBgg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ebb36b59-45a4-eb51-7a36-2aeb3ce969c5@netscape.net>
Date: Mon, 14 Mar 2022 09:05:09 -0400
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
 <ed955608-9c62-3dc8-fbcc-df5b4d3c5e46@netscape.net>
 <e0a49022-097b-b9ae-eff9-eb2111e7acb9@netscape.net>
 <d3f31e6a-706e-cc24-1d9d-d78ace0cc705@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <d3f31e6a-706e-cc24-1d9d-d78ace0cc705@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol



On 3/14/22 3:26 AM, Jan Beulich wrote:
> On 11.03.2022 21:35, Chuck Zmudzinski wrote:
>> So my only question is:
>>
>> Is it proper to include header files from tools/firmware/hvmloader in
>> tools/libs/light/libxl_pci.c ?
> No, it certainly is not.
>
> Jan
>

That's a relief, because if if was proper, I wouldn't know
how to do it properly. Instead, I wrote a patch that defines
the macros I need in tools/libs/light/libxl_pci.c with the same
values they have in tools/firmware/hvmloader.

When you get a chance, can you take a look at it?
I cc'd the patch to you because of it's reference to hvmloader.

Chuck

