Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8A1FB8CD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:59:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDyU-00048U-9B; Tue, 16 Jun 2020 15:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlDyS-00048O-2y
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:58:08 +0000
X-Inumbo-ID: 2a83dac8-afea-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a83dac8-afea-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 15:58:06 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9RTjJn1cu1zbGK1/wMEoAbg1cEEXppsSBe2Wu3i7UhI/yIW3aNhaqLAqTEaCYY/tQ/bTOy0xFC
 dOkiq4jbO59DYhDhnYZQF0JL2Sg6HJsPFMnrD0S2S3eQZHRW9mdL9xTfK90UOtJRqvjDCwR0M5
 2QE0uMI4ZeLTQ0feSNAr+zcBU4xQi0LRw2sn9OsaUGjnAzEe17eGYIc+MP4eL2I7cRtl4XPrK1
 8m6TFmc8tVwky8F9FVZs2NtPk97izsUgJnuJaZOo33dhczjXaHSA7f/Q3q8irRAq/iBsFeq7f3
 jtw=
X-SBRS: 2.7
X-MesageID: 20528443
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20528443"
Subject: Re: [PATCH 3/9] tools/libx[cl]: Move processing loop down into
 xc_cpuid_set()
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-4-andrew.cooper3@citrix.com>
 <7ac49edf-1a8c-435d-0b5b-96496432e9f6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f270ce4d-a17a-8006-7b36-155833e74598@citrix.com>
