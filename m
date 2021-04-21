Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256F366779
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114161.217440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8k8-0005k4-WD; Wed, 21 Apr 2021 09:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114161.217440; Wed, 21 Apr 2021 09:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8k8-0005je-ST; Wed, 21 Apr 2021 09:01:56 +0000
Received: by outflank-mailman (input) for mailman id 114161;
 Wed, 21 Apr 2021 09:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ8k7-0005jZ-4C
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:01:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d9a00f-bdbe-4b65-a763-7a959b4d637a;
 Wed, 21 Apr 2021 09:01:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 702FBB1FD;
 Wed, 21 Apr 2021 09:01:53 +0000 (UTC)
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
X-Inumbo-ID: b3d9a00f-bdbe-4b65-a763-7a959b4d637a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618995713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=665YTB6/AiRmXP0ytNCZ50BcWCbq1ij67+hhBzIqmYQ=;
	b=NR2zfIUMnKMRKHkr2elZwwxjKDW/Id/x5VvWUtB0P7s4gkO36BedfMOYtiN0vngwmLzg1y
	l3stDUpY8GFwlc9of3waJPrHSIWmkrjs4U25lVsf8X076O0J4K7EpiyZ6rF69E9F0joLxM
	modC1SxaDSpzQ91UeI41qLlYjIWZoTw=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Julien Grall <julien@xen.org>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
 <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45147776-10a2-7e8f-3135-6a5a2f8f921a@suse.com>
Date: Wed, 21 Apr 2021 11:01:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 10:07, Rahul Singh wrote:
> Hi Jan,
> 
>> On 20 Apr 2021, at 4:36 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 20.04.2021 15:45, Rahul Singh wrote:
>>>> On 19 Apr 2021, at 1:33 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 19.04.2021 13:54, Julien Grall wrote:
>>>>> For the time being, I think move this code in x86 is a lot better than 
>>>>> #ifdef or keep the code in common code.
>>>>
>>>> Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
>>>> I would perhaps not agree if there was a new CONFIG_* which other
>>>> (future) arch-es could select if desired.
>>>
>>> I agree with Julien moving the code to x86 file as currently it is referenced only in x86 code
>>> and as of now we are not sure how other architecture will implement the Interrupt remapping
>>> (via IOMMU or any other means).  
>>>
>>> Let me know if you are ok with moving the code to x86.
>>
>> I can't answer this with "yes" or "no" without knowing what the alternative
>> would be. As said, if the alternative is CONFIG_X86 #ifdef-ary, then yes.
>> If a separate CONFIG_* gets introduced (and selected by X86), then a
>> separate file (getting built only when that new setting is y) would seem
>> better to me.
> 
> I just made a quick patch. Please let me know if below patch is ok. I move the definition to  "passthrough/x86/iommu.c” file.

This patch on its own looks okay, but assumes you've already taken the
decision that no proper new CONFIG_* would want introducing. That
decision, however, touches (aiui) more than just this one hook.

Jan

