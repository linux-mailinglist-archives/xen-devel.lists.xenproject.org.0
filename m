Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BE285BB6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 11:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3356.9711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ5WR-0004AH-Ds; Wed, 07 Oct 2020 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3356.9711; Wed, 07 Oct 2020 09:14:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ5WR-00049s-AW; Wed, 07 Oct 2020 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 3356;
 Wed, 07 Oct 2020 09:14:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ5WQ-00049n-6z
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:14:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56ed6a3d-4ffb-40c3-8786-251ba8426add;
 Wed, 07 Oct 2020 09:14:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67BBCAC12;
 Wed,  7 Oct 2020 09:14:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ5WQ-00049n-6z
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:14:06 +0000
X-Inumbo-ID: 56ed6a3d-4ffb-40c3-8786-251ba8426add
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 56ed6a3d-4ffb-40c3-8786-251ba8426add;
	Wed, 07 Oct 2020 09:14:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602062044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KpFFuvrOT/srWnH9r6/AQUJ2IcEqImp+4OUxPM2kgo=;
	b=vPVAzRGdnU78YBWAGo88v0Zf3RB4Zuvlz0ag4FmuFUSEhU8K9bW238+HsNk75+TfIrCVyE
	YRmoisuW5fLnD1gqr3IL66O74Tawganez070/DAVx47ZUCpCjkgmMicjutNDTcXFdDki0y
	AT9Q7YO8x+nhdwhouDvvm55UBFCQxAA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67BBCAC12;
	Wed,  7 Oct 2020 09:14:04 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <bc191370356c300f84a16d10345d4a0d646f5bae.1601977978.git.bertrand.marquis@arm.com>
 <30a4ddc0-9443-ab02-341c-ae08af7fddea@suse.com>
 <B3E4C5D5-5999-4D92-8F56-FFA7019CD9BA@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <209289fb-6de5-07d7-5597-2bf8d0a58f6e@suse.com>
Date: Wed, 7 Oct 2020 11:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <B3E4C5D5-5999-4D92-8F56-FFA7019CD9BA@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.10.20 10:56, Bertrand Marquis wrote:
> Hi Jurgen,
> 
>> On 7 Oct 2020, at 09:39, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 07.10.20 10:28, Bertrand Marquis wrote:
>>> Use memcpy in getBridge to prevent gcc warnings about truncated
>>> strings. We know that we might truncate it, so the gcc warning
>>> here is wrong.
>>> Revert previous change changing buffer sizes as bigger buffers
>>> are not needed.
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> Changes in v2:
>>>   Use MIN between string length of de->d_name and resultLen to copy only
>>>   the minimum size required and prevent crossing to from an unallocated
>>>   space.
>>> ---
>>>   tools/libs/stat/xenstat_linux.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
>>> index d2ee6fda64..0ace03af1b 100644
>>> --- a/tools/libs/stat/xenstat_linux.c
>>> +++ b/tools/libs/stat/xenstat_linux.c
>>> @@ -29,6 +29,7 @@
>>>   #include <string.h>
>>>   #include <unistd.h>
>>>   #include <regex.h>
>>> +#include <xen-tools/libs.h>
>>>     #include "xenstat_priv.h"
>>>   @@ -78,7 +79,13 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
>>>   				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>>>     				if (access(tmp, F_OK) == 0) {
>>> -					strncpy(result, de->d_name, resultLen);
>>> +					/*
>>> +					 * Do not use strncpy to prevent compiler warning with
>>> +					 * gcc >= 10.0
>>> +					 * If de->d_name is longer then resultLen we truncate it
>>
>> s/then/than/
> 
> Will fix
> 
>>
>>> +					 */
>>> +					memcpy(result, de->d_name, MIN(strnlen(de->d_name,
>>> +									sizeof(de->d_name)),resultLen - 1));
>>
>> You can't use sizeof(de->d_name) here, as AFAIK there is no guarantee
>> that de->d_name isn't e.g. defined like "char d_name[]".
>>
>> My suggestion to use NAME_MAX as upper boundary for the length was
>> really meant to be used that way.
>>
>> And additionally you might want to add 1 to the strnlen() result in
>> order to copy the trailing 0-byte, too (or you should zero out the
>> result buffer before and omit writing the final zero byte).
>>
>> Thinking more about it zeroing the result buffer is better as it even
>> covers the theoretical case of NAME_MAX being shorter than resultLen.
> 
> Setting the result buffer completely to 0 and doing after a copy sounds like
> a big complexity.
> 
> How about:
> copysize = MIN(strnlen(de->d_name,NAME_MAX), resultLen - 1);
> memcpy(result, de->d_name, copysize);
> result[copysize + 1] = 0

result[copysize] = 0;

> 
> This would cover the case where NAME_MAX is shorter then resultLen.

Why is:

memset(result, 0, resultLen);
memcpy(result, de->d_name, MIN(strnlen(de->d_name,NAME_MAX), resultLen - 
1));

A big complexity?

In the end both variants are fine.


Juergen

