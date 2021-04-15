Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B19536074B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111029.212213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzNE-0007WJ-DW; Thu, 15 Apr 2021 10:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111029.212213; Thu, 15 Apr 2021 10:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzNE-0007Vu-A3; Thu, 15 Apr 2021 10:37:24 +0000
Received: by outflank-mailman (input) for mailman id 111029;
 Thu, 15 Apr 2021 10:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWzND-0007Vm-0O
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:37:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae82d845-a420-4158-a76b-ff42f5fa249a;
 Thu, 15 Apr 2021 10:37:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2810AF0D;
 Thu, 15 Apr 2021 10:37:20 +0000 (UTC)
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
X-Inumbo-ID: ae82d845-a420-4158-a76b-ff42f5fa249a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618483041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZgtjRjd+QptCS+hz4J79vjWeyIF+1+OxhjgLaACvdM=;
	b=gpB01kSCFFgTN1G2IXK/YWxHJsvwngfg+b/ayhqtM7obqGfau8yRz/6/PkKrDTuUT2aJtm
	q/tYFj3KHB3GZw2i+29keoHT4XEX7AhfQPqnwGJEpqZzLh5mp6YtqIUbiDdErTPrFE6z+o
	h7DxOuVNm5kCgkWXjy/TBDgdUCF1JoA=
Subject: Re: [PATCH v2 12/17] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
 <YHgM6eTT2OJY89aU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1862ca8d-c16c-8f47-1999-15809fcacdfe@suse.com>
Date: Thu, 15 Apr 2021 12:37:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHgM6eTT2OJY89aU@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 11:52, Roger Pau Monné wrote:
> On Mon, Nov 23, 2020 at 03:33:03PM +0100, Jan Beulich wrote:
>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -8,10 +8,13 @@
>>  #include <err.h>
>>  
>>  #include <xen-tools/libs.h>
>> +#include <xen/asm/x86-defns.h>
>>  #include <xen/asm/x86-vendors.h>
>>  #include <xen/lib/x86/cpu-policy.h>
>>  #include <xen/domctl.h>
>>  
>> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> 
> This gets used only once...
> 
>> +
>>  static unsigned int nr_failures;
>>  #define fail(fmt, ...)                          \
>>  ({                                              \
>> @@ -564,6 +567,103 @@ static void test_cpuid_out_of_range_clea
>>      }
>>  }
>>  
>> +static void test_cpuid_maximum_leaf_shrinking(void)
>> +{
>> +    static const struct test {
>> +        const char *name;
>> +        struct cpuid_policy p;
>> +    } tests[] = {
>> +        {
>> +            .name = "basic",
>> +            .p = {
>> +                /* Very basic information only. */
>> +                .basic.max_leaf = 1,
>> +                .basic.raw_fms = 0xc2,
>> +            },
>> +        },
>> +        {
>> +            .name = "cache",
>> +            .p = {
>> +                /* Cache subleaves present. */
>> +                .basic.max_leaf = 4,
>> +                .cache.subleaf[0].type = 1,
>> +            },
>> +        },
>> +        {
>> +            .name = "feat#0",
>> +            .p = {
>> +                /* Subleaf 0 only with some valid bit. */
>> +                .basic.max_leaf = 7,
>> +                .feat.max_subleaf = 0,
>> +                .feat.fsgsbase = 1,
>> +            },
>> +        },
>> +        {
>> +            .name = "feat#1",
>> +            .p = {
>> +                /* Subleaf 1 only with some valid bit. */
>> +                .basic.max_leaf = 7,
>> +                .feat.max_subleaf = 1,
>> +                .feat.avx_vnni = 1,
>> +            },
>> +        },
>> +        {
>> +            .name = "topo",
>> +            .p = {
>> +                /* Topology subleaves present. */
>> +                .basic.max_leaf = 0xb,
>> +                .topo.subleaf[0].type = 1,
>> +            },
>> +        },
>> +        {
>> +            .name = "xstate",
>> +            .p = {
>> +                /* First subleaf always valid (and then non-zero). */
>> +                .basic.max_leaf = 0xd,
>> +                .xstate.xcr0_low = XSTATE_FP_SSE,
> 
> ...here.

For now, yes. I'm introducing the constant because I think it wants
using in other places too, to avoid using literal numbers. See e.g.

                .xstate.xcr0_low = 7,

in test_cpuid_serialise_success().

> And then I also wonder whether this requires having any
> specific values rather than just using ~0 or any random non-0 value.

I'm afraid I don't understand: There's no ~0 here and no random
non-zero value - all other structure elements are left default-
initialized.

>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -121,7 +121,9 @@ void cpuid_viridian_leaves(const struct
>>      switch ( leaf )
>>      {
>>      case 0:
>> -        res->a = 0x40000006; /* Maximum leaf */
>> +        /* Maximum leaf */
>> +        cpuid_viridian_leaves(v, 0x40000006, 0, res);
>> +        res->a = res->a | res->b | res->c | res->d ? 0x40000006 : 0x40000004;
> 
> I think you would need to adjust this chunk to also take into account
> leaf 0x40000005 now.

Hmm, yes, looks like I failed to take note that I need to re-base
over that addition.

> I also wonder whether we should actually limit HyperV leaves. I think
> it's perfectly fine to report up to the maximum supported by Xen, even
> if it turns out none of the advertised feat are present, as in: Xen
> supports those leaves, but none of the features exposed are
> available.

Well, if the Viridian maintainers (I realize I failed to Cc Paul on the
original submission) think I should leave the Viridian leaves alone
(rather than handling consistently with other leaves), I can drop this
part of the change.

>> --- a/xen/include/public/arch-x86/cpuid.h
>> +++ b/xen/include/public/arch-x86/cpuid.h
>> @@ -113,6 +113,10 @@
>>  /* Max. address width in bits taking memory hotplug into account. */
>>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
>>  
>> -#define XEN_CPUID_MAX_NUM_LEAVES 5
>> +#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
>> +#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
>> +#define XEN_CPUID_MAX_NUM_LEAVES \
>> +    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
>> +     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
> 
> I guess we don't have any form of max macro available here to use?

I'm not aware of one that could be used in pre-processor directives
as well.

>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -238,6 +238,45 @@ void x86_cpuid_policy_clear_out_of_range
>>                  ARRAY_SIZE(p->extd.raw) - 1);
>>  }
>>  
>> +void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
>> +{
>> +    unsigned int i;
>> +
>> +    p->basic.raw[0x4] = p->cache.raw[0];
>> +
>> +    for ( i = p->feat.max_subleaf; i; --i )
>> +        if ( p->feat.raw[i].a | p->feat.raw[i].b |
>> +             p->feat.raw[i].c | p->feat.raw[i].d )
>> +            break;
>> +    p->feat.max_subleaf = i;
>> +    p->basic.raw[0x7] = p->feat.raw[0];
> 
> Do you need to use p->feat.raw[i] to assure the basic 0x7 leaf is seen
> as populated?
> 
> I think in theory raw[0] could be clear while raw[i] cannot as long as
> there's a populated leaf > 0 due to the check above.

Hmm, yes, this may not be very likely, but is definitely possible.

Jan

