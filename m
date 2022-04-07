Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417E4F7F69
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300771.513107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncRWe-0007BC-8S; Thu, 07 Apr 2022 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300771.513107; Thu, 07 Apr 2022 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncRWe-00078Z-5R; Thu, 07 Apr 2022 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 300771;
 Thu, 07 Apr 2022 12:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UeT=UR=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ncRWc-00078A-K0
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:46:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d70e42-b670-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 14:45:55 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-zNnOiP86NXigtgSe3wxxxA-1; Thu, 07 Apr 2022 08:46:00 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 r19-20020a7bc093000000b0038e706da7c0so2934358wmh.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 05:46:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adff205000000b0020614a499fbsm13364584wro.90.2022.04.07.05.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 05:45:58 -0700 (PDT)
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
X-Inumbo-ID: a9d70e42-b670-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649335562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/Us2cruhioCbl6RqJqudnxQAOhVEhkUDGtI39MXnNI=;
	b=F3khc/wRidAUIZRG6NgLnks5rzpZim9W81gt+QCnTAJfk5j1Joa/IQHi3RgMmRwPutOdDh
	HMeGrL6ZHj9L58h5BoOmlQ+qKfejMk8XN2l2RgWuMc+eZxg3nu9vzn8ME1dqeYQ5YvXXgo
	opnrhPU0Lu5PEW1Qf+BM1dj8T4Knu/I=
X-MC-Unique: zNnOiP86NXigtgSe3wxxxA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=9/Us2cruhioCbl6RqJqudnxQAOhVEhkUDGtI39MXnNI=;
        b=RSIZVe6Wf7zVD2dxoLefs7MxOk55RclA3+Sp1RYHusO3cXTJe4WZoJ17B1mGSu82G3
         O+pFvbdydvk2ngjXDPSFIO0Q2giPFDbTO6+AkC3qw1Qn52tIYJuJt0hpHht9n4rTZGfH
         BdaKW36YRg4HxWrJIrxGYFQekcpgW4z+mXmAS0Z0tDwOpmwUug/bv5vZY/7UxkJZSVhz
         qE7xROKrrTA6iQTzCYhVzV/CAijI9vNx03Kkxox4E+vRGnBlTseGwCAEYdEd/L+Pl5pH
         7Fhw96NQQ4loyB0tWxJU+2j28uizuqLO1UMeHH9iT94iHGW8CCGNRtl39jafYdM2t3Th
         93Uw==
X-Gm-Message-State: AOAM531GGTEV+DFy6PpOYn4hOuLkF3ydBklKLfmwDGxqM4GvZoLo9UW1
	YzUXaWDLQVCqZy9uFD92R6SGyY5l7Ts9j1cb8qRjja50HoaWGCEmHqB2bfp7QpVA28nKoBPQZA2
	nl0LVwNsjspGeoU76a8/As1x+R08=
X-Received: by 2002:adf:f6c4:0:b0:206:1581:dabc with SMTP id y4-20020adff6c4000000b002061581dabcmr10825213wrp.375.1649335559572;
        Thu, 07 Apr 2022 05:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM1kHX4+XtYoFq61dk62qQKc+KfdCBkhZ/B4Cy+Xlwxk5a3SuVrXH/rmpX3u/AmPLQfe4l7w==
X-Received: by 2002:adf:f6c4:0:b0:206:1581:dabc with SMTP id y4-20020adff6c4000000b002061581dabcmr10825196wrp.375.1649335559301;
        Thu, 07 Apr 2022 05:45:59 -0700 (PDT)
Message-ID: <42046fe0-d4da-625d-6412-b5459b80ee11@redhat.com>
Date: Thu, 7 Apr 2022 14:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] mm, page_alloc: fix build_zonerefs_node()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Michal Hocko <mhocko@suse.com>
References: <20220407120637.9035-1-jgross@suse.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220407120637.9035-1-jgross@suse.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.04.22 14:06, Juergen Gross wrote:
> Since commit 6aa303defb74 ("mm, vmscan: only allocate and reclaim from
> zones with pages managed by the buddy allocator") only zones with free
> memory are included in a built zonelist. This is problematic when e.g.
> all memory of a zone has been ballooned out when zonelists are being
> rebuilt.
> 
> The decision whether to rebuild the zonelists when onlining new memory
> is done based on populated_zone() returning 0 for the zone the memory
> will be added to. The new zone is added to the zonelists only, if it
> has free memory pages (managed_zone() returns a non-zero value) after
> the memory has been onlined. This implies, that onlining memory will
> always free the added pages to the allocator immediately, but this is
> not true in all cases: when e.g. running as a Xen guest the onlined
> new memory will be added only to the ballooned memory list, it will be
> freed only when the guest is being ballooned up afterwards.
> 
> Another problem with using managed_zone() for the decision whether a
> zone is being added to the zonelists is, that a zone with all memory
> used will in fact be removed from all zonelists in case the zonelists
> happen to be rebuilt.
> 
> Use populated_zone() when building a zonelist as it has been done
> before that commit.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6aa303defb74 ("mm, vmscan: only allocate and reclaim from zones with pages managed by the buddy allocator")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> ---
> V2:
> - updated commit message (Michal Hocko)
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

Did you drop my Ack?

Also, I'd appreciate getting CCed on patches where I commented.

-- 
Thanks,

David / dhildenb


