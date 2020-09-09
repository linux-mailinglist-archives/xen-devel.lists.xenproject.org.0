Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1C262C3E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 11:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwdx-0007Ca-Pq; Wed, 09 Sep 2020 09:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3x4=CS=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kFwdw-0007CQ-45
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:43:56 +0000
X-Inumbo-ID: 5daf493f-54ad-4681-b7df-a7d723a98805
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5daf493f-54ad-4681-b7df-a7d723a98805;
 Wed, 09 Sep 2020 09:43:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k15so2173385wrn.10
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2020 02:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=itunWBeUEUF+I5zgor+uJyYhdBRIEn0Nbwdk7PfivcQ=;
 b=jDUMiq+aCxzwR/ynZaNeXbVwVC3tX2WCqXQb+ayQyJYj9LPGmEchtdPtztFI6vzpaV
 WJVjZBE+dO+ke87u1rfzFzijTTvJnsf3Lo0Fpy5RU1KoVSJqI+8ewBmkNkhFDVaUGNJ+
 4gHhoVA816CvFIZ4p2oGhbsERAFCt1sbE28iI4DY7gLAwZHAf+K6Sg4G/dq2m1k595eo
 B8KY1FC19fM8gdm24wo1tjpNQ7RnyNnPP5L3nihDL00zgqoGEyaT3qcMxNWUy6M+rdPj
 TGBS1jic+gIH2cRz49KTt8jcLwt+p41RpFDqhD5pi3isbNCZgBQPb2YFzI6fS7FfbuOX
 BoTQ==
X-Gm-Message-State: AOAM533T4vzpFT3FEmvKWngvZ/LnL36Zw7wmPmEsMVANLPX1hMaR+NY8
 ubrQqDEy2NtLEVvdOc5sNNw=
X-Google-Smtp-Source: ABdhPJw4m6JIIMVzIcBEfdyNOEzdxl4ubsib7FAe+AQwVP/swI1ur/mk9/fv0YgWwez/zmAN9CDF6A==
X-Received: by 2002:adf:f552:: with SMTP id j18mr3339957wrp.128.1599644633198; 
 Wed, 09 Sep 2020 02:43:53 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y1sm3048033wmi.36.2020.09.09.02.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:43:52 -0700 (PDT)
Date: Wed, 9 Sep 2020 09:43:51 +0000
From: Wei Liu <wei.liu@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v2 7/7] hv_balloon: try to merge system ram resources
Message-ID: <20200909094351.2a6lpsqoqj6b4nk2@liuwe-devbox-debian-v2>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908201012.44168-8-david@redhat.com>
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

On Tue, Sep 08, 2020 at 10:10:12PM +0200, David Hildenbrand wrote:
> Let's try to merge system ram resources we add, to minimize the number
> of resources in /proc/iomem. We don't care about the boundaries of
> individual chunks we added.
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

Reviewed-by: Wei Liu <wei.liu@kernel.org>

