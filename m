Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C32A8568
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 18:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19973.45523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajV6-0000eb-PR; Thu, 05 Nov 2020 17:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19973.45523; Thu, 05 Nov 2020 17:56:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajV6-0000eC-MN; Thu, 05 Nov 2020 17:56:44 +0000
Received: by outflank-mailman (input) for mailman id 19973;
 Thu, 05 Nov 2020 17:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kajV5-0000e7-5I
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:56:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23483491-a268-4bb1-ae9e-2c096ea8b254;
 Thu, 05 Nov 2020 17:56:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kajV5-0000e7-5I
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:56:43 +0000
X-Inumbo-ID: 23483491-a268-4bb1-ae9e-2c096ea8b254
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23483491-a268-4bb1-ae9e-2c096ea8b254;
	Thu, 05 Nov 2020 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604599001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0wNNSD7lPAQz0Xa+y2jiTrG6iq0yYDdSM3++GMp1WU=;
  b=MbZM2qe1vY0TXtJMd1g8biALzkbBr87pPVaX1vh0PeE38KZl5ubUru/O
   KUQunSmzyhv72ZZo6ctwviT9PRwvyeGqQF+H17oHsnjzQBFGFOX930Qw8
   N5vjOme/haOp9CP6QyVHLdAIe2lojlEVo0DEPwd3vKtNPOvluq8bD2+Ml
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yMu/qodxUJu7veUJiFWHe4A1EQnXFMXIO0JemC6Xgj3lc0+Lw87Xic7yrsGUEiL3jjbur1Vuu4
 yMqhC80QvbISiRu27JecULIhN5j/V3V9bSISKafhXR/vRJgCSNh9C9V81STrdCBuDn9woCIbqn
 zjNq33Pu0GLXhen2BjVIlgw6d+DVGqSoUd3X0AA+r5B44lG55Dap8gcJPemQ/g8yhvpDSf5odk
 47RYRS0e+5RGtiYJ/4K0NcKDNQP4sjfI232xFrtQWK9cM7hoK4Mwj14LsNbr6g/Ybjvr6YbxMR
 a2c=
X-SBRS: None
X-MesageID: 30603986
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,454,1596513600"; 
   d="scan'208";a="30603986"
Date: Thu, 5 Nov 2020 17:56:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Takahiro Akashi
	<takahiro.akashi@linaro.org>, Alex Benn??e <alex.bennee@linaro.org>, "Masami
 Hiramatsu" <masami.hiramatsu@linaro.org>, <ian.jackson@eu.citrix.com>,
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: BUG: libxl vuart build order
Message-ID: <20201105175637.GL2214@perard.uk.xensource.com>
References: <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s>
 <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa>
 <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa>
 <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>
 <20201030025157.GA18567@laputa>
 <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
 <20201105154147.GJ2214@perard.uk.xensource.com>
 <alpine.DEB.2.21.2011050826510.2323@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011050826510.2323@sstabellini-ThinkPad-T480s>

On Thu, Nov 05, 2020 at 08:29:20AM -0800, Stefano Stabellini wrote:
> On Thu, 5 Nov 2020, Anthony PERARD wrote:
> > On Fri, Oct 30, 2020 at 10:46:37AM -0700, Stefano Stabellini wrote:
> > > On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> > > > === after "xl console -t vuart" ===
> > > > U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> > > > 
> > > > Xen virtual CPU
> > > > Model: XENVM-4.15
> > > > DRAM:  128 MiB
> > > > 
> > > > In:    sbsa-pl011
> > > > Out:   sbsa-pl011
> > > > Err:   sbsa-pl011
> > > > ===
> > > > 
> > > > If possible, I hope that "xl create -c" command would accept "-t vuart"
> > > > option (or it should automatically selects uart type from the config).
> > > 
> > > I think a patch to add the "-t" option to "xl create" would be
> > > acceptable, right Anthony?
> > 
> > I don't know. Why `xl' isn't able to select the vuart as the default one?
> 
> Because both consoles are still valid: when the emulated uart is
> enabled, the normal PV console is also enabled.
> 
> 
> > Maybe a long option would be better in the cases where we would like to
> > connect to a "secondary" console? I could see `xl create --console=vuart'
> > been fine, I don't know if that's possible.
> 
> That's OK for me but keep in mind that xl console already takes -t
> vuart. In other words:

I don't know why we would need the same exact option, `xl console` and
`xl create` are two different commands. Also, I usually prefer long
option for less used options as it makes it a bit easier to figure out
what a command is supposed to do (without checking the man; and when
there is both long and short options available).

> 1) xl console -t vuart    -> WORKS

-t for `xl console` kind of works well, -t could be a shortcut of "type"
of console".

> 2) xl create -c -t vuart  -> DOESN'T WORK

But here, -t would not be a "type" of console since we are creating a
VM. Also `xl create -t vuart` without -c would do nothing, right?
(create a vm but ignoring the -t).

Anyway, an option to auto-connect to a different console would be
useful.

> P.S.
> 
> Could you also take a quick look at the patch I appended to the previous
> email? Or would you prefer me to send it out separately as its own
> patch?

It's probably better to have a patch on its own when it's ready for
review rather that been embedded in an email in a long
discussion/debugging thread. That leave a better chance for others to
spot that a patch exist and review.

Cheers,

-- 
Anthony PERARD

