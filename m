Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A408425D3C7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7G9-00062W-JR; Fri, 04 Sep 2020 08:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE7G8-00062R-EM
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:39:48 +0000
X-Inumbo-ID: 208aee2f-1c4b-4142-b8f3-cf0c1eafee47
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 208aee2f-1c4b-4142-b8f3-cf0c1eafee47;
 Fri, 04 Sep 2020 08:39:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA434B726;
 Fri,  4 Sep 2020 08:39:47 +0000 (UTC)
Subject: Re: [PATCH v3 4/8] x86/svm: handle BU_CFG and BU_CFG2 with cases
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-5-roger.pau@citrix.com>
 <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
 <20200903080657.GJ753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65e9296a-5222-ffae-eab6-2f099f02a934@suse.com>
Date: Fri, 4 Sep 2020 10:39:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903080657.GJ753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 03.09.2020 10:15, Roger Pau Monné wrote:
> On Wed, Sep 02, 2020 at 10:02:33PM +0100, Andrew Cooper wrote:
>> On 01/09/2020 11:54, Roger Pau Monne wrote:
>>> @@ -1942,19 +1966,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>>      default:
>>>          if ( rdmsr_safe(msr, *msr_content) == 0 )
>>>              break;
>>> -
>>> -        if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
>>> -        {
>>> -            /* Win2k8 x64 reads this MSR on revF chips, where it
>>> -             * wasn't publically available; it uses a magic constant
>>> -             * in %rdi as a password, which we don't have in
>>> -             * rdmsr_safe().  Since we'll ignore the later writes,
>>> -             * just use a plausible value here (the reset value from
>>> -             * rev10h chips) if the real CPU didn't provide one. */
>>> -            *msr_content = 0x0000000010200020ull;
>>> -            break;
>>> -        }
>>> -
>>>          goto gpf;
>>>      }
>>>  
>>> @@ -2110,6 +2121,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>          nsvm->ns_msr_hsavepa = msr_content;
>>>          break;
>>>  
>>> +    case MSR_F10_BU_CFG:
>>> +    case MSR_F10_BU_CFG2:
>>> +        if ( rdmsr_safe(msr, msr_content) )
>>> +            goto gpf;
>>
>> The comment you've moved depends on this not having this behaviour, as
>> you'll now hand #GP back to Win2k8 on its write.
> 
> Oh, unless I'm very confused the comment was already wrong, since
> svm_msr_write_intercept previous to this patch would return a #GP when
> trying to write to BU_CFG if the underlying MSR is not readable, so
> this just keeps the previous behavior.
> 
> Looking at the original commit (338db98dd8d) it seems the intention
> was to only handle reads and let writes return a #GP?

I agree. And hence while moving it I think you want to also adjust
that comment.

Jan

