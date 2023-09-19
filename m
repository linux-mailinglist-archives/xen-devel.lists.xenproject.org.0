Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD17A6895
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 18:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604930.942488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidGY-00028j-FP; Tue, 19 Sep 2023 16:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604930.942488; Tue, 19 Sep 2023 16:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidGY-00026T-Bf; Tue, 19 Sep 2023 16:07:58 +0000
Received: by outflank-mailman (input) for mailman id 604930;
 Tue, 19 Sep 2023 16:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G4hl=FD=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qidGW-00024y-RI
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 16:07:57 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02868b4-5706-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 18:07:55 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Tue, 19 Sep 2023 16:07:52 +0000
Received: by hermes--production-bf1-678f64c47b-bjrhv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 344e1be807ae29426be548fd5113e1d2; 
 Tue, 19 Sep 2023 16:07:47 +0000 (UTC)
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
X-Inumbo-ID: b02868b4-5706-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1695139672; bh=wWrVFE7k6bF//p7lQmk9q8x+ld+1v3EgcPkuyMuy/xE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=PUehx6qKi6xOXbJtwJSHcPAMVMHMX635CMzReTu4kZE6yWYtd/b9nU46i0Q1O70XcJqfSu1LKG6Uajx/QowUrFRGwCvsqL5X9QCbwWF4stentBFf/IewzfIA0I03BqSkwIu0NRJjUKus+Ja66XrvAn6FaGp6jDALGBUcIj6SRAgy9aSi5c3XQ5m3MgXp9N13PzTDBug1QaQhG3uBDSYOVbcgbz4TjpnRpH2iDaxs9c0eqGydsWulOLu6Uvjh7QNOHPTMDAsXm/Pr2WwtQcbUxLcrBL7v9/efR2CY57tQVsXOM49Omx1/ll7ff5aR/+XGsavZdnuUgrzAIZSKb9ZnMA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1695139672; bh=dXNbg+FBsVkV0/VdBZLGhhiowQx4qYOmHdJeY/WndMZ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=f7jO5qV9nY4m9LJBi+0Ot5zYdzGXmJdJ3QI9RNVTMYoZEM99HYrdkT+v/b3FazZp6SNr22Bzbr2kmDuB5T9O6wJWNKi3XvNLbFla9QTT+Lu/hhBnGLg7umlxAGlkDMkUFJMk+FT8xN8PZfsE1djTPqqMvnd16/YDlr9yjBrC7eZreXnN6J9uhCS7wNSmJtA2nbRCTHk/aZzqghkkex6Ny+sza2piRk6PkWIbDM+tHxfLE0tlp3NXasX5EH+HyRLk1cT3neie4aOlyYTFkFssgGnSmNAFU1lGg+BLHPK6s9v/Ok1yxBgS3VHq4MqlX19P0ydjYBeVs+UWYuTq1oXKUA==
X-YMail-OSG: AolAysYVM1kWIsuCob8L3ckwVw_mPpdajlkWHE0Fq1bYBkrZvKeRWnCY_xr.W3m
 nt.taGDbu2CLZyTuBxOpVoaagzwjASRp8a2OvdsAkBl1IyWZAUAhV3aDKm3iBNpGl1_V0VRsC.Dm
 jesXk5G6xK8LliTBVh7nFuMETG9V3WVCDMPuwCxDsuk.KnSE9BW0YEawg08DY.gz4hr0rc1K.3hV
 rRPVmVknWTSNCJJxJvP6H6cmRUwR3uRkQKtS.h7vPv0qjerP_BFjd4Cs8QGNgeXH5ncqRZidv6lV
 tisYfbNSI6ZhQAVslkqHYACSRNYbRSSqkyS.jY1roSfcQdvHKMVJqlgJHwFJokfUA44n86vXkYV7
 PhOg3cG4JKdHiptomBC8ROmSzBt4cTAT99yX1s6NvaCePVGDjmqyZyf_H7LF63acb.iZmYs4dQWR
 wuRc.kKzL2zOIeSA5TGFjd.xblWj4RvjXaHRGdREyqvKmonklzVp_m3aeguEFC6X225j0uSmHjvd
 67cxDozrdMy1zL9nU5qcOhLjtnkDwGdcDbXoRoMko4fHhIom9bpUyIV0i9AVBkWqvc_v4O3v.yQH
 UQd497BgBMc82JECXvxxoF0ZrM8_nzepecNaAMGEOntiH5DzPM6ZXNQVrTyT5t7vAu.Etd.B5HdK
 8ukdW4H.9YA15Febm8o1b6f9y0uuFz6LRfJ8vsZt70PwXbb4XzFN8l2itet8.ChkMdZAlftN7VX1
 NLWPhj88TYnKYfIQ7RrSl_P1BKu29SsdFgbM_ukQHvcEH855hD.DDLBEUsTXG489.WTGV9qN_uZV
 ZIWSChCPj6N_9EGXLWBaSnjGPhtuX8rR_CP19x9ch6P5VQed3EOWu1jjqe6cfo.7H_MM.uWOeVl6
 iaM2TF5x4um0vknL6bmAOQ6Qf7jhFEvsw_MOR9TeOtnJS6xdznfKrNirhk0sfKS9iYTShc3vA_Xg
 R7esWn_foWvez9DQMMHgmNiIeoYN0cOMr4zevJybgksTSdJih0NpP5dUPJQuUUkhR.pmGgEuZzw9
 A2nS4ReqFzPx.qnbzHwCUygsfRQlIuFBo9_pbglTLNTTNPobFsyepFe9AiHfB6Prp8m4eXMW0PrV
 7BDBeQM1QSBhLUlrsI8OlmmHm55fL2xx2tatwLgT7MH5l1zCAdUcR23KUSWUu4AU4TalUFwTR6.b
 fzcjqvwW7ll_i.zhcXuXI5Uj9_xi_t4qvIauYot6rna5HaE4baChqTjawSt3bhCqe17W4hOHxRlf
 d0ZldYsNYV9Iac5z9G37iYWIs4OpuM7YQyCqAR9XijMgE_m5JY_AGU5mpOBgktFLbbRLE36KW47K
 WFeDEEHlEB145tQzXbFrRvrI9Lkl7jBN51syKRsPX8u7nC4LuuFzcWMchf98YhAIjtogflTkqtaT
 9TaLcyBYebpshyuEVfiNA5Efzr9Zkxyn1_Y3JThxmOIvQ0tzDWSC0aBmOgGjaFblxBV.4sl72RhJ
 gHteu6PBE9WeMSGfP00ebKBZakoiocDQ4Qs16tD2sOwejoUS23j7Et9cnlwTUMvNrjBeF6P7nKXB
 xsxCwZjhkND_tvnS1gEQSAyXQlPLd_cWLuFKkw_XdsIr8Ey.KiWsGL_t_T3y_hbEAZxchLVtm8se
 mg7sgTmWIlK89KhfYyQxzkSUJRI7iS3z5wq0_dXZ60LuzNB61Ba1I5cv.k.yfTjgJAwqlBLjqGGZ
 RrXkgqN1kSgVvHarhVwlFQAtSaJtGD.qDfFZjzNCH4OdQkjS6HWv2YjgkLXutbRoOAArFOzPHUY1
 1rp0sMyOKUO6dU3btMddEZeZUr1rb9DMCEk8xa_28TtbN2xdiN3ZdjoaVnnWnYJjSG8a33CGG4Yq
 rIpMudvEMaEWOiKquM.dXvEkbuIMO523Ak5hthgRKj1JpCwkSTSVcxHzC4zZnwf7nJRKJYitxIQm
 hQsC7XF9GBiVz94yD1wW733Otf8Q6oRJShNcyulSYFpERYx5VRI8AvwfrHvStc2zpMF3xsUyLT2_
 zsQAy6I_IWDxRVlwPZ27VZblfvEHNPq0rXs6DHloJOS9Ixz_S4BsAcp3L17am2AJnF0s7.gk1jYL
 8j2C_jiCOfCTIYVziGtweqr4539wiEzaDjNgUyaLbDCTjBBSlZVtrLzQAOio5tUdkrl_VTgJIP9t
 uejeGHu3sb1G4Ror4K_pJCBjEmTt6mXW.H.ojD2gLLlvvvbleZYhR8F22RjXPtnb57jKyXXso6..
 jSJMsFXNLQ_beT4VQUyhiIRTH4FfB0A--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: dafd4106-399d-4e8d-a4ee-9a93db7a99ce
