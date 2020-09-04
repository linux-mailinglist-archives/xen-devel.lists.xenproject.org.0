Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F525E0CA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 19:30:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFXQ-0005r4-JG; Fri, 04 Sep 2020 17:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zmj+=CN=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kEFXO-0005qr-O8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:30:10 +0000
X-Inumbo-ID: dd5b8879-9306-47c9-9dde-be468d8ec2b4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd5b8879-9306-47c9-9dde-be468d8ec2b4;
 Fri, 04 Sep 2020 17:30:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so7514464wrs.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 10:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wNy2hGieTjSAjcYv7kwR0BOvIQ7J3JLWd6JVvNnGJ0g=;
 b=QWEpeZlcyb1BB5oPEcV1nRFfi4Xe/dz8sQlWXeXvTjx+Mq6xb5ZkwYLq1/aOExyU5U
 gR/IJWabshG/cihWYBir58s1sr5v2NAWQWj7LH2UieYpTb0d6MC2377CSotMGVWHV3Hi
 2npazjgKyR0Dz25laTHdAJG519iT9ssTh1Bn3h/xqinb+++dxySh9MuJ090YL++887aU
 TmqN1qH1D0YlDyIGxi9eXNc3/WOUHVlpWUbLccaZWAQFb9tOLiJCI5XjwxauJt7LLtlM
 TrMiCMpR+zjshPOjsJTA6iF599wNHqu7FtQlYEqXruvMnN/PY8LZvg4n/BgvbNq0sKPX
 XXug==
X-Gm-Message-State: AOAM530r+sum3ndQetPbfSoaxpVDvzGRcscsOY8RUHqG4VbKp+4fcZwk
 aPCHuIafDwXJZw4uJk8/jPINeTsyqo0=
X-Google-Smtp-Source: ABdhPJy4lxSlIVmCZUYUt5G7cHc/b9vzzBbVyS5+h60xbFD5BvIaoh1SmuoljfZVF5ACmqFJVbs98w==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr9155928wrx.115.1599240608246; 
 Fri, 04 Sep 2020 10:30:08 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h5sm13026654wrt.31.2020.09.04.10.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:30:07 -0700 (PDT)
Date: Fri, 4 Sep 2020 17:30:06 +0000
From: Wei Liu <wei.liu@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v1 5/5] hv_balloon: try to merge system ram resources
Message-ID: <20200904173006.e65qow53ietxzpne@liuwe-devbox-debian-v2>
References: <20200821103431.13481-1-david@redhat.com>
 <20200821103431.13481-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821103431.13481-6-david@redhat.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 21, 2020 at 12:34:31PM +0200, David Hildenbrand wrote:
> Let's use the new mechanism to merge system ram resources below the
> root. We are the only one hotplugging system ram, e.g., DIMMs don't apply,
> so this is safe to be used.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/hv/hv_balloon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index 32e3bc0aa665a..49a6305f0fb73 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -745,6 +745,9 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
>  			has->covered_end_pfn -=  processed_pfn;
>  			spin_unlock_irqrestore(&dm_device.ha_lock, flags);
>  			break;
> +		} else {
> +			/* Try to reduce the number of system ram resources. */
> +			merge_system_ram_resources(&iomem_resource);
>  		}

You don't need to put the call under the "else" branch. It will have
broken out of the loop if ret is not zero.

Wei.

>  
>  		/*
> -- 
> 2.26.2
> 

