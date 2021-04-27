Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5BA36C96E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118730.224973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQZf-0001AE-Jp; Tue, 27 Apr 2021 16:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118730.224973; Tue, 27 Apr 2021 16:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQZf-00019p-Ge; Tue, 27 Apr 2021 16:28:35 +0000
Received: by outflank-mailman (input) for mailman id 118730;
 Tue, 27 Apr 2021 16:28:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbQZe-00019j-8r
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:28:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbQZc-0003FA-GB; Tue, 27 Apr 2021 16:28:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbQZc-0007vt-8k; Tue, 27 Apr 2021 16:28:32 +0000
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
	bh=StjzRaZfN+kNWl72qIf7AbhfCy0WcOXJl0Cq4/uXr1Q=; b=Z3iWNztLdJQm3Qm40DeeyBcnQM
	RKLsebhYzRWHTZ9h8CFVX/kJQ6GTHVt4/849DADBibmhucEC07AVo/iOMFCIEEqwGplFxCBYEysFi
	9BXGOAb2eZ7L2lnTOd3CU2n2cd7DH965vgch9aLvvGpX+WFElh1vXmihHxbCk3LNneSQ=;
Subject: Re: [PATCH 07/14] tools/xl: Use const whenever we point to literal
 strings
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-8-julien@xen.org> <YIg1+x/cR1Ft5H3u@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <7bda03dd-d943-98c5-e2e8-69f6a9677da0@xen.org>
Date: Tue, 27 Apr 2021 17:28:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIg1+x/cR1Ft5H3u@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 27/04/2021 17:04, Anthony PERARD wrote:
> On Mon, Apr 05, 2021 at 04:57:06PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> literal strings are not meant to be modified. So we should use const
>> char * rather than char * when we want to store a pointer to them.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
>> index 137a29077c1e..3052e3db0072 100644
>> --- a/tools/xl/xl.h
>> +++ b/tools/xl/xl.h
>> @@ -21,13 +21,13 @@
>>   #include <xentoollog.h>
>>   
>>   struct cmd_spec {
>> -    char *cmd_name;
>> +    const char *cmd_name;
>>       int (*cmd_impl)(int argc, char **argv);
>>       int can_dryrun;
>>       int modifies;
>> -    char *cmd_desc;
>> -    char *cmd_usage;
>> -    char *cmd_option;
>> +    const char *cmd_desc;
>> +    const char *cmd_usage;
>> +    const char *cmd_option;
>>   };
> 
> Those const in cmd_spec feels almost the wrong things to do, but it is
> also unlikely that we would want to modify the strings in a cmd_spec so
> I guess that's fine.

May I ask why you think it feels wrong things to do?

Using char * to point to literal string is a recipe for disaster because 
the compiler will not warn you if you end up to write in them. Instead, 
you will get a runtime error. xl only deals with a single domain, so the 
consequences will not be too bad, but for other piece of the userspace 
(e.g. libxl, xenstored) this would be a nice host DoS.

Both GCC and Clang provide an option (see -Wwrite-strings) to throw an 
error at compile time if char * points to literal string. I would like 
to enable it because it will harden our code.

The price to pay to use const char * for some fo the field. This is not 
that bad compare to the other options (e.g strdup(), casting...) or the 
potential fallout with the existing code.

> 
> I'm thinking that `cmd_table` should be const as well (I mean
> const struct cmd_spec cmd_table[];) as there is no reason to modify the
> entries once they are in the table. I'll send a patch.
> 
> 
> The rest looks good.
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Cheers,

-- 
Julien Grall

