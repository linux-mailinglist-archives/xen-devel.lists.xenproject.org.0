Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAD8C5124
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721424.1124814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qCS-0004zO-94; Tue, 14 May 2024 11:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721424.1124814; Tue, 14 May 2024 11:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qCS-0004wr-5b; Tue, 14 May 2024 11:20:04 +0000
Received: by outflank-mailman (input) for mailman id 721424;
 Tue, 14 May 2024 11:20:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6qCQ-0004Vc-29
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:20:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6qCP-0004st-N3; Tue, 14 May 2024 11:20:01 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6qCP-00074s-H6; Tue, 14 May 2024 11:20:01 +0000
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
	bh=5/tVt2Dk1f1bUYt40TqN7l9uRdImKRcMPvz2p+l+8l4=; b=ekHZY/o2x9ASvWw9G8JozFRvst
	YMqAXpV9R4eVsWGpDZFEs7eCjTzYK9AJMK6Xv2Zu/lOIhO72OCJv6geyJHMA7szFLW0u7R2t3YOex
	Qn4sVIelKGB/s6hnKQ9l3wXeqLQdCq0vtO0sEz23qq75f4glQ1cBpYPehG10VF3yo0x0=;
Message-ID: <862a7088-240a-42c1-9d36-703840aa3b73@xen.org>
Date: Tue, 14 May 2024 12:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix Rule 10.2 violation
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop>
 <0625f4f2-daaa-4867-8c39-f8e9ce939ca0@xen.org>
 <alpine.DEB.2.22.394.2405131706450.2544314@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2405131706450.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/05/2024 01:09, Stefano Stabellini wrote:
> On Mon, 13 May 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> title: Is this the only violation we have in Xen? If so, then please add the
>> subsystem in the title.
> 
> The only remaining violations are about the use of the "toupper" macro.
> Bugseng is recommending to add a cast to fix those or deviate toupper.

Ok. Please can you add a prefix in the title then?

> 
> 
>> On 11/05/2024 00:37, Stefano Stabellini wrote:
>>> Change opt_conswitch to char to fix a violation of Rule 10.2.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>>> index 2c363d9c1d..3a3a97bcbe 100644
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -49,7 +49,7 @@ string_param("console", opt_console);
>>>    /* Char 1: CTRL+<char1> is used to switch console input between Xen and
>>> DOM0 */
>>>    /* Char 2: If this character is 'x', then do not auto-switch to DOM0 when
>>> it */
>>>    /*         boots. Any other value, or omitting the char, enables
>>> auto-switch */
>>> -static unsigned char __read_mostly opt_conswitch[3] = "a";
>>> +static char __read_mostly opt_conswitch[3] = "a";
>>
>> Looking at the rest of the code, we have:
>>
>> #define switch_code (opt_conswitch[0] - 'a' + 1)
>>
>> Can you confirm whether this is not somehow adding a new violation?
> 
> No, this patch is to fix a violation exactly there.

Thanks for the confirmation:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

