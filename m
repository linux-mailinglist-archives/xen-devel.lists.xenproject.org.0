Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0458A91A8E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957394.1350530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NHp-00030e-Ad; Thu, 17 Apr 2025 11:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957394.1350530; Thu, 17 Apr 2025 11:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NHp-0002yE-6n; Thu, 17 Apr 2025 11:20:05 +0000
Received: by outflank-mailman (input) for mailman id 957394;
 Thu, 17 Apr 2025 11:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s05F=XD=nppct.ru=sdl@srs-se1.protection.inumbo.net>)
 id 1u5NHm-0002JH-1W
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:20:03 +0000
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e65f6bc2-1b7d-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 13:20:00 +0200 (CEST)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 2896B1C0E86
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 14:19:57 +0300 (MSK)
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7W5cGyoQYTbp for <xen-devel@lists.xenproject.org>;
 Thu, 17 Apr 2025 14:19:50 +0300 (MSK)
Received: from [172.16.0.185] (unknown [176.59.174.214])
 by mail.nppct.ru (Postfix) with ESMTPSA id 750791C08C3;
 Thu, 17 Apr 2025 14:19:37 +0300 (MSK)
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
X-Inumbo-ID: e65f6bc2-1b7d-11f0-9eb0-5ba50f476ded
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:to:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1744888790; x=1745752791; bh=EaA/y+zhy5Or9j5JTA2kf0Ms6ZLviEs08ZX
	slBXBvVU=; b=PTv9lybVRA2uUGNVgliJQYa0VIXftBqA7Zh9oRDcq/hGAvqAjTn
	5cHE10vKiHQdgRmFOe8uUvTnqG3cGLOBrFv8i+oKkrFn2Mz8NqZlspOB4Ks0V0tz
	BLA75hOoF4GoSY3t72OR/42+Mnf9ixEfOsLrH6uoYJiPEQwpXWji6aWc=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Message-ID: <ff6eed52-5f1f-4070-90dc-8cf057f35e41@nppct.ru>
Date: Thu, 17 Apr 2025 14:19:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
 <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
 <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
Content-Language: en-US
From: Alexey <sdl@nppct.ru>
In-Reply-To: <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17.04.2025 13:23, Jürgen Groß wrote:
> On 17.04.25 12:06, Alexey wrote:
>>
>> On 17.04.2025 11:51, Juergen Gross wrote:
>>> On 17.04.25 10:45, Alexey wrote:
>>>>
>>>> On 17.04.2025 10:12, Jürgen Groß wrote:
>>>>> On 17.04.25 09:00, Alexey wrote:
>>>>>>
>>>>>> On 17.04.2025 03:58, Jakub Kicinski wrote:
>>>>>>> On Mon, 14 Apr 2025 18:34:01 +0000 Alexey Nepomnyashih wrote:
>>>>>>>>           get_page(pdata);
>>>>>>> Please notice this get_page() here.
>>>>>>>
>>>>>>>>           xdpf = xdp_convert_buff_to_frame(xdp);
>>>>>>>> +        if (unlikely(!xdpf)) {
>>>>>>>> + trace_xdp_exception(queue->info->netdev, prog, act);
>>>>>>>> +            break;
>>>>>>>> +        }
>>>>>> Do you mean that it would be better to move the get_page(pdata) 
>>>>>> call lower,
>>>>>> after checking for NULL in xdpf, so that the reference count is 
>>>>>> only increased
>>>>>> after a successful conversion?
>>>>>
>>>>> I think the error handling here is generally broken (or at least very
>>>>> questionable).
>>>>>
>>>>> I suspect that in case of at least some errors the get_page() is 
>>>>> leaking
>>>>> even without this new patch.
>>>>>
>>>>> In case I'm wrong a comment reasoning why there is no leak should be
>>>>> added.
>>>>>
>>>>>
>>>>> Juergen
>>>>
>>>> I think pdata is freed in xdp_return_frame_rx_napi() -> __xdp_return()
>>>
>>> Agreed. But what if xennet_xdp_xmit() returns an error < 0?
>>>
>>> In this case xdp_return_frame_rx_napi() won't be called.
>>>
>>>
>>> Juergen
>>
>> Agreed. There is no explicit freed pdata in the calling function
>> xennet_get_responses(). Without this, the page referenced by pdata
>> could be leaked.
>>
>> I suggest:
>
> Could you please merge the two if () blocks, as they share the
> call of xdp_return_frame_rx_napi() now? Something like:
>
> if (unlikely(err <= 0)) {
>     if (err < 0)
>         trace_xdp_exception(queue->info->netdev, prog, act);
>     xdp_return_frame_rx_napi(xdpf);
> }
>
> Juergen
>
> P.S.: please don't use HTML in emails

I can't do this because xennet_xdp_xmit() can return a value > 0



