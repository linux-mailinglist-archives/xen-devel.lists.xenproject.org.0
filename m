Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ADE4F7AC2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300548.512711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO0Q-0002yF-8r; Thu, 07 Apr 2022 09:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300548.512711; Thu, 07 Apr 2022 09:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO0Q-0002wE-5f; Thu, 07 Apr 2022 09:00:42 +0000
Received: by outflank-mailman (input) for mailman id 300548;
 Thu, 07 Apr 2022 09:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UeT=UR=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ncO0N-0002uc-VO
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:00:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31428097-b651-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:00:38 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-LExrpKdLOEeDUeqSiasDjQ-1; Thu, 07 Apr 2022 05:00:36 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so4298870wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 02:00:36 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0038cc9aac1a3sm7933452wmq.23.2022.04.07.02.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:00:34 -0700 (PDT)
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
X-Inumbo-ID: 31428097-b651-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649322037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0inCEjJJWw//2DoC93l0BxRCxkrP6GV4SWwsKG2zpLQ=;
	b=aJxOc89Id1Wis/A/CoCs0zLw7VELjzmN2teAJK6WWAhLr6n7bnho+Y0w9T2rKrUXufBbP9
	GNU81ZsqKgErQZHC+xC+DN5PJcussH5ZmHjY1rd8JHXIPUjUBAAgU1p76xGc015DhRfX45
	0LrTsmj5F8cxn7sGsqm4lv/aU1MsYCY=
X-MC-Unique: LExrpKdLOEeDUeqSiasDjQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=0inCEjJJWw//2DoC93l0BxRCxkrP6GV4SWwsKG2zpLQ=;
        b=09vRx/qEJo7TG2/gXQHIU20nOkxIvbPUIdZ5A7uIQR6sY1R/Tksxlvkz6BNLeMOtEj
         qo5NfeJpIFNaKRprW1bVbf0mwqLfXyydz8B4GngQkmueWXSVv1YQb/bdXtuzYB4OFQ9/
         yTNL+AkTyjw8d2lsc+qMkNbYK7flLf/ZvnZ0D8ndKFjl5RWKwxCdFyUKcR5uwiTJaRL3
         YbEtmQe3Eqg/V/9zrwQbxnXBDIRgxgmdTdB/4UfoL5xaZWnxpHj/HPZnGQ3lNtX4jrzw
         XZn+k5sOg0FhjRfswIQns9XgSXWym8E7jscIF10rv9LMEP1RLaiMTbOXkjFiJPZpVWzb
         qstw==
X-Gm-Message-State: AOAM531aBDncp1ZicsUYMSCarZ14hGK+snmmkbIsmslWk+52ujCwxkV2
	aoAFsoZ3V69FFveFMBAXTFJrnVUnUQl+Z/7Nn0RvpNHnA/WklfW1K57J5O3JnQvlecBbqrvqXCW
	wdSn6Cx0/xbYp9MVO8jKYjQbBK04=
X-Received: by 2002:a05:600c:17c5:b0:38e:7853:e915 with SMTP id y5-20020a05600c17c500b0038e7853e915mr11065437wmo.123.1649322035313;
        Thu, 07 Apr 2022 02:00:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDXbmi0MYBbhyvRv3XQym+Vvb0hr0yJXFvC8twCFVw7fXFScumPU3//4ro5ZrKBn7rVoiing==
X-Received: by 2002:a05:600c:17c5:b0:38e:7853:e915 with SMTP id y5-20020a05600c17c500b0038e7853e915mr11065408wmo.123.1649322035047;
        Thu, 07 Apr 2022 02:00:35 -0700 (PDT)
Message-ID: <f423e210-3e28-73f8-1082-869ef680b9b0@redhat.com>
Date: Thu, 7 Apr 2022 11:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] xen/balloon: fix page onlining when populating new zone
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Yang <richard.weiyang@gmail.com>,
 Michal Hocko <mhocko@kernel.org>
References: <20220406133229.15979-1-jgross@suse.com>
 <89ad978d-e95e-d3ea-5c8f-acf4b28f992c@redhat.com>
 <4f1908b5-5674-a772-3cd9-78e4dc40f776@suse.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <4f1908b5-5674-a772-3cd9-78e4dc40f776@suse.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.22 10:50, Juergen Gross wrote:
> On 07.04.22 10:23, David Hildenbrand wrote:
>> On 06.04.22 15:32, Juergen Gross wrote:
>>> When onlining a new memory page in a guest the Xen balloon driver is
>>> adding it to the ballooned pages instead making it available to be
>>> used immediately. This is meant to enable to add a new upper memory
>>> limit to a guest via hotplugging memory, without having to assign the
>>> new memory in one go.
>>>
>>> In case the upper memory limit will be raised above 4G, the new memory
>>> will populate the ZONE_NORMAL memory zone, which wasn't populated
>>> before. The newly populated zone won't be added to the list of zones
>>> looked at by the page allocator though, as only zones with available
>>> memory are being added, and the memory isn't yet available as it is
>>> ballooned out.
>>
>> I think we just recently discussed these corner cases on the -mm list.
> 
> Indeed.
> 
>> The issue is having effectively populated zones without manages pages
>> because everything is inflated in a balloon.
> 
> Correct.
> 
>> That can theoretically also happen when managing to fully inflate the
>> balloon in one zone and then, somehow, the zones get rebuilt.
> 
> I think you are right. I didn't think of that scenario.
> 
>> build_zonerefs_node() documents "Add all populated zones of a node to
>> the zonelist" but checks for managed zones, which is wrong.
>>
>> See https://lkml.kernel.org/r/20220201070044.zbm3obsoimhz3xd3@master
> 
> I found commit 6aa303defb7454 which introduced this test. I thought
> it was needed due to the problem this commit tried to solve. Maybe I
> was wrong and that commit shouldn't have changed the condition when
> building the zonelist, but just the ones in the allocation paths.

In regard to kswapd, that is currently being worked on via

https://lkml.kernel.org/r/20220329010901.1654-2-richard.weiyang@gmail.com

-- 
Thanks,

David / dhildenb


