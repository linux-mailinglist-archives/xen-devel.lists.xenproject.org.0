Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837971F3F95
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigKq-0004OR-Jr; Tue, 09 Jun 2020 15:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2m0=7W=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jigKp-0004OM-6d
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:38:43 +0000
X-Inumbo-ID: 4c0cb4c2-aa67-11ea-bca7-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c0cb4c2-aa67-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 15:38:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d128so3632429wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 08:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ucWmNLkNFPUVczPToRcxFSCi5MdBM/Nvj/6rGX8RCBY=;
 b=mcxSYc3Wk3bZVYJUc/cT5GO/8PyyoT28fL2xxuXduz2GFFb7Qmsr2ySrnRxHcvi30i
 aOFdnZlaTDQawIhu33lf22C/fcIbOPcwDE0oMsoRXA3UF5W4GYDVZe5+Pa1EJVjMfiOe
 J9jQTmj9hwj/5cTFVR/PZUkhKKiCFFPkn565+3P57ZyLWEsQKWdT+UC+ZK8Fgpuj6gfR
 rksyw4Lvj/clxg6y+GMFS9hkoEjkVCXHRgBBxlmpJk/uaQ9Rg/GzS1cRq9SueDzSg9xI
 +0xNUtFYy7/ZY7VT04kyHlusHHjt6aFYvblKcQuRggeIBubMp1xtD3jQ+1q1HUFIbhvF
 ZMmw==
X-Gm-Message-State: AOAM530MviglN62D2vkw6fwPb6PzyAv2gTQu2zYWigB6SewvNAthIUo+
 C+Ag/sGz6ZAcMmxZe9gPIrM=
X-Google-Smtp-Source: ABdhPJz/HlOOdmjVI4U4/A2Va2+pJ3mjkVlJ9ANwsBeF91ZZlFya6wut+JqkSIPlG0S8iyDk4nm5Sg==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr4397783wmc.167.1591717121844; 
 Tue, 09 Jun 2020 08:38:41 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s72sm3165939wme.35.2020.06.09.08.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 08:38:40 -0700 (PDT)
Date: Tue, 9 Jun 2020 15:38:39 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.14 0/2] tools: two minor fixes for libxenhypfs
Message-ID: <20200609153839.wjqpremfgirxdoj3@liuwe-devbox-debian-v2>
References: <20200609144850.28619-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609144850.28619-1-jgross@suse.com>
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
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 09, 2020 at 04:48:48PM +0200, Juergen Gross wrote:
> Two fixes for libxenhypfs:
> 
> - xenhypfs terminating with segfault when hypervisor doesn't have
>   hypfs support
> - wrong error reporting in case for access errors with xenhypfs
> 
> Juergen Gross (2):
>   tools: fix error path of xenhypfs_open()
>   tools: fix setting of errno in xenhypfs_read_raw()

Applied. I also added Fixes tags to them.

Wei.

> 
>  tools/libs/hypfs/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> -- 
> 2.26.2
> 

