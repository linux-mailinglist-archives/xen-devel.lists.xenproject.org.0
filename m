Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B972DE05
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547935.855599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90aA-0007Ib-FX; Tue, 13 Jun 2023 09:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547935.855599; Tue, 13 Jun 2023 09:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90aA-0007FW-CB; Tue, 13 Jun 2023 09:44:58 +0000
Received: by outflank-mailman (input) for mailman id 547935;
 Tue, 13 Jun 2023 09:44:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q90a9-0007FQ-MH
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:44:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q90a2-0004C0-T5; Tue, 13 Jun 2023 09:44:50 +0000
Received: from [15.248.2.253] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q90a2-0004pZ-MO; Tue, 13 Jun 2023 09:44:50 +0000
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
	bh=SmZhgzXzWP89iC8wwSKmPIgtZTSCpMkaW6PrFNu4Krs=; b=6E776rsEWHJySRQvwguHDBPEz2
	0fg7rsg1/I/Zrz1k7LM/ouxSoj5GEXPUAJ429dBhwJ1gaJSngFWWvegbmEmLq35c5UXyksdzb//SE
	2v8FtJRSPhvq+OpaG0Y2LAmQDnbjoFfJyKvn5nFDba7eNDGb7YJIODZwaZoz26H7x5TY=;
Message-ID: <f3fc1848-68ca-37a1-add2-e100b4773190@xen.org>
Date: Tue, 13 Jun 2023 10:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
 <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2023 09:27, Jan Beulich wrote:
> On 13.06.2023 09:42, Nicola Vetrini wrote:
>> The xen sources contain several violations of Rule 3.1 from MISRA C:2012,
>> whose headline states:
>> "The character sequences '/*' and '//' shall not be used within a comment".
>>
>> Most of the violations are due to the presence of links to webpages within
>> C-style comment blocks, such as:
>>
>> xen/arch/arm/include/asm/smccc.h:37.1-41.3
>> /*
>>   * This file provides common defines for ARM SMC Calling Convention as
>>   * specified in
>>   * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>>   */
>>
>> In this case, we propose to deviate all of these occurrences with a
>> project deviation to be captured by a tool configuration.
>>
>> There are, however, a few other violations that do not fall under this
>> category, namely:
>>
>> 1. in file "xen/arch/arm/include/asm/arm64/flushtlb.h" we propose to
>> avoid the usage of a nested comment;
>> 2. in file "xen/common/xmalloc_tlsf.c" we propose to substitute the
>> commented-out if statement with a "#if 0 .. #endif;
>> 3. in file "xen/include/xen/atomic.h" and
>> "xen/drivers/passthrough/arm/smmu-v3.c" we propose to split the C-style
>> comment containing the nested comment into two doxygen comments, clearly
>> identifying the second as a code sample. This can then be captured with a
>> project deviation by a tool configuration.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes:
>> - Resending the patch with the right maintainers in CC.
> 
> But without otherwise addressing comments already given, afaics. One more
> remark:
> 
>> --- a/xen/common/xmalloc_tlsf.c
>> +++ b/xen/common/xmalloc_tlsf.c
>> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>           *fl = flsl(*r) - 1;
>>           *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>           *fl -= FLI_OFFSET;
>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> -         *fl = *sl = 0;
>> -         */
>> +#if 0
>> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> +        fl = *sl = 0;
> 
> You want to get indentation right here, and you don't want to lose
> the indirection on fl.
> 
>> +#endif
>>           *r &= ~t;
>>       }
>>   }
> 
> If you split this to 4 patches, leaving the URL proposal in just
> the cover letter, then I think this one change (with the adjustments)
> could go in right away. Similarly I expect the arm64/flushtlb.h
> change could be ack-ed right away by an Arm maintainer.

I actually dislike the proposal. In this case, the code is meant to look 
like assembly code. I would replace the // with ;. Also, I would like to 
keep the comment style in sync in arm32/flushtlb.h. So can this be 
updated as well?

Cheers,

-- 
Julien Grall

