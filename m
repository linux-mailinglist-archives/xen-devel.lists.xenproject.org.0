Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BE40FD7D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 18:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189567.339338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGJ3-0005nj-CE; Fri, 17 Sep 2021 16:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189567.339338; Fri, 17 Sep 2021 16:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGJ3-0005kb-8U; Fri, 17 Sep 2021 16:01:41 +0000
Received: by outflank-mailman (input) for mailman id 189567;
 Fri, 17 Sep 2021 16:01:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mRGJ1-0005kV-Q8
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 16:01:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRGIy-00029O-IQ; Fri, 17 Sep 2021 16:01:36 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRGIy-0004VB-6L; Fri, 17 Sep 2021 16:01:36 +0000
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
	bh=4EIFlC7bSP228SxUsP6EbSZoZ3lV7hhvf99Td8CaC3w=; b=qCIM68wzeRUtZz9X+rSitI7QTJ
	5E2qc6BISOOm3QsKy9YynIG8kXqu/4AaBFTR/YpgFh1nPgTJWCiYni567Wcu2BuBP6pzeaFMx93q3
	k/u5KgWVmyJRSq4ojOHRbrJewhTaamdF/8B8SF8TS96ayGEZYvQrxZu5HaoYkRRfzuWw=;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Dmitry Isaikin <isaikin-dmitry@yandex.ru>, rjstone@amazon.co.uk,
 raphning@amazon.co.uk, Paul Durrant <paul@xen.org>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
 <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
 <0fa0d369-c67c-1cdd-0ff8-1542487ffb8a@citrix.com>
 <0c860901-0992-74df-4a53-d75a0971d1f3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f6225dc6-0590-3456-8c48-7ab29aa00200@xen.org>
Date: Fri, 17 Sep 2021 21:01:26 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0c860901-0992-74df-4a53-d75a0971d1f3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 17/09/2021 14:47, Jan Beulich wrote:
> On 17.09.2021 11:41, Andrew Cooper wrote:
>> On 17/09/2021 10:27, Julien Grall wrote:
>>> Hi,
>>>
>>> (+ some AWS folks)
>>>
>>> On 17/09/2021 11:17, Jan Beulich wrote:
>>>> On 16.09.2021 19:52, Andrew Cooper wrote:
>>>>> On 16/09/2021 13:30, Jan Beulich wrote:
>>>>>> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>>>>>>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>>>>>>
>>>>>>> This significantly speeds up concurrent destruction of multiple
>>>>>>> domains on x86.
>>>>>> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
>>>>>> improve locking during domain destruction"). There it was found to
>>>>>> actually improve things;
>>>>>
>>>>> Was it?  I recall that it was simply an expectation that performance
>>>>> would be better...
>>>>
>>>> My recollection is that it was, for one of our customers.
>>>>
>>>>> Amazon previously identified 228ab9992ffb as a massive perf hit, too.
>>>>
>>>> Interesting. I don't recall any mail to that effect.
>>>
>>> Here we go:
>>>
>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Fde46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia%40amazon.com%2F&amp;data=04%7C01%7CAndrew.Cooper3%40citrix.com%7C8cf65b3fb3324abe7cf108d979bd7171%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637674676843910175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=si7eYIxSqsJY77sWuwsad5MzJDMzGF%2F8L0JxGrWTmtI%3D&amp;reserved=0
>>>
>>>
>>> We have been using the revert for quite a while in production and didn't
>>> notice any regression.
>>>
>>>>
>>>>> Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
>>>>> incomplete, and it appears as if it wasn't necessarily a wise move in
>>>>> hindsight.
>>>>
>>>> Possible; I continue to think though that the present observation wants
>>>> properly understanding instead of more or less blindly undoing that
>>>> change.
>>>
>>> To be honest, I think this is the other way around. You wrote and merged
>>> a patch with the following justification:
>>>
>>> "
>>>      There is no need to hold the global domctl lock across domain_kill() -
>>>      the domain lock is fully sufficient here, and parallel cleanup after
>>>      multiple domains performs quite a bit better this way.
>>> "
>>>
>>> Clearly, the original commit message is lacking details on the exact
>>> setups and numbers. But we now have two stakeholders with proof that
>>> your patch is harmful to the setup you claim perform better with your
>>> patch.
>>>
>>> To me this is enough justification to revert the original patch. Anyone
>>> against the revert, should provide clear details of why the patch should
>>> not be reverted.
>>
>> I second a revert.
>>
>> I was concerned at the time that the claim was unsubstantiated, and now
>> there is plenty of evidence to counter the claim.
> 
> Well, I won't object to a proper revert. I still think we'd better get to
> the bottom of this, not the least because I thought there was agreement
> that mid to long term we should get rid of global locking wherever
> possible. Or are both of you saying that using a global lock here is
> obviously fine? And does either of you have at least a theory to explain
> the observation? I can only say that I find it puzzling.

I will quote what Hongyan wrote back on the first report:

"
The best solution is to make the heap scalable instead of a global
lock, but that is not going to be trivial.

Of course, another solution is to keep the domctl lock dropped in
domain_kill() but have another domain_kill lock so that competing
domain_kill()s will try to take that lock and back off with hypercall
continuation. But this is kind of hacky (we introduce a lock to reduce
spinlock contention elsewhere), which is probably not a solution but a
workaround.
"

Cheers,

-- 
Julien Grall

