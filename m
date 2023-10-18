Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F37CDFC0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618636.962565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7XU-000633-H8; Wed, 18 Oct 2023 14:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618636.962565; Wed, 18 Oct 2023 14:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7XU-0005zx-Ds; Wed, 18 Oct 2023 14:28:48 +0000
Received: by outflank-mailman (input) for mailman id 618636;
 Wed, 18 Oct 2023 14:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVsY=GA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qt7XT-0005zr-9M
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:28:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4de5e21-6dc2-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:28:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 184074EE0739;
 Wed, 18 Oct 2023 16:28:45 +0200 (CEST)
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
X-Inumbo-ID: a4de5e21-6dc2-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 18 Oct 2023 16:28:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/7] x86: add deviations for variables only used in
 asm code
In-Reply-To: <afbb7307-50e0-047a-807a-1bcf0139f5d3@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
 <afbb7307-50e0-047a-807a-1bcf0139f5d3@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b652c60c8b5179e31b9032c5e65e9498@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:58, Jan Beulich wrote:
> On 09.10.2023 08:54, Nicola Vetrini wrote:
>> These variables are only used by asm code, and therefore
>> the lack of a declaration is justified by the corresponding
>> deviation comment.
> 
> Hmm, you say "declaration" here, but according to my understanding ...
> 
>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>   * gets set up by the containing function.
>>   */
>>  #ifdef CONFIG_FRAME_POINTER
>> +/* SAF-1-safe */
>>  register unsigned long current_stack_pointer asm("rsp");
> 
> ... this is a declaration, not a definition.
> 

It has automatic storage duration and it's not defined afterwards

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -153,6 +153,7 @@ char __section(".init.bss.stack_aligned") 
>> __aligned(STACK_SIZE)
>>  void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct 
>> cpu_info);
>> 
>>  /* Used by the boot asm to stash the relocated multiboot info 
>> pointer. */
>> +/* SAF-1-safe */
>>  unsigned int __initdata multiboot_ptr;
> 
> Imo such comments want folding; question is whether the tooling can
> cope.
> 

As far as I know, it can't fold /* comment SAF-x-safe */, but /* 
SAF-x-safe comment */,
though the latter should be a justification, which this comment is not

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

