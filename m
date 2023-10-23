Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A377D37AB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621454.967890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quuqJ-0001vU-5p; Mon, 23 Oct 2023 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621454.967890; Mon, 23 Oct 2023 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quuqJ-0001tW-2h; Mon, 23 Oct 2023 13:19:39 +0000
Received: by outflank-mailman (input) for mailman id 621454;
 Mon, 23 Oct 2023 13:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1quuqI-0001tP-9l
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:19:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfafb831-71a6-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 15:19:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6D11F4EE0747;
 Mon, 23 Oct 2023 15:19:35 +0200 (CEST)
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
X-Inumbo-ID: cfafb831-71a6-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 15:19:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
In-Reply-To: <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6d113a237846c7a41aa083e806f172e7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2023 11:19, Nicola Vetrini wrote:
> On 23/10/2023 09:48, Jan Beulich wrote:
>> On 20.10.2023 17:28, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -246,6 +246,12 @@ constant expressions are required.\""
>>>    "any()"}
>>>  -doc_end
>>> 
>>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern 
>>> to obtain the value
>>> +2^ffs(x) for unsigned integers on two's complement architectures
>>> +(all the architectures supported by Xen satisfy this requirement)."
>>> +-config=MC3R1.R10.1,reports+={safe, 
>>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>>> +-doc_end
>> 
>> This being deviated this way (rather than by SAF-* comments) wants
>> justifying in the description. You did reply to my respective
>> comment on v2, but such then (imo) needs propagating into the actual
>> patch as well.
>> 
> 
> Sure, will do.
> 
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
>>>         See automation/eclair_analysis/deviations.ecl for the full 
>>> explanation.
>>>       - Tagged as `safe` for ECLAIR.
>>> 
>>> +   * - R10.1
>>> +     - The well-known pattern (x & -x) applied to unsigned integer 
>>> values on 2's
>>> +       complement architectures (i.e., all architectures supported 
>>> by Xen), used
>>> +       to obtain the value 2^ffs(x), where ffs(x) is the position of 
>>> the first
>>> +       bit set. If no bits are set, zero is returned.
>>> +     - Tagged as `safe` for ECLAIR.
>> 
>> In such an explanation there shall not be any ambiguity. Here I see
>> an issue with ffs() returning 1-based bit position numbers, which
>> isn't in line with the use in 2^ffs(x). (Arguably use of ^ itself is
>> also problematic, as that's XOR in C, not POW. I'd suggest 2^^ffs(x)
>> or 2**ffs(x).)
>> 
> 
> Makes sense, I think I'll use an plain english explanation to avoid
> any confusion
> about notation.
> 
>>> --- a/xen/include/xen/macros.h
>>> +++ b/xen/include/xen/macros.h
>>> @@ -8,8 +8,11 @@
>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>> 
>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the 
>>> lowest set bit */
>>> +#define LOWEST_BIT(x) ((x) & -(x))
>> 
>> I'm afraid my concern regarding this new macro's name (voiced on v2) 
>> hasn't
>> been addressed (neither verbally nor by finding a more suitable name).
>> 
>> Jan
> 
> I didn't come up with much better names, so I left it as is. Here's a 
> few ideas:
> 
> - LOWEST_SET
> - MASK_LOWEST_SET
> - MASK_LOWEST_BIT
> - MASK_FFS_0
> - LOWEST_ONE
> 
> and also yours, included here for convenience, even though you felt it
> was too long:
> 
> - ISOLATE_LOW_BIT()
> 
> All maintainers from THE REST are CC-ed, so we can see if anyone has
> any suggestion.

There's also LOWEST_BIT_MASK as another possible name.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

