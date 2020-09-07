Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7F25FF1A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 18:27:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFJzK-0003wb-6Y; Mon, 07 Sep 2020 16:27:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFJzI-0003vk-5b
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 16:27:24 +0000
X-Inumbo-ID: cd0ac15c-fddd-4f4a-bd9e-695e71283533
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd0ac15c-fddd-4f4a-bd9e-695e71283533;
 Mon, 07 Sep 2020 16:27:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so14730447wmm.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 09:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WCPL9VJ+zKG48twFTZFoenhy8njvXhwBk7qgED4y4Dw=;
 b=my/G6H1VhtRZeHFCYMYMDDdn6xc1SamDnn4hn2pHbAngaLb5lR55FgxFy9j7N+sa3E
 PqA688yPBGBBOpxB6YIc6sC5RppgzozVx8CzOD084D1Nv+MfyjDksRhkV4ONqwVbyHFI
 XkYKN8YTgl6D/xAvCBLqumaWkExafa4zYxuXFVnmGrG6Z4dFleh1AHR1Wgmy7++iwT+0
 MCJa4pFaEsBwi42r1PUrt1U/lN0FkQV2GthMyZKtOe6kosT45P1yplGVokU1WhwgIWfw
 PtRfq8lJY6BZ8sQvL3c0c2T4Sz9M1yRYfwl1XpWsGYl+od8qYxGq0ZSfob0Fmrm2cuQh
 DP0A==
X-Gm-Message-State: AOAM531Y6B6b5L+3Oh+82Fqkr48NygigTYvFrZgSTiqCjOn4BQC2utnb
 eJf8PFV1N7EcRiyu6fmgS9E=
X-Google-Smtp-Source: ABdhPJw4YmSmHAo/KKWpHCxGVLAr3w1Ly4pBeBdZZZDryamG3mjhJ+ueqCv9HXc3ruT0EZEpJ57f/A==
X-Received: by 2002:a05:600c:2cc1:: with SMTP id
 l1mr142113wmc.78.1599496042425; 
 Mon, 07 Sep 2020 09:27:22 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v3sm27643224wmh.6.2020.09.07.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 09:27:21 -0700 (PDT)
Date: Mon, 7 Sep 2020 16:27:20 +0000
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
Message-ID: <20200907162720.zj4ucgwqxav3gv57@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-29-jgross@suse.com>
 <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
 <5d65901d-5729-fe17-3fb2-2a41867d726b@suse.com>
 <20200907155257.jztw3kv2h3kmjcqa@liuwe-devbox-debian-v2>
 <4a6b6986-30d9-1da9-e861-7772a8d160c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a6b6986-30d9-1da9-e861-7772a8d160c4@suse.com>
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

On Mon, Sep 07, 2020 at 06:15:00PM +0200, Jürgen Groß wrote:
> On 07.09.20 17:52, Wei Liu wrote:
> > On Mon, Aug 31, 2020 at 07:50:42AM +0200, Jürgen Groß wrote:
> > > On 28.08.20 18:05, Wei Liu wrote:
> > > > On Fri, Aug 28, 2020 at 05:07:44PM +0200, Juergen Gross wrote:
> > > > > Carve out all libxenlight related sources and move them to
> > > > > tools/libs/light in order to use the generic library build environment.
> > > > > 
> > > > > The closely related sources for libxl-save-helper and the libxl test
> > > > > environment are being moved, too.
> > > > > 
> > > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > > Acked-by: Wei Liu <wl@xen.org>
> > > > 
> > > > It occurs to me you may need to modify golang/xenlight/Makefile.
> > > > 
> > > > There is
> > > > 
> > > >       LIBXL_SRC_DIR = ../../libxl
> > > > 
> > > > in it.
> > > > 
> > > > I didn't hit any error perhaps due to I didn't have golang installed.
> > > 
> > > Me neither.
> > > 
> > > Thanks for noticing that.
> > 
> > No need to resend just for this. I can fix it up for you.
> 
> Sure? Did you consider ac7a21cf5c125810? I had to rebase in order
> to have a successful build.

I have not tried to apply this series yet. I said "just for this" for a
reason. :-)

Wei.

> 
> 
> Juergen

