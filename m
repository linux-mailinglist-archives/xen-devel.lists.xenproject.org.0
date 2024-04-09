Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EC89E3E4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 21:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702808.1098361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHSv-0002Uv-Il; Tue, 09 Apr 2024 19:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702808.1098361; Tue, 09 Apr 2024 19:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHSv-0002Ry-FT; Tue, 09 Apr 2024 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 702808;
 Tue, 09 Apr 2024 19:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xQG8=LO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ruHSu-0002Pe-Gr
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 19:49:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a28034b-f6aa-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 21:49:07 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 705C14EE0739;
 Tue,  9 Apr 2024 21:49:07 +0200 (CEST)
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
X-Inumbo-ID: 3a28034b-f6aa-11ee-b907-491648fe20b8
MIME-Version: 1.0
Date: Tue, 09 Apr 2024 21:49:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 6/9] x86/hvm: address violations of MISRA C Rule
 16.2
In-Reply-To: <1ed00b0a-2aa3-4ab4-b483-e6fd6ed2cd9e@suse.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <165d61fab77c0b6613b78e0091195753fe9cd2cc.1712305581.git.nicola.vetrini@bugseng.com>
 <1ed00b0a-2aa3-4ab4-b483-e6fd6ed2cd9e@suse.com>
Message-ID: <a8cddd0cc669e3eacfe71902f8d7ee27@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-08 09:57, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -119,12 +119,12 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>              (mode == 8 ? regs->rdi : regs->ebx) == 
>> HVMOP_guest_request_vm_event )
>>              break;
>> 
>> -        if ( unlikely(hvm_get_cpl(curr)) )
>> -        {
>> +        if ( !unlikely(hvm_get_cpl(curr)) )
> 
> likely() / unlikely() want to be the outermost part of a conditional
> like this (things are different with && or ||), i.e.
> 
>         if ( likely(!hvm_get_cpl(curr)) )
> 

Ok, LGTM

> Then:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

