Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C31EB7AF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 10:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2em-0002AZ-1G; Tue, 02 Jun 2020 08:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2ek-0002AU-4P
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 08:52:22 +0000
X-Inumbo-ID: 5eb059b2-a4ae-11ea-81bc-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eb059b2-a4ae-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 08:52:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r15so2246806wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 01:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AXfrBNb20l0kugH4AbqVdXHLCoJGjbhs7pF82Rmx8cU=;
 b=MLN+qrzGlc708D0vPX0kykFmPuQocTwFs5cjFbPgDkZ2THTSmhJRa4NVKsXzB5spYY
 lskt7MCUFTzhMh13rLyFKgPBw/L6okT8SSMZCU2HfGPp2hOaewCjMzFolTk0BXzTlz+g
 pfkFW6HJ073kBHM///MzESey83LiW+1Y38zyQuqbGDlzEjMnJTTNzTbQxfZe6jomNrT6
 SRNBwQ8QSy+5gU95VSApuYhpIf9k2a/nLtPuU0/J64kGCZh8dU30wq6ycKWIRb5SJvo/
 itMAugzi9CJvT5qpeXHYb3AywMUj7B/tnuuRmbX/FaxtX4cbPnB84OVwtICDuIxbGJNz
 ipiA==
X-Gm-Message-State: AOAM530K6VCD6NuravsEO1cSRd7eZCHhVJ6KTbqZjf1mHg9NHvLl0OBS
 BeaKQq8/uFOBFhoElsmTYtE=
X-Google-Smtp-Source: ABdhPJyazCE9fYV3sfsQOtAyu0l6qmM0AU5cTVF80Sg2d+jFkkA6x84g6haLXSpF2Ph6jlgPoP5H/Q==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr3357344wmh.31.1591087940338; 
 Tue, 02 Jun 2020 01:52:20 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g82sm2488098wmf.1.2020.06.02.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 01:52:19 -0700 (PDT)
Date: Tue, 2 Jun 2020 08:52:18 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.14 0/2] tools: some fixes for the hypervisor file
 system
Message-ID: <20200602085218.btmbixmkrbnx2btq@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200602060021.23289-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602060021.23289-1-jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 08:00:19AM +0200, Juergen Gross wrote:
> Juergen Gross (2):
>   tools: check return value of asprintf() in xenhypfs
>   tools: make libxenhypfs interface more future proof
> 
>  tools/libs/hypfs/core.c             |  2 +-
>  tools/libs/hypfs/include/xenhypfs.h | 31 +++++++++++++++++------------
>  tools/misc/xenhypfs.c               | 10 ++++++++--

Good improvements.

Acked-by: Wei Liu <wl@xen.org>

>  3 files changed, 27 insertions(+), 16 deletions(-)
> 
> -- 
> 2.26.2
> 

