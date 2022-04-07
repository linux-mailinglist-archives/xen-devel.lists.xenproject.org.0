Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4D4F7977
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300499.512600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNQE-000135-RN; Thu, 07 Apr 2022 08:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300499.512600; Thu, 07 Apr 2022 08:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNQE-00011G-OJ; Thu, 07 Apr 2022 08:23:18 +0000
Received: by outflank-mailman (input) for mailman id 300499;
 Thu, 07 Apr 2022 08:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UeT=UR=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ncNQC-00011A-Tl
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:23:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83cf557-b64b-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:23:15 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-eU60n2h0NsK9eSJoalqmpw-1; Thu, 07 Apr 2022 04:23:11 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so1028014wrj.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 01:23:10 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm16415621wri.106.2022.04.07.01.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:23:09 -0700 (PDT)
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
X-Inumbo-ID: f83cf557-b64b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649319794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ak2L++rWGA7iZB3bqmGGUjd7xVRHy3vUvtqw/fn7ZM=;
	b=ZU6tbuVq0bVIwesQJrqY9aWA4JgQ8BUeFWseLDHAHUrZTSeTKN91nn9E1o1xaHrvJ8zORD
	Dl7Q8tyl8BXmNOmXGv8+h+C1wyzE+mwx1pDiNfzdpZQZdbT0FEBBB8dvNUgwnG3S8L7Ner
	qQYyVtrh6TG4XN/WBuib+EzKSGS7CBc=
X-MC-Unique: eU60n2h0NsK9eSJoalqmpw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=6Ak2L++rWGA7iZB3bqmGGUjd7xVRHy3vUvtqw/fn7ZM=;
        b=MbScjmV87BxkF8D16KgXpUDleJ/IHTOtIQ0r8JbdDikxIdKRXOnoWvnzi+3NQLxFCk
         omekUVvnWb+3vKsNP7Utks8NM4BS9495b8kHndEw3BC1iII3LxCftySNjZlSXiGGjAPX
         j1404MDSxSW4sse2BpIDueiGOmTzJ/wFbPARN0fp3XxN3d+Zyo2vkpt6k51Zky+O7iRt
         10TAonAbIHBH+op+/SxMwjhb+KHUmyKJJMPMedAujHHjgwnlfybF1LYuLKt/5zj+jMRY
         bCKzjgx4pQr6j8RpHg+qSbWAOejxfWKbyRaR0DnOJDdWrVJ6hjMO3WxvtSRwe9a0GUa5
         WOsQ==
X-Gm-Message-State: AOAM530IO10LRHgEMw91eHqOp7qeovmuY2SjkQnKk8E86V/x/rUQKmbU
	2hYXq6x2W/AcXKd7bTTG3BL3R7IDCGS2mxNoRYrLk+glY2viWNx6pHkb7YAH30pJstQmZSuTgq4
	22pR5nXg07PRvYWIyqpvRwkHjTL8=
X-Received: by 2002:adf:8046:0:b0:205:db94:4766 with SMTP id 64-20020adf8046000000b00205db944766mr9967290wrk.565.1649319789914;
        Thu, 07 Apr 2022 01:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2Tu0tp6Y15gnR0aUGERxnoLQ64ptBmMTawYi6J5rkgZz3tkxFuWT9Vp/1zCYi8qjcSciYkA==
X-Received: by 2002:adf:8046:0:b0:205:db94:4766 with SMTP id 64-20020adf8046000000b00205db944766mr9967251wrk.565.1649319789519;
        Thu, 07 Apr 2022 01:23:09 -0700 (PDT)
Message-ID: <89ad978d-e95e-d3ea-5c8f-acf4b28f992c@redhat.com>
Date: Thu, 7 Apr 2022 10:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Yang <richard.weiyang@gmail.com>,
 Michal Hocko <mhocko@kernel.org>
References: <20220406133229.15979-1-jgross@suse.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] xen/balloon: fix page onlining when populating new zone
In-Reply-To: <20220406133229.15979-1-jgross@suse.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.04.22 15:32, Juergen Gross wrote:
> When onlining a new memory page in a guest the Xen balloon driver is
> adding it to the ballooned pages instead making it available to be
> used immediately. This is meant to enable to add a new upper memory
> limit to a guest via hotplugging memory, without having to assign the
> new memory in one go.
> 
> In case the upper memory limit will be raised above 4G, the new memory
> will populate the ZONE_NORMAL memory zone, which wasn't populated
> before. The newly populated zone won't be added to the list of zones
> looked at by the page allocator though, as only zones with available
> memory are being added, and the memory isn't yet available as it is
> ballooned out.

I think we just recently discussed these corner cases on the -mm list.
The issue is having effectively populated zones without manages pages
because everything is inflated in a balloon.

That can theoretically also happen when managing to fully inflate the
balloon in one zone and then, somehow, the zones get rebuilt.

build_zonerefs_node() documents "Add all populated zones of a node to
the zonelist" but checks for managed zones, which is wrong.

See https://lkml.kernel.org/r/20220201070044.zbm3obsoimhz3xd3@master

> 
> This will result in the new memory being assigned to the guest, but
> without the allocator being able to use it.
> 
> When running as a PV guest the situation is even worse: when having
> been started with less memory than allowed, and the upper limit being
> lower than 4G, ballooning up will have the same effect as hotplugging
> new memory. This is due to the usage of the zone device functionality
> since commit 9e2369c06c8a ("xen: add helpers to allocate unpopulated
> memory") for creating mappings of other guest's pages, which as a side
> effect is being used for PV guest ballooning, too.
> 
> Fix this by checking in xen_online_page() whether the new memory page
> will be the first in a new zone. If this is the case, add another page
> to the balloon and use the first memory page of the new chunk as a
> replacement for this now ballooned out page. This will result in the
> newly populated zone containing one page being available for the page
> allocator, which in turn will lead to the zone being added to the
> allocator.

This somehow feels like a hack for something that should be handled in
the core instead :/


-- 
Thanks,

David / dhildenb


