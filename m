Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F92A4FA0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 20:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18654.43638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka1aw-00012b-Ix; Tue, 03 Nov 2020 19:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18654.43638; Tue, 03 Nov 2020 19:03:50 +0000
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
	id 1ka1aw-00012C-F8; Tue, 03 Nov 2020 19:03:50 +0000
Received: by outflank-mailman (input) for mailman id 18654;
 Tue, 03 Nov 2020 19:03:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ka1av-000127-1m
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 19:03:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9f1dc3b-b11f-4a8c-bde3-8722dfde5f87;
 Tue, 03 Nov 2020 19:03:47 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BAEC2074B;
 Tue,  3 Nov 2020 19:03:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ka1av-000127-1m
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 19:03:49 +0000
X-Inumbo-ID: a9f1dc3b-b11f-4a8c-bde3-8722dfde5f87
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a9f1dc3b-b11f-4a8c-bde3-8722dfde5f87;
	Tue, 03 Nov 2020 19:03:47 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1BAEC2074B;
	Tue,  3 Nov 2020 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604430226;
	bh=9HeorJAkuowbAO8X3uejvWjY5pogCfovFWVu4WF1NN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PobIdsf1hkWsehple2WynRNOHnx1cJYYGZih7kEM9W9ncZ8Kl/Q0n7tO4TSZvP+wx
	 4jko2EJttIJrw1vgHxsET9xde4on19fk0mvYT/ImmoGQca4RcTJF1o1GMh5EOfQsqi
	 TX3thQkz4qy4oPflmh2k+3zrSlaGzf5h9WuS5fCU=
Date: Tue, 3 Nov 2020 11:03:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: anthony.perard@citrix.com, wl@xen.org, ian.jackson@eu.citrix.com
cc: Takahiro Akashi <takahiro.akashi@linaro.org>, 
    Alex Benn??e <alex.bennee@linaro.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: BUG: libxl vuart build order
In-Reply-To: <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2011031103180.5812@sstabellini-ThinkPad-T480s>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com> <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s> <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa> <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa> <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s> <20201030025157.GA18567@laputa> <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2125818377-1604430226=:5812"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2125818377-1604430226=:5812
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

ping?


