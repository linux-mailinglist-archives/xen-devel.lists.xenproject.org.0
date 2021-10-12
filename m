Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3293429B0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 03:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206655.362271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma6ec-00019I-R3; Tue, 12 Oct 2021 01:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206655.362271; Tue, 12 Oct 2021 01:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma6ec-00016j-Mp; Tue, 12 Oct 2021 01:32:30 +0000
Received: by outflank-mailman (input) for mailman id 206655;
 Tue, 12 Oct 2021 01:32:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma6eb-00016d-Jy
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 01:32:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35f6a6c3-e69a-440b-b45b-93814a0dc727;
 Tue, 12 Oct 2021 01:32:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0CF560462;
 Tue, 12 Oct 2021 01:32:27 +0000 (UTC)
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
X-Inumbo-ID: 35f6a6c3-e69a-440b-b45b-93814a0dc727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634002348;
	bh=ItEsptxYgixycqcUTZ8q5oqj49kgLf4k43K0tTpOQbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HpSm7Nuia6pH6CTgVbIFQV7CIrAd9ZnScMR5y9uLduAtQ9YqtF+n4HW11yT2F8E4g
	 RcOEu9GkIMy1Tt6f6/r1etHffWhyeO0kQvqEXNwl534KIUbwUAqUCRaaRDlTMoyTqG
	 Ie8hcpHorO5zcYzg/0dm7ExrGIr47Q4R/K446OmrJ3749r0ta1pK/AXCTiHedj4h+n
	 jjhQy+ioPoKvFYckiJPE9bfpZrAbsSaTKaLkZPTg/NFdikQJvS2IXbJnqvhSQJJn1B
	 jakhCppQaniY40gHi4DM4OAWLQ2VrZV2XGFtDB8nxlOxwYsQ3V0Zw49aY9gp3e93/k
	 WGq1RKGEkLQig==
Date: Mon, 11 Oct 2021 18:32:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
In-Reply-To: <YWRoMtLTd4G55koT@perard>
Message-ID: <alpine.DEB.2.21.2110111329520.25528@sstabellini-ThinkPad-T480s>
References: <20211008055535.337436-1-andr2000@gmail.com> <20211008055535.337436-8-andr2000@gmail.com> <YWRoMtLTd4G55koT@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Anthony PERARD wrote:
> On Fri, Oct 08, 2021 at 08:55:32AM +0300, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > Arm's PCI passthrough implementation doesn't support legacy interrupts,
> > but MSI/MSI-X. This can be the case for other platforms too.
> > For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> > it to the CFLAGS and compile the relevant code in the toolstack only if
> > applicable.
> 
> I don't think that's true anymore since v2 ;-). The compiler may
> choose to avoid compiling code that wouldn't be executed, but I think
> that would just be optimisation.
> 
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> > Tested-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> > diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> > index 7d8c51d49242..bd3f6be2a183 100644
> > --- a/tools/libs/light/Makefile
> > +++ b/tools/libs/light/Makefile
> > @@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> >  	-Wno-declaration-after-statement -Wformat-nonliteral
> >  CFLAGS += -I.
> >  
> > +ifeq ($(CONFIG_X86),y)
> > +CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> > +endif
> > +
> 
> Could you write this instead:
>   CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> 
> In any case,
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks Anthony! I made this change on commit and committed both this
patch and the previous one.

