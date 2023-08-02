Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44976D936
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575241.901045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJ67-0000Ie-Ha; Wed, 02 Aug 2023 21:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575241.901045; Wed, 02 Aug 2023 21:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJ67-0000G1-Ez; Wed, 02 Aug 2023 21:09:35 +0000
Received: by outflank-mailman (input) for mailman id 575241;
 Wed, 02 Aug 2023 21:09:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRJ65-0000Fv-LM
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:09:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRJ61-0005Oi-Bm; Wed, 02 Aug 2023 21:09:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRJ61-0007NH-5y; Wed, 02 Aug 2023 21:09:29 +0000
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
	bh=NakkT8skXSoyT0IxvsaSFsYRCvpGqz0PGAqwjJn4Rec=; b=Pc9DO3TXie9PzBRUoQiOyt1juF
	oJ3jKGrNKU5DgC0qbncPhBcHRqh7JCIB+pYAQdSghGmNtzC/8X/NjTtDJ4EoLOTmHrpIOgpjoChYl
	UFs3syDmvXmhspTL52RxI6J+RiO33PaCBTkJX3rFHZfCatakY/gWHPbJ18rF1l5UZMQE=;
Message-ID: <78c71235-a4f8-ecce-cd58-56d3cc44e88f@xen.org>
Date: Wed, 2 Aug 2023 22:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>, Khem Raj <raj.khem@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230801174930.2995947-1-raj.khem@gmail.com>
 <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
 <f7501e7b-2064-38dd-af32-738e01a830c5@suse.com>
 <c75870a3-d7b4-891f-7c93-c62e97b25fdb@xen.org>
 <a56b1da7-05c1-fcd0-d39f-0e528ea066a6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a56b1da7-05c1-fcd0-d39f-0e528ea066a6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/08/2023 09:01, Jan Beulich wrote:
> On 02.08.2023 09:54, Julien Grall wrote:
>> On 02/08/2023 08:22, Jan Beulich wrote:
>>> On 01.08.2023 23:02, Julien Grall wrote:
>>>> Title: This patch is not arm32 specific anymore. So I would replace
>>>> 'arm32' with 'arm'. This can be done on commit.
>>>>
>>>> On 01/08/2023 18:49, Khem Raj wrote:
>>>>> Assembler from binutils 2.41 rejects [1] this syntax
>>>>>
>>>>> .section "name"[, flags...]
>>>>>
>>>>> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
>>>>>
>>>>> It is almost like a regression compared to 2.40 or older release,
>>>>
>>>> The next word after ',' start with an uppercase. Did you intend to use
>>>> '.' rather than ','?
>>>>
>>>> That said, the documentation has the following:
>>>>
>>>> For SPARC ELF targets, the assembler supports another type of .section
>>>> directive for compatibility with the Solaris assembler:"
>>>
>>> But note that "SPARC" was added there only by the commit introducing the
>>> perceived regression.
>>
>> Yes, I noticed it while replying yesterday. I still would not describe
>> it as a regression mainly because I am not convinced binutils will
>> revert the change and it feels like a good move.
> 
> I agree as to it being unlikely that the change is going to be (partly)
> reverted, unless someone strongly advocated for it. It also wouldn't be
> of much use to us, unless a 2.41.1 was cut very soon.
> 
>> Also, regarding your point about older tree on the bug report. I don't
>> think we guarantee that stable works all new toolchain without any change.
> 
> We don't guarantee that, no, but I think it is in our own interest to
> keep things building with the newest tool chains. When build-testing
> stable tree commits before pushing, I don't want to always have to
> remember to force the build to use an older tool chain, when normally
> my build rune would default to a pretty up-to-date one.

This is where gitlab would definitely help because we can keep 
containers around to build older Xen versions.

>  This is also
> why for this specific class of changes I typically prefer to see them
> also go onto the security-only stable trees.

I am ok if this is backported to older tree. This is trivial enough.

Cheers,

-- 
Julien Grall

