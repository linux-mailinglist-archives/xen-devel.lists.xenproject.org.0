Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71C2A8387
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19926.45438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kai8f-0000w8-7V; Thu, 05 Nov 2020 16:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19926.45438; Thu, 05 Nov 2020 16:29:29 +0000
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
	id 1kai8f-0000vk-3G; Thu, 05 Nov 2020 16:29:29 +0000
Received: by outflank-mailman (input) for mailman id 19926;
 Thu, 05 Nov 2020 16:29:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kai8d-0000ve-Ii
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:29:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a58dbe1e-ceca-45f6-a591-025824bac781;
 Thu, 05 Nov 2020 16:29:26 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51E36206D9;
 Thu,  5 Nov 2020 16:29:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kai8d-0000ve-Ii
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:29:27 +0000
X-Inumbo-ID: a58dbe1e-ceca-45f6-a591-025824bac781
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a58dbe1e-ceca-45f6-a591-025824bac781;
	Thu, 05 Nov 2020 16:29:26 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 51E36206D9;
	Thu,  5 Nov 2020 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604593765;
	bh=tsk+LnGHFChweNP487VxzQI0HHqShJ9D2TXUJyZjNv8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=thwLiDGwO0AMfllqDy4viZz+PDc1XaKGr29lAKh/e+bQGgmqMqRdKvpsSjowN62L0
	 Z28CCcjiwsjTlvHdSN69S+QIf+2fPWCEvyh5qk2Wd5wfjuX8XLs9ZIeLE2BILRMoLX
	 phFTSmPJAeUzBAqnOlqhiVjuQ2gAH3TbVJhMHUpY=
Date: Thu, 5 Nov 2020 08:29:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Takahiro Akashi <takahiro.akashi@linaro.org>, 
    Alex Benn??e <alex.bennee@linaro.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, ian.jackson@eu.citrix.com, 
    wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: BUG: libxl vuart build order
In-Reply-To: <20201105154147.GJ2214@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2011050826510.2323@sstabellini-ThinkPad-T480s>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com> <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s> <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa> <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa> <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s> <20201030025157.GA18567@laputa> <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s> <20201105154147.GJ2214@perard.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Nov 2020, Anthony PERARD wrote:
> On Fri, Oct 30, 2020 at 10:46:37AM -0700, Stefano Stabellini wrote:
> > On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> > > === after "xl console -t vuart" ===
> > > U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> > > 
> > > Xen virtual CPU
> > > Model: XENVM-4.15
> > > DRAM:  128 MiB
> > > 
> > > In:    sbsa-pl011
> > > Out:   sbsa-pl011
> > > Err:   sbsa-pl011
> > > ===
> > > 
> > > If possible, I hope that "xl create -c" command would accept "-t vuart"
> > > option (or it should automatically selects uart type from the config).
> > 
> > I think a patch to add the "-t" option to "xl create" would be
> > acceptable, right Anthony?
> 
> I don't know. Why `xl' isn't able to select the vuart as the default one?

Because both consoles are still valid: when the emulated uart is
enabled, the normal PV console is also enabled.


> Maybe a long option would be better in the cases where we would like to
> connect to a "secondary" console? I could see `xl create --console=vuart'
> been fine, I don't know if that's possible.

That's OK for me but keep in mind that xl console already takes -t
vuart. In other words:

1) xl console -t vuart    -> WORKS
2) xl create -c -t vuart  -> DOESN'T WORK


P.S.

Could you also take a quick look at the patch I appended to the previous
email? Or would you prefer me to send it out separately as its own
patch?

