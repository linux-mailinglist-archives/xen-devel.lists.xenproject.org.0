Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE530D61A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 10:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80859.148209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7EJc-0005JG-II; Wed, 03 Feb 2021 09:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80859.148209; Wed, 03 Feb 2021 09:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7EJc-0005Ir-F7; Wed, 03 Feb 2021 09:19:12 +0000
Received: by outflank-mailman (input) for mailman id 80859;
 Wed, 03 Feb 2021 09:19:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l7EJb-0005Im-1y
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 09:19:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l7EJY-0004Xt-Qv; Wed, 03 Feb 2021 09:19:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l7EJY-00078V-Hg; Wed, 03 Feb 2021 09:19:08 +0000
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
	bh=Y5xbycL6If9nruYgguxOqo7byWRB1Be/Kv3cglmw/hA=; b=JTH58skLf9xQv7vVE7pWroXQv9
	ALsM/YjdxVYwctdA59WeQBc6E1R3630OtdHE9JPFrSl/2TUYN0+y4rUTvgnh56BJ74yRcz5CP5fDA
	Uiqn666LaFvBOJQzE6YQC3HHh2JjV1PKtyv+/zfc3yi2qz0rcwZUe5nFkGnHdBm6vvQQ=;
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
 <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
 <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
 <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
 <501664dbdb736eaa4d9c05255dedfd7ad3e694fa.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1ab7ad80-c027-ffdd-8188-e1ab1fd53335@xen.org>
Date: Wed, 3 Feb 2021 09:19:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <501664dbdb736eaa4d9c05255dedfd7ad3e694fa.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 03/02/2021 07:31, Dario Faggioli wrote:
> On Tue, 2021-02-02 at 15:23 +0000, Julien Grall wrote:
>> In reality, it is probably still too early as a pCPU can be
>> considered
>> quiesced until a call to rcu_lock*() (such rcu_lock_domain()).
>>
> Well, yes, in theory, we could track down which is the first RCU read
> side crit. section on this path, and put the call right before that (if
> I understood what you mean).

Oh, that's not what I meant. This will indeed be far more complex than I 
originally had in mind.

AFAIU, the RCU uses critical section to protect data. So the "entering" 
could be used as "the pCPU is not quiesced" and "exiting" could be used 
as "the pCPU is quiesced".

The concern with my approach is we would need to make sure that Xen 
correctly uses the rcu helpers. I know Juergen worked on that recently, 
but I don't know whether this is fully complete.

Cheers,

-- 
Julien Grall

