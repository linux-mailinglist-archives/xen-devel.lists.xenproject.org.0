Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76BC40F4D0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 11:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189154.338676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRA9f-0003ai-Bz; Fri, 17 Sep 2021 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189154.338676; Fri, 17 Sep 2021 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRA9f-0003Ya-96; Fri, 17 Sep 2021 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 189154;
 Fri, 17 Sep 2021 09:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mRA9e-0003YU-B1
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 09:27:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRA9b-0002x7-V2; Fri, 17 Sep 2021 09:27:31 +0000
Received: from 54-240-199-97.amazon.com ([54.240.199.97]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mRA9b-0000vv-BX; Fri, 17 Sep 2021 09:27:31 +0000
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
	bh=OVPtBbA96+972EE33f2c7pWRmvVZUFsGppBQap9lvn8=; b=P8yNgPVrzC0w16HGGWaYeLtqbT
	CJI6MUyDfaJGUwHWxgqfLaJ/iZMaW63opY3eSG4gcSxbxyYM560OWqb/u4+ehWgHAZJ5kq0w/mYDy
	cESh6Rofzt830uVvPPBePnxPSTeI+dX3gmf/XMaNAeUbnp49Tfyk5w63o5ZcSFuHcZJY=;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Dmitry Isaikin <isaikin-dmitry@yandex.ru>, rjstone@amazon.co.uk,
 raphning@amazon.co.uk, Paul Durrant <paul@xen.org>
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
 <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
 <16d43ba8-d45f-021c-0e19-e233cb967938@citrix.com>
 <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <01ec71a5-a1f1-b7db-d467-bc4c734db096@xen.org>
Date: Fri, 17 Sep 2021 14:27:20 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f1dda72c-695f-34d3-619e-ec2aa7696bce@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

(+ some AWS folks)

On 17/09/2021 11:17, Jan Beulich wrote:
> On 16.09.2021 19:52, Andrew Cooper wrote:
>> On 16/09/2021 13:30, Jan Beulich wrote:
>>> On 16.09.2021 13:10, Dmitry Isaikin wrote:
>>>> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>>>>
>>>> This significantly speeds up concurrent destruction of multiple domains on x86.
>>> This effectively is a simplistic revert of 228ab9992ffb ("domctl:
>>> improve locking during domain destruction"). There it was found to
>>> actually improve things;
>>
>> Was it?  I recall that it was simply an expectation that performance
>> would be better...
> 
> My recollection is that it was, for one of our customers.
> 
>> Amazon previously identified 228ab9992ffb as a massive perf hit, too.
> 
> Interesting. I don't recall any mail to that effect.

Here we go:

https://lore.kernel.org/xen-devel/de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com/

We have been using the revert for quite a while in production and didn't 
notice any regression.

> 
>> Clearly some of the reasoning behind 228ab9992ffb was flawed and/or
>> incomplete, and it appears as if it wasn't necessarily a wise move in
>> hindsight.
> 
> Possible; I continue to think though that the present observation wants
> properly understanding instead of more or less blindly undoing that
> change.

To be honest, I think this is the other way around. You wrote and merged 
a patch with the following justification:

"
     There is no need to hold the global domctl lock across domain_kill() -
     the domain lock is fully sufficient here, and parallel cleanup after
     multiple domains performs quite a bit better this way.
"

Clearly, the original commit message is lacking details on the exact 
setups and numbers. But we now have two stakeholders with proof that 
your patch is harmful to the setup you claim perform better with your patch.

To me this is enough justification to revert the original patch. Anyone 
against the revert, should provide clear details of why the patch should 
not be reverted.

Cheers,

-- 
Julien Grall

