Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D410234151
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 10:39:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1QZ9-0005UD-Cg; Fri, 31 Jul 2020 08:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALHA=BK=amazon.com=prvs=474dac838=elnikety@srs-us1.protection.inumbo.net>)
 id 1k1QZ7-0005U8-PO
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 08:38:57 +0000
X-Inumbo-ID: 45955296-d309-11ea-ab8f-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45955296-d309-11ea-ab8f-12813bfff9fa;
 Fri, 31 Jul 2020 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1596184737; x=1627720737;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dbgp+mgGDpt6s0BH/lBjYcctpiFZ1oBJvtaGhj7elSI=;
 b=WZrgQmAUBRdsroZSebACoVCI9cGqtIxCh2Hl2qDt3a5UOAcqLX+GDt8r
 aAK8DaT4aETZOuI6nLdz39ByiFCdoBsN55NugdE/txTAFRG5ldq8SaneF
 dknELemtUy+gD3VgncuTcERd6MU61VyW74ciH92lWx7d37iXMT+VK7e8g I=;
IronPort-SDR: eQz03h9VQxdct/SIk99QwxVxrYimMz/qsRmT86awONPy6YNdnUf0k1u+h8BUru/kbOYbc7wZGO
 Y3GKuMEcscpQ==
X-IronPort-AV: E=Sophos;i="5.75,417,1589241600"; d="scan'208";a="64481883"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 31 Jul 2020 08:38:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 01285A216B; Fri, 31 Jul 2020 08:38:49 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 08:38:49 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.161.203) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 08:38:45 +0000
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Eslam Elnikety <elnikety@amazon.com>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
 <278f0f31-619b-a392-6627-e75e65d0d14f@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <076df48e-0010-bb8d-891f-dc89aa4b9439@amazon.com>
Date: Fri, 31 Jul 2020 10:38:40 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <278f0f31-619b-a392-6627-e75e65d0d14f@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.203]
X-ClientProxiedBy: EX13D37UWA003.ant.amazon.com (10.43.160.25) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.20 19:51, Jan Beulich wrote:
> On 28.07.2020 11:26, Andrew Cooper wrote:
>> Does this work?
>>
>> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
>> index ca94e8b453..638f6174de 100644
>> --- a/xen/arch/x86/hvm/hpet.c
>> +++ b/xen/arch/x86/hvm/hpet.c
>> @@ -62,8 +62,7 @@
>>   #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n),
>> HPET_TN_ROUTE)
>> -#define timer_int_route_cap(h, n) \
>> -    MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
>> +#define timer_int_route_cap(h, n) (h)->hpet.timers[(n)].route
> 
> Seeing that this is likely the route taken here, and hence to avoid
> an extra round trip, two remarks: Here I see no need for the
> parentheses inside the square brackets.
> 

Will take of this in v2.

>> diff --git a/xen/include/asm-x86/hvm/vpt.h 
>> b/xen/include/asm-x86/hvm/vpt.h
>> index f0e0eaec83..a41fc443cc 100644
>> --- a/xen/include/asm-x86/hvm/vpt.h
>> +++ b/xen/include/asm-x86/hvm/vpt.h
>> @@ -73,7 +73,13 @@ struct hpet_registers {
>>       uint64_t isr;               /* interrupt status reg */
>>       uint64_t mc64;              /* main counter */
>>       struct {                    /* timers */
>> -        uint64_t config;        /* configuration/cap */
>> +        union {
>> +            uint64_t config;    /* configuration/cap */
>> +            struct {
>> +                uint32_t _;
>> +                uint32_t route;
>> +            };
>> +        };
> 
> So long as there are no static initializers for this construct
> that would then suffer the old-gcc problem, this is of course a
> fine arrangement to make.
> 

I have to admit that I have no clue what the "old-gcc" problem is. I am 
curious, and I would appreciate pointers to figure out if/how to 
resolve. Is that an old, existing problem? Or a problem that was present 
in older versions of gcc? If the latter, is that a gcc version that we 
still care about? Thanks, Jan.

-- Eslam

> Jan
> 


