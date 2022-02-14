Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC84B5D69
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 23:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272645.467548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJjTI-0007ar-AG; Mon, 14 Feb 2022 22:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272645.467548; Mon, 14 Feb 2022 22:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJjTI-0007Z4-6g; Mon, 14 Feb 2022 22:05:24 +0000
Received: by outflank-mailman (input) for mailman id 272645;
 Mon, 14 Feb 2022 22:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHWl=S5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nJjTG-0007Yy-RE
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 22:05:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33989a61-8de2-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 23:05:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D759B81670;
 Mon, 14 Feb 2022 22:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB89C340E9;
 Mon, 14 Feb 2022 22:05:18 +0000 (UTC)
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
X-Inumbo-ID: 33989a61-8de2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644876318;
	bh=GyWt1ZhBon7J6cCAQ3nuHkfRgzKuUIr3j+ONXYhCWb0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HUCp3jYZrhBTw7x7O3P4JAR9HTomIx3dVpyTtzVC8rin+wMGf5cHZc4vUtYXLbzSH
	 Zy6srR1WjeU5Ure9H6CNKZB+Bu5iYpOL96hziuErDWRAipm5kIFivAbf2d1mOeEMcG
	 hK1DQKcK1Fj1UcK+kRpHQ4dNE9jrvn5LTU50Vc5dpifXOwNVBd3T71Ept2W8kuZWZz
	 vAIxvoMzq0y482UObnt5ZWRIMn6NqnwNCr5s5wWKpsab+7fA+GxwDRKxNHpf+Z9z/5
	 RTT9p2NResGSJqlKEfgsqxV4bn5pg/sAzdCbkLdxRPdnaAD4pe6PyYPTxh7iraXvrU
	 OOTeAAa0teGyg==
Date: Mon, 14 Feb 2022 14:05:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220214115127.GA3637134@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2202141355150.4183037@ubuntu-linux-20-04-desktop>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com> <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com> <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com> <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com> <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org> <20220214111300.GA3615313@EPUAKYIW015D> <E78206B4-3793-498E-A580-F0561DF6D4AC@arm.com> <20220214115127.GA3637134@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Feb 2022, Oleksii Moisieiev wrote:
> Hi Bertrand,
> 
> On Mon, Feb 14, 2022 at 11:27:21AM +0000, Bertrand Marquis wrote:
> > Hi Oleksii,
> > 
> > > On 14 Feb 2022, at 11:13, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com> wrote:
> > > 
> > > Hi Julien,
> > > 
> > > On Sat, Feb 12, 2022 at 12:43:56PM +0000, Julien Grall wrote:
> > >> Hi,
> > >> 
> > >> On 11/02/2022 11:18, Bertrand Marquis wrote:
> > >>> Do you plan to add support for other boards ?
> > >>> 
> > >>> Did you discuss more in general with the linux kernel guys to see if this
> > >>> approach was agreed and will be adopted by other manufacturers ?
> > >>> 
> > >>> All in all I think this is a good idea but I fear that all this will actually only
> > >>> be used by one board or one manufacturer and other might use a different
> > >>> strategy, I would like to unrisk this before merging this in Xen.
> > >> 
> > >> In the past we merged code that would only benefits one vendor (i.e. EEMI).
> > >> That said, this was a vendor specific protocol. I believe the situation is
> > >> different here because the spec is meant to be generic.
> > >> 
> > >>> @julien and Stefano: what is your view here ?
> > >> 
> > >> I share the same concerns as you. I think we need to make sure all the
> > >> pieces we rely on (e.g. firmware, DT bindings) have been agreed before we
> > >> can merge such code in Xen.
> > >> 
> > >> The first step is to have all the pieces available in public so they can be
> > >> reviewed and tested together.
> > >>
> > >> Oleksii, on a separate e-mail, you said you made change for ATF. How much of
> > >> those changes was related to support for Xen? If they are some, then I think
> > >> they should be upstreamed first.
> > >> 
> > > 
> > > Let me share changes, that were done to AT-F and Linux kernel
> > > device-tree in terms of the SCMI mediator POC.
> > > Changes to the Linux kernel:
> > > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/arm-trusted-firmware/pull/4__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyWycHX0YARezTnc7aYHpGRJ8tSxHqIC0fTMUUSV$ [github[.]com]
> > > Based on renesas-rcar linux-bsp, branch v5.10/rcar-5.0.0.rc5
> > > 
> > > Changes to AT-F:
> > > https://urldefense.com/v3/__https://github.com/oleksiimoisieiev/linux-bsp/pull/3__;!!GF_29dbcQIUBPA!je9Cu0n0498Yn76OLWjxxVaB7jWJtyWycHX0YARezTnc7aYHpGRJ8tSxHqIC0eDKS3ge$ [github[.]com]
> > > Based on renesas-rcar/arm-trusted-firmware branch rcar_gen3_v2.5.
> > 
> > You inverted the links but thanks this is really useful.
> > 
> 
> That's strange. Links looks good from xen.markmail.org interface.
> 
> > Did you push the ATF changes to mainstream ATF or discuss those with
> > the maintainers ?
> 
> No. We did changes in ATF as a proof of concept.
> 
> > 
> > The strategy overall is nice but we need to make sure this is accepted and
> >  merged by all parties (ATF and Linux) to make sure the support for this will
> > not only be available in Xen and for one board.

+1


> I've prepared patch to Linux kernel, which is introducing scmi_devid
> binding, needed to set device permissions via SCMI. I've contacted
> Sudeep Holla <sudeep.holla@arm.com>, who is the maintainer of the SCMI protocol
> drivers. Waiting for the response.
> 
> Changes to ATF are not Xen specific and were done in terms of POC. We do
> not have plans to upstream those changes right now.

If this work relies on a new interface in ATF, and the interface is not
vendor-specific, then at least the interface (if not the code) should be
reviewed and accepted by ATF.

Otherwise we risk ending up with an upstream SCMI implementation in Xen
that cannot be used anywhere, except the PoC. To make things worse, this
could happen:

- we upstream the SCMI mediator to Xen
- we upstream any required changes to Linux
- ATF rejects the SCMI-related interface changes
- ATF comes up with a difference interface

At this point we would have to deprecate the implementation in Xen. It
might also be difficult to do so due to versioning issues. We would
need to be able to detect which version of ATF we are running on, to
distinguish the ATF PoC version that works with the old interface from
the new ATF version that supports a different interface.

To avoid this kind of issues we typically expect that all relevant
communities agree on the public interfaces before upstreaming the code.

