Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3F800616
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 09:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645352.1007478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8z71-0004pw-9L; Fri, 01 Dec 2023 08:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645352.1007478; Fri, 01 Dec 2023 08:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8z71-0004ni-6B; Fri, 01 Dec 2023 08:43:03 +0000
Received: by outflank-mailman (input) for mailman id 645352;
 Fri, 01 Dec 2023 08:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJ34=HM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8z6z-0004na-SQ
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 08:43:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a19e9015-9025-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 09:42:59 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1B0A54EE073A;
 Fri,  1 Dec 2023 09:42:59 +0100 (CET)
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
X-Inumbo-ID: a19e9015-9025-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Fri, 01 Dec 2023 09:42:59 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/7] xen/x86: add missing instances of asmlinkage
 attributes
In-Reply-To: <918d258e-c10a-4cdd-a598-3b5dc0124de8@suse.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <4815279026ca4e2f1d93c98bfe6ea51ee139280d.1701270983.git.nicola.vetrini@bugseng.com>
 <918d258e-c10a-4cdd-a598-3b5dc0124de8@suse.com>
Message-ID: <d48f43185a08874aa0f44287a8023f13@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-30 17:44, Jan Beulich wrote:
> On 29.11.2023 16:24, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/desc.c
>> +++ b/xen/arch/x86/desc.c
>> @@ -91,7 +91,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / 
>> sizeof(seg_desc_t)] =
>>   * References boot_cpu_gdt_table for a short period, until the CPUs 
>> switch
>>   * onto their per-CPU GDTs.
>>   */
>> -const struct desc_ptr boot_gdtr = {
>> +const struct desc_ptr asmlinkage boot_gdtr = {
>>      .limit = LAST_RESERVED_GDT_BYTE,
>>      .base = (unsigned long)(boot_gdt - FIRST_RESERVED_GDT_ENTRY),
>>  };
> 
> I'm not convinced asmlinkage is okay to use on data. Recall that in 
> principle
> it may expand to an attribute specifying a non-default calling 
> convention.
> Such attributes cannot be assumed to continue to be possible to apply 
> to
> non-functions, even if such may happen to work with a particular 
> compiler
> version.
> 

It's already being used on variables, I believe.

xen/arch/x86/mm.c:l1_pgentry_t asmlinkage __section(".bss.page_aligned") 
__aligned(PAGE_SIZE)
xen/arch/x86/setup.c:unsigned long asmlinkage __read_mostly 
cr4_pv32_mask;
xen/arch/x86/setup.c:char asmlinkage 
__section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
xen/arch/x86/setup.c:unsigned int asmlinkage __initdata multiboot_ptr;

If you have concern about this particular variable, then we can fall 
back on SAF or just put a declaration in the appropriate place.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

