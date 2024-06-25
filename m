Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC1916427
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 11:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747525.1154962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2rz-0003kt-Ho; Tue, 25 Jun 2024 09:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747525.1154962; Tue, 25 Jun 2024 09:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2rz-0003hj-Ez; Tue, 25 Jun 2024 09:53:47 +0000
Received: by outflank-mailman (input) for mailman id 747525;
 Tue, 25 Jun 2024 09:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sM2rx-0003hd-Sp
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 09:53:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce6a04cf-32d8-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 11:53:43 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id 6CAB94EE0738;
 Tue, 25 Jun 2024 11:53:42 +0200 (CEST)
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
X-Inumbo-ID: ce6a04cf-32d8-11ef-b4bb-af5377834399
Message-ID: <33d24bb8-9ef5-4d46-a93a-9bc7310cabb8@bugseng.com>
Date: Tue, 25 Jun 2024 11:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 04/13] x86/vpmu: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
 <1ea5bebd-23ee-4d2c-a7c8-bc6ba99851c5@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1ea5bebd-23ee-4d2c-a7c8-bc6ba99851c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/24 17:16, Jan Beulich wrote:
> On 24.06.2024 11:04, Federico Serafini wrote:
>> --- a/xen/arch/x86/cpu/vpmu_intel.c
>> +++ b/xen/arch/x86/cpu/vpmu_intel.c
>> @@ -713,6 +713,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
>>               break;
>>           default:
>>               rdmsrl(msr, *msr_content);
>> +            break;
>>           }
>>       }
>>       else if ( msr == MSR_IA32_MISC_ENABLE )
> 
> Up from here, in core2_vpmu_do_wrmsr() there's a pretty long default
> block with no terminating break. Is there a reason that you don't put
> one there?

I noticed that vpmu_intel.c is a file out-of-scope.
The violation I addressed was shown because it involves
the macro rdmsrl coming from file xen/arch/x86/include/asm/msr.h
(in scope).
I will address also the violation you pointed out in a v3.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

