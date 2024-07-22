Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66648938B91
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 10:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761553.1171517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVoo8-0005Yb-Kp; Mon, 22 Jul 2024 08:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761553.1171517; Mon, 22 Jul 2024 08:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVoo8-0005Wg-Hi; Mon, 22 Jul 2024 08:54:12 +0000
Received: by outflank-mailman (input) for mailman id 761553;
 Mon, 22 Jul 2024 08:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5b5=OW=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sVoo7-0005WY-0b
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 08:54:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f517de61-4807-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 10:54:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D81C54EE0737;
 Mon, 22 Jul 2024 10:54:07 +0200 (CEST)
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
X-Inumbo-ID: f517de61-4807-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Mon, 22 Jul 2024 10:54:07 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Nicola Vetrini
 <nicola.vetrini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 14/17] xen: add SAF deviation for MISRA C Dir 4.10
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2407121527500.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d6c313e5-19c6-4775-8d9c-0742a37032b4@suse.com>
 <alpine.DEB.2.22.394.2407121527500.3635@ubuntu-linux-20-04-desktop>
Message-ID: <39ca09f9ef0fe1b6ec93371995f2a49a@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-13 00:28, Stefano Stabellini wrote:
> On Wed, 3 Jul 2024, Jan Beulich wrote:
>> public/x86: don't include common xen.h from arch-specific one
>> 
>> No other arch-*.h does so, and arch-x86/xen.h really just takes the 
>> role
>> of arch-x86_32.h and arch-x86_64.h (by those two forwarding there). 
>> With
>> xen.h itself including the per-arch headers, doing so is also kind of
>> backwards anyway, and just calling for problems. There's exactly one
>> place where arch-x86/xen.h is included when really xen.h is meant (for
>> wanting XEN_GUEST_HANDLE_64() to be made available, the default
>> definition of which lives in the common xen.h).
>> 
>> This then addresses a violation of Misra C:2012 Directive 4.10
>> ("Precautions shall be taken in order to prevent the contents of a
>> header file being included more than once").
>> 
>> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

One question: when making the new version of the patch series should I
revert this commit as Jan made the patch for it himself, or should Jan's 
fixes
be integrated in the patch series?

Many thanks in advance,
Alessandro Zucchelli

>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -7,8 +7,6 @@
>>   * Copyright (c) 2004-2006, K A Fraser
>>   */
>> 
>> -#include "../xen.h"
>> -
>>  #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
>>  #define __XEN_PUBLIC_ARCH_X86_XEN_H__
>> 
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -525,7 +525,7 @@ void x86_cpu_policy_bound_max_leaves(str
>>  void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p);
>> 
>>  #ifdef __XEN__
>> -#include <public/arch-x86/xen.h>
>> +#include <public/xen.h>
>>  typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
>>  typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
>>  #else
>> 
>> 

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

