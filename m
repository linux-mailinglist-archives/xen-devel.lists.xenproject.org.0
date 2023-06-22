Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D6739921
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553332.863824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTV-0002zd-EL; Thu, 22 Jun 2023 08:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553332.863824; Thu, 22 Jun 2023 08:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTV-0002xq-BH; Thu, 22 Jun 2023 08:15:29 +0000
Received: by outflank-mailman (input) for mailman id 553332;
 Thu, 22 Jun 2023 08:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J06O=CK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qCFTT-0002xc-Hu
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:15:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f048e08d-10d4-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:15:24 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.37.206.199])
 by support.bugseng.com (Postfix) with ESMTPSA id C3CEA4EE0737;
 Thu, 22 Jun 2023 10:15:22 +0200 (CEST)
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
X-Inumbo-ID: f048e08d-10d4-11ee-8611-37d641c3527e
Message-ID: <6b0ca17e-d6c7-f7f1-e4b1-26977008b873@bugseng.com>
Date: Thu, 22 Jun 2023 10:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v2] xen/include: avoid undefined behavior.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9d222cc83013aaa67b45638b27f5975b60aecb37.1687332385.git.nicola.vetrini@bugseng.com>
 <0fcc228c-548f-9051-b8ce-4d79a3d8293f@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <0fcc228c-548f-9051-b8ce-4d79a3d8293f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/23 10:48, Jan Beulich wrote:
> On 21.06.2023 09:58, Nicola Vetrini wrote:
>> Redefine BUILD_BUG_ON_ZERO to fully comply with C99 avoiding
>> undefined behavior 58 ("A structure or union is defined as
>> containing no named members (6.7.2.1)."
> 
> Here and in the title I'm not happy about you referencing undefined
> behavior. What we do here is use a well-known compiler extension (and I'm
> sure you're aware we do so elsewhere, where it's actually going to remain
> as is from all I can tell right now).
>

Noted, I'll change the commit message.

>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -51,9 +51,10 @@
>>      e.g. in a structure initializer (or where-ever else comma expressions
>>      aren't permitted). */
>>   #define BUILD_BUG_ON_ZERO(cond) \
>> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
>> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) - 1U)
> 
> To be compatible with whatever odd ABIs new ports may have, maybe better to
> AND or multiply with 0? (I also don't think a U suffix is warranted here.)

Good idea

> 
>>   #else
>> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>> +#define BUILD_BUG_ON_ZERO(cond) \
>> +    (sizeof(struct { unsigned u : (cond) ? -1 : sizeof(unsigned) * 8; }) - sizeof(unsigned))
> 
> What's wrong with just giving the bitfield a name:
> 
> #define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int _:-!!(cond); })
> 

A named bitfield with zero width is not allowed by the standard, which 
is why the fix introduces a constant positive width. I'll send a v3 
shortly addressing your previous remarks, though.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

