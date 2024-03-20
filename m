Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6623880E22
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695815.1085961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrne-0006nc-64; Wed, 20 Mar 2024 08:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695815.1085961; Wed, 20 Mar 2024 08:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrne-0006lg-36; Wed, 20 Mar 2024 08:59:54 +0000
Received: by outflank-mailman (input) for mailman id 695815;
 Wed, 20 Mar 2024 08:59:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rmrnc-0006lO-Ph
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:59:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmrnc-000246-LX; Wed, 20 Mar 2024 08:59:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmrnc-0001Lz-Gr; Wed, 20 Mar 2024 08:59:52 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=POeuv4ks2fDwz2BnRsfBteaYygmEZZEmiYCrQja7E5M=; b=D0L5NRhmQyEXUjA7AMNzCyQ+SN
	QcLPOVn22foOhgbI7GSzlUpPmYnzZrbCYMxRYoi6lK2AMW1vfkP77haIpEN3U0MTwAGqXN5IkB9IS
	lbKlmLQtwQ8Ygs/DmF4FIcdLrCYbnkXiOYnbhHEbjvbaXyOaLnDWQ3twLn+YGD2TPItc=;
Message-ID: <46810047-21ff-4821-a802-405431d4aae2@xen.org>
Date: Wed, 20 Mar 2024 08:59:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/parse-support-md: Handle BulletList
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240319151509.8937-1-anthony.perard@citrix.com>
 <f4f61385-bf2e-465a-9cd2-a5da23942f7a@xen.org>
In-Reply-To: <f4f61385-bf2e-465a-9cd2-a5da23942f7a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/03/2024 17:45, Julien Grall wrote:
> Hi Anthony,
> 
> On 19/03/2024 15:15, Anthony PERARD wrote:
>> Commit d638e304f13a introduced a bullet list, but parse-support-md
>> choke on it as it doesn't know what to do about it.
>>
>> Introduce ri_BulletList() so that r_content() will find this new
>> function and call it instead of calling process_unknown().
>>
>> Reported-by: Julien Grall <julien@xen.org>
>> Fixes: d638e304f13a ("SUPPORT.MD: Fix matrix generation after 
>> 43c416d0d819 and 77c39a53cf5b")
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> My Perl knowledge is rubbish. But I tested the fix. So:
> 
> Tested-by: Julien Grall <jgrall@amazon.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

> 
> Cheers,
> 
>> ---
>>   docs/parse-support-md | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/docs/parse-support-md b/docs/parse-support-md
>> index a397637639..b04f62da37 100755
>> --- a/docs/parse-support-md
>> +++ b/docs/parse-support-md
>> @@ -218,6 +218,13 @@ sub ri_DefinitionList {
>>       }
>>   }
>> +sub ri_BulletList {
>> +    # Assume a paragraph introduce this bullet list, which would mean 
>> that
>> +    # ri_Para() has already been called, and there's nothing else to 
>> do about
>> +    # the caveat.
>> +    return;
>> +}
>> +
>>   sub process_unknown {
>>       my ($c, $e) = @_;
>>       $had_unknown = Dumper($e);
> 

-- 
Julien Grall

