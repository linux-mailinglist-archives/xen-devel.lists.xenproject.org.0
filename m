Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAD7CFC77
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 16:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619390.964353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTzI-0007PU-Im; Thu, 19 Oct 2023 14:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619390.964353; Thu, 19 Oct 2023 14:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTzI-0007NY-Eu; Thu, 19 Oct 2023 14:27:00 +0000
Received: by outflank-mailman (input) for mailman id 619390;
 Thu, 19 Oct 2023 14:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtTzH-0007NS-I8
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 14:26:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea9a175-6e8b-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 16:26:57 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8A5924EE073D;
 Thu, 19 Oct 2023 16:26:56 +0200 (CEST)
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
X-Inumbo-ID: 8ea9a175-6e8b-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 16:26:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <08286993-6a83-b928-6398-e129397927a0@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 18:30, Jan Beulich wrote:
> On 16.10.2023 18:17, Nicola Vetrini wrote:
>> On 16/10/2023 17:33, Jan Beulich wrote:
>>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -274,6 +274,12 @@ still non-negative."
>>>>  -config=MC3R1.R10.1,etypes+={safe,
>>>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))",
>>>> "dst_type(ebool||boolean)"}
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern 
>>>> to
>>>> obtain the value
>>>> +2^ffs(x) for unsigned integers on two's complement architectures
>>>> +(all the architectures supported by Xen satisfy this requirement)."
>>>> +-config=MC3R1.R10.1,reports+={safe,
>>>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>>>> +-doc_end
>>> 
>>> Why is this added here rather than by ...
>>> 
>>>> --- a/xen/include/xen/macros.h
>>>> +++ b/xen/include/xen/macros.h
>>>> @@ -8,8 +8,10 @@
>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>> 
>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>> 
>>> a SAF-<n>-safe comment here?
>>> 
>> 
>> One reason is that now that violations only belonging to tool
>> configurations
>> and similar are documented in docs/misra/deviations.rst (committed in
>> Stefano's
>> branch for-4.19 [1]).
> 
> But tool configuration means every analysis tool needs configuring
> separately. That's why the comment tagging scheme was decided to be
> preferred, iirc.
> 
>> Also, there were disagreements on the SAF naming
>> scheme, and
>> patches like those would not be accepted at the moment.
> 
> Well, that needs resolving. The naming there shouldn't lead to patches
> being accepted that later may need redoing.
> 
> Jan

While this is true, in this case I'm not willing to deviate with a SAF, 
given that
some ECLAIR-specific configuration would be needed anyways, given that 
I'm deviating a macro definition, rather than the line where it's 
actually used (and maybe other tools would need
that as well).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

