Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63F9006C4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 16:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736551.1142651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFafm-0001fL-MS; Fri, 07 Jun 2024 14:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736551.1142651; Fri, 07 Jun 2024 14:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFafm-0001dq-JY; Fri, 07 Jun 2024 14:34:30 +0000
Received: by outflank-mailman (input) for mailman id 736551;
 Fri, 07 Jun 2024 14:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZm=NJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sFafl-0001dk-JK
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 14:34:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ad8c6c6-24db-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 16:34:27 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9CC5F4EE073E;
 Fri,  7 Jun 2024 16:34:26 +0200 (CEST)
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
X-Inumbo-ID: 0ad8c6c6-24db-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Fri, 07 Jun 2024 16:34:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/5] x86: deviate violation of MISRA C Rule 20.12
In-Reply-To: <02262bd1-4d2f-413f-bc03-58c7181be216@suse.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <475daa82f5be77644b1f32ecd3f6e66ccd9ac904.1717236930.git.nicola.vetrini@bugseng.com>
 <02262bd1-4d2f-413f-bc03-58c7181be216@suse.com>
Message-ID: <317aa87b389a8eb7de86853c7fc45829@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-04 08:08, Jan Beulich wrote:
> On 01.06.2024 12:16, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/include/asm/shared.h
>> +++ b/xen/arch/x86/include/asm/shared.h
>> @@ -76,6 +76,7 @@ static inline void arch_set_##field(struct vcpu *v,  
>>        \
>> 
>>  GET_SET_SHARED(unsigned long, max_pfn)
>>  GET_SET_SHARED(xen_pfn_t, pfn_to_mfn_frame_list_list)
>> +/* SAF-6-safe Rule 20.12: expansion of macro nmi_reason */
>>  GET_SET_SHARED(unsigned long, nmi_reason)
> 
> Before we go this route, were alternatives at least considered? Plus
> didn't we special-case function-like macros already, when used in
> situations where only object-like macros would be expanded anyway?
> 

It may be the case that this is already deviated, hence meaning that the 
patch can be dropped: I'll recheck.

In that case, thanks for pointing this out.

> As to alternatives: nmi_reason() is used in exactly one place.
> Dropping the #define and expanding the one use instead would be an
> option. I further wonder whether moving the #define-s past the
> piece of code you actually modify would also be an option (i.e. the
> tool then no longer complaining).
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

