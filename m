Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960530A2DA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 08:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79591.144889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Tzn-0003mr-7h; Mon, 01 Feb 2021 07:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79591.144889; Mon, 01 Feb 2021 07:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Tzn-0003mR-2t; Mon, 01 Feb 2021 07:51:39 +0000
Received: by outflank-mailman (input) for mailman id 79591;
 Mon, 01 Feb 2021 07:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Tzl-0003mM-E9
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 07:51:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb23232-0385-411b-9d19-bffda1e715e3;
 Mon, 01 Feb 2021 07:51:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 711F0AD87;
 Mon,  1 Feb 2021 07:51:35 +0000 (UTC)
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
X-Inumbo-ID: ffb23232-0385-411b-9d19-bffda1e715e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612165895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I34PXV5jcXCd0lDNvXoTB1OluD7lbxJLWzB1GJ6LEhY=;
	b=VvKSIpiwHZReKxs3XbFMV/Aen3AWHgmS0+slW2ZJgYST44Qn+VVVhWrEG7dfNCLhy9srIK
	yMjhVJDdK8FB3UgJ7yokey0pt+YqPD4nfPz8YW4vmnvxdcL5rjGPKQuK4ZvlbOPcj69+Tg
	W+FyqiW4rL0mNq/VbAWIG/IyAmLnXIU=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
 <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
 <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
 <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
 <bd150f4d-4f7e-082e-6b10-03bf1eca7b80@suse.com>
 <CANyqHYeHf8f6G+U2z9A0JC049HPYvWQ+WXZYLCQyWyx5Jvq6BA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0dbd6c58-a524-e013-946b-181ed3b40fb4@suse.com>
Date: Mon, 1 Feb 2021 08:51:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYeHf8f6G+U2z9A0JC049HPYvWQ+WXZYLCQyWyx5Jvq6BA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 20:31, Claudemir Todo Bom wrote:
> Em sex., 29 de jan. de 2021 às 13:24, Jan Beulich <jbeulich@suse.com> escreveu:
>>
>> On 28.01.2021 14:08, Claudemir Todo Bom wrote:
>>> Em qui., 28 de jan. de 2021 às 06:49, Jan Beulich <jbeulich@suse.com> escreveu:
>>>>
>>>> On 28.01.2021 10:47, Jan Beulich wrote:
>>>>> On 26.01.2021 14:03, Claudemir Todo Bom wrote:
>>>>>> If this information is good for more tests, please send the patch and
>>>>>> I will test it!
>>>>>
>>>>> Here you go. For simplifying analysis it may be helpful if you
>>>>> could limit the number of CPUs in use, e.g. by "maxcpus=4" or
>>>>> at least "smt=0". Provided the problem still reproduces with
>>>>> such options, of course.
>>>>
>>>> Speaking of command line options - it doesn't look like you have
>>>> told us what else you have on the Xen command line, and without
>>>> a serial log this isn't visible (e.g. in your video).
>>>
>>> All tests are done with xen command line:
>>>
>>> dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true
>>> smt=false vga=text-80x50,keep
>>>
>>> and kernel command line:
>>>
>>> loglevel=0 earlyprintk=xen nomodeset
>>>
>>> this way I can get all xen messages on console.
>>>
>>> Attached are the frames I captured from a video, I manually selected
>>> them starting from the first readable frame.
>>
>> I've just sent a pair of patches, with you Cc-ed on the 2nd one.
>> Please give that one a try, with or without the updated debugging
>> patch below. In case of problems I'd of course want to see the
>> output from the debugging patch as well. I think it's up to you
>> whether you also use the first patch from that series - afaict it
>> shouldn't directly affect your case, but I may be wrong.
> 
> I've applied both patches, system didn't booted, used following parameters:
> 
> xen: dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true smt=true
> kernel: loglevel=3
> 
> The screen cleared right after the initial xen messages and frozen
> there for a few minutes until I restarted the system.
> 
> I've added "vga=text-80x25,keep" to the xen command line and
> "nomodeset" to the kernel command line, hoping to get some more info
> and surprisingly this was sufficient to make system boot!

Odd, but as per my reply to the patch submission itself a
few minutes ago, over the weekend I realized a flaw. I do
think this explains the anomalies seen from the log between
CPU0 and and all other CPUs; the problem merely isn't as
severe anymore as it was before as it seems. I also did
realize I ought to be able to mimic your system's behavior;
if so I ought to be able to send out an updated series that
actually had some testing for the specific case. Later
today, hopefully.

Jan

