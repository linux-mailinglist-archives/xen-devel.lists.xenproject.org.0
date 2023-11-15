Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA47EC138
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633566.988483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3DyF-0003H2-F8; Wed, 15 Nov 2023 11:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633566.988483; Wed, 15 Nov 2023 11:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3DyF-0003EO-C6; Wed, 15 Nov 2023 11:22:11 +0000
Received: by outflank-mailman (input) for mailman id 633566;
 Wed, 15 Nov 2023 11:22:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3DyE-0003EI-5X
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:22:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3DyD-0007UC-Jf; Wed, 15 Nov 2023 11:22:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3DyD-0008UD-DX; Wed, 15 Nov 2023 11:22:09 +0000
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
	bh=qo3KaNunEgv53SCHfI/K4uLo/sJkZL6X4BgMutUSWoY=; b=hYgAFk/J5S7/tUebh4rKjpYw+y
	Gk5KEf5cwKrYJ6JjMDLVFcXSbkN7T7veNC4eGoFtVZ3jeddZIYDh9hqXD0sAaaMiy+pTf0T0OCND2
	y22hjHeHoN2ERIQ8/ZsTgZkFapYEMtq578rMNso5OSR7lJ++ngmgZWZw3vHY28PMmFxM=;
Message-ID: <ecbfa46d-2e0a-4685-9695-f7de37e7b6ce@xen.org>
Date: Wed, 15 Nov 2023 11:22:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
 <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
 <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org>
 <1689d4b47d708098c43601a58e867f1c@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1689d4b47d708098c43601a58e867f1c@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 15/11/2023 11:02, Nicola Vetrini wrote:
> On 2023-11-14 23:12, Julien Grall wrote:
>> Hi,
>>
>> On 14/11/2023 15:36, Nicola Vetrini wrote:
>>> To be able to check for the existence of the necessary subsections in
>>> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a 
>>> source
>>> file that is built.
>>>
>>> This file is generated from 'C-runtime-failures.rst' in docs/misra
>>> and the configuration is updated accordingly.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes from RFC:
>>> - Dropped unused/useless code
>>> - Revised the sed command
>>> - Revised the clean target
>>>
>>> Changes in v2:
>>> - Added explanative comment to the makefile
>>> - printf instead of echo
>>>
>>> Changes in v3:
>>> - Terminate the generated file with a newline
>>> - Build it with -std=c99, so that the documentation
>>>    for D1.1 applies.
>>> Changes in v5:
>>> - Transform and build the file directly in the eclair-specific directory
>>> ---
>>>   automation/eclair_analysis/build.sh   | 21 +++++++++++++++++++--
>>>   automation/eclair_analysis/prepare.sh |  7 ++++---
>>>   2 files changed, 23 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/automation/eclair_analysis/build.sh 
>>> b/automation/eclair_analysis/build.sh
>>> index ec087dd822fa..f24292ed0643 100755
>>> --- a/automation/eclair_analysis/build.sh
>>> +++ b/automation/eclair_analysis/build.sh
>>> @@ -33,12 +33,29 @@ else
>>>     PROCESSORS=6
>>>   fi
>>>   +runtime_failures_docs() {
>>> +  doc="C-runtime-failures.rst"
>>> +  builddir="automation/eclair_analysis"
>>> +
>>> +  cp "docs/misra/${doc}" "${builddir}"
>>
>> Is it necessary to copy the .rst? IOW, would it be sufficient to use...
>>
>>> +  cd "${builddir}"
>>> +  printf "/*\n\n" >"${doc}.tmp"
>>> +  sed -e 's|\*/|*//*|g' "${doc}" >>"${doc}.tmp"
>>
>> ... docs/misc/${doc} here?
>>
> 
> I didn't want to leave a stray file under docs/misra, but it's not 
> essential.

I am confused. I am suggesting to use:

sed -e 's|\*/|*//*|g' "../../docs/misc/${doc}" >> "${doc}.tmp"

So *.tmp is still created at the same place.

> 
>>> +  printf "\n\n*/\n" >>"${doc}.tmp"
>>> +  mv "${doc}.tmp" "${doc}.c"
>>
>> NIT: I am not sure why you need to first create .tmp and then create.c.
>>
> 
> Wasn't this a pattern to defend against interruptions of the build, just 
> as I did in v3?
> 
> +$(TARGETS:.o=.c): %.c: %.rst
> +    printf "/*\n\n" > $@.tmp
> +    sed -e 's|\*/|*//*|g' $< >> $@.tmp
> +    printf "\n\n*/\n" >> $@.tmp
> +    mv $@.tmp $@

Yes but it makes sense for the Makefile because the target would not be 
re-executed if *.c exists.

But I don't think this is the case for you because you are using a bash 
script. So your function should always be re-executed regardless on 
whether it was interrupted or not.

> 
>>> +
>>> +  # Cannot redirect to /dev/null because it would be excluded from 
>>> the analysis
>>> +  "${CROSS_COMPILE}gcc-12" -std=c99 -c "${doc}.c" -o "${doc}.o"
>>
>> NIT: It would be helpful to specify why -std=c99 is used. Above, you 
>> suggest this is to enable D1.1.
>>
> 
> Yeah, the comment in the changelog should be pasted here
> 
>> NIT: Can we define CC and use here and ...
>>
>>> +  cd -
>>> +}
>>> +
>>>   (
>>> -  cd xen
>>> +  runtime_failures_docs
>>>       make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>>>          "CROSS_COMPILE=${CROSS_COMPILE}"         \
>>>          "CC=${CROSS_COMPILE}gcc-12"              \
>>
>> ...? This would make easier to re-use the code.
>>
> 
> I don't expect this build script to be changed much to be honest, but if 
> you think
> this is beneficial then it's ok.

This is not only about code evolving. It makes easier to spot your are 
using the same compiler. I would not have made the remark if you were 
using 'gcc'.

But I noticed you were using gcc-12 and originally thought it was a 
mistake until I saw the second use.

The advantage of a variable CC (and CXX) is you can add a comment on top 
why you are specifically requestion gcc-12? IOW, why is gcc not fine?

Cheers,

-- 
Julien Grall

