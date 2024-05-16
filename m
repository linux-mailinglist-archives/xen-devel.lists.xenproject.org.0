Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2D8C7F05
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 01:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723694.1128724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kjS-0003do-8n; Thu, 16 May 2024 23:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723694.1128724; Thu, 16 May 2024 23:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kjS-0003cG-5L; Thu, 16 May 2024 23:41:54 +0000
Received: by outflank-mailman (input) for mailman id 723694;
 Thu, 16 May 2024 23:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7kjQ-0003c8-Ni
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 23:41:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc6cee5-13dd-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 01:41:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9DFA0CE198B;
 Thu, 16 May 2024 23:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5661C2BD11;
 Thu, 16 May 2024 23:41:42 +0000 (UTC)
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
X-Inumbo-ID: dbc6cee5-13dd-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715902903;
	bh=s2yTsINqAzvFL10MGMb7Hyz2mo3TKMWfKU796GIYCLo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WwY1johu5/CQkU/uXnib6RCkHPs3XhGStL9CV9iyYtVCYkQ38PNgjEGH+wSvkXdqL
	 9SvVzKoOzBa3CkhWQfu+liRGLDTo5wfj0KRIo2XVg5vXRwVYfsSLHJlIDSolOD2Y3o
	 Gnk3EMhsEiUQLTL7Acw24BQs/Mv6ueUft8boxJ3BJ+MBsBIAQMeLzIy9sxoSxoeoYG
	 XWtztxL+0pbHcBcVXNWhDkhy4xL1rIW4n+3eDg8xCiZfIBgvPnyDGtkFeHehy+y78q
	 gcweMsnF5gDg1O2t+I1xTUxyeuvOMfnLHF2qN5oWpvRyAzxZJqlFbvtXQHh/pscwwy
	 6BC725GdXeg2Q==
Date: Thu, 16 May 2024 16:41:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with
 cpu_has_vmx
In-Reply-To: <3104deae-0d27-438e-83ea-035a7786fd4a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405161640350.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com> <alpine.DEB.2.22.394.2405151751530.2544314@ubuntu-linux-20-04-desktop>
 <3104deae-0d27-438e-83ea-035a7786fd4a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 May 2024, Jan Beulich wrote:
> On 16.05.2024 02:54, Stefano Stabellini wrote:
> > On Wed, 15 May 2024, Sergiy Kibrik wrote:
> >> VMX posted interrupts support can now be excluded from x86 build along with
> >> VMX code itself, but still we may want to keep the possibility to use
> >> VT-d IOMMU driver in non-HVM setups.
> >> So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a case.
> >>
> >> No functional change intended here.
> >>
> >> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > 
> > I know that Andrew was keep on having a separate Kconfig option for
> > VT-D, separate from VMX. But still, couldn't we make the VT-D Kconfig
> > option depending on CONFIG_VMX?
> > 
> > To me, VT-D should require VMX, without VMX it should not be possible to
> > enable VT-D.
> > 
> > This comment goes in the same direction of my previous comment regarding
> > the vpmu: we are trying to make things more configurable and flexible
> > and that's good, but we don't necessary need to make all possible
> > combination work. VT-D without VMX is another one of those combination
> > that I would only enable after a customer asks.
> 
> Well. Imo again the configuration should be permitted.

FYI Andrew said the same thing as you on Matrix, so I withdraw my
suggestion.

