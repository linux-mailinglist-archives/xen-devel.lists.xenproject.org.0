Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18841BAE83
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 21:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT9o5-0006gW-CG; Mon, 27 Apr 2020 19:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R4Dr=6L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jT9o3-0006gR-Ub
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 19:52:43 +0000
X-Inumbo-ID: a86f153e-88c0-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a86f153e-88c0-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 19:52:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v8so618057wma.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 12:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CDFsWD9ltBZh+kkR8XQfWxcPeNZOq2AAsVExkrBHq80=;
 b=BYTtmxty9B+0//VJntPPCib41pEdOqlmDp+ZLS76YrT24ajIjHuyuhAoYbmpH6YMUs
 y0Z91uoNVjUW3GnsdUK6/66893JE9eeqxGem00fQYw2N894KK5sd3QF4wPFRiKcIIZez
 cuxDWGiB2wquZonNF4qUSgKt6f/cbq7SXPaIOo355FIVI+xg+wf2fKVqAyFd7KK0bF/X
 +0zB6/Dska8aYASQrOzVuWALmvYLc90cKOGTrS9pbjC4FrR+wws1FhKQ1hAv4mAr583+
 01AJ/GFQF64vwh+tn3jGlA4numQvUL3Lu1tAt5UyYnBuazgHavFksceOqNK/znZ23hb+
 QCrA==
X-Gm-Message-State: AGi0PuZxPxC74Y3tiWJBINWaS/jnX7KMQlK1/3f8R0SnEiIDrNlzeZFl
 n08cTTul0gROH7LTYgcSk0k=
X-Google-Smtp-Source: APiQypJTOJ1p1gP1T4h+rz+LT+5fETxu91u+a8Yv3SsYdY5NzCbxyajE8xZY5v4r358Ncgs22pQRUw==
X-Received: by 2002:a05:600c:1109:: with SMTP id
 b9mr347585wma.116.1588017162583; 
 Mon, 27 Apr 2020 12:52:42 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y18sm235486wmc.45.2020.04.27.12.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 12:52:41 -0700 (PDT)
Date: Mon, 27 Apr 2020 19:52:40 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: drop high compat r/o M2P table address range
Message-ID: <20200427195240.dskoev3u2ohzklpu@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
 <520c95ba-f9d0-4260-5426-b450c2310c3c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520c95ba-f9d0-4260-5426-b450c2310c3c@suse.com>
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
Cc: Hongyan Xia <hx242@xen.org>, julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 10:23:58AM +0200, Jan Beulich wrote:
> Now that we don't properly hook things up into the page tables anymore
> we also don't need to set aside an address range. Drop it, using
> compat_idle_pg_table_l2[] simply (explicitly) from slot 0.
> 
> While doing the re-arrangement, which is accompanied by the dropping or
> replacing of some local variables, restrict the scopes of some further
> ones at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

> ---
> TBD: With the changed usage perhaps we want to also rename
>      compat_idle_pg_table_l2[] (to e.g. compat_idle_l2_entries[])?

No opinion on this.

