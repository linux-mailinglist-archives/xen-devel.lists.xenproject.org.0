Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65C2437F4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 11:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k69rt-0006Rk-DR; Thu, 13 Aug 2020 09:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZwWr=BX=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1k69rr-0006Rd-2x
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 09:49:51 +0000
X-Inumbo-ID: d6ff1668-9af8-4f83-b71c-2314a79b5eb9
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6ff1668-9af8-4f83-b71c-2314a79b5eb9;
 Thu, 13 Aug 2020 09:49:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so4650563wrs.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0LlvHfm0fDcpoyyMaORTx/eYLC8CvpylDILZS1NvjiE=;
 b=lWi1FzHH1BV+EzmrSga7ApiENnWG4rnFNvY55jJnx4HEYYqFbLTyoosig8cHp1FiY+
 KzDuXOaac641oazK7Pj5mp5b/e6dsFLKNW4tORrAeiih1MKDWVWE0X2vuI1VAcIyx2P7
 Yyv67b5AUWBZMZM3ni5igMfct6/Px27rLKJM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0LlvHfm0fDcpoyyMaORTx/eYLC8CvpylDILZS1NvjiE=;
 b=KyvTvRsSPVn/HI2LEWBGNJS0lXCYivuTcG4i04EwzTQFUB0CIlkQiq2aZMdLOHjuDU
 mjiy4+PJVzbqYcRBobx+XILcW8Ul/rpZLMl7iK+U9ZC2zLUSF0ozAsQbLF7MH7UMypWq
 Z6pmZb58hwefz0W6YIZcdc4ggQw7cDxoA8u7q+wUj1AoTzcHKNZQeI94LeuuTSl3XGN9
 hE8Q0IAjGB1CbXo9CoVszk0dvZEAFQXWBe8EBRbvm0wbvcurPkW6b93m3IuliRU4te8A
 of/5WKpwmy1dKYrGf30lPyw7vdnP5tsSQHmnmilDHH6Kqw1LG4cVzEm/WOOwd/3bstoq
 PPPQ==
X-Gm-Message-State: AOAM533BAw+VytNkmEFalnwKOHVQ0XDQ6Nv1EJs1OIoxr0WoJg8QbXM3
 pBNjD+QKWh+fKppSpxNwoNlYnQ==
X-Google-Smtp-Source: ABdhPJycUujEr7rVda86HPb+DkIE8Ht8J0MPhgd4scPfkc4FA7fTcodh9eVHq8K2RnSra1Me1/FpMg==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr3037067wrq.327.1597312188920; 
 Thu, 13 Aug 2020 02:49:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 68sm9267182wra.39.2020.08.13.02.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 02:49:48 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:49:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813094946.GJ2352366@phenom.ffwll.local>
Mail-Followup-To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813075420.GC975@Air-de-Roger>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monné wrote:
> On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > unpopulated physical memory ranges to map foreign pages, which is the
> > > correct thing to do in order to avoid mappings of foreign pages depend
> > > on memory hotplug.
> > 
> > So please just select ZONE_DEVICE if this is so much better rather
> > than maintaining two variants.
> 
> We still need to other variant for Arm at least, so both need to be
> maintained anyway, even if we force ZONE_DEVICE on x86.

Why does arm not have ZONE_DEVICE?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

