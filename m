Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF3257C35
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 17:21:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kClcm-0004wf-N6; Mon, 31 Aug 2020 15:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kClcl-0004wX-Az
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 15:21:35 +0000
X-Inumbo-ID: 5ddfde8c-898f-4742-a6ad-900f37cd1446
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ddfde8c-898f-4742-a6ad-900f37cd1446;
 Mon, 31 Aug 2020 15:21:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F798B5A5;
 Mon, 31 Aug 2020 15:21:30 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-3-roger.pau@citrix.com>
 <52cde027-e7c2-3ca7-3d7e-7abfe19198da@suse.com>
 <20200831143747.GD753@Air-de-Roger> <20200831144445.GE753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7da73a66-3f81-180d-fdd0-d1a936fbd5d6@suse.com>
Date: Mon, 31 Aug 2020 17:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831144445.GE753@Air-de-Roger>
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

On 31.08.2020 16:45, Roger Pau Monné wrote:
> On Mon, Aug 31, 2020 at 04:37:47PM +0200, Roger Pau Monné wrote:
>> On Thu, Aug 27, 2020 at 05:03:50PM +0200, Jan Beulich wrote:
>>> On 20.08.2020 17:08, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>> @@ -1917,6 +1917,21 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>>>              goto gpf;
>>>>          break;
>>>>  
>>>> +    case MSR_K8_TOP_MEM1:
>>>> +    case MSR_K8_TOP_MEM2:
>>>> +        *msr_content = 0;
>>>> +        break;
>>>
>>> Any reason you don't fold this with ...
>>>
>>>> +    case MSR_K8_SYSCFG:
>>>> +        /*
>>>> +         * Return MtrrFixDramEn: albeit the current emulated MTRR
>>>> +         * implementation doesn't support the Extended Type-Field Format having
>>>> +         * such bit set is common on AMD hardware and is harmless as long as
>>>> +         * MtrrFixDramModEn isn't set.
>>>> +         */
>>>> +        *msr_content = K8_MTRRFIXRANGE_DRAM_ENABLE;
> 
> On the previous version you commented that returning 0 here would be
> more correct, do you still think so?

I do, but I'm still hoping to either get Andrew to agree (iirc it was
him to suggest the value above), or for me to understand why he's
wanting it this way.

Jan

