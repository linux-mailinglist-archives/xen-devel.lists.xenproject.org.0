Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A56E7C3C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523518.813634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8fv-0004jZ-AN; Wed, 19 Apr 2023 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523518.813634; Wed, 19 Apr 2023 14:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8fv-0004gl-71; Wed, 19 Apr 2023 14:20:47 +0000
Received: by outflank-mailman (input) for mailman id 523518;
 Wed, 19 Apr 2023 14:20:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pp8ft-0004gf-E1
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:20:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp8fs-0006qG-Hy; Wed, 19 Apr 2023 14:20:44 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp8fs-0000EE-9b; Wed, 19 Apr 2023 14:20:44 +0000
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
	bh=CGAyeELYbnc6DNVGhu+h9UWuX5iEvXwGyTwvm3jBQ8k=; b=vQQ2glI0FT6JZQK27jWrxb1009
	th20PsbAdy4Wv1yy7s54YREWd6amZNcXBywBi27lleG+NKut6kIMPSK/mfd0OrIgRImmNgMooOT2f
	1WtizPgX9pNcRAIeYmrmBfXh9IQJ9i/FT0loYET5dtcSoexA342a+NpbpaGm+W5yPnBk=;
Message-ID: <fcb46556-c729-df8a-1db1-820f7400e429@xen.org>
Date: Wed, 19 Apr 2023 15:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
 <5915f963-97d9-19f3-e797-3fd02b6fb406@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5915f963-97d9-19f3-e797-3fd02b6fb406@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/04/2023 14:39, Michal Orzel wrote:
> Hi Julien,
> 
> On 19/04/2023 15:26, Julien Grall wrote:
>>
>>
>> Hi,
>>
>>>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
>>>> new file mode 100644
>>>> index 0000000000..3296a368a6
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>>>> @@ -0,0 +1,55 @@
>>>> +/*
>>>> + * SPDX-License-Identifier: GPL-2.0-only
>>> Our CODING_STYLE says:
>>> New files should start with a single-line SPDX comment, ..., e.g.
>>> /* SPDX-License-Identifier: GPL-2.0 */
>>>
>>> For me it would be perfectly fine to do as you did but it is not what our docs state
>>> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.
>>
>>   From my reading of https://spdx.dev/ids/#how, what you suggest would
>> not be a valid SPDX-License-Idenfier as everything in needs to be in
>> *one* (including the begin/end comment).
> I said what is written in our CODING_STYLE and what we did already for lots of files, i.e. having 2 comments:
> /* SPDX-License-Identifier: GPL-2.0 */
> /*
>   * ...
>   */

My comment was about your suggestion to update the CODING_STYLE not what 
it is currently written. Sorry if this wasn't clear enough.

>  > In the link you provided, the "*one line*" requirement refers only to 
SPDX short form identifier
> which does not contain any other information like author, description, etc..
Right because the SPDX block is intended to be in own block and there is 
a another block for the author, description, etc.

I am not in favor of changing of the CODING_STYLE and I thought I would 
express it right now to spare the round-trip of writing a patch.

Cheers,

-- 
Julien Grall

