Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0D2542A1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 11:42:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEPx-0000WF-DM; Thu, 27 Aug 2020 09:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBEPw-0000WA-80
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 09:42:00 +0000
X-Inumbo-ID: 160f2728-c221-4ee5-9fff-7cd470284309
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 160f2728-c221-4ee5-9fff-7cd470284309;
 Thu, 27 Aug 2020 09:41:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a5so4704376wrm.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 02:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vWTvGWPDJFUXZXB0zp/KEyXgKG5mEGZWQPg9W440OdE=;
 b=ipqBp9FO1mLEv5dp7TpfR/AGhu5shW9c3wyJhMJLVUKMsHwRDWReLNfykC9U/MEHVj
 8jr4RWvCdxRgzz/5/IrXhpCSS28HCWbeaScbhpXmSOcB4HmkOr3lNab8PqNmU7rHz86/
 tMUKMa5gl17QNUVP7FD/KJjMat30l0FGNe0lNI9Q1GHXBgr2dewo60vfH3jNZDwjCnlN
 z2W4wgUS0+kll0yYj/KiF8ex60oHUV2pTq+uYki4MCoDTSjZ/6T5AfOp6mEQIABwcDNa
 QNYp2CTb4fhKfkfhyCqCO0/gUwiUQ3q4urvP4LJbWMK5hcRQw1i6htf34eycsfO7IZLT
 3VTw==
X-Gm-Message-State: AOAM533owkZey7RndIPl7t54BRwz2jU0gFYaxVep7ntWqR96GlNJLRCq
 zWN97lPKegWBk7U7XcO/QK8=
X-Google-Smtp-Source: ABdhPJxm0IdviBQyVGxD5XrqFOaUQjwtXA8rO07TWGfxgZ9VQUIlvkiVQ4Hg0vfbySMWpTnL1HwDMg==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr18946676wrq.261.1598521317497; 
 Thu, 27 Aug 2020 02:41:57 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i12sm4214117wrm.46.2020.08.27.02.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 02:41:56 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:41:55 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "dave@recoil.org" <dave@recoil.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Message-ID: <20200827094155.mrsghjnmjc72ab6q@liuwe-devbox-debian-v2>
References: <cover.1597439193.git.edvin.torok@citrix.com>
 <1597668966374.91968@citrix.com>
 <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
 <1597742707142.74318@citrix.com>
 <cd17508f-b170-3e3c-d8d3-26e827f7492a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd17508f-b170-3e3c-d8d3-26e827f7492a@citrix.com>
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

On Tue, Aug 18, 2020 at 01:40:18PM +0100, Andrew Cooper wrote:
> On 18/08/2020 10:25, Christian Lindig wrote:
> > I see little reason to support old OCaml releases and requiring OCaml 4.06 would be fine with me but I assume that the project might have its own ideas about this.
> >
> > ________________________________________
> > From: Edwin Torok
> > Sent: 18 August 2020 08:28
> > To: Christian Lindig; xen-devel@lists.xenproject.org
> > Cc: Ian Jackson; dave@recoil.org; wl@xen.org
> > Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
> >
> > On Mon, 2020-08-17 at 14:56 +0200, Christian Lindig wrote:
> >> This all looks good - I left a small comment on one of the patches
> >> and I agree that this needs testing. I also wonder about
> >> compatibility with earlier OCaml releases that we support but I see
> >> no real obstacles.
> >>
> > I've developed the series using OCaml 4.08.1. I think the newest
> > feature I used was Map.update (OCaml 4.06, nearly 3 years ago).
> > Looking through https://repology.org/project/ocaml/versions I'm not
> > sure if we can require more than 4.05 though.
> > The README in Xen doesn't specify a minimum version, but configure
> > checks for >=4.02.
> >
> > I can try to backport my series to OCaml 4.05 (to use Map.find_opt
> > instead of Map.update) and update the configure check to require 4.05.
> > It would be possible to backport even further to 4.02 by introducing
> > additional inefficiencies (Map.mem + Map.find would traverse the map
> > twice, and Map.find on its own would raise an exception on Not found,
> > which is more costly than returning None in Map.find_opt), I'd avoid
> > doing that.
> >
> > Xen's CI from automation might need some updates to use latest stable
> > versions:
> > * Fedora 29 is EOL, should use at least Fedora 31
> > * Debian Jessie is EOL. Stretch is present, but Buster is missing
> 
> We're working on the CI loop.
> 
> As maintainer, it is ultimately Christian's choice to as to if/when to
> bump the minimum versions.
> 
> 
> As a general rule, we don't want to be sufficiently bleeding edge to
> rule out in-use distros.  I have no idea if 4.06 is ok there, or whether
> it is too new.  Then again, the Ocaml components are strictly optional
> so it is perhaps less important.
> 
> Whatever happens WRT version, the configure change should occur before
> changes in the code which would fail on older versions.

Yes I would like to see the bump happen before applying a version of
this series too.

Wei.

> 
> ~Andrew

