Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54252765824
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571215.894545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3Ns-0004l8-IR; Thu, 27 Jul 2023 15:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571215.894545; Thu, 27 Jul 2023 15:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3Ns-0004iS-Fb; Thu, 27 Jul 2023 15:58:36 +0000
Received: by outflank-mailman (input) for mailman id 571215;
 Thu, 27 Jul 2023 15:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qP3Nq-0004iE-Ez
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:58:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fde7791-2c96-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:58:33 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id D69854EE073F;
 Thu, 27 Jul 2023 17:58:30 +0200 (CEST)
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
X-Inumbo-ID: 6fde7791-2c96-11ee-b248-6b7b168915f2
Message-ID: <da8ca9ee-d60b-a765-35ff-944b51f940f7@bugseng.com>
Date: Thu, 27 Jul 2023 17:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 4/4] x86: avoid shadowing to address MISRA C:2012 Rule
 5.3
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <10606d7429239b5a2b7dffcb22eeb1ce5e73e991.1690449587.git.nicola.vetrini@bugseng.com>
 <fdd04423-f38d-1575-62e7-4d452e396c51@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <fdd04423-f38d-1575-62e7-4d452e396c51@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/07/23 17:41, Jan Beulich wrote:
> On 27.07.2023 12:48, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -1483,7 +1483,7 @@ x86_emulate(
>>       {
>>           enum x86_segment seg;
>>           struct segment_register cs, sreg;
>> -        struct cpuid_leaf cpuid_leaf;
>> +        struct cpuid_leaf res;
> 
> This is too generic a name for a variable with a scope of several
> thousand lines. Perhaps just "leaf"?

It can also be defined inside the switch clause, since it has no other 
purpose than store a result.

> 
>> @@ -8408,8 +8408,6 @@ x86_emulate(
>>           generate_exception(X86_EXC_MF);
>>       if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
>>       {
>> -        unsigned long cr4;
>> -
>>           if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
>>               cr4 = X86_CR4_OSXMMEXCPT;
>>           generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
> 
> This change looks okay to me, but I'd like to strongly encourage
> you to split both changes. They're of different nature, and for
> the latter it may even be worthwhile pointing out when exactly
> this duplication of variables was introduced (it clearly would
> better have been avoided).
> 

I did it this way because they are the only violations of R5.3 left in 
this file (among those not subject to deviation). By splitting you mean 
two patches in this series or a separate patch just for this change?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

