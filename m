Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4725BD4A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 10:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDkcW-0008LN-AJ; Thu, 03 Sep 2020 08:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kD+y=CM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kDkcV-0008LI-8u
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 08:29:23 +0000
X-Inumbo-ID: 6a1dc7e5-3221-475b-9de0-d975ebf35eef
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a1dc7e5-3221-475b-9de0-d975ebf35eef;
 Thu, 03 Sep 2020 08:29:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 859E5AD1A;
 Thu,  3 Sep 2020 08:29:22 +0000 (UTC)
Subject: Re: [PATCH v3 4/8] x86/svm: handle BU_CFG and BU_CFG2 with cases
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-5-roger.pau@citrix.com>
 <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a61ed2b1-84ab-0c5e-c14f-635be15feda7@suse.com>
Date: Thu, 3 Sep 2020 10:29:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
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

On 02.09.2020 23:02, Andrew Cooper wrote:
> On 01/09/2020 11:54, Roger Pau Monne wrote:
>> @@ -1942,19 +1966,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>      default:
>>          if ( rdmsr_safe(msr, *msr_content) == 0 )
>>              break;
>> -
>> -        if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
>> -        {
>> -            /* Win2k8 x64 reads this MSR on revF chips, where it
>> -             * wasn't publically available; it uses a magic constant
>> -             * in %rdi as a password, which we don't have in
>> -             * rdmsr_safe().  Since we'll ignore the later writes,
>> -             * just use a plausible value here (the reset value from
>> -             * rev10h chips) if the real CPU didn't provide one. */
>> -            *msr_content = 0x0000000010200020ull;
>> -            break;
>> -        }
>> -
>>          goto gpf;
>>      }
>>  
>> @@ -2110,6 +2121,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>          nsvm->ns_msr_hsavepa = msr_content;
>>          break;
>>  
>> +    case MSR_F10_BU_CFG:
>> +    case MSR_F10_BU_CFG2:
>> +        if ( rdmsr_safe(msr, msr_content) )
>> +            goto gpf;
> 
> The comment you've moved depends on this not having this behaviour, as
> you'll now hand #GP back to Win2k8 on its write.
> 
> Honestly, given that how obsolete both Win2k8 and K10's are, I'm
> seriously tempted to suggest dropping this workaround entirely.

Let's not (yet). I'm told we (as a company) still support such guests.

Jan

