Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFD771DB4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577958.905104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx34-0006ff-Qi; Mon, 07 Aug 2023 10:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577958.905104; Mon, 07 Aug 2023 10:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx34-0006dK-NQ; Mon, 07 Aug 2023 10:01:14 +0000
Received: by outflank-mailman (input) for mailman id 577958;
 Mon, 07 Aug 2023 10:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSx33-0006dC-FD
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:01:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 562deceb-3509-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 12:01:11 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EC1DA4EE0737;
 Mon,  7 Aug 2023 12:01:10 +0200 (CEST)
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
X-Inumbo-ID: 562deceb-3509-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 12:01:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/6] x86: refactor macros in 'xen-mca.h' to address
 MISRA C:2012 Rule 5.3
In-Reply-To: <b575aad0-9c04-2037-b568-b2bc1fdc33d0@suse.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
 <b575aad0-9c04-2037-b568-b2bc1fdc33d0@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1f286a7219521052198c9cdadf400fda@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2023 10:31, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
>> The macros defined 'xen/include/public/arch-x86/xen-mca.h' have 
>> needless
>> underscore prefixes for parameter names and variable names that cause
>> shadowing with e.g. the variable 'i' in function 'mce_action'.
>> Therefore, the renaming aims to resolve present shadowing issues and
>> lessen the probability of future ones.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> I'm okay with the code adjustments here, but I'm afraid I don't follow
> the description: How is shadowing of "i" connected to the use of
> leading underscores in macro parameter names? I think you need to
> separate the two aspects in the wording.
> 

The shadowing remark is tied to the second part of the sentence, but 
I'll try
to make that clearer in v2.

>> --- a/xen/include/public/arch-x86/xen-mca.h
>> +++ b/xen/include/public/arch-x86/xen-mca.h
>> @@ -280,39 +280,39 @@ DEFINE_XEN_GUEST_HANDLE(xen_mc_logical_cpu_t);
>>  /* Prototype:
>>   *    uint32_t x86_mcinfo_nentries(struct mc_info *mi);
>>   */
>> -#define x86_mcinfo_nentries(_mi)    \
>> -    (_mi)->mi_nentries
>> +#define x86_mcinfo_nentries(mi)    \
>> +    (mi)->mi_nentries
> 
> Isn't there another rule demanding parenthization of the whole
> construct? If so, adding the then-missing parentheses right here would
> be quite desirable. (Personally I'm happy about them not being there on
> suffix expressions, as kind of an exception to the general rule.)
> 

If you're referring to Rule 20.7 then it does not require the whole 
expression to be enclosed in
parentheses, as it's concerned with macro parameters (their full 
expansion must parenthesize arguments at
some point, to prevent wrong evaluations due to operator precedence).

>> -        if (_mi == NULL) break;                                 \
>> -        _mic = x86_mcinfo_first(_mi);                           \
>> -        for (i = 0; i < x86_mcinfo_nentries(_mi); i++) {        \
>> -            if (_mic->type == (_type)) {                        \
>> -                found = 1;                                      \
>> +        found_ = 0;                                             \
>> +        (ret) = NULL;                                           \
>> +        if (mi == NULL) break;                                  \
> 
> The lack of parentheses here definitely wants dealing with right away.
> 
> Jan

Good catch

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

