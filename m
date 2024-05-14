Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558BE8C5A2A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 19:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721687.1125295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6vlB-0002GX-IE; Tue, 14 May 2024 17:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721687.1125295; Tue, 14 May 2024 17:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6vlB-0002Dq-FZ; Tue, 14 May 2024 17:16:17 +0000
Received: by outflank-mailman (input) for mailman id 721687;
 Tue, 14 May 2024 17:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ttm=MR=amazon.co.uk=prvs=857b575ae=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6vl9-0002Dh-Ma
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 17:16:15 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8f028a5-1215-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 19:16:13 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 17:16:05 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:22193]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.14.167:2525]
 with esmtp (Farcaster)
 id e42f7b7e-387e-4fbc-bce0-ee8dc1ea35ec; Tue, 14 May 2024 17:16:03 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 May 2024 17:16:03 +0000
Received: from [10.95.97.194] (10.95.97.194) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 14 May
 2024 17:16:01 +0000
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
X-Inumbo-ID: a8f028a5-1215-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715706974; x=1747242974;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7WMWzzWfADKU6GG+LTImiZZ3v3HOBZvXkyxAIdszVRA=;
  b=K4lHS4UEAEaeOeFW4a0bRg22vLazQAybOF3iylOdbKv+IhLemKMYRmvp
   nCgLqqaMMWH2Sgybj30WC66VzIHzSIIStBAOBM56E/rIEGA1kfsv5tGzt
   UeB9e/rbAGc21mVYPuyozMYBKF1hZBSwOVDwoZJtq+Kle+/LoigkMk5Qj
   g=;
X-IronPort-AV: E=Sophos;i="6.08,159,1712620800"; 
   d="scan'208";a="725759101"
X-Farcaster-Flow-ID: e42f7b7e-387e-4fbc-bce0-ee8dc1ea35ec
Message-ID: <699c6487-58c9-456f-8415-e3c525fa905e@amazon.com>
Date: Tue, 14 May 2024 18:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 01/19] x86: Create per-domain mapping of guest_root_pt
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>, <pdurrant@amazon.com>,
	<dwmw@amazon.com>, Julien Grall <jgrall@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
 <20240513111117.68828-2-eliasely@amazon.com> <ZkIxdtiDc_pnPWdx@macbook>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <ZkIxdtiDc_pnPWdx@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.95.97.194]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Roger,

On 13/05/2024 16:27, Roger Pau Monné wrote:
>> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
>> index 2a445bb17b..1b025986f7 100644
>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -288,6 +288,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>>                                 1U << GDT_LDT_VCPU_SHIFT);
>>   }
>>   
>> +static int pv_create_root_pt_l1tab(struct vcpu *v)
>> +{
>> +    return create_perdomain_mapping(v->domain,
>> +                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v),
>> +                                    1, v->domain->arch.pv.root_pt_l1tab,
>> +                                    NULL);
>> +}
>> +
>> +static void pv_destroy_root_pt_l1tab(struct vcpu *v)
> 
> The two 'v' parameters could be const here.

I could constify the parameters but the functions wouldn't be consistent 
with the two above for gdt/ldt.

>> @@ -381,6 +412,11 @@ int pv_domain_initialise(struct domain *d)
>>       if ( rc )
>>           goto fail;
>>   
>> +    rc = create_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START,
>> +                                  PV_ROOT_PT_MAPPING_ENTRIES, NULL, NULL);
> 
> Why not use d->max_vcpus here, instead of forcing up to MAX_VIRT_CPUS?
> 
> By the time pv_domain_initialise() is called max_vcpus should already
> be initialized.  AFAICT it doesn't make a difference, because for the
> call here only the L3 table is created, as last two parameters are
> NULL, but still is more accurate to use max_vcpus.


There is no particular reason. I think we can safely use d->max_vcpus.
>> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
>> index df015589ce..c1377da7a5 100644
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -162,7 +162,15 @@ FUNC_LOCAL(restore_all_guest)
>>           and   %rsi, %rdi
>>           and   %r9, %rsi
>>           add   %rcx, %rdi
>> +
>> +        /*
>> +         * The address in the vCPU cr3 is always mapped in the per-domain
>> +         * pv_root_pt virt area.
>> +         */
>> +        imul  $PAGE_SIZE, VCPU_id(%rbx), %esi
> 
> Aren't some of the previous operations against %rsi now useless since
> it gets unconditionally overwritten here?

I think I can just get rid off of:

     and   %r9, %rsi

> and   %r9, %rsi
> [...]
> add   %rcx, %rsi

The second operation you suggested is actually used to retrieve the VA 
of the PV_ROOT_PT.

Cheers,
Elias


