Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F331254463
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGD3-00051r-2q; Thu, 27 Aug 2020 11:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGD1-00051g-Ia
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:36:47 +0000
X-Inumbo-ID: 88439c34-edca-4eb7-9378-165d7a907884
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88439c34-edca-4eb7-9378-165d7a907884;
 Thu, 27 Aug 2020 11:36:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c15so5024620wrs.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vjLI/H+n6JRi+UPooghYX4mTqwxkknzzpdetb1100N0=;
 b=bE4WkLdnhXhpJ+ATjXEiDMjoyFvnk3TNsA2ZtH8DvIcO5u42S7XaCGmrC/wtaTMLG2
 xwCNTvUTdxIJCZsHoR37yeI9ziToQHHmvBi4go4K0CRZfkUBRjItbDxXbhcP7UdtWENC
 sAxTVo2fYVStTVKwaLopzkYafyBJWkCl2opmmq88dXV1AQnsh2hVYDhqUtXz6jD2uwbQ
 U2H5MX5jH/OYI+tvrhH3HQcIDTybibGhyVF6JTgBBb1Gvyaic8SBYX/YSf5nNhkPcxYd
 OaLnBDaZBoDlQfpWLeXhhs47esgjon6+rmZXIGF8NVsBuJkK1QwXJY/YL8+ozlBe+76q
 II/w==
X-Gm-Message-State: AOAM5329o7oUZZAZkO7L2ylMhaHt9w4iAPQAaikfd591CMB4zOLFlG+H
 8B9gCPhbrfSvHza2MJlBpNsbICY1pfM=
X-Google-Smtp-Source: ABdhPJydThiMg77J1oBZgE1aZ0FkxyyzjJ10Sfl+1q4GtXeksl2neEpMSnDuM5JS5q2CJ3oqqPM38Q==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr20509455wrs.185.1598528206208; 
 Thu, 27 Aug 2020 04:36:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g70sm4768006wmg.24.2020.08.27.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:36:45 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:36:44 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 31/38] tools/libxl: fix dependencies of libxl tests
Message-ID: <20200827113644.m7x354tbg6yyjign@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-32-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-32-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:12AM +0200, Juergen Gross wrote:
> Today building the libxl internal tests depends on libxlutil having
> been built, in spite of the tests not using any functionality og

og -> of

> libxlutil. Fix this by dropping the dependency.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

