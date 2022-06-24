Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EB55992C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355485.583172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4i6Z-0007nO-Cq; Fri, 24 Jun 2022 12:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355485.583172; Fri, 24 Jun 2022 12:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4i6Z-0007ki-90; Fri, 24 Jun 2022 12:08:07 +0000
Received: by outflank-mailman (input) for mailman id 355485;
 Fri, 24 Jun 2022 12:08:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4i6X-0007kc-Io
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:08:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4i6X-0005Gb-7b; Fri, 24 Jun 2022 12:08:05 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4i6X-0006zi-12; Fri, 24 Jun 2022 12:08:05 +0000
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
	bh=SydIncRv2k6Y+M8KPuux05mdFu4KZNWWv3IU2bwoSgk=; b=4hoR1+usP+6mat+iUjvDN0v7Ka
	o20/i8aHE4xttvSS9MQkLg5qMIALjRoGzc5mqvU5dLHEq9o7FrOdoADCRLXSGrFY7x96X2xSPgR4W
	KbHADeK2U4Z38eRF/2fYeJZAuJN9x4++0Tm4I0qtnnhFLXQ3kUJDlT9Uaoex1uECDUBc=;
Message-ID: <c304be56-ae9b-121a-007e-1bb5ef06f95b@xen.org>
Date: Fri, 24 Jun 2022 13:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <E5F45AD6-8D0E-447C-9864-6E9F34C1BE0D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E5F45AD6-8D0E-447C-9864-6E9F34C1BE0D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2022 12:40, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 24 Jun 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 24/06/2022 11:53, Luca Fancellu wrote:
>>> Add instructions on how to build cppcheck, the version currently used
>>> and an example to use the cppcheck integration to run the analysis on
>>> the Xen codebase
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 66 insertions(+)
>>> create mode 100644 docs/misra/cppcheck.txt
>>> diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
>>> new file mode 100644
>>> index 000000000000..4df0488794aa
>>> --- /dev/null
>>> +++ b/docs/misra/cppcheck.txt
>>> @@ -0,0 +1,66 @@
>>> +Cppcheck for Xen static and MISRA analysis
>>> +==========================================
>>> +
>>> +Xen can be analysed for both static analysis problems and MISRA violation using
>>> +cppcheck, the open source tool allows the creation of a report with all the
>>> +findings. Xen has introduced the support in the Makefile so it's very easy to
>>> +use and in this document we can see how.
>>> +
>>> +First recommendation is to use exactly the same version in this page and provide
>>> +the same option to the build system, so that every Xen developer can reproduce
>>> +the same findings.
>>
>> I am not sure I agree. I think it is good that each developper use their own version (so long it is supported), so they may be able to find issues that may not appear with 2.7.
> 
> Right now the reality is not that great:
> - 2.8 version of cppcheck has bugs and Misra checking is not working

Can you be more specifics for "bugs". Is it Xen specific?

Also, what do you mean by MISRA checking is not working? Is this a 
regression or intentional?

> - older versions of cppcheck are generating wrong html or xml files

That's fine to say we don't support cppcheck < 2.7 (we do that also for 
the compiler).

Cheers,

-- 
Julien Grall

