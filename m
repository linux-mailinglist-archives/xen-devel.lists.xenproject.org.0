Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33462651E2C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466883.725848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZNq-00013u-82; Tue, 20 Dec 2022 09:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466883.725848; Tue, 20 Dec 2022 09:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZNq-00011j-55; Tue, 20 Dec 2022 09:58:02 +0000
Received: by outflank-mailman (input) for mailman id 466883;
 Tue, 20 Dec 2022 09:58:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7ZNo-00011b-Ru
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:58:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7ZNj-0004Pb-2Z; Tue, 20 Dec 2022 09:57:55 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7ZNi-0000s1-Sp; Tue, 20 Dec 2022 09:57:55 +0000
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
	bh=/HkDCNYgpSQPesn1E1x/ZtLF87jsjQ++wmlUNIEfawg=; b=EEMJywfajEHmBRm5upzseIFPAE
	Ol70ANqL2vXm+WFy0GycnqN78Y6dBgi9sCZywSRcDWd7G2/XCkPBRol3FItVQ6MS2ybJYt3j2UpqP
	02XuUgB4N1ry1NRFHqA59ww272ub4VD4kXQnWjNueX7LJz4/h4q1MKEvjZe25HGSRobU=;
Message-ID: <2fe13837-75f1-3f6c-6be2-d3cd762aa310@xen.org>
Date: Tue, 20 Dec 2022 09:57:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 05/18] arm: cppcheck: fix misra rule 20.7 on
 arm/include/asm/string.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-6-luca.fancellu@arm.com>
 <4b51edb0-a203-a6d1-b660-914dc0c87bf2@xen.org>
 <72ebe791-7e3a-acc0-0021-cbffed69e10d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72ebe791-7e3a-acc0-0021-cbffed69e10d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 09:38, Jan Beulich wrote:
> On 20.12.2022 10:12, Julien Grall wrote:
>> On 20/12/2022 08:50, Luca Fancellu wrote:
>>> Cppcheck has found a violation of rule 20.7 for the macro memset
>>> about missing parenthesis for the "n" argument, while the parenthesis
>>> are not mandatory because the argument is never used in an
>>> expression, adding them will not harm code and readability, so fix
>>> the finding adding parenthesis for the argument.
>>
>> This is something I have argued against in the past (see [1]). So...
>>
>>>
>>> Eclair and coverity does not report this finding.
>>
>> ... if neither Eclair nor Coverity report it then I think this should be
>> a bug report against Cppcheck.
> 
> Furthermore in reply to my "Arm32: tidy the memset() macro" you said [1]
> 
> "In this case, Linux has removed __memzero() is patch ff5fdafc9e97 "ARM:
>   8745/1: get rid of __memzero()" because the performance difference with
>   memset() was limited. For Xen, I think we should also remove the function."
> 
> So either you want to follow that route, or it would rather be my patch
> which ought to be considered for merging, not the least because it also
> deals with yet another MISRA violation.

I forgot that discussion, thanks for the reminder! I would still prefer 
if we port the Linux change to Xen.

Cheers,

-- 
Julien Grall

