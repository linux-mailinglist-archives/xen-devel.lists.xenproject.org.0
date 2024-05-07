Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE4A8BE75E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 17:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718279.1120875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Mh5-000768-5H; Tue, 07 May 2024 15:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718279.1120875; Tue, 07 May 2024 15:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Mh5-00073m-2b; Tue, 07 May 2024 15:25:27 +0000
Received: by outflank-mailman (input) for mailman id 718279;
 Tue, 07 May 2024 15:25:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YimZ=MK=amazon.co.uk=prvs=8506a7df7=eliasely@srs-se1.protection.inumbo.net>)
 id 1s4Mh3-00073e-L6
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 15:25:25 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04d20811-0c86-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 17:25:23 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 15:25:19 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:22996]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.11.44:2525]
 with esmtp (Farcaster)
 id 93c06852-df1b-488d-ac33-f5dfbd568114; Tue, 7 May 2024 15:25:18 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 7 May 2024 15:25:18 +0000
Received: from [192.168.15.40] (10.106.83.8) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 7 May
 2024 15:25:14 +0000
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
X-Inumbo-ID: 04d20811-0c86-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715095523; x=1746631523;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gr9kwZ+RTjeaE5vmYv137GFBoQHoDJVWeG4hdNIu1V8=;
  b=YAvU4Nwp2CFIvLN3QtzWaYvqEw+OgL0IJRqE9TYFsBTMEvOhJiqWbTgV
   XZDNlHqTXstjusmiobYa5YFkT4aN/oivRCk598S4qci+Uo92c1pzAjqIl
   cu3QuEcDXrTzxCq/x1Z3yCRBHTv9bW9KYE2iwythlBMLQktJ7hGvyYNj2
   Q=;
X-IronPort-AV: E=Sophos;i="6.08,142,1712620800"; 
   d="scan'208";a="87615136"
X-Farcaster-Flow-ID: 93c06852-df1b-488d-ac33-f5dfbd568114
Message-ID: <5b1e5eac-df9b-48b0-ba14-9c56f32a5d9c@amazon.com>
Date: Tue, 7 May 2024 16:25:10 +0100
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
X-Originating-IP: [10.106.83.8]
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
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


Sorry but I don't get your point, why calling another time 
`mapcache_domain_init()`? What panic() are you referring to?

Elias

