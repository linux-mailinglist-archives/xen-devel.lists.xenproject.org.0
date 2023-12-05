Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FC8059F8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648131.1012163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYIu-0003tT-Aw; Tue, 05 Dec 2023 16:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648131.1012163; Tue, 05 Dec 2023 16:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYIu-0003rr-78; Tue, 05 Dec 2023 16:29:48 +0000
Received: by outflank-mailman (input) for mailman id 648131;
 Tue, 05 Dec 2023 16:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAYIs-0003qe-0b
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAYIo-0001tB-Bg; Tue, 05 Dec 2023 16:29:42 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAYIo-0004ji-3b; Tue, 05 Dec 2023 16:29:42 +0000
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
	bh=lXUiWPPltrThPXRV+LzJfKYclvUaKlvlfvmMUY4S1ks=; b=ysHPJCuG3gYlvE/11JIyb5diDl
	AsFEXSr+MYrOBoXAgzITCxil4/DWzVwO8rhkaS1AR9VFwt7OGkgm3TGyJ1PmXlj+8fOxKRIhBHuXR
	cdxpvcjc3OU+na4VKZRMi3psGyI51KH3+no5Dbw/lxfmnOOtN7ls8VIPB24uK+Cpx88M=;
Message-ID: <4e56e585-c5f9-4290-94d3-c0a6789188b4@xen.org>
Date: Tue, 5 Dec 2023 16:29:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
 <5a05e194-28d1-409d-9f45-ca4de0fc78c8@app.fastmail.com>
 <fcdab8c1-b0ea-4d7a-943e-2180b13234fd@xen.org>
 <ab8c9daa-9543-4aed-85f7-69febd85aeb9@app.fastmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ab8c9daa-9543-4aed-85f7-69febd85aeb9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 05/12/2023 14:37, Arnd Bergmann wrote:
> On Tue, Dec 5, 2023, at 15:19, Julien Grall wrote:
>> On 05/12/2023 14:10, Arnd Bergmann wrote:
>>> On Tue, Dec 5, 2023, at 15:01, Julien Grall wrote:
>>>> On 05/12/2023 13:59, Jan Beulich wrote:
>>>>> On 05.12.2023 14:46, Julien Grall wrote:
>>> This would repeat the mistake that we had in Linux in the
>>> past (and still do in some drivers): Simply dereferencing
>>> a misaligned pointer is always a bug, even on architectures
>>> that have efficient unaligned load/store instructions,
>>> because C makes this undefined behavior and gcc has
>>> optimizations that assume e.g. 'int *' to never have
>>> the lower two bits set [1].
>>
>> Just to clarify, I haven't suggested to use 'int *'. My point was more
>> that I don't think that the helpers would work as-is on arm32 because
>> even if the ISA allows a direct access, we are setting the bit in SCTLR
>> to disable unaligned access.
>>
>> As Juergen is proposing a common header, then I could ask him to do the
>> work to confirm that the helpers properly work on arm32. But I think
>> this is unfair.
> 
> When I introduced the helpers in Linux, I showed that these
> produce the best output on all modern compilers (at least gcc-5,
> probably earlier) for both architectures that allow unaligned
> access and for those that don't. We used to have architecture
> specific helpers depending on what each architecture could
> do, but all the other variants we had were either wrong or
> less efficient.
> 
> If for some reason an Arm system is configured to trap
> all unaligned access, then you must already pass
> -mno-unaligned-access to the compiler to prevent certain
> optimizations, and then the helpers will still behave
> correctly (the same way they do on armv5, which never has
> unaligned access). On armv7 with -munaligned-access, the
> same functions only prevent the use of stm/ldm and strd/ldrd
> but still use ldr/str.

Unfortunately we don't explicitely do. This would explain why I saw some 
issues with certain compiler [1].

So I agree that adding -mno-unaligned-access for arm32 makes sense.

@Juergen, do you want me to send a patch?

Cheers,

[1] c71163f6-2646-6fae-cb22-600eb0486539@xen.org

-- 
Julien Grall

