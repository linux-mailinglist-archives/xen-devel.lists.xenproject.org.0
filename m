Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFD7CAEC9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617856.960917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQHf-00015q-HF; Mon, 16 Oct 2023 16:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617856.960917; Mon, 16 Oct 2023 16:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQHf-00013P-EA; Mon, 16 Oct 2023 16:17:35 +0000
Received: by outflank-mailman (input) for mailman id 617856;
 Mon, 16 Oct 2023 16:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KAZ=F6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsQHd-00013J-Qi
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:17:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82af9089-6c3f-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 18:17:32 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4FA294EE0737;
 Mon, 16 Oct 2023 18:17:32 +0200 (CEST)
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
X-Inumbo-ID: 82af9089-6c3f-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 18:17:32 +0200
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
In-Reply-To: <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 17:33, Jan Beulich wrote:
> On 12.10.2023 17:28, Nicola Vetrini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -274,6 +274,12 @@ still non-negative."
>>  -config=MC3R1.R10.1,etypes+={safe, 
>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
>> "dst_type(ebool||boolean)"}
>>  -doc_end
>> 
>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to 
>> obtain the value
>> +2^ffs(x) for unsigned integers on two's complement architectures
>> +(all the architectures supported by Xen satisfy this requirement)."
>> +-config=MC3R1.R10.1,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>> +-doc_end
> 
> Why is this added here rather than by ...
> 
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -8,8 +8,10 @@
>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>> 
>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> 
> a SAF-<n>-safe comment here?
> 

One reason is that now that violations only belonging to tool 
configurations
and similar are documented in docs/misra/deviations.rst (committed in 
Stefano's
branch for-4.19 [1]). Also, there were disagreements on the SAF naming 
scheme, and
patches like those would not be accepted at the moment.

>> +#define LOWEST_BIT(x) ((x) & -(x))
> 
> Personally I consider the name misleading: I'd expect a macro of this
> name to return a bit number, not a mask with a single bit set. No
> good, reasonably short name comes to mind - ISOLATE_LOW_BIT() is too
> long for my taste.
> 
> Jan

[1] 
https://gitlab.com/xen-project/people/sstabellini/xen/-/commits/for-4.19

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

