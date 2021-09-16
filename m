Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B564340E9EF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 20:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188673.337922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQwDI-00058H-1R; Thu, 16 Sep 2021 18:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188673.337922; Thu, 16 Sep 2021 18:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQwDH-00056P-T8; Thu, 16 Sep 2021 18:34:23 +0000
Received: by outflank-mailman (input) for mailman id 188673;
 Thu, 16 Sep 2021 18:34:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8L3r=OG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mQwDG-00056J-Fr
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 18:34:22 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d43359eb-4a97-40cb-9fd7-db64c17e9ed9;
 Thu, 16 Sep 2021 18:34:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t8so4006134wri.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 11:34:21 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:6d33:e960:5a2a:9aae?
 ([2a00:23c5:5785:9a01:6d33:e960:5a2a:9aae])
 by smtp.gmail.com with ESMTPSA id k6sm6947250wmo.37.2021.09.16.11.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 11:34:20 -0700 (PDT)
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
X-Inumbo-ID: d43359eb-4a97-40cb-9fd7-db64c17e9ed9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w4Ekv6N9l8FCIqGomJ6KrcmtU6Dai3vMtJDZaK7FIpM=;
        b=aQJNdADA4sjWyHEyiZB8v/YOimfup3q/yreXaUIsDRkCIWXuEkGURS6rDJLMDBGo8j
         /q9oVBu4VyMzqzJmkCtZZO4Wk+KhZnXKB6K0nK8DfpQaKq3edXaU30WCMQIH2JRok3vr
         0bIbbWxeglawI62Ne9ttrxhN+YsQkmIJiE+KibjbbAAEqy81UR0j+y4oJ/h44DOepE4C
         RILQh364ipYOnZFaRHBJF/GywrJwkXBgd5fiO2zt6kOLwc3jK2NUQtmYYzdxNlAb75fk
         nNnmtmHBit70CIhpc7eU7xfS5gy87sdOHSSlvQxZKGOfDtSthBD58mDltOMv0ZnTIViK
         MMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=w4Ekv6N9l8FCIqGomJ6KrcmtU6Dai3vMtJDZaK7FIpM=;
        b=N8jvcWZbwDoam4AW0QeOKzxzEQJzAjnuTExKCNmlejn9XK1aNZ/AvJhG26LXHQUN70
         TA+fboTyB8XNU6VB4IpjOGxFiTiW2Ip/GplsfFjG5Dm9WVOu5iZel6vVQUubWrDMRpQ5
         y6p8ahYhtJ1nGVT2T0v/0fGbvugAIPdOwFtpSHLigEsd3W8hrofHGUJxRJgI5gkxvb/e
         cayyE0/xUOLHzjrYvI9gXSC/UwiqfCO9VrEGTCZTpnGAcn/reR/GJhomEshdnH+keq9e
         Pg/bK6LYU4GHvvE8KdNalNmw+Yxb3RNtNq8ckHwdHyYk8Ls0v+1ZsxpiQ9WI7MnuzEUc
         3bCA==
X-Gm-Message-State: AOAM531oCJPvj3oiqIiAG8EZxacj7W5/0TXPERLboLDiwm7UH16x7mnk
	En1JxvcCtwqjUbYfhFPAPhg=
X-Google-Smtp-Source: ABdhPJy0sR3FbB/pw8T5ItPYEMv6Lo96GQc/NTvLmcBSZhuqqvbxHEwECve262i1QyUWdJo2iIVcxA==
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr7789848wrw.182.1631817260434;
        Thu, 16 Sep 2021 11:34:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_xen-netback=3a_correct_su?=
 =?UTF-8?Q?ccess/error_reporting_for_the_SKB-with-fraglist_case?=
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
 <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
 <76c94541-21a8-7ae5-c4c4-48552f16c3fd@suse.com>
 <17e50fb5-31f7-60a5-1eec-10d18a40ad9a@xen.org>
 <57580966-3880-9e59-5d82-e1de9006aa0c@suse.com>
 <a26c1ecd-e303-3138-eb7e-96f0203ca888@xen.org>
 <1a522244-4be8-5e33-77c7-4ea5cf130335@suse.com>
 <9d27a3eb-1d50-64bb-8785-81de1eef3102@suse.com>
 <d4f381e9-6698-3339-1d17-15e3abc71d06@suse.com>
