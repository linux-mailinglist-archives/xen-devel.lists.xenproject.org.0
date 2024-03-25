Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49207889C5D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 12:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697713.1088767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiKp-0000V1-FF; Mon, 25 Mar 2024 11:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697713.1088767; Mon, 25 Mar 2024 11:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiKp-0000TL-C6; Mon, 25 Mar 2024 11:17:47 +0000
Received: by outflank-mailman (input) for mailman id 697713;
 Mon, 25 Mar 2024 11:17:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1roiKn-0000T9-UH
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 11:17:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1roiKl-0000Eh-BE; Mon, 25 Mar 2024 11:17:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1roiKl-0007iY-37; Mon, 25 Mar 2024 11:17:43 +0000
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
	bh=mpn8L1ljf7AtccoZRkolubYU3MEj+wmmtgKXEnHgWAg=; b=rN/aybtuVxZKYOuzh7CkwwEsCL
	sJT8SVhURYmtOI/MWy6+QgNFugAHCU8MPD9Y2VBjFOVmHb9LcXrpBT1Ib1eJ21RJe8emnrUBWsOSt
	koAMIHsUJrOrV8/txVLBdLMWj3Cvig1j2MyUB3xPDbSr1a1M7sMVykwy+IbI8Swvo5SM=;
Message-ID: <1a13510a-6085-411d-8d7a-788da9a16e09@xen.org>
Date: Mon, 25 Mar 2024 11:17:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, michal.orzel@amd.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
 <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
 <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
 <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
 <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
 <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
 <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
 <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop>
 <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com>
 <alpine.DEB.2.22.394.2403211140540.1569010@ubuntu-linux-20-04-desktop>
 <a5c01d46-eb46-49d1-8ffd-98b6d1680daa@xen.org>
 <b6430745-2b1a-43e7-9f11-88c8c8f04b4a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b6430745-2b1a-43e7-9f11-88c8c8f04b4a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/03/2024 11:16, Jan Beulich wrote:
> On 22.03.2024 00:17, Julien Grall wrote:
>> Hi Stefano,
>>
>> I haven't fully read the thread. But I wanted to clarify something.
>>
>> On 21/03/2024 19:03, Stefano Stabellini wrote:
>>>>> Or possibly unsigned long depending on the parameter.
>>>>
>>>> You're contradicting yourself: You mean to advocate for fixed-width types,
>>>> yet then you suggest "unsigned long".
>>>
>>> No. I explained it in another thread a couple of days ago. There are
>>> cases where we have fixed-width types but the type changes by
>>> architecture: 32-bit for 32-bit archs and 64-bit for 64-bit archs.
>>> Rather than having #ifdefs, which is also an option, that is the one
>>> case where using "unsigned long" could be a decent compromise. In this
>>> context "unsigned long" means register size (on ARM we even have
>>> register_t). Once you pick an architecture, the size is actually meant
>>> to be fixed. In fact, it is specified in this document. Which is one of
>>> the reasons why we have to use == in this document and not >=. In
>>> general, fixed-width types like uint32_t are better because they are
>>> clearer and unambiguous. When possible I think they should be our first
>>> choice in ABIs.
>>
>> "unsigned long" is not fixed in a given architecture. It will change
>> base on the data model used by the OS. For instance, for Arm 64-bit, we
>> have 3 models: ILP32, LP64, LLP64. Only on LP64, 'unsigned long' is 32-bit.
> 
> "... is 64-bit" you mean?

Whoops. Yes!

Cheers,

-- 
Julien Grall

