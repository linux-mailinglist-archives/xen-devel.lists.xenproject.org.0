Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED954694786
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494530.764622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZK4-0005qU-7u; Mon, 13 Feb 2023 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494530.764622; Mon, 13 Feb 2023 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZK4-0005ol-57; Mon, 13 Feb 2023 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 494530;
 Mon, 13 Feb 2023 13:56:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pRZK3-0005of-3Z
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:56:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRZK1-00077O-9v; Mon, 13 Feb 2023 13:56:45 +0000
Received: from [54.239.6.185] (helo=[192.168.15.251])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRZK1-0004xW-4P; Mon, 13 Feb 2023 13:56:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=hnGXkGUaSo6KFQgncZa+YU0pxZdZRutMdWypOr4o+qE=; b=aHrYtisgG0pK36kxWyqrnbkezp
	rpv9jpEe0v3tqHnS6qeTF2AP8WmC44TTfZeA8Qd4d772nTIAQVTiTiHkpMUZIAy7d5nLerd3Y9tl1
	nI+JdmxsGT/8F3B/AmUbd2K9+nZRS/VRrkuYOswzsN942+GaGnlFH7wV+OgghOTC77/E=;
Message-ID: <1b079086-ffb7-2716-8092-b69ede4aec8c@xen.org>
Date: Mon, 13 Feb 2023 13:56:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
 <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/02/2023 13:30, Jan Beulich wrote:
> On 13.02.2023 14:19, Julien Grall wrote:
>> On 13/02/2023 12:24, Jan Beulich wrote:
>>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/common/bug.c
>>>> @@ -0,0 +1,88 @@
>>>> +#include <xen/bug.h>
>>>> +#include <xen/errno.h>
>>>> +#include <xen/types.h>
>>>> +#include <xen/kernel.h>
>>>
>>> Please order headers alphabetically unless there's anything preventing
>>> that from being done.
>>>
>>>> +#include <xen/string.h>
>>>> +#include <xen/virtual_region.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +
>>>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>>>
>>> I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
>>> environments that's redundant with "unsigned long", and it's also
>>> redundant with C99's uintptr_t. Hence when seeing the type I always
>>> wonder whether it's really a host virtual address which is meant (and
>>> not perhaps a guest one, which in principle could differ from the host
>>> one for certain guest types). In any event the existence of this type
>>> should imo not be a prereq to using this generic piece of infrastructure
>>
>> C spec aside, the use "unsigned long" is quite overloaded within Xen.
>> Although, this has improved since we introduced mfn_t/gfn_t.
>>
>> In the future, I could imagine us to also introduce typesafe for
>> vaddr_t, reducing further the risk to mix different meaning of unsigned
>> long.
>>
>> Therefore, I think the introduction of vaddr_t should be a prereq for
>> using the generic piece of infrastructure.
> 
> Would be nice if other maintainers could share their thoughts here. I,
> for one, would view a typesafe gaddr_t as reasonable, and perhaps also
> a typesafe gvaddr_t, but hypervisor addresses should be fine as void *
> or unsigned long.

See my answer to Andrew.

> 
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/bug.h
>>>> @@ -0,0 +1,127 @@
>>>> +#ifndef __XEN_BUG_H__
>>>> +#define __XEN_BUG_H__
>>>> +
>>>> +#define BUG_DISP_WIDTH    24
>>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>>> +
>>>> +#define BUGFRAME_run_fn 0
>>>> +#define BUGFRAME_warn   1
>>>> +#define BUGFRAME_bug    2
>>>> +#define BUGFRAME_assert 3
>>>> +
>>>> +#define BUGFRAME_NR     4
>>>> +
>>>> +#ifndef __ASSEMBLY__
>>>> +
>>>> +#include <xen/errno.h>
>>>> +#include <xen/stringify.h>
>>>> +#include <xen/types.h>
>>>> +#include <xen/lib.h>
>>>
>>> Again - please sort headers.
>>>
>>>> +#include <asm/bug.h>
>>>> +
>>>> +#ifndef BUG_FRAME_STUFF
>>>> +struct bug_frame {
>>>
>>> Please can we have a blank line between the above two ones and then similarly
>>> ahead of the #endif?
>>>
>>>> +    signed int loc_disp;    /* Relative address to the bug address */
>>>> +    signed int file_disp;   /* Relative address to the filename */
>>>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>> +    uint16_t line;          /* Line number */
>>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>
>>> Already the original comment in Arm code is wrong: The padding doesn't
>>> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
>>> size.
>>> Aiui there's also no need for 8-byte alignment anywhere here (in
>>> fact there's ".p2align 2" in the generator macros).
>>
>> I would rather keep the pad0 here.
> 
> May I ask why that is?

It makes clear of the padding (which would have been hidden) when using 
.p2align 2.

Cheers,

-- 
Julien Grall

