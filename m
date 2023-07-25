Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BC761BB2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569732.890728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ3H-00052J-SY; Tue, 25 Jul 2023 14:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569732.890728; Tue, 25 Jul 2023 14:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ3H-0004zM-PT; Tue, 25 Jul 2023 14:30:15 +0000
Received: by outflank-mailman (input) for mailman id 569732;
 Tue, 25 Jul 2023 14:30:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOJ3F-0004z0-Ib
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:30:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOJ3B-0003hY-Ur; Tue, 25 Jul 2023 14:30:09 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOJ3B-0006U8-Or; Tue, 25 Jul 2023 14:30:09 +0000
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
	bh=4Vs3l1QEosKolhDvdmkMRtOXHwMJdKxdH7fCelID/dU=; b=dLBc7BQHWLPrpljfhGJcinwVJ1
	KD83OPX3pHZAQf9mRPqfZkhOUALhXUGR5p6CS8LgejIQCAgr7OaGU5dSpi9hNZUHIuYUIfx5+Et4a
	lu9iBxpRPABm/Y81HLL/cK4oOO6rRyH6FD3I5vCfT6ZxPaqvy2Ru3B4qL8Og4QgyC7Yw=;
Message-ID: <6f263328-0fdb-8a8d-69b4-1d05ec742cef@xen.org>
Date: Tue, 25 Jul 2023 15:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
 <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
 <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
 <8ABBDFFB-AE3C-4A8F-8AAA-F0C5EB99C2C3@arm.com>
 <fc1bffbe-c5ce-ba05-ad01-22bb1ff983b7@suse.com>
 <60BC1EAE-ACE2-4D28-9323-51E03D405B35@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <60BC1EAE-ACE2-4D28-9323-51E03D405B35@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2023 15:34, Bertrand Marquis wrote:
>> On 21 Jul 2023, at 16:24, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.07.2023 16:07, Bertrand Marquis wrote:
>>>> On 21 Jul 2023, at 15:08, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 21.07.2023 14:27, Bertrand Marquis wrote:
>>>>> So what should i keep or remove here ?
>>>>
>>>> My understanding so far was that "visibility" merely hides all prompts
>>>> underneath (but then I use the command line version of the tool, not
>>>> menuconfig), so it largely is shorthand for adding "if" to all enclosed
>>>> prompts. Therefore I think all the "if UNSUPPORTED" are redundant and
>>>> could be dropped. But then I'm also working from the understanding that
>>>> "depends on" would behave somewhat differently ...
>>>
>>> If that is ok with you I would rather keep them so that making one of them
>>> SUPPORTED one day will not end up in wrongly making the other one
>>> supported to. The visible if i added was more to "beautify" a bit when
>>> unsupported is not selected so that we do not have an empty menu.
>>
>> You're the maintainer, so you judge what is best. If I was maintainer, the
>> primary thing I would ask for is that there be no redundancy. IOW here
>> either no "if"s or no "visibility".
> 
> In this case i do think that the "if UNSUPPORTED" per entry is important
> so that it clear per config entry which ones are unsupported.
> 
> So if other arm maintainers agree with your point, i would remove the
> "visibility" and keep an empty menu.
> But my vote is to keep both.
> 
> @julien and Stefano: Any view on that ?

I agree with keeping both.

Cheers,

-- 
Julien Grall

