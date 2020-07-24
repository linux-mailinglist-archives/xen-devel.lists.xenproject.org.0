Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D633C22BF11
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 09:29:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jys83-0003c2-Hy; Fri, 24 Jul 2020 07:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gdfW=BD=gmail.com=mstsxfx@srs-us1.protection.inumbo.net>)
 id 1jys82-0003bx-4w
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 07:28:26 +0000
X-Inumbo-ID: 426181a6-cd7f-11ea-a37b-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 426181a6-cd7f-11ea-a37b-12813bfff9fa;
 Fri, 24 Jul 2020 07:28:25 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n2so6325521edr.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 00:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xfL/HVhb5CZmwLPp8FrK3Hc1m89ug/giIGTFH3XnKGo=;
 b=TDSWpspTEwZy7lJOmXWQ9LdNEAiCZ6gBhjOZGoIJNpzBrU8ZsvtGN4mMcPL+Jn+i7l
 N/7Qu99yGiT9FrO551clr71eHzNfN80c2mJjmE7Ru55pf2GG18ijGu5wZZbQWgH/ONAA
 LcYkDS0ONBXitRALpFBYk9/H1N66+jjU90nbo6fpTEUv/vrs1idkoD1pOT6QUDb3FBsC
 kf5OyBgIh+yxYsw5P5QyAJZ6YboGY8YvoB26QbTCcGxpvT0T8BOQpDGyGv8KXpuWLauT
 +vFSS3EqVgw9Y8qs8zxadx5alCUO4zVNWtHxy/JUNSOqi9+S0q23Lg7BPi6iqqG0JJXv
 PQIA==
X-Gm-Message-State: AOAM5325lD6MKa0ET3Z2BNBAIgRxaWQF83B/XTi1IrEQHHTMwpdaPsNf
 53j59ugxL+Gk/qySAyn6fis=
X-Google-Smtp-Source: ABdhPJw43GhFTsOZBuTzQhugNO+Sk6Rpj0CrpsDoWTG6p0Jw6ktDtr5TgT1bNjQpFHfxrJ2v5rE5xA==
X-Received: by 2002:a50:cd53:: with SMTP id d19mr7868671edj.300.1595575704271; 
 Fri, 24 Jul 2020 00:28:24 -0700 (PDT)
Received: from localhost (ip-37-188-169-187.eurotel.cz. [37.188.169.187])
 by smtp.gmail.com with ESMTPSA id lc18sm120397ejb.29.2020.07.24.00.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 00:28:23 -0700 (PDT)
Date: Fri, 24 Jul 2020 09:28:21 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
Message-ID: <20200724072821.GD4061@dhcp22.suse.cz>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
 <20200723135930.GH7191@Air-de-Roger>
 <82b131f4-8f50-cd49-65cf-9a87d51b5555@suse.com>
 <20200723162256.GI7191@Air-de-Roger>
 <4ff380e9-4b16-4cd0-7753-c2b89bd8ac6b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff380e9-4b16-4cd0-7753-c2b89bd8ac6b@redhat.com>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu 23-07-20 19:39:54, David Hildenbrand wrote:
[...]
> Yeah, might require some code churn. It just feels wrong to involve
> buddy concepts (e.g., onlining pages, calling memory notifiers, exposing
> memory block devices) and introducing hacks (forced onlining) just to
> get a memmap+identity mapping+iomem resource. I think reserving such a
> region during boot as suggested is the easiest approach, but I am
> *absolutely* not an expert on all these XEN-specific things :)

I am late to the discussion but FTR I completely agree.
-- 
Michal Hocko
SUSE Labs

