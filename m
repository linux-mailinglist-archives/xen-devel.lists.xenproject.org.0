Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F62249851
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:36:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8JZ5-0007JH-Oc; Wed, 19 Aug 2020 08:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8JZ4-0007JC-Jj
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:35:22 +0000
X-Inumbo-ID: 1534101a-90fd-4fca-b29b-c3a13c918d98
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1534101a-90fd-4fca-b29b-c3a13c918d98;
 Wed, 19 Aug 2020 08:35:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F33E2AEA2;
 Wed, 19 Aug 2020 08:35:46 +0000 (UTC)
Subject: Re: [PATCH v2 3/7] x86: shrink struct arch_{vcpu,domain} when !HVM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <014a655b-7080-3804-3a56-5e00851a2a7d@suse.com>
 <306cec0c-93e6-4b45-f68c-3808309478bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75b06e66-72f3-09d9-cfe7-97d5efd98902@suse.com>
Date: Wed, 19 Aug 2020 10:35:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <306cec0c-93e6-4b45-f68c-3808309478bf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 19:14, Andrew Cooper wrote:
> On 07/08/2020 12:33, Jan Beulich wrote:
>> While this won't affect overall memory overhead (struct vcpu as well as
>> struct domain get allocated as single pages) nor code size (the offsets
>> into the base structures are too large to be representable as signed 8-
>> bit displacements), it'll allow the tail of struct pv_{domain,vcpu} to
>> share a cache line with subsequent struct arch_{domain,vcpu} fields.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: There is a risk associated with this: If we still have code
>>      somewhere accessing the HVM parts of the structures without a prior
>>      type check of the guest, this going to end up worse than the so far
>>      not uncommon case of the access simply going to space unused by PV.
>>      We may therefore want to consider whether to further restrict when
>>      this conversion to union gets done.
>>      And of course there's also the risk of future compilers complaining
>>      about this abuse of unions. But this is limited to code that's dead
>>      in !HVM configs, so only an apparent problem.
>>
>> --- a/xen/include/asm-x86/hvm/domain.h
>> +++ b/xen/include/asm-x86/hvm/domain.h
>> @@ -99,7 +99,13 @@ struct hvm_pi_ops {
>>  
>>  #define MAX_NR_IOREQ_SERVERS 8
>>  
>> -struct hvm_domain {
>> +typedef
>> +#ifdef CONFIG_HVM
>> +struct
>> +#else
>> +union
>> +#endif
>> +hvm_domain {
>>      /* Guest page range used for non-default ioreq servers */
>>      struct {
>>          unsigned long base;
>> @@ -203,7 +209,7 @@ struct hvm_domain {
>>  #ifdef CONFIG_MEM_SHARING
>>      struct mem_sharing_domain mem_sharing;
>>  #endif
>> -};
>> +} hvm_domain_t;
> 
> Honestly, I'd say no to this patch even it resulted in a 100x speedup,
> because I am totally lost for words about this construct, and the effect
> it comprehensibility of our code.

Okay - away it goes.

Jan

