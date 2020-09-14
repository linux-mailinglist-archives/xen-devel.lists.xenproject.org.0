Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685E2688A2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:39:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkxA-0000CG-LY; Mon, 14 Sep 2020 09:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHkx8-0000C3-Hj
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:39:14 +0000
X-Inumbo-ID: 0e443aa4-d4a3-4382-b332-aef5c6b6dc34
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e443aa4-d4a3-4382-b332-aef5c6b6dc34;
 Mon, 14 Sep 2020 09:39:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l9so10524839wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kOAz+/3u/Tar4mSMA6ww27fxE7S/z7Jb8EdBtNvriKg=;
 b=ldBKX+6Ra2P8v+LVLiQM5O1jvBlhWYO65GnAiuJdih6kPeWGvUEEdttV/NzjB8hGdq
 S09vwXYoCmPGtGzkrRqqwS00KdaJ0S4jkfhE5CmxUcjUBhrCTBNq/OkCxxCecmH0aZSz
 tmM4kMC02QsmcipD/aBSRDyCQHb+SiDpbxRl9ehDwF4Ys/kz7mwYzDZ05fOkw3cJO4C8
 cLz+U+/0XY/OOjN/RLlVwVUiu0uiQlBo1+4XKmXOWP2IjDCoHlzt1Yo/WF+yagWUpWZA
 EV37hQzlunEF2RS/apur64qmclgQCCFRs4/GjpN7jnXpfqI7ji7Gg1zaI29FSjDBjgsV
 fTuw==
X-Gm-Message-State: AOAM532ooNLhG5PrjHvHOujdSAdUCHcVwr2kb9d4cXPubsmjZvdF0/iy
 ntT9NgTpuyXwiid+FTu8AYc=
X-Google-Smtp-Source: ABdhPJyAtQVv3Tg8wGjoGdJUxvLKTXuHPdJAV5mkRhjtVl5zU4V4dOyxBGzHxnRS3VZdURtzF7aBjA==
X-Received: by 2002:a1c:1f42:: with SMTP id f63mr13660636wmf.1.1600076343384; 
 Mon, 14 Sep 2020 02:39:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q186sm19588696wma.45.2020.09.14.02.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:39:02 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:39:01 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/guest: fix Makefile regarding zlib options
Message-ID: <20200914093901.ce74eajfp36oiuw5@liuwe-devbox-debian-v2>
References: <20200910154210.2440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910154210.2440-1-jgross@suse.com>
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

On Thu, Sep 10, 2020 at 05:42:10PM +0200, Juergen Gross wrote:
> When renaming the libxenguest sources to xg_*.c there was an omission
> in the Makefile when setting the zlib related define for the related
> sources. Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

