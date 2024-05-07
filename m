Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C28BE74F
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 17:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718274.1120866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Me0-0005yZ-Qs; Tue, 07 May 2024 15:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718274.1120866; Tue, 07 May 2024 15:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Me0-0005wH-Ms; Tue, 07 May 2024 15:22:16 +0000
Received: by outflank-mailman (input) for mailman id 718274;
 Tue, 07 May 2024 15:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YimZ=MK=amazon.co.uk=prvs=8506a7df7=eliasely@srs-se1.protection.inumbo.net>)
 id 1s4Mdz-0005vv-QE
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 15:22:15 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938368bb-0c85-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 17:22:13 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 15:22:08 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.43.254:57861]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.47.37:2525]
 with esmtp (Farcaster)
 id c5e04267-e561-4916-a0ae-9e823ef5524c; Tue, 7 May 2024 15:22:07 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 7 May 2024 15:22:07 +0000
Received: from [192.168.15.40] (10.106.83.8) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 7 May
 2024 15:22:03 +0000
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
X-Inumbo-ID: 938368bb-0c85-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715095333; x=1746631333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ccs95s/rZ0fo0CsY7mPxJ280lq33oO29To/SWJqvuJI=;
  b=jdpqn34xwSqRcK5PGlevPW+GTuB4LtxTTs7zZ6T+8pqRyrSmIBxV3hYu
   RHDgYwKBfay7/tW1KnF6YwWGqvwdWRYUMDP1rNp83tIyFuixCQsz4+ar2
   h3lqaS1Fyf9ADiTzhExNb3h8obttPJ6jyC5CbT4jxsRuDqu6hdYLn8yxa
   Y=;
X-IronPort-AV: E=Sophos;i="6.08,142,1712620800"; 
   d="scan'208";a="87520326"
X-Farcaster-Flow-ID: c5e04267-e561-4916-a0ae-9e823ef5524c
Message-ID: <06e162de-55d6-4612-aa45-b1a350571d2b@amazon.com>
Date: Tue, 7 May 2024 16:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 11/27] x86: Lift mapcache variable to the arch
 level
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Wei Liu
	<wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-12-eliasely@amazon.com>
 <1ff19cb2-851d-40cf-bb12-5b7074eee0b8@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <1ff19cb2-851d-40cf-bb12-5b7074eee0b8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.8]
X-ClientProxiedBy: EX19D032UWB003.ant.amazon.com (10.13.139.165) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

>> This only lifts the mapcache variable up. Whether we populate the
>> mapcache for a domain is unchanged in this patch.
> 
> Is it? I wonder because of ...
>

I agree, the commit message doesn't completely reflect the changes below.

>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -843,6 +843,8 @@ int arch_domain_create(struct domain *d,
>>   
>>       psr_domain_init(d);
>>   
>> +    mapcache_domain_init(d);
>> +
>>       if ( is_hvm_domain(d) )
>>       {
>>           if ( (rc = hvm_domain_initialise(d, config)) != 0 )
>> @@ -850,8 +852,6 @@ int arch_domain_create(struct domain *d,
>>       }
>>       else if ( is_pv_domain(d) )
>>       {
>> -        mapcache_domain_init(d);
>> -
>>           if ( (rc = pv_domain_initialise(d)) != 0 )
>>               goto fail;
>>       }
> 
> ... this and ...
> 
>> --- a/xen/arch/x86/domain_page.c
>> +++ b/xen/arch/x86/domain_page.c
>> @@ -82,11 +82,11 @@ void *map_domain_page(mfn_t mfn)
>>   #endif
>>   
>>       v = mapcache_current_vcpu();
>> -    if ( !v || !is_pv_vcpu(v) )
>> +    if ( !v )
>>           return mfn_to_virt(mfn_x(mfn));
> 
> ... this and yet more changes indicating otherwise.
> 
> Yet if which domains have a mapcache set up is already changed here, I
> wonder whether the idle domain shouldn't be taken care of here as well.

Do you suggest to fold here the following patch where the mapcache gets 
initialized for idle domains?


Elias

