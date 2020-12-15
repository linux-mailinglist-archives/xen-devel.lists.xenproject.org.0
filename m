Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DB2DADE5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 14:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54069.93603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpAEt-00046o-6e; Tue, 15 Dec 2020 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54069.93603; Tue, 15 Dec 2020 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpAEt-00046O-35; Tue, 15 Dec 2020 13:19:39 +0000
Received: by outflank-mailman (input) for mailman id 54069;
 Tue, 15 Dec 2020 13:19:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpAEr-00046E-Em
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 13:19:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpAEq-0006y0-7j; Tue, 15 Dec 2020 13:19:36 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpAEp-0005BJ-Um; Tue, 15 Dec 2020 13:19:36 +0000
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
	bh=1qVcZQEO+1OxKDOOLU7DQI0+5rG1VyXBNOheLar7arA=; b=2F5uJt34K3RGtS2yTeogvWze+F
	IETk1Jjk2OX5zoOy1mQgdGSzilxnK1vGVGCGNhARMCmQMZRAX/UJ6PO25HQMPs1EcJjkVUG5lkwPO
	g7P93Kx27D1+k6SthAyDm3LnVO3n6pg7lymMM6NHw21mLKS147jUczp9X3lUAAGKLHdY=;
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201215112610.1986-1-julien@xen.org>
 <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04455739-f07f-3da8-f764-33600a9cab6f@xen.org>
Date: Tue, 15 Dec 2020 13:19:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2020 11:46, Jan Beulich wrote:
> On 15.12.2020 12:26, Julien Grall wrote:
>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -23,7 +23,13 @@
>>   #include <asm/bug.h>
>>   
>>   #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
>> +#define WARN_ON(p)  ({                  \
>> +    bool __ret_warn_on = (p);           \
> 
> Please can you avoid leading underscores here?

I can.

> 
>> +                                        \
>> +    if ( unlikely(__ret_warn_on) )      \
>> +        WARN();                         \
>> +    unlikely(__ret_warn_on);            \
>> +})
> 
> Is this latter unlikely() having any effect? So far I thought it
> would need to be immediately inside a control construct or be an
> operand to && or ||.

The unlikely() is directly taken from the Linux implementation.

My guess is the compiler is still able to use the information for the 
branch prediction in the case of:

if ( WARN_ON(...) )

Cheers,

> Jan
> 

-- 
Julien Grall

