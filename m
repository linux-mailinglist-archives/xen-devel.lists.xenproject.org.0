Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20884F7EC9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300749.513063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncR0I-0001AG-N9; Thu, 07 Apr 2022 12:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300749.513063; Thu, 07 Apr 2022 12:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncR0I-00018C-Jo; Thu, 07 Apr 2022 12:12:46 +0000
Received: by outflank-mailman (input) for mailman id 300749;
 Thu, 07 Apr 2022 12:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UeT=UR=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ncR0G-000184-Oy
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:12:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 069ef4bd-b66c-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 14:12:43 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-LwJ02UxGNW6o0TXp7NXWJw-1; Thu, 07 Apr 2022 08:12:41 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 r19-20020a7bc093000000b0038e706da7c0so2895998wmh.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 05:12:40 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0038c6c37efc3sm7370765wmq.12.2022.04.07.05.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 05:12:38 -0700 (PDT)
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
X-Inumbo-ID: 069ef4bd-b66c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649333562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=He8h+g9gcpriqclLdlbV5LzBn0WlLmTvUFHHwXaoICE=;
	b=GxmHoz3mvqVkuOjk50fkuE1bi4h4MZKOWFLKa8nWsAp4YZeFb+45Jq3XxZW8Ch4/bqxTCH
	NiSizmijzHDzMGDBd2VjGmFse/ElX8XZmscI9WhNXKHw3EiJQhL/mgoijBx40taApubI6I
	/svwLnGe2oH6OIOks9qZNBG3rOYe4mg=
X-MC-Unique: LwJ02UxGNW6o0TXp7NXWJw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=He8h+g9gcpriqclLdlbV5LzBn0WlLmTvUFHHwXaoICE=;
        b=IZk6YzAWh1A1Jyw1TEIOBDSw8REZEoJtOZuKn5KrFRVNsOYeVdeWccEI8jlqvAJISc
         8BHSwgCPB9P+r2ykubBPEVmruAQusCRtFEKHK/hWEkjmEyBuqeOYl9SFBpxWtAIBgGg3
         MepthnMq+yHbeW1Dye448S+k0L9fsLCRR/h30evvIJcTDA2DHkyGebwL0mQubHQiZw2b
         jCY0+Em0qUQXFb4ZgfKlpgeHOzModvuE3l4y2L2s2yC3XjYxyWygwfkPfPpbSLh7G60U
         JwEKgZARTMKiya4SK/i8FeV1Q12jaz8/jSdnL2zyT3V9eVoAGGjbxb0KtHmyEd6ApiEY
         ewZA==
X-Gm-Message-State: AOAM532AiRphYbNMOzQU5+gEnOyb8SjCai/naTOsnkOR7BFW/fhah9FX
	B9kHaCDMscy5fJhVKDjHAjkdGqMnU+YeeYZLyURrUeUPc+ZZkatVtT2A1rFQQ4CakVu3bj/suJN
	WKYnshJINYBG/vVsGgFEMmlclgoc=
X-Received: by 2002:a05:600c:4f08:b0:38c:93fd:570f with SMTP id l8-20020a05600c4f0800b0038c93fd570fmr12048352wmq.136.1649333559834;
        Thu, 07 Apr 2022 05:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8VD2jmyYCLdT1LS37dFQHExBQz5m/CcSM2lhqIzro2UScARspuOQOmGyPtwzTU/phPmvvNw==
X-Received: by 2002:a05:600c:4f08:b0:38c:93fd:570f with SMTP id l8-20020a05600c4f0800b0038c93fd570fmr12048327wmq.136.1649333559539;
        Thu, 07 Apr 2022 05:12:39 -0700 (PDT)
Message-ID: <ca22625e-b72c-059a-9242-f10b291be4fe@redhat.com>
Date: Thu, 7 Apr 2022 14:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
To: Michal Hocko <mhocko@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Mel Gorman <mgorman@suse.de>
References: <20220407093221.1090-1-jgross@suse.com>
 <Yk6+QBacbb6oI8lW@dhcp22.suse.cz>
 <f08c1493-9238-0009-56b4-dc0ab3571b33@suse.com>
 <Yk7F2KzRrhLjYw4Z@dhcp22.suse.cz>
 <5e97a7f5-1fc9-d0b4-006e-6894d5653c06@suse.com>
 <Yk7NqTlw7lmFzpKb@dhcp22.suse.cz>
 <770d8283-4315-3d83-4f8b-723308fffe5c@redhat.com>
 <Yk7TMKBAkuSVZRLT@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yk7TMKBAkuSVZRLT@dhcp22.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.22 14:04, Michal Hocko wrote:
> On Thu 07-04-22 13:58:44, David Hildenbrand wrote:
> [...]
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index 3589febc6d31..130a2feceddc 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -6112,10 +6112,8 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
>>>  	do {
>>>  		zone_type--;
>>>  		zone = pgdat->node_zones + zone_type;
>>> -		if (managed_zone(zone)) {
>>> -			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
>>> -			check_highest_zone(zone_type);
>>> -		}
>>> +		zoneref_set_zone(zone, &zonerefs[nr_zones++]);
>>> +		check_highest_zone(zone_type);
>>>  	} while (zone_type);
>>>  
>>>  	return nr_zones;
>>
>> I don't think having !populated zones in the zonelist is a particularly
>> good idea. Populated vs !populated changes only during page
>> onlininge/offlining.
>>
>> If I'm not wrong, with your patch we'd even include ZONE_DEVICE here ...
> 
> What kind of problem that would cause? The allocator wouldn't see any
> pages at all so it would fallback to the next one. Maybe kswapd would
> need some tweak to have a bail out condition but as mentioned in the
> thread already. !populated or !managed for that matter are not all that
> much different from completely depleted zones. The fact that we are
> making that distinction has led to some bugs and I suspect it makes the
> code more complex without a very good reason.

I assume performance problems. Assume you have an ordinary system with
multiple NUMA nodes and no MOVABLE memory. Most nodes will only have
ZONE_NORMAL. Yet, you'd include ZONE_DMA* and ZONE_MOVABLE that will
always remain empty to be traversed on each and every allocation
fallback. Of course, we could measure, but IMHO at least *that* part of
memory onlining/offlining is not the complicated part :D

Populated vs. !populated is under pretty good control via page
onlining/offlining. We have to be careful with "managed pages", because
that's a moving target, especially with memory ballooning. And I assume
that's the bigger source of bugs.

> 
>> I'd vote for going with the simple fix first, which should be good
>> enough AFAIKT.
> 
> yes, see the other reply
> 

I think we were composing almost simultaneously :)

-- 
Thanks,

David / dhildenb


