Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866837438B
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 19:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123241.232446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLQS-0007Wu-Hz; Wed, 05 May 2021 17:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123241.232446; Wed, 05 May 2021 17:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLQS-0007Un-Eh; Wed, 05 May 2021 17:35:08 +0000
Received: by outflank-mailman (input) for mailman id 123241;
 Wed, 05 May 2021 17:35:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leLQR-0007Uh-PL
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 17:35:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLQQ-0006rC-Px; Wed, 05 May 2021 17:35:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLQQ-0001zW-Jo; Wed, 05 May 2021 17:35:06 +0000
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
	bh=vO2/1BMS+rEXM2serPa+0DZbUGvvSNfRrgTNgUBOWD8=; b=waXZYXBAXPwQrd/f+fy1SucVLd
	6uitCS/n0zeyQq6A0yNpP5w+O21WmRIh3vqS1CHjBh5FnH1C1/haF2X1SjefVjNhxou/I52Bls8tM
	eNqseV1Iw/FKFNjmZjgKrYezXPQXX/8FOAtMT10lMfFW7h+Sb0G1ClQrJzXbbYZnqWU4=;
Subject: Re: [PATCH v4 3/3] unzstd: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
 <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
Date: Wed, 5 May 2021 18:35:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 29/04/2021 14:26, Jan Beulich wrote:
> On 29.04.2021 13:27, Julien Grall wrote:
>> On 21/04/2021 11:22, Jan Beulich wrote:
>>> While for the original library's purposes these functions of course want
>>> to be externally exposed, we don't need this, and we also don't want
>>> this both to prevent unintended use and to keep the name space tidy.
>>> (When functions have no callers at all, wrap them with a suitable
>>> #ifdef.) This has the added benefit of reducing the resulting binary
>>> size - while this is all .init code, it's still desirable to not carry
>>> dead code.
>>
>> So I understand the desire to keep the code close to Linux and removing
>> the dead code. However I am still not convinced that the approach taken
>> is actually worth the amount of memory saved.
>>
>> How much memory are we talking about here?
> 
> There are no (runtime) memory savings, as is being said by the
> description. There are savings on the image and symbol table sizes
> (see below - .*.0/ holding files as produced without the patch
> applied, while .*.1/ holding output with it in place), the image
> size reduction part of which is - as also expressed by the
> description - a nice side effect, but not the main motivation for
> the change.

Thanks for the providing the information. I have misunderstood your 
original intention.

Reading them again, I have to admit this doesn't really change my view 
here. You are trading a smaller name space or prevent unintended use 
(not clear what would be wrong to call them) to code 
maintenability/readability.

At the same time, this is not a code I usually work on (even if I am 
meant to maintain it). I will leave another maintainer to make the 
decision here.

Cheers,

-- 
Julien Grall

