Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676531E962
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86605.162734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChvq-0002Bw-AA; Thu, 18 Feb 2021 11:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86605.162734; Thu, 18 Feb 2021 11:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChvq-0002BX-6z; Thu, 18 Feb 2021 11:57:18 +0000
Received: by outflank-mailman (input) for mailman id 86605;
 Thu, 18 Feb 2021 11:57:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lChvo-0002BP-3H
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:57:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48a9391d-8549-4fc7-aa01-25d8e5e64783;
 Thu, 18 Feb 2021 11:57:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B540BAF1B;
 Thu, 18 Feb 2021 11:57:14 +0000 (UTC)
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
X-Inumbo-ID: 48a9391d-8549-4fc7-aa01-25d8e5e64783
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613649434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8c74sPvl5d2onmBiOM54dv7aEMSFVP3Md/vEjhTS5g=;
	b=TMxSGla0TK56fDd/xKwnLjJqDfLpWOcHYPxkqtBPurgiG/mR7NLcs7AwyBc8JB6fqyXhyd
	qBDRnlcla64+edGOmarE+OiYbJZ+WqGSQQuovFl3GGUpErCTQosNkXhps8qIQLVdGluF9L
	lR90q1BLhb9ot6EOwJGpT4y+iaYLfKc=
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
 anthony.perard@citrix.com, andrew.cooper3@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
 <YC5OYZOAkx+jutJz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <785a4925-31f2-9df1-a4b3-1760ad17e01e@suse.com>
Date: Thu, 18 Feb 2021 12:57:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC5OYZOAkx+jutJz@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.02.2021 12:24, Roger Pau Monné wrote:
> On Wed, Jan 20, 2021 at 05:49:11PM -0500, Boris Ostrovsky wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>              break;
>>          }
>>  
>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
>> -        goto gp_fault;
>> +        if ( guest_unhandled_msr(curr, msr, msr_content, false, true) )
>> +            goto gp_fault;
>>      }
>>  
>>  done:
>> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>               is_last_branch_msr(msr) )
>>              break;
>>  
>> -        gdprintk(XENLOG_WARNING,
>> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>> -                 msr, msr_content);
>> -        goto gp_fault;
>> +        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
>> +            goto gp_fault;
>>      }
> 
> I think this could be done in hvm_msr_read_intercept instead of having
> to call guest_unhandled_msr from each vendor specific handler?
> 
> Oh, I see, that's likely done to differentiate between guest MSR
> accesses and emulator ones? I'm not sure we really need to make a
> difference between guests MSR accesses and emulator ones, surely in
> the past they would be treated equally?

We did discuss this before. Even if they were treated the same in
the past, that's not correct, and hence we shouldn't suppress the
distinction going forward. A guest explicitly asking to access an
MSR (via RDMSR/WRMSR) is entirely different from the emulator
perhaps just probing an MSR, falling back to some default behavior
if it's unavailable.

Jan

