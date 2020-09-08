Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E090261218
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:38:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdpW-0007uL-KO; Tue, 08 Sep 2020 13:38:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd5i=CR=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kFdpW-0007uE-2P
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:38:38 +0000
X-Inumbo-ID: c9f8df1e-ae93-42eb-8916-abd8561bf4c9
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9f8df1e-ae93-42eb-8916-abd8561bf4c9;
 Tue, 08 Sep 2020 13:38:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so19178868wrs.5
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 06:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TwxpdK/59MAWiq//AO3EX8E7L55hRGsuGsOm1BqtOWc=;
 b=qpPBrlXglZzC4ALLtcROBK/J8rV+M5DgGplIL9MbvEi0X8jVXCL/+XhBRs3B3gIwPc
 G0BgDw0fVCPIsJy19g6/rzla6TnZUfgZS6ouqY6dXUNU7GS9xpKUeo7n3qy8q44ryht8
 h5wk8aLzueJex6ArVyVOxLecAYfRUlLpbNd6lgE6Qr2yTHn9pMiZx/nh6dt1n6jUUwEK
 Ei42P4eB/1YPx82U6ZJdU1Q8SuKO2bbdfEL6NLyy31McAkkX4e2WjsBPlzMnn6LXJxmX
 9bTfgTAVBBI8N40jXYEifxW+hPpF32QmvJfebuBqsKVqMlyVjBOJSKrXZJYU23BFjsGZ
 VYiA==
X-Gm-Message-State: AOAM532+WOL9sNbKg4Kz1/2Auq/Unp/pY1NMXVlQm+HOVC8wpUx/BalH
 xT//hxCfovCw4JX6lQ53icE=
X-Google-Smtp-Source: ABdhPJxwPrLUlwLGCmVvH0TkOg6gDhxxfObMHIv2CKXNM2BFIqu6XYC/IeSPUBmDSTnuAzSCGx0NTA==
X-Received: by 2002:adf:e690:: with SMTP id r16mr22651171wrm.15.1599572316681; 
 Tue, 08 Sep 2020 06:38:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w7sm33986516wrm.92.2020.09.08.06.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 06:38:36 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:38:35 +0000
From: Wei Liu <wei.liu@kernel.org>
To: paul@xen.org
Cc: wei.liu@kernel.org, 'Ian Jackson' <iwj@xenproject.org>,
 'Anthony PERARD' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] fix 'xl block-detach'
Message-ID: <20200908133834.2jk26wpvefijmemv@liuwe-devbox-debian-v2>
References: <20200903100537.1337-1-paul@xen.org>
 <004901d685ce$3179a060$946ce120$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004901d685ce$3179a060$946ce120$@xen.org>
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

On Tue, Sep 08, 2020 at 11:52:48AM +0100, Paul Durrant wrote:
> Ping? Can I get a toolstack maintainer opinion on this?

This series landed in my @xen.org inbox just fine but I haven't got
around reviewing it.

Wei.

