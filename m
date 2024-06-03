Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB88D8996
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 21:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735003.1141160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sED6t-0002Dz-U8; Mon, 03 Jun 2024 19:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735003.1141160; Mon, 03 Jun 2024 19:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sED6t-0002BG-Qe; Mon, 03 Jun 2024 19:12:47 +0000
Received: by outflank-mailman (input) for mailman id 735003;
 Mon, 03 Jun 2024 19:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3ZA=NF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sED6s-0002BA-Qn
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 19:12:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41a3641c-21dd-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 21:12:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 17E6E4EE0738;
 Mon,  3 Jun 2024 21:12:44 +0200 (CEST)
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
X-Inumbo-ID: 41a3641c-21dd-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Mon, 03 Jun 2024 21:12:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 4/5] automation/eclair_analysis: address remaining
 violations of MISRA C Rule 20.12
In-Reply-To: <cb14826d-3c5c-45b8-aaea-30cfa85a450f@suse.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
 <90c40d6a-d648-46bb-9cb0-df11ac165bd7@suse.com>
 <085aabe9953d53e634d5cf75fecdb8b7@bugseng.com>
 <cb14826d-3c5c-45b8-aaea-30cfa85a450f@suse.com>
Message-ID: <017a3e69ef784eb919a96a06b0fcf0dc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-03 20:52, Jan Beulich wrote:
> On 03.06.2024 09:13, Nicola Vetrini wrote:
>> On 2024-06-03 07:58, Jan Beulich wrote:
>>> On 01.06.2024 12:16, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
>>>>  -config=MC3R1.R20.12,macros+={deliberate,
>>>> "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="The macro DEFINE is defined and used in excluded files
>>>> asm-offsets.c.
>>>> +This may still cause violations if entities outside these files are
>>>> referred to
>>>> +in the expansion."
>>>> +-config=MC3R1.R20.12,macros+={deliberate,
>>>> "name(DEFINE)&&loc(file(asm_offsets))"}
>>>> +-doc_end
>>> 
>>> Can you give an example of such a reference? Nothing _in_ 
>>> asm-offsets.c
>>> should be referenced, I'd think. Only stuff in asm-offsets.h as
>>> _generated
>>> from_ asm-offsets.c will, of course, be.
>>> 
>> 
>> Perhaps I could have expressed that more clearly. What I meant is that
>> there are some arguments to DEFINE that are not part of asm-offsets.c,
>> therefore they end up in the violation report, but are not actually
>> relevant, because the macro DEFINE is actually what we want to 
>> exclude.
>> 
>> See for instance at the link below VCPU_TRAP_{NMI,MCE}, which are
>> defined in asm/domain.h and used as arguments to DEFINE inside
>> asm-offsets.c.
>> 
>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/676/PROJECT.ecd;/by_service/MC3R1.R20.12.html
> 
> I'm afraid I still don't understand: The file being supposed to be
> excluded from scanning, why does it even show up in that report?
> 
> Jan

The report is made up of several source code locations. Three of them 
are within asm-offsets.c, which is excluded from compliance but still 
analyzed, but one references a macro definition in another file (e.g., 
VCPU_TRAP_NMI from asm/domain.h). So in this case the exclusion of 
asm-offsets.c is not enough for the report not to be shown.

The configuration is telling the tool that the macro DEFINE from 
asm-offsets is meant to be deviated, which is what is needed in this 
case.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

