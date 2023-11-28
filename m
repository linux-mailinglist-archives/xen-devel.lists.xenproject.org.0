Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B87FC003
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643342.1003431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81aN-0004Oe-Ti; Tue, 28 Nov 2023 17:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643342.1003431; Tue, 28 Nov 2023 17:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81aN-0004MF-Qb; Tue, 28 Nov 2023 17:09:23 +0000
Received: by outflank-mailman (input) for mailman id 643342;
 Tue, 28 Nov 2023 17:09:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r81aM-0004M9-44
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:09:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r81aL-0005N5-68; Tue, 28 Nov 2023 17:09:21 +0000
Received: from static-css-csq-252138.business.bouyguestelecom.com
 ([176.175.252.138] helo=[172.20.7.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r81aK-0003BV-WF; Tue, 28 Nov 2023 17:09:21 +0000
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
	bh=l1xMnfsDShhgw5TfcxK6+vwbE/RkPF2ZR0NP2bYAqtw=; b=eR4owU4Wt3/1yKfHknV0dJ8zq4
	BdJBeJTsOVaiadBkntDVwz0fAcEcG86ncBVCfNnJF4sKvClNd/HCKSSdSDmqKcT5GtbAuW4SY1a46
	Wsvpo3lM0goszbTFuKHH4+ILVBj0sQ7u6wuAOmmpnkvWFAQnK+2OjSrWDhQ0mVSXkYvI=;
Message-ID: <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org>
Date: Tue, 28 Nov 2023 18:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
 <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/11/2023 18:00, Michal Orzel wrote:
> Hi Julien,
> 
> On 28/11/2023 17:14, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 27/11/2023 15:41, Michal Orzel wrote:
>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>> attention to undefined behavior issues, notably during CI test runs, is
>>> essential. When enabled, this option causes Xen to panic upon detecting
>>> UBSAN failure (as the last step in ubsan_epilogue()).
>>
>> I have mixed opinions on this patch. This would be a good one if we had
>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>> on arm32. So we would end up to stop at the first error. IOW, we would
>> need to fix the first error before we can see the next one.
> Well, this patch introduces a config option disabled by default.

I understood this is disabled by default... I am pointing out that I am 
not convinced about the usefulness until we are at the stage where Xen 
is normally not reporting any USBAN error.

> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
> of handling such issues is to do the investigation locally.

This will not always be possible. One example is when you are only able 
to reproduce some of the USBAN errors on a specific HW.

> Then, you are not forced
> to select this option and you can see all the UBSAN issues if you want.

See above, I got that point. I am mostly concerned about the implication 
in the CI right now.

> 
>>
>> So I feel it would be best if the gitlab CI jobs actually check for
>> USBAN in the logs and fail if there are any. With that, we can get the
>> full list of UBSAN issues on each job.
> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
> 
> *my plan was to first fix the UBSAN issues and then enable this option for CI.

That would have been useful to describe your goal after "---". With that 
in mind, then I suggest to revisit this patch once all the UBSAN issues 
in a normal build are fixed.

Cheers,

-- 
Julien Grall

