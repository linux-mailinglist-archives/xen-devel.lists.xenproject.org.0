Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25C4FA015
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 01:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301837.515188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxv4-0005NZ-1b; Fri, 08 Apr 2022 23:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301837.515188; Fri, 08 Apr 2022 23:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxv3-0005LQ-U4; Fri, 08 Apr 2022 23:21:33 +0000
Received: by outflank-mailman (input) for mailman id 301837;
 Fri, 08 Apr 2022 23:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBby=US=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1ncxv2-0005LK-M3
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 23:21:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f17e6e5-b792-11ec-a405-831a346695d4;
 Sat, 09 Apr 2022 01:21:30 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id bq8so20052190ejb.10
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 16:21:30 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 v8-20020a50d848000000b0041cb912717asm8936807edj.91.2022.04.08.16.21.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Apr 2022 16:21:29 -0700 (PDT)
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
X-Inumbo-ID: 9f17e6e5-b792-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VeBo5MNmcNP8GgrnYnuxwD9C21s9NCSI0hQmRgeVZ2c=;
        b=SwUdCASoZsLrVzHwYE9Q2w7j8anHVyABwID7GJeaxGfrbLM5k0Ll9QikJqmhJzldK2
         DEhbbyAiFI6iSlauWF8t+jKysCy4/ituH373bOQYneDjgtlRMT6MU1S3YxRPtJMX4oX1
         xiqUnHmj8t0fgyqR+02CHlzq+jgHtUhjPECIh0Ks3TbRC2E9CvqftD/OWYrUdEqNpZjp
         3glxzcacU6WGhpBVaEXzCQ0oxQ8tSiZTZ4JCiNXATn1QSgRsiUvuhHZik+iIDX+IIXcf
         8J9iJvcV6FOxsjwd8QIAaWSAR31c/r5e3ajAJURaZ6AV3A29bWAbfjYHTsvDoGioJU0U
         luDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VeBo5MNmcNP8GgrnYnuxwD9C21s9NCSI0hQmRgeVZ2c=;
        b=Q7pcVjbebdySi7jEak+8XdOTdRPyk0ERPd/DK1SZhC9Lu/+qr7685zSuHi7NSr3lvZ
         TH7AossrocMD3Sg+8iU1vl4/6O5NlqvKbN7eFDmbLyipJ7XFDm00UusiGoR6AXXvYws7
         ni6r/3l+Mse7YwRHmU1hO7u2r76bsRA4+mcs+PyhdmT8vsXemMu4nILF+WdWPL95Yw/a
         Zh+5lVtS5O9na/nRGOY3n8bMruy1le366pUPN7+VQae9ol7C5odvtcY2SS6t9IS/XjUf
         PO5Rd10UPUl9LN3u6FKMyodUya93IfnP6BIu+XpyfmKvfhRwxRbAJz6g2SUDY8nCdMrZ
         phlA==
X-Gm-Message-State: AOAM530uqtXan8WqZj0W3DIPp+YoNv2Wx3G+kgvKyFR6uN9L0VMo8Y4T
	5SbirCq0FHkRImtjeazi3Ow=
X-Google-Smtp-Source: ABdhPJw0QRTK6Xo+GwWqeZ539WFr3ViLkQZwB5m+GvauaxNMLcPszYUGFgrOGSqHLo80QDJyI0Moiw==
X-Received: by 2002:a17:907:7da8:b0:6e0:5b94:5ed8 with SMTP id oz40-20020a1709077da800b006e05b945ed8mr19652474ejc.312.1649460090158;
        Fri, 08 Apr 2022 16:21:30 -0700 (PDT)
Date: Fri, 8 Apr 2022 23:21:29 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>,
	Michal Hocko <mhocko@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Message-ID: <20220408232129.caboqxtw6s4nmgde@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20220407093221.1090-1-jgross@suse.com>
 <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Apr 07, 2022 at 11:46:13AM +0200, David Hildenbrand wrote:
>On 07.04.22 11:32, Juergen Gross wrote:
>> Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
>> initialization") only zones with free memory are included in a built
>> zonelist. This is problematic when e.g. all memory of a zone has been
>> ballooned out.
>> 
>> Use populated_zone() when building a zonelist as it has been done
>> before that commit.
>> 
>> Cc: stable@vger.kernel.org
>> Fixes: 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist initialization")
>> Reported-by: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>  mm/page_alloc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index bdc8f60ae462..3d0662af3289 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -6128,7 +6128,7 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
>>  	do {
>>  		zone_type--;
>>  		zone = pgdat->node_zones + zone_type;
>> -		if (managed_zone(zone)) {
>> +		if (populated_zone(zone)) {
>>  			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
>>  			check_highest_zone(zone_type);
>>  		}
>
>Let's see if we have to find another way to properly handle fadump.
>
>Acked-by: David Hildenbrand <david@redhat.com>

Ok, I see the point.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>
>-- 
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

