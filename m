Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4B8010A3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 17:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645630.1007828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r96pK-0004Po-Av; Fri, 01 Dec 2023 16:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645630.1007828; Fri, 01 Dec 2023 16:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r96pK-0004No-8Q; Fri, 01 Dec 2023 16:57:18 +0000
Received: by outflank-mailman (input) for mailman id 645630;
 Fri, 01 Dec 2023 16:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJ34=HM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r96pI-0004Ni-Ho
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 16:57:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abeb93e8-906a-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 17:57:12 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8EF554EE073C;
 Fri,  1 Dec 2023 17:57:11 +0100 (CET)
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
X-Inumbo-ID: abeb93e8-906a-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Fri, 01 Dec 2023 17:57:11 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/7] xen/x86: remove stale comment
In-Reply-To: <48f44ee5-95c5-4656-97f1-7fa6d0fdc53c@suse.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
 <48f44ee5-95c5-4656-97f1-7fa6d0fdc53c@suse.com>
Message-ID: <528ef7334c091ad9acb0316cf4b5558b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-30 17:41, Jan Beulich wrote:
> On 29.11.2023 16:24, Nicola Vetrini wrote:
>> The comment referred to the declaration for do_mca, which
>> now is part of hypercall-defs.h, therefore the comment is stale.
> 
> If the comments were stale, the #include-s should also be able to
> disappear?
> 
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -14,7 +14,7 @@
>>  #include <xen/cpumask.h>
>>  #include <xen/event.h>
>>  #include <xen/guest_access.h>
>> -#include <xen/hypercall.h> /* for do_mca */
>> +#include <xen/hypercall.h>
>>  #include <xen/cpu.h>
> 
> Here specifically I think the comment isn't stale, as xen/hypercall.h
> includes xen/hypercall-defs.h.
> 

Ok, I see your point

>> --- a/xen/arch/x86/include/asm/hypercall.h
>> +++ b/xen/arch/x86/include/asm/hypercall.h
>> @@ -12,7 +12,7 @@
>>  #include <xen/types.h>
>>  #include <public/physdev.h>
>>  #include <public/event_channel.h>
>> -#include <public/arch-x86/xen-mca.h> /* for do_mca */
>> +#include <public/arch-x86/xen-mca.h>
>>  #include <asm/paging.h>
> 
> Here otoh I'm not even sure this public header (or the others) is (are)
> really needed.
> 

I confirm this. It build even without this header.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

