Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D945F70BA15
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 12:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537845.837416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q12kt-0003V5-M8; Mon, 22 May 2023 10:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537845.837416; Mon, 22 May 2023 10:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q12kt-0003TA-HQ; Mon, 22 May 2023 10:27:07 +0000
Received: by outflank-mailman (input) for mailman id 537845;
 Mon, 22 May 2023 10:27:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q12ks-0003T4-Iu
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 10:27:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q12kp-0002Ls-Kv; Mon, 22 May 2023 10:27:03 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q12kp-00010r-F6; Mon, 22 May 2023 10:27:03 +0000
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
	bh=Y3t5PCR+goOLoHSXRN+oulTtCiOKZLDA1W2Ufx8gwQY=; b=gFKViP7m4JxZ+4psxwa7INGeju
	xYMw5du1x4NaEieA+x2RKB+gmKQxpXBD16ajlUzEloPqzIcidIHpIOqKF7UxII80ufKzUkD0TpOja
	lY/E7gBlc0ffrFnPNt27CMWK2R5eXyRHPsE0qI6enIFHD/jrWxrizc/uJ2I1Q9E5PhsM=;
Message-ID: <4c72b060-52b7-a852-f966-5849a78ccc19@xen.org>
Date: Mon, 22 May 2023 11:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] maintainers: add regex matching for xsm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519114824.12482-1-dpsmith@apertussolutions.com>
 <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/05/2023 10:23, Jan Beulich wrote:
> On 19.05.2023 13:48, Daniel P. Smith wrote:
>> XSM is a subsystem where it is equally important of how and where its hooks are
>> called as is the implementation of the hooks. The people best suited for
>> evaluating the how and where are the XSM maintainers and reviewers. This
>> creates a challenge as the hooks are used throughout the hypervisor for which
>> the XSM maintainers and reviewers are not, and should not be, a reviewer for
>> each of these subsystems in the MAINTAINERS file. Though the MAINTAINERS file
>> does support the use of regex matches, 'K' identifier, that are applied to both
>> the commit message and the commit delta. Adding the 'K' identifier will declare
>> that any patch relating to XSM require the input from the XSM maintainers and
>> reviewers. For those that use the get_maintianers script, the 'K' identifier
>> will automatically add the XSM maintainers and reviewers.
> 
> With, aiui, a fair chance of false positives when e.g. XSM hook invocations
> are only in patch context. Much like ...
> 
>> Any one not using
>> get_maintainers, it will be their responsibility to ensure that if their work
>> touches and XSM hook, to ensure the XSM maintainers and reviewers are copied.
> 
> ... manual intervention is needed in the case of not using the script, I
> think people should also be at least asked to see about avoiding stray Cc-s
> in that case. 

I don't particularly like this suggestion because the sender may 
mistakenly believe this is a "stray CC".

Personally, I would prefer to be in CC more often than less often. I 
think we should give the choice to Daniel to decide whether he is happy 
to be in CC potentially more often.

If it is becoming too much then we can decide to adjust the script.

> Unless of course I'm misreading get_maintainers.pl (my Perl
> isn't really great) or the script would be adjusted to only look at added/
> removed lines (albeit even that would leave a certain risk of false
> positives).
> 
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -674,6 +674,8 @@ F:	tools/flask/
>>   F:	xen/include/xsm/
>>   F:	xen/xsm/
>>   F:	docs/misc/xsm-flask.txt
>> +K:  xsm_.*
>> +K:  \b(xsm|XSM)\b

Aside the NIT from Jan, this change is only affecting the number of 
e-mails the XSM maintainers will receive. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

