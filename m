Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C245F47DDAF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 03:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250929.432176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Dla-0003za-1Z; Thu, 23 Dec 2021 02:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250929.432176; Thu, 23 Dec 2021 02:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0DlZ-0003x8-UQ; Thu, 23 Dec 2021 02:23:37 +0000
Received: by outflank-mailman (input) for mailman id 250929;
 Thu, 23 Dec 2021 02:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yk4J=RI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0DlY-0003Ju-BP
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 02:23:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54c3aab4-6397-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 03:23:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 293B5B81F48;
 Thu, 23 Dec 2021 02:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87CAC36AE8;
 Thu, 23 Dec 2021 02:23:33 +0000 (UTC)
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
X-Inumbo-ID: 54c3aab4-6397-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640226214;
	bh=33rgWlcYdNSQjeG2Heew0TNj0Tq69gnqNHVs9FbW+fY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZJitwKg7MkixQi/2E9J6CalneQxMDZ+2P6c7NGJICoFi2ovqEHLVXfSjOixGYy405
	 J8D9I0I8feTutSU01mSrMNFadeeUR+bTD+8GfMMxrqFvHsoJ4EqbFygP+yJEwMTjO2
	 TMJ78WrLOO3BbOUdbxpkUgO/IbMCNqm3TU4BEakaf5HrdU3K+J1jHcd9HA7D0bidhn
	 MOd11nDZV0gDNxKPO0IpRfpymyJsyzLBvv2BtBOendy1tGW/pegzHIFuHAtTIQSBRG
	 cJOMv5UoJNtH+cSgtWd7buwoKYVDLq/Bsm5rUmO6o0YdhE5KLr4BGjzBu3RlR0Sd9B
	 9ygqT/ch8dL3g==
Date: Wed, 22 Dec 2021 18:23:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
In-Reply-To: <20211222102417.GA2882292@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2112221633000.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2112201653500.2060010@ubuntu-linux-20-04-desktop>
 <20211222102417.GA2882292@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
> On Mon, Dec 20, 2021 at 04:54:25PM -0800, Stefano Stabellini wrote:
> > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > This enumeration sets SCI type for the domain. Currently there is
> > > two possible options: either 'none' or 'scmi_smc'.
> > > 
> > > 'none' is the default value and it disables SCI support at all.
> > > 
> > > 'scmi_smc' enables access to the Firmware from the domains using SCMI
> > > protocol and SMC as transport.
> > > 
> > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > ---
> > >  docs/man/xl.cfg.5.pod.in         | 22 ++++++++++++++++++++++
> > >  tools/include/libxl.h            |  5 +++++
> > >  tools/libs/light/libxl_types.idl |  6 ++++++
> > >  tools/xl/xl_parse.c              |  9 +++++++++
> > >  4 files changed, 42 insertions(+)
> > > 
> > > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > > index b98d161398..92d0593875 100644
> > > --- a/docs/man/xl.cfg.5.pod.in
> > > +++ b/docs/man/xl.cfg.5.pod.in
> > > @@ -1614,6 +1614,28 @@ This feature is a B<technology preview>.
> > >  
> > >  =back
> > >  
> > > +=item B<sci="STRING">
> > > +
> > > +B<Arm only> Set SCI type for the guest. SCI is System Control Protocol -
> > > +allows domain to manage various functions that are provided by HW platform.
> > > +
> > > +=over 4
> > > +
> > > +=item B<none>
> > > +
> > > +Don't allow guest to use SCI if present on the platform. This is the default
> > > +value.
> > > +
> > > +=item B<scmi_smc>
> > > +
> > > +Enables SCMI-SMC support for the guest. SCMI is System Control Management
> > > +Inferface - allows domain to manage various functions that are provided by HW
> > > +platform, such as clocks, resets and power-domains. Xen will mediate access to
> > > +clocks, power-domains and resets between Domains and ATF. Disabled by default.
> > > +SMC is used as transport.
> > 
> > Would it make sense to actually enable SCMI-SMC support for the guest by
> > default if the guest has any devices directly assigned?
> 
> Hi Stefano,
> 
> Previously we discussed with Oleksandr about introducing new dom.cfg
> parameter, such as scidev[] lists all sci related nodes, which will help to
> avoid extra domctl calls.

The concerning part is (too much) information the user needs to provide
in device tree or dom.cfg. We can be flexible with the number of extra
domctl calls, but of course it would be good to avoid them too.


> But there is still a question how mediator types should be set for
> different domains? I know currently system supports only one mediator
> type, but different implementation should be also possible.

I think it is fine to have an option sci="scmi_smc" in dom.cfg, that is
not a problem. The issue is a detailed list of SCMI IDs or a second list
of device tree paths, because those are far harder to write correctly.


> For example, if we have to start dom0 and domd using scmi_mailbox
> mediator and domU using scmi_smc, because our system supports only 2
> mailboxes.

Yeah that's fine, it could be done with the sci option you are
suggesting.