Date: Tue, 16 Jun 2020 16:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7ac49edf-1a8c-435d-0b5b-96496432e9f6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 10:16, Jan Beulich wrote:
> On 15.06.2020 16:15, Andrew Cooper wrote:
>> Currently, libxl__cpuid_legacy() passes each element of the policy list to
>> xc_cpuid_set() individually.  This is wasteful both in terms of the number of
>> hypercalls made, and the quantity of repeated merging/auditing work performed
>> by Xen.
>>
>> Move the loop processing down into xc_cpuid_set(), which allows us to do one
>> set of hypercalls, rather than one per list entry.
>>
>> In xc_cpuid_set(), obtain the full host, guest max and current policies to
>> begin with, and loop over the xend array, processing one leaf at a time.
>> Replace the linear search with a binary search, seeing as the serialised
>> leaves are sorted.
>>
>> No change in behaviour from the guests point of view.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a few remarks:
>
>> @@ -286,99 +311,101 @@ int xc_cpuid_set(
>>      }
>>  
>>      rc = -ENOMEM;
>> -    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL )
>> +    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
>> +         (max  = calloc(nr_leaves, sizeof(*max)))  == NULL ||
>> +         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
>>      {
>>          ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
>>          goto fail;
>>      }
>>  
>> +    /* Get the domain's current policy. */
>> +    nr_msrs = 0;
>> +    nr_cur = nr_leaves;
>> +    rc = xc_get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
>> +    if ( rc )
>> +    {
>> +        PERROR("Failed to obtain d%d current policy", domid);
>> +        rc = -errno;
>> +        goto fail;
>> +    }
>> +
>>      /* Get the domain's max policy. */
>>      nr_msrs = 0;
>> -    policy_leaves = nr_leaves;
>> +    nr_max = nr_leaves;
>>      rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
>>                                                : XEN_SYSCTL_cpu_policy_pv_max,
>> -                                  &policy_leaves, leaves, &nr_msrs, NULL);
>> +                                  &nr_max, max, &nr_msrs, NULL);
>>      if ( rc )
>>      {
>>          PERROR("Failed to obtain %s max policy", di.hvm ? "hvm" : "pv");
>>          rc = -errno;
>>          goto fail;
>>      }
>> -    for ( i = 0; i < policy_leaves; ++i )
>> -        if ( leaves[i].leaf == xend->leaf &&
>> -             leaves[i].subleaf == xend->subleaf )
>> -        {
>> -            polregs[0] = leaves[i].a;
>> -            polregs[1] = leaves[i].b;
>> -            polregs[2] = leaves[i].c;
>> -            polregs[3] = leaves[i].d;
>> -            break;
>> -        }
>>  
>>      /* Get the host policy. */
>>      nr_msrs = 0;
>> -    policy_leaves = nr_leaves;
>> +    nr_host = nr_leaves;
>>      rc = xc_get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
>> -                                  &policy_leaves, leaves, &nr_msrs, NULL);
>> +                                  &nr_host, host, &nr_msrs, NULL);
>>      if ( rc )
>>      {
>>          PERROR("Failed to obtain host policy");
>>          rc = -errno;
>>          goto fail;
>>      }
>> -    for ( i = 0; i < policy_leaves; ++i )
>> -        if ( leaves[i].leaf == xend->leaf &&
>> -             leaves[i].subleaf == xend->subleaf )
>> -        {
>> -            regs[0] = leaves[i].a;
>> -            regs[1] = leaves[i].b;
>> -            regs[2] = leaves[i].c;
>> -            regs[3] = leaves[i].d;
>> -            break;
>> -        }
>>  
>> -    for ( i = 0; i < 4; i++ )
>> +    rc = -EINVAL;
>> +    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
>>      {
>> -        if ( xend->policy[i] == NULL )
>> +        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
>> +        const xen_cpuid_leaf_t *max_leaf = find_leaf(max, nr_max, xend);
>> +        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
>> +
>> +        if ( cur_leaf == NULL || max_leaf == NULL || host_leaf == NULL )
>>          {
>> -            regs[i] = polregs[i];
>> -            continue;
>> +            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
>> +            goto fail;
>>          }
>>  
>> -        /*
>> -         * Notes for following this algorithm:
>> -         *
>> -         * While it will accept any leaf data, it only makes sense to use on
>> -         * feature leaves.  regs[] initially contains the host values.  This,
>> -         * with the fall-through chain, is how the 's' and 'k' options work.
>> -         */
>> -        for ( j = 0; j < 32; j++ )
>> +        for ( int i = 0; i < 4; i++ )
> As you move the declaration here, perhaps switch to unsigned int
> as well? And express 4 as ARRAY_SIZE()?
>
>>          {
>> -            unsigned char val = !!((regs[i] & (1U << (31 - j))));
>> -            unsigned char polval = !!((polregs[i] & (1U << (31 - j))));
>> -
>> -            rc = -EINVAL;
>> -            if ( !strchr("10xks", xend->policy[i][j]) )
>> -                goto fail;
>> -
>> -            if ( xend->policy[i][j] == '1' )
>> -                val = 1;
>> -            else if ( xend->policy[i][j] == '0' )
>> -                val = 0;
>> -            else if ( xend->policy[i][j] == 'x' )
>> -                val = polval;
>> -
>> -            if ( val )
>> -                set_feature(31 - j, regs[i]);
>> -            else
>> -                clear_feature(31 - j, regs[i]);
>> +            uint32_t *cur_reg = &cur_leaf->a + i;
>> +            const uint32_t *max_reg = &max_leaf->a + i;
>> +            const uint32_t *host_reg = &host_leaf->a + i;
>> +
>> +            if ( xend->policy[i] == NULL )
>> +                continue;
>> +
>> +            for ( int j = 0; j < 32; j++ )
> unsigned int again? I don't think there's a suitable array available
> to also use ARRAY_SIZE() here.

All fixed.

>
>> +            {
>> +                bool val;
>> +
>> +                if ( xend->policy[i][j] == '1' )
>> +                    val = true;
>> +                else if ( xend->policy[i][j] == '0' )
>> +                    val = false;
>> +                else if ( xend->policy[i][j] == 'x' )
>> +                    val = test_bit(31 - j, max_reg);
> Still seeing "max" used here is somewhat confusing given the purpose
> of the series, and merely judging from the titles I can't yet spot
> where later on it'll change. But I assume it will ...

No - it won't change.  The legacy xend adjustments have always been
based on the max featureset, and changing it will break VM migration.

The soon-to-exist (4.15 at this point) brand new "what do I do for a
fresh boot" path will do things differently even for the legacy Xend
leaves, but the logic here must not semantically change.

~Andrew