Message-ID: <0dff83ff-629a-7179-9fef-77bd1fbf3d09@xen.org>
Date: Thu, 16 Sep 2021 19:34:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d4f381e9-6698-3339-1d17-15e3abc71d06@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16/09/2021 16:45, Jan Beulich wrote:
> On 15.07.2021 10:58, Jan Beulich wrote:
>> On 20.05.2021 13:46, Jan Beulich wrote:
>>> On 25.02.2021 17:23, Paul Durrant wrote:
>>>> On 25/02/2021 14:00, Jan Beulich wrote:
>>>>> On 25.02.2021 13:11, Paul Durrant wrote:
>>>>>> On 25/02/2021 07:33, Jan Beulich wrote:
>>>>>>> On 24.02.2021 17:39, Paul Durrant wrote:
>>>>>>>> On 23/02/2021 16:29, Jan Beulich wrote:
>>>>>>>>> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
>>>>>>>>> special considerations for the head of the SKB no longer apply. Don't
>>>>>>>>> mistakenly report ERROR to the frontend for the first entry in the list,
>>>>>>>>> even if - from all I can tell - this shouldn't matter much as the overall
>>>>>>>>> transmit will need to be considered failed anyway.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>
>>>>>>>>> --- a/drivers/net/xen-netback/netback.c
>>>>>>>>> +++ b/drivers/net/xen-netback/netback.c
>>>>>>>>> @@ -499,7 +499,7 @@ check_frags:
>>>>>>>>>      				 * the header's copy failed, and they are
>>>>>>>>>      				 * sharing a slot, send an error
>>>>>>>>>      				 */
>>>>>>>>> -				if (i == 0 && sharedslot)
>>>>>>>>> +				if (i == 0 && !first_shinfo && sharedslot)
>>>>>>>>>      					xenvif_idx_release(queue, pending_idx,
>>>>>>>>>      							   XEN_NETIF_RSP_ERROR);
>>>>>>>>>      				else
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think this will DTRT, but to my mind it would make more sense to clear
>>>>>>>> 'sharedslot' before the 'goto check_frags' at the bottom of the function.
>>>>>>>
>>>>>>> That was my initial idea as well, but
>>>>>>> - I think it is for a reason that the variable is "const".
>>>>>>> - There is another use of it which would then instead need further
>>>>>>>      amending (and which I believe is at least part of the reason for
>>>>>>>      the variable to be "const").
>>>>>>>
>>>>>>
>>>>>> Oh, yes. But now that I look again, don't you want:
>>>>>>
>>>>>> if (i == 0 && first_shinfo && sharedslot)
>>>>>>
>>>>>> ? (i.e no '!')
>>>>>>
>>>>>> The comment states that the error should be indicated when the first
>>>>>> frag contains the header in the case that the map succeeded but the
>>>>>> prior copy from the same ref failed. This can only possibly be the case
>>>>>> if this is the 'first_shinfo'
>>>>>
>>>>> I don't think so, no - there's a difference between "first frag"
>>>>> (at which point first_shinfo is NULL) and first frag list entry
>>>>> (at which point first_shinfo is non-NULL).
>>>>
>>>> Yes, I realise I got it backwards. Confusing name but the comment above
>>>> its declaration does explain.
>>>>
>>>>>
>>>>>> (which is why I still think it is safe to unconst 'sharedslot' and
>>>>>> clear it).
>>>>>
>>>>> And "no" here as well - this piece of code
>>>>>
>>>>> 		/* First error: if the header haven't shared a slot with the
>>>>> 		 * first frag, release it as well.
>>>>> 		 */
>>>>> 		if (!sharedslot)
>>>>> 			xenvif_idx_release(queue,
>>>>> 					   XENVIF_TX_CB(skb)->pending_idx,
>>>>> 					   XEN_NETIF_RSP_OKAY);
>>>>>
>>>>> specifically requires sharedslot to have the value that was
>>>>> assigned to it at the start of the function (this property
>>>>> doesn't go away when switching from fragments to frag list).
>>>>> Note also how it uses XENVIF_TX_CB(skb)->pending_idx, i.e. the
>>>>> value the local variable pending_idx was set from at the start
>>>>> of the function.
>>>>>
>>>>
>>>> True, we do have to deal with freeing up the header if the first map
>>>> error comes on the frag list.
>>>>
>>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>>
>>> Since I've not seen this go into 5.13-rc, may I ask what the disposition
>>> of this is?
>>
>> I can't seem to spot this in 5.14-rc either. I have to admit I'm
>> increasingly puzzled ...
> 
> Another two months (and another release) later and still nothing. Am
> I doing something wrong? Am I wrongly assuming that maintainers would
> push such changes up the chain?
> 

It has my R-b so it ought to go in via netdev AFAICT.

   Paul


