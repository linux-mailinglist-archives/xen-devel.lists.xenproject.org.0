Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4D255E85
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:06:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgsj-00060w-M6; Fri, 28 Aug 2020 16:05:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqI4=CG=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBgsi-00060r-2J
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:05:36 +0000
X-Inumbo-ID: 1c21f795-70bb-49cb-bb90-c551fe85978f
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c21f795-70bb-49cb-bb90-c551fe85978f;
 Fri, 28 Aug 2020 16:05:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a5so1778752wrm.6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 09:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CRVBm7fuyUaJs2bVhDsqWGaQc+AKIuVXsKKiJuDV2XQ=;
 b=pHBBlexSVyW4Pshm0jmISIe+YEdHFfLHWE8QU/AE2/59RCtJvqFBZUMpbnCc/psXQz
 WpTsnIEFTNjTEmhmKjmF4YV/2GmFoNgS/EDnbcUD5lmfuDPP5e2Ak00KncmgApoAmaNX
 prXxcdAJCF4grM7KKrcwqze2JhFY2XDqCHJK3VjqhLdHouI+HI+/zaxClIhh9QgL8DLE
 D7X/Xdg1QoQO94Mh3hRph+RFqj7J6ZaO6a4Hm6leq/2NzFpaag3cbi/BdbxxOQz3woZ6
 pjxR6KL1T7/1TYL7XLRScgCLNvMji4mqowwdKUWSc9VXpO0xLqLr0QZxGltY9de87Wzm
 /ZUQ==
X-Gm-Message-State: AOAM530+Jm0OTra34w+8l1NVVMOIyeEM+2Zc1yc/8XldXbKEi4BRA93q
 L9ox5HRQj9FTjLxv6oXiiw8=
X-Google-Smtp-Source: ABdhPJwdJkwt28R7ABVHTrmr+G4ykXgvsVJS8hklfAKXtCsJT9Tlpm+spCHPxvil2HzN87djD03cIA==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr2258867wrw.101.1598630734169; 
 Fri, 28 Aug 2020 09:05:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n16sm2744001wrj.25.2020.08.28.09.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 09:05:33 -0700 (PDT)
Date: Fri, 28 Aug 2020 16:05:32 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Subject: Re: [PATCH v4 28/31] tools/libxl: move libxenlight to tools/libs/light
Message-ID: <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-29-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-29-jgross@suse.com>
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

On Fri, Aug 28, 2020 at 05:07:44PM +0200, Juergen Gross wrote:
> Carve out all libxenlight related sources and move them to
> tools/libs/light in order to use the generic library build environment.
> 
> The closely related sources for libxl-save-helper and the libxl test
> environment are being moved, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Wei Liu <wl@xen.org>

It occurs to me you may need to modify golang/xenlight/Makefile.

There is

    LIBXL_SRC_DIR = ../../libxl

in it.

I didn't hit any error perhaps due to I didn't have golang installed.

Wei.

