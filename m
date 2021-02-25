Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413F32536B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 17:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89859.169680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFJQJ-0005gl-Ea; Thu, 25 Feb 2021 16:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89859.169680; Thu, 25 Feb 2021 16:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFJQJ-0005gP-BI; Thu, 25 Feb 2021 16:23:31 +0000
Received: by outflank-mailman (input) for mailman id 89859;
 Thu, 25 Feb 2021 16:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qDmu=H3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lFJQH-0005gK-Qc
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 16:23:29 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a53316b5-1634-449e-b862-c754761e8d45;
 Thu, 25 Feb 2021 16:23:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id w7so5122898wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 08:23:28 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id l15sm8132275wmh.21.2021.02.25.08.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 08:23:26 -0800 (PST)
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
X-Inumbo-ID: a53316b5-1634-449e-b862-c754761e8d45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GlKFw17HlSadzsLvhkkdjanZrmggScCohCGFmx1NWfg=;
        b=C3jhe/BOKV6oECZihDXiEs05jbwYe6hP8PtR5d5EInbgy2LqWH/sD400gAo66HjCHt
         HG7kGGUhMqJI8YTo6QbS25buhtNUqvbWotZoNrjwsnO9DAnvT99fx3qjb+3IwJGtEI60
         fKMvxk9nB0eRfXwM1YuBOjl9WLZvvjoCeqt+FFUmh2hlccxJ3hWhFFs7qg2e/CnmAnvy
         lP9QmLoFafAhNgRIwJb/d/moC9BqgWa9VD5QM5AG21xiojs9WFg2vUZR+lJrY7iesf39
         jOa2XfJqQUwhbvl0eHEz3w7i2ch7Q/FAkMQ8bbcQJldL7pDJ3sdA9O5mKwyT4AEvSvPa
         qyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GlKFw17HlSadzsLvhkkdjanZrmggScCohCGFmx1NWfg=;
        b=MvK9a2dXYgAmysD5YQuRAthdeE4NYzgBRrzS52tVmNKjdne+m5MUdrHolCHGuwe90b
         vYfdq2sixX8Wen3EfNaszIKjC3dNH9vlG9ouaCHXkjkdrLVXR+pNYc2tadeKgmTQfRYj
         FJTWPry+tUW5lSjPIqMFWCm+2mWEM0tmhBGgniPGI+RIE8b87CfMqWnRQKkLrkm7PNuZ
         u6J3TbGLcydY7cHz2KP3zTsu36DS7H+bkMgw8UmsEC6d3o9QkolHCv4miiigp3uNkT03
         gFO61WJp5rqgL4l6GKO10fKufMbcvI98yMjmPTqc5M83J+A9bVPEUPhrkSWBDc+XvyE8
         Vddg==
X-Gm-Message-State: AOAM530aXmr+77QnBwL11ZPjBfZ52MvYDDd7xePqaT8k1QuR70+VpEMT
	zkVWh1MA6TSDrBHslxBVUZE=
X-Google-Smtp-Source: ABdhPJxFJpbPBk0sDF7od5u+aATKNxXkfGITmm9sISjxD08kKnyIrfCoDPP7XJYEiZfweO2Ea6etnQ==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr4034403wmc.100.1614270208015;
        Thu, 25 Feb 2021 08:23:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-netback: correct success/error reporting for the
 SKB-with-fraglist case
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Wei Liu <wl@xen.org>
References: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
 <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
 <76c94541-21a8-7ae5-c4c4-48552f16c3fd@suse.com>
 <17e50fb5-31f7-60a5-1eec-10d18a40ad9a@xen.org>
 <57580966-3880-9e59-5d82-e1de9006aa0c@suse.com>
Message-ID: <a26c1ecd-e303-3138-eb7e-96f0203ca888@xen.org>
Date: Thu, 25 Feb 2021 16:23:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <57580966-3880-9e59-5d82-e1de9006aa0c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/02/2021 14:00, Jan Beulich wrote:
> On 25.02.2021 13:11, Paul Durrant wrote:
>> On 25/02/2021 07:33, Jan Beulich wrote:
>>> On 24.02.2021 17:39, Paul Durrant wrote:
>>>> On 23/02/2021 16:29, Jan Beulich wrote:
>>>>> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
>>>>> special considerations for the head of the SKB no longer apply. Don't
>>>>> mistakenly report ERROR to the frontend for the first entry in the list,
>>>>> even if - from all I can tell - this shouldn't matter much as the overall
>>>>> transmit will need to be considered failed anyway.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/drivers/net/xen-netback/netback.c
>>>>> +++ b/drivers/net/xen-netback/netback.c
>>>>> @@ -499,7 +499,7 @@ check_frags:
>>>>>     				 * the header's copy failed, and they are
>>>>>     				 * sharing a slot, send an error
>>>>>     				 */
>>>>> -				if (i == 0 && sharedslot)
>>>>> +				if (i == 0 && !first_shinfo && sharedslot)
>>>>>     					xenvif_idx_release(queue, pending_idx,
>>>>>     							   XEN_NETIF_RSP_ERROR);
>>>>>     				else
>>>>>
>>>>
>>>> I think this will DTRT, but to my mind it would make more sense to clear
>>>> 'sharedslot' before the 'goto check_frags' at the bottom of the function.
>>>
>>> That was my initial idea as well, but
>>> - I think it is for a reason that the variable is "const".
>>> - There is another use of it which would then instead need further
>>>     amending (and which I believe is at least part of the reason for
>>>     the variable to be "const").
>>>
>>
>> Oh, yes. But now that I look again, don't you want:
>>
>> if (i == 0 && first_shinfo && sharedslot)
>>
>> ? (i.e no '!')
>>
>> The comment states that the error should be indicated when the first
>> frag contains the header in the case that the map succeeded but the
>> prior copy from the same ref failed. This can only possibly be the case
>> if this is the 'first_shinfo'
> 
> I don't think so, no - there's a difference between "first frag"
> (at which point first_shinfo is NULL) and first frag list entry
> (at which point first_shinfo is non-NULL).

Yes, I realise I got it backwards. Confusing name but the comment above 
its declaration does explain.

> 
>> (which is why I still think it is safe to unconst 'sharedslot' and
>> clear it).
> 
> And "no" here as well - this piece of code
> 
> 		/* First error: if the header haven't shared a slot with the
> 		 * first frag, release it as well.
> 		 */
> 		if (!sharedslot)
> 			xenvif_idx_release(queue,
> 					   XENVIF_TX_CB(skb)->pending_idx,
> 					   XEN_NETIF_RSP_OKAY);
> 
> specifically requires sharedslot to have the value that was
> assigned to it at the start of the function (this property
> doesn't go away when switching from fragments to frag list).
> Note also how it uses XENVIF_TX_CB(skb)->pending_idx, i.e. the
> value the local variable pending_idx was set from at the start
> of the function.
> 

True, we do have to deal with freeing up the header if the first map 
error comes on the frag list.

Reviewed-by: Paul Durrant <paul@xen.org>

> Jan
> 


