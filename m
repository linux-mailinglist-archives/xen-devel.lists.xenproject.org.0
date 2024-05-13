Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187E8C3E34
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 11:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720778.1123694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6S6B-00056T-Gt; Mon, 13 May 2024 09:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720778.1123694; Mon, 13 May 2024 09:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6S6B-00053f-Dv; Mon, 13 May 2024 09:35:59 +0000
Received: by outflank-mailman (input) for mailman id 720778;
 Mon, 13 May 2024 09:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6S69-00053Z-G2
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 09:35:57 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 319cf100-110c-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 11:35:55 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 09:35:52 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.43.254:51335]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.3.195:2525]
 with esmtp (Farcaster)
 id f3d64704-d3dd-4a0e-82e9-75f995f45500; Mon, 13 May 2024 09:35:51 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 09:35:47 +0000
Received: from [10.95.164.111] (10.95.164.111) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 09:35:43 +0000
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
X-Inumbo-ID: 319cf100-110c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715592955; x=1747128955;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FBRM1OdC9cKzr+j3pNvlhcc8bnkFfM6GEY8jvy5lak8=;
  b=ewEaTqah2jnVNhwHiR1vYQBtpuCqTL/iJ8/IhR8NwOLB9QV+JPv9QLR4
   oe5jMj6FSGFBZ+DqGzV3bmJ1Wyq85iWTdqrhi3NBGdtqg3q2JVoO17XAC
   n702jxDbp+O0dRslGnConY4elW0HvPw4m1qCSjabDAHUX0nIJi1kzsoYD
   E=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="396039285"
X-Farcaster-Flow-ID: f3d64704-d3dd-4a0e-82e9-75f995f45500
Message-ID: <a74001e4-7ae1-48f7-854d-2a8aeb2ff8da@amazon.com>
Date: Mon, 13 May 2024 10:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 12/27] x86/mapcache: Initialise the mapcache
 for the idle domain
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-13-eliasely@amazon.com>
 <d6f3993e-5e96-4e3d-9334-9b44152f9f81@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <d6f3993e-5e96-4e3d-9334-9b44152f9f81@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.164.111]
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)



On 20/02/2024 10:51, Jan Beulich wrote:
> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -750,9 +750,16 @@ int arch_domain_create(struct domain *d,
>>   
>>       spin_lock_init(&d->arch.e820_lock);
>>   
>> +    if ( (rc = mapcache_domain_init(d)) != 0)
>> +    {
>> +        free_perdomain_mappings(d);
>> +        return rc;
>> +    }
>> +
>>       /* Minimal initialisation for the idle domain. */
>>       if ( unlikely(is_idle_domain(d)) )
>>       {
>> +        struct page_info *pg = d->arch.perdomain_l3_pg;
>>           static const struct arch_csw idle_csw = {
>>               .from = paravirt_ctxt_switch_from,
>>               .to   = paravirt_ctxt_switch_to,
>> @@ -763,6 +770,9 @@ int arch_domain_create(struct domain *d,
>>   
>>           d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>>   
>> +        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
>> +            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
>> +
>>           return 0;
>>       }
> 
> Why not add another call to mapcache_domain_init() right here, allowing
> a more specific panic() to be invoked in case of failure (compared to
> the BUG_ON() upon failure of creation of the idle domain as a whole)?
> Then the other mapcache_domain_init() call doesn't need moving a 2nd
> time in close succession.
> 

To be honest, I don't really like the idea of having twice the same call 
just for the benefit of having a panic() call in case of failure for the 
idle domain.

If you don't mind, I'd rather keep just a single call to 
mapcache_domain_init() as it is now.

Elias

