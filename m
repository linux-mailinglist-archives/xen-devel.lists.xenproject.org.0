Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EF7CFCDF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 16:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619397.964372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtU7X-0001fU-JU; Thu, 19 Oct 2023 14:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619397.964372; Thu, 19 Oct 2023 14:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtU7X-0001d5-Gr; Thu, 19 Oct 2023 14:35:31 +0000
Received: by outflank-mailman (input) for mailman id 619397;
 Thu, 19 Oct 2023 14:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtU7W-0001cy-BT
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 14:35:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf63922d-6e8c-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 16:35:28 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E69814EE073D;
 Thu, 19 Oct 2023 16:35:27 +0200 (CEST)
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
X-Inumbo-ID: bf63922d-6e8c-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 16:35:27 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2 8/8] xen/compat: use BUILD_BUG_ON in
 CHECK_SIZE macros
In-Reply-To: <8546127f-9945-0175-4e11-e187233e13cb@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6138e02935236afd51a5db98d3527e5e2602468d.1697123806.git.nicola.vetrini@bugseng.com>
 <8546127f-9945-0175-4e11-e187233e13cb@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4e0c7d27b73fd00e8574547eff2a8da6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2023 08:09, Jan Beulich wrote:
> On 12.10.2023 17:28, Nicola Vetrini wrote:
>> BUILD_BUG_ON is the preferred way to induce a build error
>> upon statically determined incorrect conditions.
>> 
>> This also fixes a MISRA C:2012 Rule 10.1 violation in the
>> previous formulation.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Hmm, looking back it's indeed not clear why I didn't use BUILD_BUG_ON() 
> right
> away. Perhaps just to avoid inline functions when things can be done 
> without.
> And/or because originally the macros were intended to be usable in 
> function
> bodies, not (just) at file scope. However, ...
> 
>> --- a/xen/include/xen/compat.h
>> +++ b/xen/include/xen/compat.h
>> @@ -151,12 +151,20 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
>>      return x == c; \
>>  }
>> 
>> -#define CHECK_SIZE(name) \
>> -    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) 
>> != \
>> -                                         sizeof(compat_ ## name ## 
>> _t)) * 2]
>> +#define CHECK_SIZE(name)                                  \
>> +static inline void __maybe_unused CHECK_SIZE_##name(void) \
>> +{                                                         \
>> +    typedef int CHECK_NAME(name, S)[1];                   \
> 
> ... what's this and ...
> 
>> +    BUILD_BUG_ON(sizeof(xen_ ## name ## _t) !=            \
>> +                 sizeof(compat_ ## name ## _t));          \
>> +}
>>  #define CHECK_SIZE_(k, n) \
>> -    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
>> -                                          sizeof(k compat_ ## n)) * 
>> 2]
>> +static inline void __maybe_unused CHECK_SIZE_##k_##n(void) \
>> +{                                                          \
>> +    typedef int CHECK_NAME_(k, n, S)[1];                   \
> 
> ... this needed for? The types aren't used anywhere afaict.
> 
> Jan
> 
>> +    BUILD_BUG_ON(sizeof(k xen_ ## n) !=                    \
>> +                 sizeof(k compat_ ## n));                  \
>> +}
>> 
>>  #define CHECK_FIELD_COMMON(name, t, f) \
>>  static inline int __maybe_unused name(xen_ ## t ## _t *x, compat_ ## 
>> t ## _t *c) \

You're probably right. I was wondering the same thing when replacing the 
code with
BUILD_BUG_ON.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

