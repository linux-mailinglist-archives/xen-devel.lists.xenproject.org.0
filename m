Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9649756295
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564487.881930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLN9G-0003SP-TG; Mon, 17 Jul 2023 12:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564487.881930; Mon, 17 Jul 2023 12:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLN9G-0003QC-QU; Mon, 17 Jul 2023 12:16:18 +0000
Received: by outflank-mailman (input) for mailman id 564487;
 Mon, 17 Jul 2023 12:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRey=DD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qLN9F-0003Q6-Hr
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:16:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ae96b8-249b-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 14:16:15 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.206.54])
 by support.bugseng.com (Postfix) with ESMTPSA id 38E694EE0739;
 Mon, 17 Jul 2023 14:16:12 +0200 (CEST)
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
X-Inumbo-ID: b9ae96b8-249b-11ee-8611-37d641c3527e
Message-ID: <2bc64be1-10c0-d064-a5a2-1f076b596e6e@bugseng.com>
Date: Mon, 17 Jul 2023 14:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <d1ccb5e1-d122-88df-e46a-39494b6d6d12@xen.org>
 <299D0BAE-D15E-4260-AF3E-8D84CF058083@arm.com>
 <528fb310-f469-e449-d1c3-269fa7dec750@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <528fb310-f469-e449-d1c3-269fa7dec750@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/07/23 18:50, Julien Grall wrote:
> Hi,
> 
> On 16/07/2023 10:20, Luca Fancellu wrote:
>>> On 14 Jul 2023, at 14:05, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi,
>>>
>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>> The macro 'testop' expands to a function that declares the local
>>>> variable 'oldbit', which is written before being set, but is such a
>>>> way that is not amenable to automatic checking.
>>>
>>> The code is pretty straightforward. So I am not entirely sure why 
>>> Eclair is not happy. Is it because the value is set by assembly code?

Exactly. The reason why I didn't just state that oldbit is always 
written or never read before being written in that function is that I 
was unsure about the meaning of the assembly.

>>
>> Hi Julien,
>>
>> Yes I agree that it’s strange, do you think that that if at line 97 we 
>> initialize oldbit to zero, it would solve the issue?
> 
> At the moment, I am not entirely happy to zero oldbit because we have 
> other places in Xen where we need assembly instructions to read a value 
> (e.g. READ_SYSREG()).
> 
> So I would first like to understand why Eclair can't cope with it.
> 
> Cheers,
> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

