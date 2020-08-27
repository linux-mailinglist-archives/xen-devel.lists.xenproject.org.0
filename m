Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAD2543E4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:40:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFJt-0006nY-OD; Thu, 27 Aug 2020 10:39:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFJs-0006nH-33
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:39:48 +0000
X-Inumbo-ID: 70f62db7-ef7b-4a30-ab75-9037cd2ab117
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70f62db7-ef7b-4a30-ab75-9037cd2ab117;
 Thu, 27 Aug 2020 10:39:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t2so4709252wma.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oxMsonTMFfyhQzVdmBazP2fJ7UFm10exY19rIhEFa7o=;
 b=D7xJ8raPAZENZUPk1OTp7m2QwwfnMRGpQ8Ee4Bg0jg6YKvY8uDTwAa2xl8kSN2uxlH
 RSiPHDsIck1/tOm+5+VhDxaUxRDFymHf+sfhDuOYxHr2twLnD8mLU4vhXoqD4B3iQJgX
 04lHgarzQfCmN0UN8TZL65DkPuYIJKin2KRgNGwNZVoKlNg2/2ju97zdZa5u0oFkZyBy
 ktsq9RwNIWJah+hYvBu2Dl+/0JA9+uv/kR0kTOq8KYzo79UNW8skkjL2h9KPAgj6pqyg
 zAXwQuZMASHDakZsNl7ImIwaLNF5CT0DDcBIxYFnFRBHuxdYqIoHD2aXv4Ber4e1ABOf
 AK4g==
X-Gm-Message-State: AOAM5316pMIaFYFdVlJ5plWj39LoxZIR+o5gIgh4j0RvQjbvBP4hnuNa
 e8AjQH9gnOcFpFVWCajlBIs=
X-Google-Smtp-Source: ABdhPJxQ3qJPSD04guKHWbFtW8gCu564QdtS+QLEl+6aGcqFNynjvpayA7sQ8NWr4sIvzVF5typsuQ==
X-Received: by 2002:a1c:6445:: with SMTP id y66mr4719207wmb.12.1598524786611; 
 Thu, 27 Aug 2020 03:39:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p11sm5541862wrw.23.2020.08.27.03.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:39:46 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:39:44 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 19/38] tools/libxc: move xc_[un]map_domain_meminfo()
 into new source xg_domain.c
Message-ID: <20200827103944.a54zkdnkjgk3kgge@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-20-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-20-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:00AM +0200, Juergen Gross wrote:
> Move xc_[un]map_domain_meminfo() functions to new source xg_domain.c as
> they are defined in include/xenguest.h and should be in libxenguest.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

