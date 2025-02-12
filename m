Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5BA332FA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886898.1296491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLho-0005Ja-0O; Wed, 12 Feb 2025 22:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886898.1296491; Wed, 12 Feb 2025 22:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLhn-0005Hk-TL; Wed, 12 Feb 2025 22:59:43 +0000
Received: by outflank-mailman (input) for mailman id 886898;
 Wed, 12 Feb 2025 22:59:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tiLhn-0005HZ-3U
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:59:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLhm-00FBIo-1N;
 Wed, 12 Feb 2025 22:59:42 +0000
Received: from [2a02:8012:3a1:0:4060:8ed:ba21:1efd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLhl-009CZn-3C;
 Wed, 12 Feb 2025 22:59:42 +0000
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
	bh=T4Hs2vlsBFvcPIpR9Ep1UNNKEPHu+ihn4OG6uoIJ34g=; b=tnaC0V0JYLuGhKxaXeSOVFRHWX
	5pxhNhrW6Al4FeHSsThxs2bK5mzuKTKWrk2eiAQFyt7zwAP8BHm1pfpBl16UalqIETScl2O30UZQJ
	uPE5+eF/dHIFXvHLorPoof/wk9dedIkjNSjX2MSCck0srBhJvT+4WmuKHtQVkZIwsJlE=;
Message-ID: <c5f2e7fb-211b-4763-a161-d0089704086c@xen.org>
Date: Wed, 12 Feb 2025 22:59:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
 <59a3a09b-d05f-4ad7-867a-bb41bf6e6c54@gmail.com>
 <c93ad2d7-6ac2-4a5b-b6d8-07459a2884b6@xen.org>
 <ea51509b-034b-4fa8-8a3f-8304a2bc48f3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ea51509b-034b-4fa8-8a3f-8304a2bc48f3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 10/02/2025 22:41, Andrew Cooper wrote:
> On 10/02/2025 9:31 pm, Julien Grall wrote:
>>
>>
>> On 10/02/2025 09:21, Oleksii Kurochko wrote:
>>>
>>> On 2/8/25 1:02 AM, Andrew Cooper wrote:
>>>> Right now, run_in_exception_handler() takes an input in an arbitrary
>>>> register,
>>>> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn
>>>> in the
>>>> wrong regsiter.
>>>
>>> Probably, we should give a chance for the patch which suggests to use
>>> GENERIC_BUG_FRAME:
>>>     https://lore.kernel.org/xen-
>>> devel/8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com/
>>
>> That would be the ideal if someone has time for it. Otherwise, patch
>> #3 needs to be modified (see my answer on patch #2).
>>
>> But I would also be ok with this as a stop-gap for the time being.
> 
> Getting ARM onto GENERIC_BUG_FRAME would definitely be best all around,
> but that is an almost-2-year-old patch with an open "it doesn't compile
> on ARM32" issue.
> 
> I presume that all which is wanted is *a* solution that compiles (and
> works) everywhere we support?

Correct. Looking at the previous e-mail, it sounds like the patch was 
meant to work but it wasn't tested with older compilers and the commit 
message needed some rewording to mention what was tested.

Cheers,

-- 
Julien Grall


