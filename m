Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B28A341D3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887665.1297131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia8t-0005rG-TA; Thu, 13 Feb 2025 14:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887665.1297131; Thu, 13 Feb 2025 14:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia8t-0005oO-QT; Thu, 13 Feb 2025 14:24:39 +0000
Received: by outflank-mailman (input) for mailman id 887665;
 Thu, 13 Feb 2025 14:24:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tia8s-0005oI-9k
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:24:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tia8q-00GtXl-28;
 Thu, 13 Feb 2025 14:24:36 +0000
Received: from [15.248.3.95] (helo=[10.24.66.127])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tia8q-00CAx2-0d;
 Thu, 13 Feb 2025 14:24:36 +0000
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
	bh=lmu+2YbB1WmfTrdNzUuwoHP7+HBjzwvGGWgLWCT9GK0=; b=cPrS7CP4h8/WRsAIbrSA/W686O
	trUAXbRpoywaeuX0yHvC2GBc+BHg0+LwK2jqJ7tDahLym1HBNYlM0JxRIVoM9W72RL2OxGW5E0QeI
	KLpMfzokv7dnSM+4tH8+WgNYa1zAdZg/CwEcoqXhCdsFV5Flph1ozyPZAqvKsIqaVrlA=;
Message-ID: <2dbe84e9-485b-47e1-8ceb-94ed9b6b13bc@xen.org>
Date: Thu, 13 Feb 2025 14:24:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
 <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/02/2025 14:21, Oleksii Kurochko wrote:
> 
> On 2/13/25 3:07 PM, Andrew Cooper wrote:
>> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>>> Hi Andrew,
>>>
>>> Andrew Cooper<andrew.cooper3@citrix.com> writes:
>>>
>>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>>> Volodymyr Babchuk (4):
>>>>>    common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>>    xen: common: add ability to enable stack protector
>>>>>    xen: arm: enable stack protector feature
>>>>>    CHANGELOG.md: Mention stack-protector feature
>>>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>>
>>>> There's one minor formatting error which can be fixed on commit.
>>>>
>>>> ~Andrew
>>> Thanks for the review. I noticed that this series is not committed. Is
>>> there anything else required from my side?
>>>
>> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
>> enough.

I beg to differ. For low level code, you really ought to have Arm folks 
to confirm this is correct. In fact, I don't think patch #3 it is. So ...

>>
>> And at this point at rc4, you'll need to persuade Oleksii to take it for
>> 4.20.
>>
>> Personally I think it's low risk and worthwhile to take for 4.20, and it
>> was technically completed in time - it just fell between the cracks.
> 
> I think the same it's low risk patch series, so we can take it for 4.20:
>   Release-Acked-by: Oleksii Kurochko<olekskii.kurochko@gmail.com>

... I should not go to 4.20 as-is.

And before someone ask why it wasn't answered early. I can't comment for 
the other Arm maintainers, but I have been away for the past two months. 
So still catching up on my emails.

Cheers,

-- 
Julien Grall


