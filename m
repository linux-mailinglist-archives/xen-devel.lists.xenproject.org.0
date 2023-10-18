Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8B7CD8D3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 12:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618469.962135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3SI-0003Wa-Dg; Wed, 18 Oct 2023 10:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618469.962135; Wed, 18 Oct 2023 10:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3SI-0003Tg-Af; Wed, 18 Oct 2023 10:07:10 +0000
Received: by outflank-mailman (input) for mailman id 618469;
 Wed, 18 Oct 2023 10:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt3SH-0003Ta-3I
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 10:07:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16af6093-6d9e-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 12:07:05 +0200 (CEST)
Received: from [157.138.166.97] (unknown [157.138.166.97])
 by support.bugseng.com (Postfix) with ESMTPSA id B41BC4EE0738;
 Wed, 18 Oct 2023 12:07:03 +0200 (CEST)
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
X-Inumbo-ID: 16af6093-6d9e-11ee-9b0e-b553b5be7939
Message-ID: <da6e11ef-f35c-45d7-afcb-8c9b21defd9a@bugseng.com>
Date: Wed, 18 Oct 2023 12:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/23 17:26, Jan Beulich wrote:
> On 03.10.2023 17:24, Federico Serafini wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>    * a problem.
>>    */
>>   void init_or_livepatch modify_xen_mappings_lite(
>> -    unsigned long s, unsigned long e, unsigned int _nf)
>> +    unsigned long s, unsigned long e, unsigned int nf)
>>   {
>> -    unsigned long v = s, fm, nf;
>> +    unsigned long v = s, fm, flags;
> 
> While it looks correct, I consider this an unacceptably dangerous
> change: What if by the time this is to be committed some new use of
> the local "nf" appears, without resulting in fuzz while applying the
> patch? Imo this needs doing in two steps: First nf -> flags, then
> _nf -> nf.
> 
> Furthermore since you alter the local variable, is there any reason
> not to also change it to be "unsigned int", matching the function
> argument it's set from?

If you are referring to the local variable 'flags', it is set using the
value returned from put_pte_flags() which is an intpte_t (typedef for 
u64). Am I missing something?

> 
> Yet then - can't we just delete "nf" and rename "_nf" to "nf"? The
> function parameter is only used in
> 
>      nf = put_pte_flags(_nf & FLAGS_MASK);
> 
> Jan
> 

I thought about it but it will introduce a violation of Rule 17.8:
"A function parameter should not be modified".
It is an advisory rule that is not currently accepted but one day
it may be.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

