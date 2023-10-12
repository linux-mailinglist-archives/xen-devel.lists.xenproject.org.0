Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088417C6E1A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 14:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615775.957189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqumR-0004SA-Ka; Thu, 12 Oct 2023 12:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615775.957189; Thu, 12 Oct 2023 12:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqumR-0004Pq-Hv; Thu, 12 Oct 2023 12:27:07 +0000
Received: by outflank-mailman (input) for mailman id 615775;
 Thu, 12 Oct 2023 12:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqumP-0004Pk-QR
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 12:27:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5341635-68fa-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 14:27:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8124D4EE0739;
 Thu, 12 Oct 2023 14:27:01 +0200 (CEST)
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
X-Inumbo-ID: a5341635-68fa-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 14:27:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, Simone
 Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
In-Reply-To: <9c728576-16e0-4d72-9019-d6f5fe8f033b@citrix.com>
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
 <9c728576-16e0-4d72-9019-d6f5fe8f033b@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1747011c199a19b458079e04d49f9c45@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/2023 18:56, andrew.cooper3@citrix.com wrote:
> On 11/10/2023 8:46 pm, Nicola Vetrini wrote:
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index ee7aed0609d2..1b00e4e3e9b7 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>>         See automation/eclair_analysis/deviations.ecl for the full 
>> explanation.
>>       - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R11.9
>> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if 
>> a type is
>> +       scalar, therefore its usage for this purpose is allowed.
>> +     - Tagged as `deliberate` for ECLAIR.
> 
> Really?
> 
> #define __ACCESS_ONCE(x)
>     (void)(typeof(x))0; /* Scalar typecheck. */
> 
> That's not a pointer.
> 
> If someone were to pass in an x who's type was pointer-to-object, then
> yes it is technically a NULL pointer constant for long enough for the
> build to error out.
> 
> What justification is Eclair using to suggest that it is a pointer?
> 
> If you really really want to shut things up, it doesn't need to be 0 -
> it could be 1 or any other integer, but this honestly feels like a bug
> in Eclair to me.
> 
> ~Andrew

The non-compliant uses found by the checker were due to function 
pointers
e.g.

void (*fp)(int i);

violation for rule MC3R1.R11.9: (required) The macro `NULL' shall be the 
only permitted form of integer null pointer constant. (untagged)
p.c:12.3-12.7: (MACRO) Loc #1 [culprit: non-compliant use of null 
pointer constant]
   A(fp) = NULL;
   <~~~>
p.c:6.8-6.19: for #1 [culprit: expanded from macro `_A']
  (void)(typeof(X))0; \
        <~~~~~~~~~~>
p.c:9.16-9.20: for #1 [culprit: expanded from macro `A']
#define A(X) (*_A(X))
                <~~~>

These uses do not cause a build fail, and we deemed this usage of 0 to 
be correct
(a neutral value that would allow __ACCESS_ONCE to support any type of 
argument).
While perhaps some other value does have the same property (e.g., 1), we 
felt that it was
okay to let 0 remain there.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