Message-ID: <307db0cc-f31c-40e6-9f91-cbb83298f04b@netscape.net>
Date: Tue, 19 Sep 2023 12:07:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
 <ZQlHj5rjMaYj8Z4e@MacBookPdeRoger>
 <41a2cdf9-8fd1-418d-abc9-1fe4f3fd8b5e@xen.org>
 <232644f5-b0ad-414f-a4b5-03724f5ac053@netscape.net>
 <f40ce805-b6b7-46c5-87b2-3fe8c331072d@xen.org>
 <62c98f14-1559-16c9-f070-e3e6112a6dd4@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <62c98f14-1559-16c9-f070-e3e6112a6dd4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21797 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 9/19/2023 12:00 PM, Jan Beulich wrote:
> On 19.09.2023 17:56, Julien Grall wrote:
>> On 19/09/2023 16:09, Chuck Zmudzinski wrote:
>>> On 9/19/2023 8:10 AM, Julien Grall wrote:
>>>> On 19/09/2023 08:02, Roger Pau Monné wrote:
>>>>> On Mon, Sep 18, 2023 at 07:49:26PM +0100, Julien Grall wrote:
>>>>>> (+Roger and moving to xen-devel)
>>>>>> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
>>>>>>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>>>>>>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>>>>>>>
>>>>>>>> [user@Malmalinux ~]$ sudo xl dmesg
>>>>>>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>>>>>>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>>>>>>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>>>>>>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>>>>>>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>>>>>>>> ...
>>>>>>>>
>>>>>>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>>>>>>>
>>>>>>>> Can increasing the buffer fix this? How would one do that?
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>>
>>>>>>> I see the setting is the command line option conring_size:
>>>>>>>
>>>>>>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
>>>>>>>
>>>>>>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
>>>>>>
>>>>>> Thanks for the report. This remind me the series [1] from Roger which tries
>>>>>> to increase the default size to 32K. @Roger, I am wondering if we should
>>>>>> revive it?
>>>>>
>>>>> I think the relevant patch (2/2) will still apply as-is, it's just a
>>>>> Kconfig one line change.  I'm however thinking it might be better to
>>>>> bump it even further, to 128K.  From a system point of view it's still
>>>>> a very small amount of memory.
>>>>
>>>> I don't have a strong opinion about 128K vs 32K.
>>>
>>> I am sure 32k will be big enough on my system, and based on Jan's comment
>>> about release builds being less verbose, the current default of 16k may
>>> still work on my system once the release is out. 
>> 
>> I think it is quite (actually more) important to capture all the logs 
>> even in non-release build. So it would makes sense to increase the 
>> buffer to 32KB.
>> 
>> An alternative option would be to have a different limit for debug and 
>> production build. Not sure what the others thinks.
> 
> I would certainly like a two-way default better than the uniform bumping
> to 128k.
> 
> Jan

I think for release builds (production) minimize it as much as possible without
losing the less verbose logs. For debug builds, make it as big as needed for
the convenience of developers and the more verbose logs.

