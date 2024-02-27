Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6239868F78
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686041.1067599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rew12-0008LQ-2k; Tue, 27 Feb 2024 11:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686041.1067599; Tue, 27 Feb 2024 11:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rew11-0008Iv-WA; Tue, 27 Feb 2024 11:52:55 +0000
Received: by outflank-mailman (input) for mailman id 686041;
 Tue, 27 Feb 2024 11:52:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rew10-0008In-KQ
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:52:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rew0x-0007F8-A2; Tue, 27 Feb 2024 11:52:51 +0000
Received: from [15.248.2.14] (helo=[10.45.19.66])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rew0x-0003ZW-1H; Tue, 27 Feb 2024 11:52:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=kmabYmYV7w/DwdNxModdPKfiurpHr2ETQgn0Vl9O2rc=; b=Wj+TyPM/rwmzSKS191oBA9wFUG
	NHmZKnQJAUHMuTmsKiY+Lsr0cxrPh0aM3KX02kagaorxhMSOoauW0CR7wV5z1J3tGF8eX3xw0v30Z
	DBKDOoE1L/hqwkS8/kDfJzxEZdhspQg0fOJSimdU2rotOjy0jhl8jOvPY5QOeu8efvO8=;
Message-ID: <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
Date: Tue, 27 Feb 2024 11:52:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/02/2024 07:28, Jan Beulich wrote:
> On 27.02.2024 01:26, Stefano Stabellini wrote:
>> On Mon, 26 Feb 2024, Jan Beulich wrote:
>>> On 23.02.2024 10:35, Nicola Vetrini wrote:
>>>> Refactor cpu_notifier_call_chain into two functions:
>>>> - the variant that is allowed to fail loses the nofail flag
>>>> - the variant that shouldn't fail is encapsulated in a call
>>>>    to the failing variant, with an additional check.
>>>>
>>>> This prevents uses of the function that are not supposed to
>>>> fail from ignoring the return value, thus violating Rule 17.7:
>>>> "The value returned by a function having non-void return type shall
>>>> be used".
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> I'm afraid I disagree with this kind of bifurcation. No matter what
>>> Misra thinks or says, it is normal for return values of functions to
>>> not always be relevant to check.
>>
>> Hi Jan, I disagree.
>>
>> Regardless of MISRA, I really think return values need to be checked.
>> Moreover, we decided as a group to honor MISRA Rule 17.7, which requires
>> return values to be checked. This patch is a good step forward.
> 
> Yet splitting functions isn't the only way to deal with Misra's
> requirements, I suppose. After all there are functions where the
> return value is purely courtesy for perhaps just one of its callers.

You are right that we have some places where one caller care about the 
return value. But the problem is how do you tell whether the return was 
ignored on purpose or not?

We had at least one XSA because the return value of a function was not 
checked (see XSA-222). We also had plenty of smaller patches to check 
returns.

So far, we added __must_check when we believed return values should be 
checked. But usually at the point we notice, this is far too late.

To me the goal should be that we enforce __must_check everywhere. We are 
probably going to detect places where we forgot to check the return. For 
thoses that are on purpose, we can document them.

> 
> Splitting simply doesn't scale very well, imo.

Do you have another proposal? As Stefano said, we adopted the rule 17.7. 
So we know need a solution to address it.

> 
>>> To deal with the Misra rule imo requires to first have an abstract
>>> plan of how to handle such globally in the code base. Imo such a plan
>>> can't be to introduce perhaps dozens of new wrapper functions like is
>>> done here.
>>
>> This patch is following the right pattern, one we already follow with
>> the _locked suffix.
> 
> Right, and - just to mention it - one which I similarly dislike, albeit
> to a lesser degree.

AFAIU, we are debating between having a boolean indicating if a function 
doesn't fail or adding a wrapper.

While I understand this requires to add more code, the advantage of the 
suffix is this is more obvious for the reader (including the reviewer) 
that the call is not supposed to fail. I agree this is a matter of taste 
here...

In this case, what would be your suggestion to address the problem?

Cheers,

-- 
Julien Grall

