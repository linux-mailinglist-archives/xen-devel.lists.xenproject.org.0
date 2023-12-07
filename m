Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC2808878
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649841.1014828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDsT-0005eJ-34; Thu, 07 Dec 2023 12:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649841.1014828; Thu, 07 Dec 2023 12:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDsS-0005cd-Vs; Thu, 07 Dec 2023 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 649841;
 Thu, 07 Dec 2023 12:53:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBDsR-0005cX-6l
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:53:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDsQ-00039z-7T; Thu, 07 Dec 2023 12:53:14 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDsP-0005U6-T4; Thu, 07 Dec 2023 12:53:14 +0000
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
	bh=M1qSmsOW6kafIeVM0i7Y8hMx3SsB/jPM2B/5jjnpl0Q=; b=Py0AFJlWIVxFyq+4PyoQPGwyIV
	hMVLSjfT0US0R75hUPCmNWdn0MLiT9Br2o93DEVWu7PtLZQ+qO/RwjnIfvVsaNNUomm8APz7Tp6fH
	cqL5QqAMy2ltRNT38WvQPhpd7vNnowIj16ITacMnAI8FRvxle4UTFDQ4sdcSxLbLm+6o=;
Message-ID: <810b1398-20c1-4b1b-98ae-9d78520910f9@xen.org>
Date: Thu, 7 Dec 2023 12:53:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tools/xenstored: remove some command line options
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
 <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
 <fab5cc9d-d97e-405d-9f7a-1b86de097aab@suse.com>
 <2763baaf-110d-457a-b302-12b06bf28b15@xen.org>
 <c3601b9a-67c6-498c-a177-cda94c3c3d47@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c3601b9a-67c6-498c-a177-cda94c3c3d47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2023 12:39, Jan Beulich wrote:
> On 07.12.2023 13:14, Julien Grall wrote:
>> Hi Jan,
>>
>> On 07/12/2023 09:30, Jan Beulich wrote:
>>> On 07.12.2023 09:26, Juergen Gross wrote:
>>>> On 21.11.23 12:40, Juergen Gross wrote:
>>>>> Remove some command line options which have no real use case.
>>>>>
>>>>> Changes in V2:
>>>>> - moved removal of "-N" into last patch of the series, as this is the
>>>>>      only option which seems to have a use case (OTOH using it has some
>>>>>      downsides as well).
>>>>>
>>>>> Juergen Gross (5):
>>>>>      tools/xenstored: remove "-D" command line parameter
>>>>>      tools/xenstored: remove "-V" command line option
>>>>>      tools/xenstored: remove the "-P" command line option
>>>>>      tools/xenstored: remove the "-R" command line option
>>>>>      tools/xenstored: remove "-N" command line option
>>>>>
>>>>>     tools/xenstored/core.c | 81 +++++++-----------------------------------
>>>>>     1 file changed, 12 insertions(+), 69 deletions(-)
>>>>>
>>>>
>>>> I think at least patches 1-4 can go in as they all have the required Acks.
>>>
>>> I'll try to remember to include them in the next swipe. I was kind of
>>> assuming Julien would be taking care of them.
>>
>> Sorry this fell through the cracks. I can do it if you haven't yet done it.
> 
> I haven't yet, no.

Ok. I will take care of patches #1-#4 then.

Cheers,

-- 
Julien Grall

