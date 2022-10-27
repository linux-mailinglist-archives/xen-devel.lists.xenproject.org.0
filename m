Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A060F718
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 14:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431031.683490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1u8-0002f6-LD; Thu, 27 Oct 2022 12:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431031.683490; Thu, 27 Oct 2022 12:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1u8-0002c4-IF; Thu, 27 Oct 2022 12:22:36 +0000
Received: by outflank-mailman (input) for mailman id 431031;
 Thu, 27 Oct 2022 12:22:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oo1u7-0002by-8B
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 12:22:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo1u6-0002GF-3c; Thu, 27 Oct 2022 12:22:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo1u5-0005Q5-Rd; Thu, 27 Oct 2022 12:22:34 +0000
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
	bh=nyPPKmCS1j28BPWFcMl8JsK0BaQ8YaQOQoEUDg9JxiU=; b=0ziwU8Mri+kIYcIGdfMzTDI8wF
	Rnwxad51noIQ6o1rQgEjW22wVnKEQxZHkd7GIDNq8XrYHqRYMAwCUN9p3DUd1dIxwh7epI/LtJ6v7
	/mhzoA0B+4BEmUXAf0VaCFoYEGoAFpowUw9GA9dS3issKQQxFvRLBWRjiDaWUh9bhAJU=;
Message-ID: <77793987-d638-deaa-f3a5-4a9aba3d2a30@xen.org>
Date: Thu, 27 Oct 2022 13:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare the
 underlying page
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
 <b9c190ee-f916-b03d-e56f-0a54d93ba948@suse.com>
 <AS8PR08MB7991C7034FE22A68AE77A39A92309@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991C7034FE22A68AE77A39A92309@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry, Jan,

Sorry for the late reply.

On 26/10/2022 03:03, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, October 26, 2022 12:07 AM
>> To: Henry Wang <Henry.Wang@arm.com>
>> Cc: xen-devel@lists.xenproject.org; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
>> Wei Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>
>> Subject: [4.17?] Re: [PATCH] common: map_vcpu_info() wants to unshare
>> the underlying page
>>
>> On 25.10.2022 17:42, Roger Pau Monné wrote:
>>> On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
>>>> Not passing P2M_UNSHARE to get_page_from_gfn() means there won't
>> even be
>>>> an attempt to unshare the referenced page, without any indication to the
>>>> caller (e.g. -EAGAIN). Note that guests have no direct control over
>>>> which of their pages are shared (or paged out), and hence they have no
>>>> way to make sure all on their own that the subsequent obtaining of a
>>>> writable type reference can actually succeed.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I didn't Cc you on the initial submission because mem-sharing isn't a
>> supported feature, but upon reconsideration I thought I'd at least ask
>> whether you would want to give this a release-ack. I don't really see
>> any risk associated with it.
> 
> By looking at the patch itself, this change seems ok to me, so I think
> I will not block it, but I think Arm maintainers' approval might be needed
> because of the discussion in [1], so I added them for their information.
> If Arm maintainers do not object the change, you can have my release-ack.

The P2M query type is so far ignored on Arm as we neither support 
populate-on-demand nor memsharing.

I am assuming that if we ever introduce any those of features, we would 
follow the same behavior as x86. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

