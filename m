Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1A972CA2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795136.1204294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwfp-0003Ug-5p; Tue, 10 Sep 2024 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795136.1204294; Tue, 10 Sep 2024 08:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwfp-0003Rj-2Y; Tue, 10 Sep 2024 08:56:33 +0000
Received: by outflank-mailman (input) for mailman id 795136;
 Tue, 10 Sep 2024 08:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snwfo-0003Rb-1I
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:56:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920aff65-6f52-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 10:56:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 520524EE079F;
 Tue, 10 Sep 2024 10:56:29 +0200 (CEST)
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
X-Inumbo-ID: 920aff65-6f52-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725958589; bh=C7Pogm89p0sFhq392osUtwwY2A8uiNnMshCPptL9GFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h8JC5H7Isu1r4JTUZwwwihG98DsyBF57/YgpTFxb4B5V4FXYPEh+5llcn/UrbsC5W
	 7339DUZNv+65Bgqp+gCXeHzq8FepRWGT0YHPWpNLJg3oNSFyI2dmApGeWjyHAIB64q
	 6qAxCyJe7y71J1yFZofV1cMGlktlFmzuQXTW2eLLMSHEOo5BBApabkzAucDMlReQxp
	 lF51Y1PqOj1anxmh+S06NCrsvndt4yOALoksOy5s8dm1VImYa1TB1mPQgLoC1J6PVk
	 9M3SmlNh2/Qff+hRGbi84PJo4CvFOMN35PRAJF5A2L0UFK8qG8Xh+owVWZPwXMTOM8
	 s9OoKz0Xf5lsg==
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 10:56:29 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
 <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
Message-ID: <25b6a974b7c9aaec32b11930168148a5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-01 10:36, Jan Beulich wrote:
> On 28.06.2024 08:30, Nicola Vetrini wrote:
>> The label 'out_unmap' is only reachable after ASSERT_UNREACHABLE,
>> so the code below is only executed upon erroneously reaching that
>> program point and calling domain_crash, thus resulting in the
>> for loop after 'out_unmap' to become unreachable in some 
>> configurations.
> 
> First: As you have come to be used to, briefly stating the rule itself
> (rather than just its number, requiring people like me - who have not
> memorized all the rule numbers - to go look up what rule this is) would
> be nice.

Sure

> 
> This being about unreachable code, why are the domain_crash() not the
> crucial points of "unreachability"? And even if they weren't there, why
> wouldn't it be the goto or ...
> 
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1040,6 +1040,7 @@ out_unmap:
>>       * Something went wrong, probably crashing the domain.  Unmap
>>       * everything and return.
>>       */
>> +    /* SAF-8-safe Rule 2.1: defensive programming */
>>      for ( i = 0; i < count; i++ )
>>          if ( map[i] )
>>              unmap_domain_page(map[i]);
> 
> ... the label (just out of context) where the comment needs to go?

Because of the way this rule's configuration work, deviations are placed 
on the construct that ends up being the target of the unreachability, 
rather than (one of) the causes of such unreachability. Putting the 
comment on the label works for ECLAIR by offsetting its target 
statement, but not for other tools afaik.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

