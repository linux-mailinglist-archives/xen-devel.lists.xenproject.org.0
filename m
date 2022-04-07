Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAF4F7C13
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300594.512820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOib-00053G-9R; Thu, 07 Apr 2022 09:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300594.512820; Thu, 07 Apr 2022 09:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOib-00050D-6Z; Thu, 07 Apr 2022 09:46:21 +0000
Received: by outflank-mailman (input) for mailman id 300594;
 Thu, 07 Apr 2022 09:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UeT=UR=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ncOiZ-000507-Ox
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:46:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9221d961-b657-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:46:18 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ZHB8039tNR-jm-40Dp7zmA-1; Thu, 07 Apr 2022 05:46:15 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 h18-20020a05600c351200b0038e82e6321bso1344468wmq.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 02:46:15 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0038e72a95ec4sm8249142wms.13.2022.04.07.02.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:46:13 -0700 (PDT)
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
X-Inumbo-ID: 9221d961-b657-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649324777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CIrkyxw2ltSATsongCKPkeTXMJ2u05ZyiioovqE8L0s=;
	b=cxj+M8aFF8GeLJI7MQCFr/hY8TkmAm8CBPwDFYLrtJLSFKxzH4IrBwa2eGxTg45Vyf3Ifr
	HnheAAvacCUEuFbNS1JUnkGSLtu2KR7RXYPdWBPFdZN++9Jfg6G/r1iisOG8DYPyiF7Lh0
	4sZA6Gl0ANUI74kEBxIDB65Wrt/c8x4=
X-MC-Unique: ZHB8039tNR-jm-40Dp7zmA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CIrkyxw2ltSATsongCKPkeTXMJ2u05ZyiioovqE8L0s=;
        b=kDdjH2YWl4VEQGGUEFyg2xfQ6BreDkCLY7bM58YmNECsxJaxXsldNmVd61i6DfQ2pL
         5VupmwWyX22JR82FtsCILLMBZ4bBaxZkF80IWKc3t1V9se5XJsCmSlxeFQqedWYPW8OI
         QWHbYNos2f8WnnmUb8UqpckoQvoSvJ4Q6Yg6Nwy9/a/g+att/+HihgrzX7aCfrArtBN5
         tRWLFN1T+VdpeToccl1mDOvpTPtN+gse5xSYpr0pVeUsv4PFQSvE9luKm0/2Jz/VCGrA
         O07fe2Vp/DC20UlJgoU809l1tUE9qh2KEXNvIbv84Q9Tod4Zdpuv621So5VV1dUJLMWp
         7DqQ==
X-Gm-Message-State: AOAM531zX7QR4jXwrQsXRTpLpEDGhWFxgdc0x3yV1dAtOj+VhgNYCg4y
	YvOvF50nOQ6nIkNND7iLs7jM8qm25OStW5YJ2GlCv364aCEr/1vQLCRnFf6S2mhUhVZyaCUr/OI
	5o95uus1tuPpIjkJY+nNDFTsu5ho=
X-Received: by 2002:a1c:f005:0:b0:38c:b6d5:5c2a with SMTP id a5-20020a1cf005000000b0038cb6d55c2amr11560877wmb.89.1649324774615;
        Thu, 07 Apr 2022 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaV/O4sc8yI66xNvj9tArkavzQBoS8J9F6Pviebz+CdcTWfctMEO9PWcH/8H60MajLM0j21Q==
X-Received: by 2002:a1c:f005:0:b0:38c:b6d5:5c2a with SMTP id a5-20020a1cf005000000b0038cb6d55c2amr11560857wmb.89.1649324774387;
        Thu, 07 Apr 2022 02:46:14 -0700 (PDT)
Message-ID: <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
Date: Thu, 7 Apr 2022 11:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Michal Hocko <mhocko@kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>
References: <20220407093221.1090-1-jgross@suse.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220407093221.1090-1-jgross@suse.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.04.22 11:32, Juergen Gross wrote:
> Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
> initialization") only zones with free memory are included in a built
> zonelist. This is problematic when e.g. all memory of a zone has been
> ballooned out.
> 
> Use populated_zone() when building a zonelist as it has been done
> before that commit.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist initialization")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index bdc8f60ae462..3d0662af3289 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6128,7 +6128,7 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
>  	do {
>  		zone_type--;
>  		zone = pgdat->node_zones + zone_type;
> -		if (managed_zone(zone)) {
> +		if (populated_zone(zone)) {
>  			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
>  			check_highest_zone(zone_type);
>  		}

Let's see if we have to find another way to properly handle fadump.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


