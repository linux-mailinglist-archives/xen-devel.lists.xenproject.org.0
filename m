Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546086AC94
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686470.1068558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHlL-0006If-TQ; Wed, 28 Feb 2024 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686470.1068558; Wed, 28 Feb 2024 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHlL-0006GU-PH; Wed, 28 Feb 2024 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 686470;
 Wed, 28 Feb 2024 11:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A+G=KF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfHlJ-0006GO-UY
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:06:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f600c67-d629-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 12:06:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 641BD4EE0737;
 Wed, 28 Feb 2024 12:06:07 +0100 (CET)
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
X-Inumbo-ID: 5f600c67-d629-11ee-afd7-a90da7624cb6
MIME-Version: 1.0
Date: Wed, 28 Feb 2024 12:06:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
In-Reply-To: <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
 <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
 <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
Message-ID: <61bdcfc51c4d6ad81949f1f4d84593e1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-27 13:47, Jan Beulich wrote:
> On 27.02.2024 12:52, Julien Grall wrote:
>> Hi Jan,
>> 
>> On 27/02/2024 07:28, Jan Beulich wrote:
>>> On 27.02.2024 01:26, Stefano Stabellini wrote:
>>>> On Mon, 26 Feb 2024, Jan Beulich wrote:
>>>>> On 23.02.2024 10:35, Nicola Vetrini wrote:
>>>>>> Refactor cpu_notifier_call_chain into two functions:
>>>>>> - the variant that is allowed to fail loses the nofail flag
>>>>>> - the variant that shouldn't fail is encapsulated in a call
>>>>>>    to the failing variant, with an additional check.
>>>>>> 
>>>>>> This prevents uses of the function that are not supposed to
>>>>>> fail from ignoring the return value, thus violating Rule 17.7:
>>>>>> "The value returned by a function having non-void return type 
>>>>>> shall
>>>>>> be used".
>>>>>> 
>>>>>> No functional change.
>>>>>> 
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> 
>>>>> I'm afraid I disagree with this kind of bifurcation. No matter what
>>>>> Misra thinks or says, it is normal for return values of functions 
>>>>> to
>>>>> not always be relevant to check.
>>>> 
>>>> Hi Jan, I disagree.
>>>> 
>>>> Regardless of MISRA, I really think return values need to be 
>>>> checked.
>>>> Moreover, we decided as a group to honor MISRA Rule 17.7, which 
>>>> requires
>>>> return values to be checked. This patch is a good step forward.
>>> 
>>> Yet splitting functions isn't the only way to deal with Misra's
>>> requirements, I suppose. After all there are functions where the
>>> return value is purely courtesy for perhaps just one of its callers.
>> 
>> You are right that we have some places where one caller care about the
>> return value. But the problem is how do you tell whether the return 
>> was
>> ignored on purpose or not?
>> 
>> We had at least one XSA because the return value of a function was not
>> checked (see XSA-222). We also had plenty of smaller patches to check
>> returns.
>> 
>> So far, we added __must_check when we believed return values should be
>> checked. But usually at the point we notice, this is far too late.
>> 
>> To me the goal should be that we enforce __must_check everywhere. We 
>> are
>> probably going to detect places where we forgot to check the return. 
>> For
>> thoses that are on purpose, we can document them.
>> 
>>> 
>>> Splitting simply doesn't scale very well, imo.
>> 

Yes. I certainly don't plan to do much splitting either. I saw this one 
as a low-hanging fruit.

>> Do you have another proposal? As Stefano said, we adopted the rule 
>> 17.7.
>> So we know need a solution to address it.
> 
> One possibility that was circulated while discussing was to add (void)
> casts. I'm not a huge fan of those, but between the two options that
> might be the lesser evil. We also use funny (should I say ugly)
> workarounds in a few cases where we have __must_check but still want
> to not really handle the return value in certain cases. Given there are
> example in the code base, extending use of such constructs is certainly
> also something that may want considering.
> 

Can you point out some of these constructs, just to get an idea of what 
that might look like?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

