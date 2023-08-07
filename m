Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81133772492
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578355.905814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzas-0004vH-CS; Mon, 07 Aug 2023 12:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578355.905814; Mon, 07 Aug 2023 12:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzas-0004s6-9F; Mon, 07 Aug 2023 12:44:18 +0000
Received: by outflank-mailman (input) for mailman id 578355;
 Mon, 07 Aug 2023 12:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiBK=DY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qSzaq-0004rp-CJ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:44:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1de9e286-3520-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 14:44:15 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 93B954EE0737;
 Mon,  7 Aug 2023 14:44:14 +0200 (CEST)
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
X-Inumbo-ID: 1de9e286-3520-11ee-b27e-6b7b168915f2
Message-ID: <52e93c6b-376d-7f31-e319-c90de4588b6a@bugseng.com>
Date: Mon, 7 Aug 2023 14:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [BUGGY] Re: [XEN PATCH] x86: Address violations of MISRA C:2012
 and drop bool_t
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
 <64ec2572-348a-2c6f-d354-2747659e4666@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <64ec2572-348a-2c6f-d354-2747659e4666@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/23 14:31, Andrew Cooper wrote:
> On 04/08/2023 3:11 pm, Federico Serafini wrote:
>> Give a name to unnamed parameters to address violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between object and function declarations thus
>> addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
>> object or function shall use the same names and type qualifiers").
>> Replace the occurrences of bool_t with bool.
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/cpu/common.c            |  6 +++---
>>   xen/arch/x86/include/asm/processor.h | 16 ++++++++--------
>>   2 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index cfcdaace12..5f29148416 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -26,11 +26,11 @@
>>   
>>   bool __read_mostly opt_dom0_cpuid_faulting = true;
>>   
>> -bool_t opt_arat = 1;
>> +bool opt_arat = 1;
>>   boolean_param("arat", opt_arat);
> 
> I see this has been committed, but you do realise you've created a new
> violation of 8.3 by failing to change the declaration of opt_arat to be
> bool ?
> 
> Please everyone be more careful.  There is an enormous amount of MISRA
> churn, and it's hard enough to deal with this when the patches are correct.
> 
> ~Andrew

I'm sorry, I noticed too late.
I will submit a patch to address the new violations.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

