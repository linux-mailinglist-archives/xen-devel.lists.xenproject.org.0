Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A1914374
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746097.1153043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLe0U-0003Ae-0H; Mon, 24 Jun 2024 07:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746097.1153043; Mon, 24 Jun 2024 07:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLe0T-000381-TN; Mon, 24 Jun 2024 07:20:53 +0000
Received: by outflank-mailman (input) for mailman id 746097;
 Mon, 24 Jun 2024 07:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLe0S-00037v-Ig
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:20:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4891a04e-31fa-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:20:50 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id 2A3F04EE0738;
 Mon, 24 Jun 2024 09:20:49 +0200 (CEST)
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
X-Inumbo-ID: 4891a04e-31fa-11ef-90a3-e314d9c70b13
Message-ID: <272eb185-4cfb-4aa7-8961-97121a718d20@bugseng.com>
Date: Mon, 24 Jun 2024 09:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: configure Rule 13.6 and custom
 service B.UNEVALEFF
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <73b4105bf007e5bd0f351ec70711ba7219f31eb3.1719053209.git.federico.serafini@bugseng.com>
 <e8ca39e4-dd44-4399-9712-e1737f98bd0e@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <e8ca39e4-dd44-4399-9712-e1737f98bd0e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/06/24 14:22, Andrew Cooper wrote:
> On 22/06/2024 11:48 am, Federico Serafini wrote:
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index e2653f77eb..6bdfe7c883 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -328,6 +328,16 @@ of the short-circuit evaluation strategy of such logical operators."
>>   -config=MC3R1.R13.5,reports+={disapplied,"any()"}
>>   -doc_end
>>   
>> +-doc_begin="Macros alternative_v?call[0-9] use sizeof and typeof to check that th argument types match the corresponding parameter ones."
> 
> Typo "th" => "the".  Can be fixed on commit.
> 
>> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86.*$)))"}
>> +-config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86.*$)))"}
> 
> There will be expansions of these macros outside of arch/x86/.
> drivers/iommu/ as an example.
> 
> Is the file() clause targetting the source of the macro (in which it
> probably wants making more specific to alternative_call.h), or the
> expansions of the macro (in which case it probably wants dropping
> entirely) ?

It is targetting the source of the macro,
we can make it more specific.


> 
>> +-doc_end
>> +
>> +-doc_begin="Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very specific cases where the usage is correct and can be checked by code inspection.
>> +The BUILD_BUG_ON checks check that EFI_TIME and struct xenpf_efi_time fields match."
>> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^chk_fld$))&&file(^xen/common/efi/runtime\\.c$)))"}
>> +-doc_end
> 
> It's just occurred to me.  Anything, no matter how complicated, inside a
> BUILD_BUG_ON() is clearly a compile time thing so has no relevant side
> effects.
> 
> Is it possible to generally exclude any sizeof/alignof/typeof inside a
> BUILD_BUG_ON()?  That would be better than identifying every user locally.

Sure.

I will send a v2 with your observations.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

