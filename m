Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7623C6D80
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155247.286633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Elc-0005SG-KS; Tue, 13 Jul 2021 09:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155247.286633; Tue, 13 Jul 2021 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Elc-0005PB-Gy; Tue, 13 Jul 2021 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 155247;
 Tue, 13 Jul 2021 09:31:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3Elb-0005P4-Ax
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 09:31:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3ElZ-0001xH-9u; Tue, 13 Jul 2021 09:31:49 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3ElZ-0001t4-3i; Tue, 13 Jul 2021 09:31:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Z1+YjkNeRwD6c90OG38e0Q4IIhzBXvlJ9JskkUS3Djo=; b=t3xDfYRvkhCQZd8tf+QjKAON/d
	A0dSwSsmbLxakkq0RsSsCjEVsmfxdiAvKm3lyqnOEWPjbHfH6iMzWNwXT69m2ui7yedLYrUR/gBBS
	C6ybYwQWpobCGTu+f+EbRzgCXhW0uzQcgDwN0anBqTpgWAtmJclW53yJoIpL+pqSqndg=;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3ba3b128-027b-f95a-6021-5e34da56d260@xen.org>
Date: Tue, 13 Jul 2021 10:31:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 13/07/2021 10:27, Juergen Gross wrote:
> On 13.07.21 11:20, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
>> wreck the build in an interesting way:
>>
>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>                   from xen/tools/include/xenctrl.h:36,
>>                   from private.h:4,
>>                   from minios.c:29:
>> xen/include/public/memory.h:407:5: error: expected 
>> specifier-qualifier-list before ‘XEN_GUEST_HANDLE_64’
>>       XEN_GUEST_HANDLE_64(const_uint8) buffer;
>>       ^~~~~~~~~~~~~~~~~~~
>>
>> This is happening because xenctrl.h defines __XEN_TOOLS__ and therefore
>> the public headers will start to expose the non-stable ABI. However,
>> xen.h has already been included by a mini-OS header before hand. So
>> there is a mismatch in the way the headers are included.
>>
>> For now solve it in a very simple (and gross) way by including
>> xenctrl.h before the mini-os headers.
>>
>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE 
>> redefinition error")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I couldn't find a better way with would not result to revert the patch
>> (and break build on some system) or involve a longer rework of the
>> headers.
> 
> Just adding a "#define __XEN_TOOLS__" before the #include statements
> doesn't work?
It works but if someone decides to the rework the header and drop 
__XEN_TOOLS__ we would still define in minios.c (we technically don't 
need it). So I find the solution a lot worse than what I wrote.

> 
>> ---
>>   tools/libs/foreignmemory/minios.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/libs/foreignmemory/minios.c 
>> b/tools/libs/foreignmemory/minios.c
>> index c5453736d598..d7b3f0e1c823 100644
>> --- a/tools/libs/foreignmemory/minios.c
>> +++ b/tools/libs/foreignmemory/minios.c
>> @@ -17,6 +17,14 @@
>>    * Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.com>.
>>    */
>> +/*
>> + * xenctlr.h currently defines __XEN_TOOLS__ which affects what is
> 
> Typo, should be xenctrl.h

I will fix it.

-- 
Julien Grall

