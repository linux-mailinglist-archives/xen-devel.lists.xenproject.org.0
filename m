Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69317C836B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616439.958476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFda-0001AF-SQ; Fri, 13 Oct 2023 10:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616439.958476; Fri, 13 Oct 2023 10:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFda-00017k-Os; Fri, 13 Oct 2023 10:43:22 +0000
Received: by outflank-mailman (input) for mailman id 616439;
 Fri, 13 Oct 2023 10:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqNf=F3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qrFdZ-000153-EU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:43:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5366ba0e-69b5-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 12:43:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4C0354EE073A;
 Fri, 13 Oct 2023 12:43:20 +0200 (CEST)
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
X-Inumbo-ID: 5366ba0e-69b5-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 13 Oct 2023 12:43:20 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <f62ad310-0f9a-4b28-9592-023d6a98c0dd@xen.org>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <f62ad310-0f9a-4b28-9592-023d6a98c0dd@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <022106b550e8303d554e557bf6c23651@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2023 10:25, Julien Grall wrote:
> Hi Nicola,
> 
> On 12/10/2023 16:28, Nicola Vetrini wrote:
>> The purpose of this macro is to encapsulate the well-known expression
>> 'x & -x', that in 2's complement architectures on unsigned integers 
>> will
>> give 2^ffs(x), where ffs(x) is the position of the lowest set bit in 
>> x.
> 
> In the commit message it is clear that the macro will return the
> lowest set bit. But...
> 
>> 
>> A deviation for ECLAIR is also introduced.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - rename to LOWEST_BIT
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>>   xen/include/xen/macros.h                         | 6 ++++--
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index d8170106b449..b8e1155ee49d 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -274,6 +274,12 @@ still non-negative."
>>   -config=MC3R1.R10.1,etypes+={safe, 
>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
>> "dst_type(ebool||boolean)"}
>>   -doc_end
>> 
>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to 
>> obtain the value
>> +2^ffs(x) for unsigned integers on two's complement architectures
>> +(all the architectures supported by Xen satisfy this requirement)."
>> +-config=MC3R1.R10.1,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>> +-doc_end
>> +
>>   ### Set 3 ###
>> 
>>   #
>> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
>> index d0caae7db298..af47179d1056 100644
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -8,8 +8,10 @@
>>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>> 
>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>> +#define LOWEST_BIT(x) ((x) & -(x))
> 
> ... this is not reflected in the name of the macro. So it is not
> obvious if it will return the lowest bit set or clear.
> 
> Can you at least add a comment on top explaining what it returns?
> Something like:
> 
> /* Return the lowest bit set */
> 
> Cheers,

No problem

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

