Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDB89CF3D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 02:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702092.1096890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz8N-0001KF-Bj; Tue, 09 Apr 2024 00:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702092.1096890; Tue, 09 Apr 2024 00:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz8N-0001Ii-7t; Tue, 09 Apr 2024 00:14:43 +0000
Received: by outflank-mailman (input) for mailman id 702092;
 Tue, 09 Apr 2024 00:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rtz8M-0001Ic-Gn
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 00:14:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27da37ff-f606-11ee-914f-f14010f3f246;
 Tue, 09 Apr 2024 02:14:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34D1CCE1B8D;
 Tue,  9 Apr 2024 00:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B151DC433C7;
 Tue,  9 Apr 2024 00:14:35 +0000 (UTC)
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
X-Inumbo-ID: 27da37ff-f606-11ee-914f-f14010f3f246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712621676;
	bh=13zOYFhSAVAslBjxFZD7iRTWIREeQBo1hOI+G75Gsac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DKq03D2QXznahLZrGo+LyjwMHLJrqUqvvzJ3eOkQd0a/NFUcCnBBWvjv/l8xawtUM
	 sG35CP2pDbv8fQRiYQtDYbYg5Sz1wNYyk+5DrEbSiXdPn3jdmjQmPM4RXB6dqSR57H
	 o97MVa+T9rEZ9e+RNMwkRVf+3CGoHEmNayLTvzJ1gHIhoxhb4IAPwTf9rMZ/ocGomQ
	 2Vd6zvmJSMw89WdPq1UO8jcNCR+OAeZbCZNQYSvWAdHkFwIsmR+1ff1bY8K7WBChzr
	 vsb9xsy98wOGlif9t0ryX0qiaAo2fLzNes6IT6KTfHVX/mg0Wh0T0p5Ghcf6KeBQdd
	 65jSOOjV7t0mg==
Date: Mon, 8 Apr 2024 17:14:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/9] x86/irq: tidy switch statement and address
 MISRA violation
In-Reply-To: <dfa9e320-266a-49aa-8d90-5e0c63ab1db6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404081712520.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com> <d1bdd54b6751a047626b0271fff882484f98ea1a.1712305581.git.nicola.vetrini@bugseng.com> <dfa9e320-266a-49aa-8d90-5e0c63ab1db6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Apr 2024, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
> > Remove unneded blank lines between switch clauses.
> 
> NAK for this part again.
> 
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2882,7 +2882,7 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p)
> >  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >                                int type, struct msi_info *msi)
> >  {
> > -    int irq, pirq, ret;
> > +    int irq = -1, pirq, ret;
> >  
> >      ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
> >  
> > @@ -2892,12 +2892,10 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >          if ( !msi->table_base )
> >              msi->entry_nr = 1;
> >          irq = index;
> > -        if ( irq == -1 )
> > -        {
> > +        fallthrough;
> >      case MAP_PIRQ_TYPE_MULTI_MSI:
> > +        if( type == MAP_PIRQ_TYPE_MULTI_MSI || irq == -1 )
> >              irq = create_irq(NUMA_NO_NODE, true);
> 
> It may seem small, but this extra comparison already is duplication I'd rather
> see avoided. At the very least though you want to clarify in the description
> whether the compiler manages to eliminate it again.

It could just be:

    if ( irq == -1 )

because in the MAP_PIRQ_TYPE_MULTI_MSI case we know the irq will be -1.
No duplication needed.

