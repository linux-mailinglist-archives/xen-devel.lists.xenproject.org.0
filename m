Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006C773BE8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580093.908387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTP5e-0005kg-Os; Tue, 08 Aug 2023 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580093.908387; Tue, 08 Aug 2023 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTP5e-0005ie-MH; Tue, 08 Aug 2023 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 580093;
 Tue, 08 Aug 2023 15:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTP5c-0005iY-N2
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTP5Z-0000Ga-8n; Tue, 08 Aug 2023 15:57:41 +0000
Received: from [15.248.2.255] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTP5Z-0002PF-2P; Tue, 08 Aug 2023 15:57:41 +0000
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
	bh=7EvLkAQmuz3R6hHoKhPlhpWB0vD5TVJ4Ate7DCOp56A=; b=OBZ5ZRagInM3yustkcaBNJOUw4
	M2GvmZ4lTxz1nLkBWjlnNspvRlIv/ZKLDqDyu+RmPgx4UN4SHWuPQt67+uF/VujVm/u6wnGALEOlV
	WotO84SNL3Om3PeZjl+8Q9TvWCgfgN/+k6IpfUB8fQCIvqeXAU3LHFrYNSwTXVak68lk=;
Message-ID: <6aac7add-544b-4c8a-b397-2a6b6c6b766c@xen.org>
Date: Tue, 8 Aug 2023 16:57:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
 <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
 <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
 <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/08/2023 16:53, Nicola Vetrini wrote:
> 
>>>
>>> ... "return" alone already tells the compiler that "break" is
>>> unreachable. You don't need unreachable() for that. As said before,
>>> "break" like this simply want purging (and Misra is wrong to demand
>>> "break" everywhere - it should instead demand no [unannotated]
>>> fall-through, which can also be achieved by return, continue, and
>>> goto).
>>
>> My suggestion was in the context of this series where we add
>> ASSERT_UNREACHABLE() before break. From my understanding, we don't
>> have a lot of leeway here because, from what Nicola wrote, rule 16.3
>> is mandatory.
>>
>> So I think using unreachable is better if we every decide to use break
>> after return.
>>
>> Cheers,
> 
> 16.3 is not Mandatory, just Required.

Ah I misread what you wrote. In that case...

> I was just reluctant to knowingly 
> add one more violation
> while fixing another before submitting the patch. If indeed 16.3 won't 
> likely be adopted by Xen,
> then that break should indeed go away.
> 
> However, the main thing that's holding me back from doing a slimmed-down 
> v2 here is that
> evidently there's no consensus even on the ASSERT_UNREACHABLE() patches.

... I agree with the following statement from Jan:

"it should instead demand no [unannotated] fall-through, which can also 
be achieved by return, continue, and goto"

Cheers,

-- 
Julien Grall