On Fri, 30 Oct 2020, Stefano Stabellini wrote:
> On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> > Hi Stefano,
> > 
> > On Thu, Oct 29, 2020 at 07:03:28PM -0700, Stefano Stabellini wrote:
> > > + xen-devel and libxl maintainers
> > > 
> > > In short, there is a regression in libxl with the ARM vuart introduced
> > > by moving ARM guests to the PVH build.
> > > 
> > > 
> > > On Thu, 29 Oct 2020, Takahiro Akashi wrote:
> > > > On Wed, Oct 28, 2020 at 02:44:16PM -0700, Stefano Stabellini wrote:
> > > > > On Wed, 28 Oct 2020, Takahiro Akashi wrote:
> > > > > > On Tue, Oct 27, 2020 at 09:02:14AM +0900, Takahiro Akashi wrote:
> > > > > > > On Mon, Oct 26, 2020 at 04:37:30PM -0700, Stefano Stabellini wrote:
> > > > > > > > 
> > > > > > > > On Mon, 26 Oct 2020, Takahiro Akashi wrote:
> > > > > > > > > Stefano,
> > > > > > > > > 
> > > > > > > > > # I'm afraid that I have already bothered you with a lot of questions.
> > > > > > > > > 
> > > > > > > > > When I looked at Xen's vpl011 implementation, I found
> > > > > > > > > CR (and LCHR) register is not supported. (trap may cause a data abort).
> > > > > > > > > On the other hand, for example, linux's pl011 driver surely
> > > > > > > > > accesses CR (and LCHR) register.
> > > > > > > > > So I guess that linux won't be able to use pl011 on a Xen guest vm
> > > > > > > > > if vuart = "sbsa_uart".
> > > > > > > > > 
> > > > > > > > > Is this a known issue or do I miss anything?
> > > > > > > > 
> > > > > > > > Linux should definitely be able to use it, and in fact, I am using it
> > > > > > > > with Linux in my test environment.
> > > > > > > > 
> > > > > > > > I think the confusion comes from the name "vpl011": it is in fact not a
> > > > > > > > full PL011 UART, but an SBSA UART.
> > > > > > > 
> > > > > > > Yeah, I have noticed it.
> > > > > > > 
> > > > > > > > SBSA UART only implements a subset of
> > > > > > > > the PL011 registers. The compatible string is "arm,sbsa-uart", also see
> > > > > > > > drivers/tty/serial/amba-pl011.c:sbsa_uart_probe.
> > > > > > > 
> > > > > > > Looking closely into the details of implementation, I found
> > > > > > > that all the accesses to unimplemented registers, including
> > > > > > > CR, are deliberately avoided in sbsa part of linux driver.
> > > > > > 
> > > > > > So I'm now trying to implement "sbsa-uart" driver on U-Boot
> > > > > > by modifying the existing pl011 driver.
> > > > > > (Please note the current xen'ized U-Boot utilises a para-virtualized
> > > > > > console, i.e. with HVM_PARAM_CONSOLE_PFN.)
> > > > > > 
> > > > > > So far my all attempts have failed.
> > > > > > 
> > > > > > There are a couple of problems, and one of them is how we can
> > > > > > access vpl011 port (from dom0).
> > > > > > What I did is:
> > > > > > - modify U-Boot's pl011 driver
> > > > > >   (I'm sure that the driver correctly handle a vpl011 device
> > > > > >   with regard of accessing a proper set of registers.)
> > > > > > - start U-Boot guest with "vuart=sbsa_uart" by
> > > > > >     xl create uboot.cfg -c
> > > > > > 
> > > > > > Then I have seen almost nothing on the screen.
> > > > > > Digging into vpl011 implementation, I found that all the characters
> > > > > > written DR register will be directed to a "backend domain" if a guest
> > > > > > vm is launched by xl command.
> > > > > > (In case of dom0less, the backend seems to be Xen itself.)
> > > > > > 
> > > > > > As a silly experiment, I modified domain_vpl011_init() to always create
> > > > > > a vpl011 device with "backend_in_domain == false".
> > > > > > Then, I could see more boot messages from U-Boot, but still fails
> > > > > > to use the device as a console, I mean, we will lose all the outputs
> > > > > > after at some point and won't be able to type any keys (at a command prompt).
> > > > > > (This will be another problem on U-Boot side.)
> > > > > > 
> > > > > > My first question here is how we can configure and connect a console
> > > > > > in this case?
> > > > > > Should "xl create -c" or "xl console -t vuart" simply work?
> > > > > 
> > > > > "xl create -c" creates a guest and connect to the primary console which
> > > > > is the PV console (i.e. HVM_PARAM_CONSOLE_PFN.)
> > > > 
> > > > So in case of vuart, it (console) doesn't work?
> > > > (Apparently, "xl create" doesn't take '-t' option.)
> > > > 
> > > > > To connect to the emulated sbsa uart you need to pass -t vuart. So yes,
> > > > > "xl console -t vuart domain_name" should get you access to the emulated
> > > > > sbsa uart. The sbsa uart can also be exposed to dom0less guests; you get
> > > > > their output by using CTRL-AAA to switch to right domU console.
> > > > > 
> > > > > You can add printks to xen/arch/arm/vpl011.c in Xen to see what's
> > > > > happening on the Xen side. vpl011.c is the emulator.
> > > > 
> > > > I'm sure that write to "REG_DR" register is caught by Xen.
> > > > What I don't understand is
> > > > if back_in_domain -> no outputs
> > > > if !back_in_domain -> can see outputs
> > > > 
> > > > (As you know, if a guest is created by xl command, back_in_domain
> > > > is forcedly set to true.)
> > > > 
> > > > I looked into xenstore and found that "vuart/0/tty" does not exist,
> > > > but "console/tty" does.
> > > > How can this happen for vuart?
> > > > (I clearly specified, vuart = "sbsa_uart" in Xen config.)
> > > 
> > > It looks like we have a bug :-(
> > > 
> > > I managed to reproduce the issue. The problem is a race in libxl.
> > > 
> > > tools/libxc/xc_dom_arm.c:alloc_magic_pages is called first, setting
> > > dom->vuart_gfn.  Then, libxl__build_hvm should be setting
> > > state->vuart_gfn to dom->vuart_gfn (like libxl__build_pv does) but it
> > > doesn't.
> > 
> > Thank you for the patch.
> > I confirmed that sbsa-uart driver on U-Boot now works.
> 
> Excellent!
> 
> 
> > === after "xl console -t vuart" ===
> > U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> > 
> > Xen virtual CPU
> > Model: XENVM-4.15
> > DRAM:  128 MiB
> > 
> > In:    sbsa-pl011
> > Out:   sbsa-pl011
> > Err:   sbsa-pl011
> > xenguest# dm tree
> >  Class     Index  Probed  Driver                Name
> > -----------------------------------------------------------
> >  root          0  [ + ]   root_driver           root_driver
> >  firmware      0  [   ]   psci                  |-- psci
> >  serial        0  [ + ]   serial_pl01x          |-- sbsa-pl011
> >  pvblock       0  [   ]   pvblock               `-- pvblock
> > ===
> > 
> > If possible, I hope that "xl create -c" command would accept "-t vuart"
> > option (or it should automatically selects uart type from the config).
> 
> I think a patch to add the "-t" option to "xl create" would be
> acceptable, right Anthony?
> 
> 
> > > 
> > > ---
> > > 
> > > libxl: set vuart_gfn in libxl__build_hvm
> > > 
> > > Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> > > Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> > > dom->vuart_gfn.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > 
> > > diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> > > index f8661e90d4..36fe8915e7 100644
> > > --- a/tools/libxl/libxl_dom.c
> > > +++ b/tools/libxl/libxl_dom.c
> > > @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
> > >          LOG(ERROR, "hvm build set params failed");
> > >          goto out;
> > >      }
> > > +    state->vuart_gfn = dom->vuart_gfn;
> > >  
> > >      rc = hvm_build_set_xs_values(gc, domid, dom, info);
> > >      if (rc != 0) {
> > 
--8323329-2125818377-1604430226=:5812--

