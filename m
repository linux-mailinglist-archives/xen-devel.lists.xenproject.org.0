Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02779FF76
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 11:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602149.938545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgiHB-0006xh-98; Thu, 14 Sep 2023 09:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602149.938545; Thu, 14 Sep 2023 09:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgiHB-0006v0-5h; Thu, 14 Sep 2023 09:04:41 +0000
Received: by outflank-mailman (input) for mailman id 602149;
 Thu, 14 Sep 2023 09:04:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgiHA-0006uu-0V
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 09:04:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgiH4-00023L-77; Thu, 14 Sep 2023 09:04:34 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgiH3-00036D-V4; Thu, 14 Sep 2023 09:04:34 +0000
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
	bh=Ca5peWhjmYFfJ54b2Cg0W/+Po0Cuxrzl6sJdjwIyhPI=; b=sRs0R6FOkasGthui+55IAt4coF
	HMkOQLPSDhAPUTXMF37PccUyi+0kHxRdbvVxnUAqZfEjCrC5a1bAUlPziFd2FZ+GArnlSKJHN0V0k
	a5VvlC3/V0vRnOSD7Y+kjC3S2GHcOUUnwGZbOQIgQJD4WdU74R/QfcUYnnjia4ltXSFg=;
Message-ID: <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
Date: Thu, 14 Sep 2023 10:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
 <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/09/2023 07:32, Jan Beulich wrote:
> On 13.09.2023 19:56, Julien Grall wrote:
>> On 11/09/2023 16:01, Jan Beulich wrote:
>>> [1] specifies a long list of instructions which are intended to exhibit
>>> timing behavior independent of the data they operate on. On certain
>>> hardware this independence is optional, controlled by a bit in a new
>>> MSR. Provide a command line option to control the mode Xen and its
>>> guests are to operate in, with a build time control over the default.
>>> Longer term we may want to allow guests to control this.
>>
>> If I read correctly the discussion on the previous version. There was
>> some concern with this version of patch. I can't find anything public
>> suggesting that the concerned were dismissed. Do you have any pointer?
> 
> Well, I can point to the XenServer patch queue, which since then has
> gained a patch of similar (less flexible) functionality (and seeing
> the similarity I was puzzled by this patch, which was posted late
> for 4.17, not having gone in quite some time ago). This to me
> demonstrates that the original concerns were "downgraded". It would
> of course still be desirable to have guests control the behavior for
> themselves, but that's a more intrusive change left for the future.
> 
> Beyond that I guess I need to have Andrew speak for himself.
> 
>>> Since Arm64 supposedly also has such a control, put command line option
>>> and Kconfig control in common files.
>>>
>>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
>>>
>>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This may be viewed as a new feature, and hence be too late for 4.18. It
>>> may, however, also be viewed as security relevant, which is why I'd like
>>> to propose to at least consider it.
>>>
>>> Slightly RFC, in particular for whether the Kconfig option should
>>> default to Y or N.
>>
>> I am not entirely sure. I understand that DIT will help in the
>> cryptographic case but it is not clear to me what is the performance impact.
> 
> The entire purpose of the bit is to have a performance impact, slowing
> down execution when fastpaths could be taken, but shouldn't to achieve
> the named goal. 

I understood that. My question was more related to how much it will 
degrade the performance. This will help to know whether the default 
should be yes or no.

>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
>>>    		alternative_vcall(ctxt_switch_masking, next);
>>>    }
>>>    
>>> +static void setup_doitm(void)
>>> +{
>>> +    uint64_t msr;
>>> +
>>> +    if ( !cpu_has_doitm )
>>
>> I am not very familiar with the feature. If it is not present, then can
>> we guarantee that the instructions will be executed in constant time?
> 
> _We_ cannot guarantee anything. It is only hardware vendors who can. As a
> result I can only again refer you to the referenced documentation. It
> claims that without the bit being supported in hardware, an extensive
> list of insns is going to expose data operand independent performance.

Right. So ...

> 
>> If not, I think we should taint Xen and/or print a message if the admin
>> requested to use DIT. This would make clear that the admin is trying to
>> do something that doesn't work.
> 
> Tainting Xen on all hardware not exposing the bit would seem entirely
> unreasonable to me. If we learned of specific cases where the vendor
> promises are broken, we could taint there, sure. I guess that would be
> individual XSAs / CVEs then for each instance.

... we need to somehow let the user know that the HW it is running on 
may not honor DIT. Tainting might be a bit too harsh, but I think 
printing a
message with warning_add() is necessary.

Cheers,

-- 
Julien Grall

