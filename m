Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8218966B0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700337.1093311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvCe-0003we-2A; Wed, 03 Apr 2024 07:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700337.1093311; Wed, 03 Apr 2024 07:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvCd-0003tb-Vq; Wed, 03 Apr 2024 07:38:35 +0000
Received: by outflank-mailman (input) for mailman id 700337;
 Wed, 03 Apr 2024 07:38:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE2n=LI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrvCc-0003tV-HS
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:38:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bab7ff4-f18d-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 09:38:33 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 9C0E14EE0739;
 Wed,  3 Apr 2024 09:38:31 +0200 (CEST)
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
X-Inumbo-ID: 2bab7ff4-f18d-11ee-afe5-a90da7624cb6
Message-ID: <f4ee27ea-2cc8-4f59-8670-51f81eb4e2c1@bugseng.com>
Date: Wed, 3 Apr 2024 09:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] vsprintf: address violations of MISRA C:2012 Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <b1f2dc6467571090f882ce7c0611db13a8c63555.1712042178.git.federico.serafini@bugseng.com>
 <23612847-e364-47cc-a1ca-a571431a3996@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <23612847-e364-47cc-a1ca-a571431a3996@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/24 09:06, Jan Beulich wrote:
> On 02.04.2024 09:22, Federico Serafini wrote:
>> MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
>> shall terminate every switch-clause".
>>
>> Add break statement to address violations of the rule or add
>> pseudo-keyword fallthrough to meet the requirements to deviate it.
> 
> While the latter half of the sentence properly describes the latter
> two of the hunks, the former half doesn't match the former two hunks
> at all:
> 
>> --- a/xen/common/vsprintf.c
>> +++ b/xen/common/vsprintf.c
>> @@ -377,7 +377,7 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
>>               str = number(str, end, hex_buffer[i], 16, 2, -1, ZEROPAD);
>>   
>>               if ( ++i == field_width )
>> -                return str;
>> +                break;
> 
> This "break" is inside for(), not switch().
> 
>> @@ -386,6 +386,8 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
>>                   ++str;
>>               }
>>           }
>> +
>> +        return str;
>>       }
> 
> And this "return" is what now "delimits" case 'h' of the switch(). The
> original situation therefore was that the for() could not be exited by
> other than the "return" inside. The supposedly missing "break" in that
> arrangement would have been "unreachable code", i.e. violate another
> rule. Hence the (undescribed) further re-arrangement.

I'll improve the description.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

