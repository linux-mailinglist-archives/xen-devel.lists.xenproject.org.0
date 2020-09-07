Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6925FDA1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 17:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFJS1-0000Sx-VN; Mon, 07 Sep 2020 15:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFJS0-0000Ss-NT
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 15:53:00 +0000
X-Inumbo-ID: 4a0e8fd0-4117-4e1a-bb33-11f4068f9f37
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0e8fd0-4117-4e1a-bb33-11f4068f9f37;
 Mon, 07 Sep 2020 15:52:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w2so14791257wmi.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vLqpoGPliuehNDxtCfKfHk+kNKkvqqte1DpAqTHAY0c=;
 b=RhxT36BQ/PcgeEbB3HTBq5eg+rOsNjXGIPpsRjfMe2UnUx1bZM2K9+VXRpvaNG/R4/
 JiisVXXzRcvJMFdIQ8Co3fR41/J921a80i+TnFRHiJkS53VRkUn90h4ekJfdk9AvUNdI
 KaVksBPc/j1QAgcyP6b9uTE6wvN1xLp4ib/j/qBYi47IIuVSDSFzoxx2wNoN8oLjmmHI
 o7GMaZmkoIU96LulUTpjlpjh3agYH3ndhJzUMgA4440T3W+hKXC+nltrJHZs5o+G/hao
 JUl4rx66Co55tx3DwmcnnJ1Ux7jyKkC36li4tkU6zNz0CmZLEzThAO/hbJnny/FiVQhM
 Spmg==
X-Gm-Message-State: AOAM530QZrtPJ3GS2FU+YEoV3ZIkaN3VF7TpSeHGIhan9BAk0NxiHUAa
 uwm0JG8TSFSiriTg3AGnOW0=
X-Google-Smtp-Source: ABdhPJzXvhQClyexeU/Zc4tGz0TvA8BqTJp0cxGJCRy/x2dJzHXjGfRsmbW4DYDq0YTsJ+Z6UJb1OA==
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr20115157wmf.47.1599493979113; 
 Mon, 07 Sep 2020 08:52:59 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m13sm28718410wrr.74.2020.09.07.08.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 08:52:58 -0700 (PDT)
Date: Mon, 7 Sep 2020 15:52:57 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Subject: Re: [PATCH v4 28/31] tools/libxl: move libxenlight to tools/libs/light
Message-ID: <20200907155257.jztw3kv2h3kmjcqa@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-29-jgross@suse.com>
 <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
 <5d65901d-5729-fe17-3fb2-2a41867d726b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d65901d-5729-fe17-3fb2-2a41867d726b@suse.com>
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

On Mon, Aug 31, 2020 at 07:50:42AM +0200, Jürgen Groß wrote:
> On 28.08.20 18:05, Wei Liu wrote:
> > On Fri, Aug 28, 2020 at 05:07:44PM +0200, Juergen Gross wrote:
> > > Carve out all libxenlight related sources and move them to
> > > tools/libs/light in order to use the generic library build environment.
> > > 
> > > The closely related sources for libxl-save-helper and the libxl test
> > > environment are being moved, too.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > Acked-by: Wei Liu <wl@xen.org>
> > 
> > It occurs to me you may need to modify golang/xenlight/Makefile.
> > 
> > There is
> > 
> >      LIBXL_SRC_DIR = ../../libxl
> > 
> > in it.
> > 
> > I didn't hit any error perhaps due to I didn't have golang installed.
> 
> Me neither.
> 
> Thanks for noticing that.

No need to resend just for this. I can fix it up for you.

Wei.

