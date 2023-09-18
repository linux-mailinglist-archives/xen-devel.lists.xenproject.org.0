Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C67A531C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 21:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604212.941446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJvc-0002pl-UP; Mon, 18 Sep 2023 19:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604212.941446; Mon, 18 Sep 2023 19:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJvc-0002mo-R6; Mon, 18 Sep 2023 19:29:04 +0000
Received: by outflank-mailman (input) for mailman id 604212;
 Mon, 18 Sep 2023 19:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5AVA=FC=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qiJvb-0002me-L4
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 19:29:04 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c123919-5659-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 21:28:58 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Mon, 18 Sep 2023 19:28:55 +0000
Received: by hermes--production-ne1-6cbd549489-vgq2q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 37c3c06ffad938951c78619d23a59c3a; 
 Mon, 18 Sep 2023 19:28:50 +0000 (UTC)
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
X-Inumbo-ID: 9c123919-5659-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1695065335; bh=ZBSgQAZ92TmyZLCmaW8NNKPPhDYur2cUlrAqYuxTEKU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=IAGjqrl5Hx2p6K539MLT8GSakPiWRcOLduHUVLYW1qAOH3AiwoQrZmItooeWUdiiDdR+WZyoJ4juoFBtd9G6RhTutsLDtawgKGBeB0U97FQ1rFIu0gJhQyqdRk/vhdnfRhe0NOQHGuIpjoO7vH2sGyTAHLrp6eBCJ0UhdaZbDYexJ3hejbjsRt2JWGgUBPoMsQ3qpbo/9h7SOej22gxEMzyOzchvVSzLefLwaccDXB3HfBKV0/jq9LuGPJf2I0WLIu65c84+6+IphcZArHHL6Rxvsji6qUiQSI6J3gbFz9HS+whabcfPZ/q2BP5yMiuKKvZguCZvcSWM5X98lvGgpw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1695065335; bh=5vzRoq44MKYB4tNj9daDAhfNAIuZ/nuUC+Nx+hDpbbm=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=jN4YKt2xRQ1TzKZMcdzkCP+jkjn9QWzTkpGSTcEURizWwfVH2jxADS9jiTMO/RD6KNz8+CR+58n0cJydVs/ngQHd7Zl4O6ULc+TJ61dWkAuHpcapWnDCx0e9RiLWntJRDxLbkbajtrYtqD3OoQPPd4NOiSbk1e6lctE9plPQoQsGbVgMNZMSjfy4YbCakTD9cO7ny1M8EAy77dvI/X6ovsDYz5nhVGxUOUkon9yfr4hiO2AoNSNY0xn/iLOSXAL/qofSmTNkjXPpObKb39PkN6mYDjaj97Gdgv/YSzqviC98R4qUw+zQiVvbB1EhqyoYe6gm5dDRm4SWZLUzj8/51A==
X-YMail-OSG: tSnEX60VM1k7XeSbkU8xPF3ObHJKV6p8H7zz0pDB7VOTAAeZTUBbmme2QPv6_oo
 dysDTIGg8eWNStVZlF20MpnkU_OvzwPJgq2x4IEFfqqcxx5K1Qcw5p7QxctJrzeiq5i18DB7Bjqn
 MxsZ.vgHorlt0XhLFFVrCyOZyEPmRIqey81IA5_tiYhnshbly3iczbe71JNYzKYVoC6G9T6uipbf
 yYPAVCb3tNwvRulc1baj2uym5rPIt34CNRCIOwTBWwtbfLCTpU9vb6HRT5b5xFJiTEvQnsR5mkhU
 EN3pA996ik6E_8z5tUx3THm.dRJn9ttJfapgmqRaN0iyBEWRlOqPaTpIghSupGRGURRFw4zRqPFY
 8dFqT.apnLR9VZli75JV1Tu6UvBiHW_2LB2_rlp._z90a03yzDOTC63xRlkkAMqvkAUfic3feOfI
 k8OWFGUx6zzuErLoYD5zHAVsQCkY_VZKgm7IFPmw9cYedReP1EqCLSXuWQwPomxxIPCNp4MW37_.
 3YGgPEBbqtmiCnYElx9gsiys94jVJluQA3meqTX75Di_oOqpLePkAQieukyDYtltBE63SpXUKaVb
 8DA.6qX6dA6KxQII2YUP1YxzPU.AFsLrdBpPAy5yRgSX06GtJe3yICGecl7kEswwmrRNmVTx5Ik.
 OI9FlBfShqoHkBebmoaJgAQTncOG5p1wpfE40UQtEKw0XkofvrHBAN5VTDdDs32gqlplql2ofuSz
 REnP6nxfwPoWrL9._XLZMwC4E1leCs3mG_HY6NF3TXGovWIlhzSebeWAwQrCnHO1YNCBDmicMV0J
 8iZEVBvg9cjbRgY56488AGkVnvf.UljYvqAUVWa7cTkGDaGMUtDjm9kyhMX97EQpGzlpuzHjI.MZ
 NQzD6PPhjpRVKlIvfnGwC5UQrdDJyCPkSsBpwE4gohP1uacn_xdqYxgyptM6823FQj7hVKDyPwQC
 HzXkU9Q.AP9ctSQ_s0q2H1ZRliGUAv2GtTqCEJGpv1qGeuq.WNmuPZI.Lvc_k4s7mW7WGyMprLF7
 JPSQqoxMrf.o8Hb45Q8ssVYpbQD9YuydvZRdzHphtpOQLesTkkup7saxEpNpNSh8KhwhYXviQCvw
 GY_olVO0iRKIHnQVFxlRTwrz2k_6Wm0rIzqpqHyjwMhTgnB9GCuyqnDbeOy1B6thykXyMHBuIJKl
 ClooUG.ysGODbHSisTAsH2xidT23OJsg4xeFNMNtNEMqF0zNPKKuMUahFP5MXTXuEYDz4EpzrKR5
 dOp4OiagnxxcBmsBMUcJuZGIGTmiY0i3UxmiRftaccPrBRTPJEoT6I2OfokVFmS3Oe54_deGJefE
 4RWmMhbmpjd0_P_wAQzz_4hZmTkRghUff17Dj18aqUcB8I6i_uLJpkjEkVDjp.WhgGCDnN0ytSjn
 15bsjEja47IRou3F5BQEQH8ZiFhNvIoGKzz2nCfnIPKPpxuBenkPojiwcCE0xeyc0gRGWpYP4NEK
 7Yhmzf8TzdfLeCRxQzh7kzI8Bo63MrgqGiXimYAJXoXjG1SbSZCBPPyVj3FEYHZxwnFe_Km6eWtw
 zolCpySkGtJpMD6u8wgYUoQ95HChJBpHoZl2BxmTtlS7jWD3Q_mDCRK42R_XuRy0QmzNJzF7t0ZG
 Yy_fbhisjdiIZNHZqVwOJ5QIKEoixDxHCWcrQ4qCQXFJ.RMaSrIKwa52oiZsQKv15ZoxQZasIm4w
 DTcedCjkJZBTmV0f3h._3cmNE93yflk8k8mbL4nZgbWxQP4D7cwehSbKBKOOnolqopWSSrxfeIw2
 3uGqDledL_dd2ulC8DcrYHwgNyBqVuWSHDhkPCJVcX7hpr_P3_tr0RnmclUkxi2Eywyj7Fb3lqoc
 xflueDTRWbUPQ63Oa44_alQUyqMdn7kHjr3G8Z7Wg4f08ySBwQQxorBHf1PY2XIYzACMFXcRPJko
 KZVsoUuDcIDvjad9Xo2vWCGLCm173A0cUGHTebOjYESvCsGOeRJSR0ZSXWpDkJkasgGbZ.LuZn3o
 Xw9MJTl09LOKuQlySnIK6gxqAiSC63zT3TBfQIYKmJGFrp5Segy2Dfrvpwm28I8Fk219gDUkJDmf
 k9ih_lU2jBfOouvBxfk32nom8KXLGrkC1aPUgG1qU.wK2dIKIopYAN47nu5eSIMmleB6AfadTOEG
 wewP2XFKh1VIJoWVlYtuEchdP79QrzsmzvOVSLMWufh_fa2HnIDxGbDhe0b2vc5UgHZ3thrAUF4T
 3UnIpK4qbvvMlBuPy
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 4e57dd28-2cc4-4f72-8202-7c9886aae99e
Message-ID: <09079b5a-a0b3-4184-aef1-14764fa0ea41@netscape.net>
Date: Mon, 18 Sep 2023 15:28:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21797 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 9/18/2023 2:49 PM, Julien Grall wrote:
> (+Roger and moving to xen-devel)
> 
> Hi,
> 
> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>>> Hello,
>>>
>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>>
>>> [user@Malmalinux ~]$ sudo xl dmesg
>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>>> ...
>>>
>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>>
>>> Can increasing the buffer fix this? How would one do that?
>>>
>>> Thanks
>>>
>> 
>> I see the setting is the command line option conring_size:
>> 
>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
>> 
>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
> 
> Thanks for the report. This remind me the series [1] from Roger which 
> tries to increase the default size to 32K. @Roger, I am wondering if we 
> should revive it?
> 
> Cheers,
> 
> [1] 
> https://lore.kernel.org/xen-devel/20220630082330.82706-1-roger.pau@citrix.com/
> 

I just tested with 24k, and that is also big enough. So 32k would also be good. But the default of 16k appears to be too small for Xen 4.18 rc0 on my machine.

