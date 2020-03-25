Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346DB19279A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:59:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH4dT-000325-V9; Wed, 25 Mar 2020 11:55:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH4dT-000320-4l
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:55:51 +0000
X-Inumbo-ID: 91c949d2-6e8f-11ea-85e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91c949d2-6e8f-11ea-85e2-12813bfff9fa;
 Wed, 25 Mar 2020 11:55:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6DDAAC44;
 Wed, 25 Mar 2020 11:55:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
 <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fe56e73-6d6c-9f8a-136d-ace39e9c8b09@suse.com>
Date: Wed, 25 Mar 2020 12:55:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 7/7] x86emul: support SYSRET
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 11:00, Andrew Cooper wrote:
> On 24/03/2020 16:29, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -5975,6 +5975,60 @@ x86_emulate(
>>              goto done;
>>          break;
>>  
>> +    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
>> +        vcpu_must_have(syscall);
>> +        /* Inject #UD if syscall/sysret are disabled. */
>> +        fail_if(!ops->read_msr);
>> +        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
>> +            goto done;
>> +        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
> 
> (as with the SYSCALL side), no need for the vcpu_must_have(syscall) as
> well as this check.

Upon re-reading I'm now confused - are you suggesting to also drop
the EFER.SCE check? That's not what you said in reply to 6/7. If
so, what's your thinking behind saying so? If I'm to guess, this
may go along the lines of you suggesting to drop the explicit CPUID
checks from SYSENTER/SYSEXIT as well, but I'm not seeing there
either why you would think this way (albeit there it's also a
little vague what exact changes you're thinking of at the MSR
handling side).

Jan

