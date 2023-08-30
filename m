Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80B78D430
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 10:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592783.925615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGqx-000656-CF; Wed, 30 Aug 2023 08:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592783.925615; Wed, 30 Aug 2023 08:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGqx-00062P-8n; Wed, 30 Aug 2023 08:47:07 +0000
Received: by outflank-mailman (input) for mailman id 592783;
 Wed, 30 Aug 2023 08:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbGqv-0005Ww-V1
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 08:47:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb7fafe-4711-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 10:47:05 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.36.90.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 9135A4EE0738;
 Wed, 30 Aug 2023 10:47:04 +0200 (CEST)
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
X-Inumbo-ID: cbb7fafe-4711-11ee-8783-cb3800f73035
Message-ID: <d0786cb8-13c7-9be4-94f0-9f49ed7e94bf@bugseng.com>
Date: Wed, 30 Aug 2023 10:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 01/13] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281458390.6458@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2308281531070.6458@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2308281531070.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 00:32, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Stefano Stabellini wrote:
>> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>>> Some headers, under specific circumstances (documented in a comment at
>>> the beginning of the file), explicitly avoid inclusion guards: the caller
>>> is responsible for including them correctly.
>>>
>>> These files are not supposed to comply with Directive 4.10:
>>> "Precautions shall be taken in order to prevent the contents of a header
>>> file being included more than once"
>>>
>>> This patch adds a deviation for all headers that contain the following
>>> in a comment text:
>>> "In this case, no inclusion guards apply and the caller is responsible"
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Actually one question
> 
> 
>>> ---
>>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>>>   docs/misra/rules.rst                             | 3 ++-
>>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index d8170106b4..5f068377fa 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -91,6 +91,10 @@ conform to the directive."
>>>   -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
>>>   -doc_end
>>>   
>>> +-doc_begin="Some headers, under specific circumstances, explicitly avoid inclusion guards."
>>> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
>>> +-doc_end
> 
> Is this supposed to match with any files starting with "In this case,
> no inclusion..." ?
> 
> We should use the format introduced by safe.json instead
> 

I agree, I will do it in the next submission.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


