Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E425D55E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8Gv-0005AE-8K; Fri, 04 Sep 2020 09:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kE8Gt-0005A8-Fu
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:44:39 +0000
X-Inumbo-ID: d80b5f3a-f087-42e0-a2c3-c0702ef3b6f8
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d80b5f3a-f087-42e0-a2c3-c0702ef3b6f8;
 Fri, 04 Sep 2020 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599212678;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=36uEOwKiJPaAdwWIJH0AnAkCdtor7kmEVd6Mu1O9x5E=;
 b=YYYl7GFFG1NxMB7Fgjn7JHdvlFVV5m4HpH/+rS9C/NAxslIaUSUcvWrR
 +SnwwSnGBGwGA+TDVxYxxImiJXVqyf6W+m5tGigh2bZQsdD75pxB5bHlw
 MCnwMM13t7uNj70sJrLhnFdUAW/Oz1fjFosPj1fR9TVrdDDwLjFuO/ZCp o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z4aebpRE00MjPxZigGCHj91MBKH86aA15kV8E72k36C5QBrUnj1yz8x4kD7lbv6nqXKZjNMteU
 Yu+3AglMI3MxFZJgPCR+WUk1ZRrrv8Bq+STKpmWE+febDMHmjSDNhs/pDmC2hd1efiVM4tQH11
 GIy7oi51jCUg6GRE3Nlf3cK7sxwn1Pft4y2r5NdMlOpQXxkC8CIS8lgxNJSWQrLPZXAflDuRND
 AMhf+8xf/9cIZuDwhryk4GSt3z1P9kYMJYcy57ehPLfQVNl3HZC3TAH5BrOsM0qEpdfvD305Tx
 Pbo=
X-SBRS: 2.7
X-MesageID: 26332402
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26332402"
Subject: Re: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-8-roger.pau@citrix.com>
 <6823183f-90f0-90df-f843-6db2e84dba4a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <79067d5f-2f2f-2308-ecc7-30d5da08b9ef@citrix.com>
Date: Fri, 4 Sep 2020 10:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6823183f-90f0-90df-f843-6db2e84dba4a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 04/09/2020 09:53, Jan Beulich wrote:
> On 01.09.2020 12:54, Roger Pau Monne wrote:
>> @@ -3290,11 +3288,6 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>          __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
>>          break;
>>  
>> -    case MSR_IA32_FEATURE_CONTROL:
>> -    case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
>> -        /* None of these MSRs are writeable. */
>> -        goto gp_fault;
> I understand Andrew did ask for this (and I didn't look closely
> when I saw the comment), but ...
>
>> @@ -3320,10 +3313,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>               is_last_branch_msr(msr) )
>>              break;
>>  
>> -        /* Match up with the RDMSR side; ultimately this should go away. */
>> -        if ( rdmsr_safe(msr, msr_content) == 0 )
>> -            break;
>> -
>> +        gdprintk(XENLOG_WARNING,
>> +                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>> +                 msr, msr_content);
>>          goto gp_fault;
> ... above from here is logic that handling of these MSRs now goes
> through. I'm particularly worried about vmx_write_guest_msr(),
> which blindly updates the value of any MSR it can find, i.e. if
> any r/o MSR (from the set above, or even more generally) ever got
> added to this vCPU-specific set, the r/o-ness would no longer be
> maintained. Do we perhaps need to white-list MSRs for which
> vmx_write_guest_msr() may get called here?

If a read-only MSR ever actually gets into the load/save list, we'll
take a VMEntry failure (guest load) or SHUTDOWN (host load) as a
consequence of microcode takes a #GP fault.

However, restricting the content of this catch-all clause to nothing
(but the printk) is something I have planned as part of the ongoing MSR
cleanup work.

~Andrew

