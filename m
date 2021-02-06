Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAA311D0D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 13:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82178.151963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8MYi-0007XR-Nq; Sat, 06 Feb 2021 12:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82178.151963; Sat, 06 Feb 2021 12:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8MYi-0007X2-KX; Sat, 06 Feb 2021 12:19:28 +0000
Received: by outflank-mailman (input) for mailman id 82178;
 Sat, 06 Feb 2021 12:19:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l8MYh-0007Wx-En
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 12:19:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8MYf-0008BZ-0C; Sat, 06 Feb 2021 12:19:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8MYe-0005pl-Ml; Sat, 06 Feb 2021 12:19:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=e3DoAeL+lOAUxA+lEznGlmmjujWcwFYkHH+iAB3YFd8=; b=4rbcp6mGnnPqoWsQ2dSADRlhJb
	msnMqOlsGoUcFiM4mmlsLdcW1GDhMQWw3xTBjBDyrmdIykTolAfFqm0lCx6QRYuMm6byzvsQJiYqV
	wT+UBehO42aD2R0/DbrTJ8fOjw5qAU5VJKeFbkcCX4w3szma0Ec/mtfb7bXPXkNa+YKU=;
Subject: Re: [PATCH 1/7] xen/events: reset affinity of 2-level event initially
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-2-jgross@suse.com>
 <f89567cf-f954-0d97-087e-5e31bfa6d49d@xen.org>
 <d2017caa-0ea8-ae9d-d9f6-45be3da20688@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d856a721-4f5f-8f8f-bddd-810213daac9c@xen.org>
Date: Sat, 6 Feb 2021 12:19:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d2017caa-0ea8-ae9d-d9f6-45be3da20688@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 06/02/2021 12:09, Jürgen Groß wrote:
> On 06.02.21 12:20, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 06/02/2021 10:49, Juergen Gross wrote:
>>> When creating a new event channel with 2-level events the affinity
>>> needs to be reset initially in order to avoid using an old affinity
>>> from earlier usage of the event channel port.
>>>
>>> The same applies to the affinity when onlining a vcpu: all old
>>> affinity settings for this vcpu must be reset. As percpu events get
>>> initialized before the percpu event channel hook is called,
>>> resetting of the affinities happens after offlining a vcpu (this is
>>> working, as initial percpu memory is zeroed out).
>>>
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   drivers/xen/events/events_2l.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/xen/events/events_2l.c 
>>> b/drivers/xen/events/events_2l.c
>>> index da87f3a1e351..23217940144a 100644
>>> --- a/drivers/xen/events/events_2l.c
>>> +++ b/drivers/xen/events/events_2l.c
>>> @@ -47,6 +47,16 @@ static unsigned evtchn_2l_max_channels(void)
>>>       return EVTCHN_2L_NR_CHANNELS;
>>>   }
>>> +static int evtchn_2l_setup(evtchn_port_t evtchn)
>>> +{
>>> +    unsigned int cpu;
>>> +
>>> +    for_each_online_cpu(cpu)
>>> +        clear_bit(evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
>>
>> The bit corresponding to the event channel can only be set on a single 
>> CPU. Could we avoid the loop and instead clear the bit while closing 
>> the port?
> 
> This would need another callback.

Right, this seems to be better than walking over all the CPUs every time 
just for cleaning one bit.

Cheers,

-- 
Julien Grall

