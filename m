Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F57BD41C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 09:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614193.955163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkS5-00048D-Q3; Mon, 09 Oct 2023 07:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614193.955163; Mon, 09 Oct 2023 07:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkS5-00045P-Ly; Mon, 09 Oct 2023 07:13:17 +0000
Received: by outflank-mailman (input) for mailman id 614193;
 Mon, 09 Oct 2023 07:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkS4-00044X-88
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 07:13:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50a0c244-6673-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 09:13:15 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5F61A4EE073F;
 Mon,  9 Oct 2023 09:13:15 +0200 (CEST)
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
X-Inumbo-ID: 50a0c244-6673-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 09 Oct 2023 09:13:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 5/9] x86/cpu-policy: address violations of MISRA C
 Rule 10.1
In-Reply-To: <91d900b5-1298-4bb3-bd3d-6a829819a030@citrix.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <463572d126a7700e5e90ef3a49104bd4b8c1c389.1696514677.git.nicola.vetrini@bugseng.com>
 <91d900b5-1298-4bb3-bd3d-6a829819a030@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <5f83ddda5c176cccce275f52f7905de5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 06/10/2023 19:57, Andrew Cooper wrote:
> On 06/10/2023 9:26 am, Nicola Vetrini wrote:
>> The COUNT_LEAVES macro is introduced to avoid using an essentially
>> boolean value in a subtraction.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/include/xen/lib/x86/cpu-policy.h | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>> 
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h 
>> b/xen/include/xen/lib/x86/cpu-policy.h
>> index bab3eecda6c1..700993cc67e8 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -95,17 +95,18 @@ const char *x86_cpuid_vendor_to_str(unsigned int 
>> vendor);
>>  #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
>>                                        CPUID_GUEST_NR_EXTD_AMD)
>> 
>> +#define COUNT_LEAVES(X) ((X) - ((X) ? 1 : 0))
>>  /*
>>   * Maximum number of leaves a struct cpu_policy turns into when 
>> serialised for
>>   * interaction with the toolstack.  (Sum of all leaves in each union, 
>> less the
>>   * entries in basic which sub-unions hang off of.)
>>   */
>> -#define CPUID_MAX_SERIALISED_LEAVES                     \
>> -    (CPUID_GUEST_NR_BASIC +                             \
>> -     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
>> -     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
>> -     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
>> -     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
>> +#define CPUID_MAX_SERIALISED_LEAVES         \
>> +    (CPUID_GUEST_NR_BASIC +                 \
>> +     COUNT_LEAVES(CPUID_GUEST_NR_FEAT) +    \
>> +     COUNT_LEAVES(CPUID_GUEST_NR_CACHE) +   \
>> +     COUNT_LEAVES(CPUID_GUEST_NR_TOPO) +    \
>> +     COUNT_LEAVES(CPUID_GUEST_NR_XSTATE) +  \
>>       CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
> 
> This may not have been a MISRA-approved calculation, but encapsulating
> it like this breaks any ability to follow what's going on.
> 
> CPUID data in x86 is mostly a sparse 1-D array (BASIC, EXTD, HV 
> blocks),
> but a couple of elements in the BASIC array have arrays themselves.
> 
> The struct is laid out for O(1) access, so you can't just say
> sizeof(struct) / sizeof(element).  The BASIC array has elements (0x4,
> 0x7, 0xb, 0xd) which hold no data because there's actually an array
> elsewhere containing all the data.
> 
> So logically, it's:
> 
> (BASIC + (FEAT - 1) + (CACHE - 1) + (TOPO - 1) + (XSTATE - 1)) + EXTD + 
> 2
> 
> And in practice I'd far rather express it with a plain -1 than a -
> !!NR_, if the latter isn't an option.
> 
> Presumably MISRA would be happy with that?
> 
> If so, I can submit a patch.  There's also a typo in that the comment
> that wants fixing.
> 
> ~Andrew

Yes, that should be fine. I'll be happy to test that.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

