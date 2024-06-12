Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5E904F9B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739091.1146017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKeV-0006Wx-AM; Wed, 12 Jun 2024 09:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739091.1146017; Wed, 12 Jun 2024 09:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKeV-0006UQ-7N; Wed, 12 Jun 2024 09:52:23 +0000
Received: by outflank-mailman (input) for mailman id 739091;
 Wed, 12 Jun 2024 09:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uw/A=NO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sHKeU-0006UJ-DL
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:52:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 754ae3b4-28a1-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:52:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 70A734EE0754;
 Wed, 12 Jun 2024 11:52:19 +0200 (CEST)
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
X-Inumbo-ID: 754ae3b4-28a1-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Wed, 12 Jun 2024 11:52:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 4/6] x86emul: address violations of MISRA C Rule 20.7
In-Reply-To: <12ce10af-cd36-492e-a73b-2b81b5bf60cc@suse.com>
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
 <12ce10af-cd36-492e-a73b-2b81b5bf60cc@suse.com>
Message-ID: <ac1faf5feded028ce80752ce69983352@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-12 11:19, Jan Beulich wrote:
> On 11.06.2024 17:53, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> These local helpers could in principle be deviated, but the 
>> readability
>> and functionality are essentially unchanged by complying with the 
>> rule,
>> so I decided to modify the macro definition as the preferred option.
> 
> Well, yes, but ...
> 
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -2255,7 +2255,7 @@ x86_emulate(
>>          switch ( modrm_reg & 7 )
>>          {
>>  #define GRP2(name, ext) \
>> -        case ext: \
>> +        case (ext): \
>>              if ( ops->rmw && dst.type == OP_MEM ) \
>>                  state->rmw = rmw_##name; \
>>              else \
>> @@ -8611,7 +8611,7 @@ int x86_emul_rmw(
>>              unsigned long dummy;
>> 
>>  #define XADD(sz, cst, mod) \
>> -        case sz: \
>> +        case (sz): \
>>              asm ( "" \
>>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
> 
> ... this is really nitpicky of the rule / tool. What halfway realistic
> ways do you see to actually misuse these macros? What follows the 
> "case"
> keyword is just an expression; no precedence related issues are 
> possible.
> 

I do share the view: no real danger is possible in sensible uses. Often 
MISRA rules are stricter than necessary to have a simple formulation, by 
avoiding too many special cases.

However, if a deviation is formulated, then it needs to be maintained, 
for no real readability benefit in this case, in my opinion. I can be 
convinced otherwise, of course.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

