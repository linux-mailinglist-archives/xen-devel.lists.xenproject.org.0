Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C239EC2C8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853721.1267105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD2v-0005SJ-Bx; Wed, 11 Dec 2024 03:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853721.1267105; Wed, 11 Dec 2024 03:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD2v-0005Q8-91; Wed, 11 Dec 2024 03:05:53 +0000
Received: by outflank-mailman (input) for mailman id 853721;
 Wed, 11 Dec 2024 03:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLD2t-0004v5-CI
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:05:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d05216c8-b76c-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 04:05:49 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733886337935142.06994430560655;
 Tue, 10 Dec 2024 19:05:37 -0800 (PST)
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
X-Inumbo-ID: d05216c8-b76c-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733886339; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jq3cB01e+q6IoRNReQp6lmHqAnZZf3NambExyUlCaJS26QyxiKJ7qXl4vkhuqqPfyzQrpqOgRBGE8aTVN9ecfx0dUTi+xX/UnmyT/OMJBSFu54HV/KHlJLkv7fafSHtHzn9KVnihjdojAAemoysZzJa3cPBxu8rWrUXwY+dRcvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886339; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FBwm+DVWo17DNhDVIoOYs3CG1EuER4iJJ7HL5yW7lN8=; 
	b=mKhs1SBOhMPrYzi/dA4IeDYI6W2z69CF5evhFuNb6/fDp0b7Ez+bfuB6yACsT0eEjXMUWsTvz5pY7TM0BfD32sibd57PqjPJ2Fkg/WsPED2HAuEtnARagw2/3YB7UuwJr1/jneqVE6fmRao8KKFzeatscTvIXTezY/+LCxHC5GY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886339;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FBwm+DVWo17DNhDVIoOYs3CG1EuER4iJJ7HL5yW7lN8=;
	b=iTDilk1jr2I2dTP311drMfI9Df0PGHfOyy9DLI2C3Y6M+AEe6vK7PevJtHe72KbH
	+6NhUnEQOAP3qI+QVFWteZbMPaNt9+bCM4rgyLMmGMBymVzJUUDu2JKrT/RJjDEqPOF
	Ri8PGxHpka4lBRPvsrfGI9Z3419FMoXUAtiPQdBY=
Message-ID: <3b508660-f584-429e-8721-31b7d026cf0a@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:05:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
 <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
 <87779b38-c027-45c3-a7af-f3e2b4b2a0f5@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <87779b38-c027-45c3-a7af-f3e2b4b2a0f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/24 05:05, Jan Beulich wrote:
> On 26.11.2024 11:03, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -53,8 +53,12 @@ config HAS_ALTERNATIVE
>>>   config HAS_COMPAT
>>>   	bool
>>>   
>>> +config LIB_DEVICE_TREE
>>> +    bool
>>
>> Nit: Indentation is wrong here and ...
>>
>>>   config HAS_DEVICE_TREE
>>>   	bool
>>> +    select LIB_DEVICE_TREE
>>
>> ... here.
> 
> Oh, and - please don't put LIB_DEVICE_TREE in the middle of (sorted) HAS_*.
> It wants to move past them, before MEM_*.

ack.

v/r,
dps

