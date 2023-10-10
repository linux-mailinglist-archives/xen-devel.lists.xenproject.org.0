Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D17C43BD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 00:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615166.956403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqL8h-0001pR-RA; Tue, 10 Oct 2023 22:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615166.956403; Tue, 10 Oct 2023 22:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqL8h-0001nF-Np; Tue, 10 Oct 2023 22:23:43 +0000
Received: by outflank-mailman (input) for mailman id 615166;
 Tue, 10 Oct 2023 22:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qqL8g-0001n9-5X
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 22:23:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a827e2ae-67bb-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 00:23:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CFDACE1E58;
 Tue, 10 Oct 2023 22:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21574C433C7;
 Tue, 10 Oct 2023 22:23:32 +0000 (UTC)
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
X-Inumbo-ID: a827e2ae-67bb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696976613;
	bh=+dX7i/pzKBCNzRfkTTQ5+O9/SrrEZZMaoBuluMgh9GQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hX/D9ErWpR+yVP3hnPvudiyPJdBWaxF9HeeNYOkUeL6O4dnaHP6NhlYz8hoKMmF3o
	 ONoz1tr4mfBWah39JLMBSFkNR9/uce5sN8cgYgkusWnfdWBjI2tSE9gn03G7+eBWVM
	 A1kmUA42JsCwki7OhKo5R8AREX5Pk9+898uEmdRe921+aMU7SGGt4AQZ58ZNyHLNhe
	 4XEkWIGDL/2ygqxNjvx1XWs4KH5O/CNLLb2UUoFdmuR0ZC14nttghJ5oTosO3YZ909
	 dsgp5gk9F4OBF96aLkLsQCFarIjFBjo1EUSm269Bu+MukvzbSsINaDMspz6D10C8pK
	 Md9/OO7X6MmRA==
Date: Tue, 10 Oct 2023 15:23:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, consulting@bugseng.com, 
    roger.pau@citrix.com, dfaggioli@suse.com
Subject: Re: Rule 10.1 violations in perfc_incra and PERFCOUNTER_ARRAY
In-Reply-To: <771624f5199fe76ce266a00d0c649428@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310101515070.3431292@ubuntu-linux-20-04-desktop>
References: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com> <alpine.DEB.2.22.394.2310091838510.3431292@ubuntu-linux-20-04-desktop> <771624f5199fe76ce266a00d0c649428@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Oct 2023, Nicola Vetrini wrote:
> On 10/10/2023 03:56, Stefano Stabellini wrote:
> > On Fri, 6 Oct 2023, Nicola Vetrini wrote:
> > > Given the following macros in <xen/perfc.h> and
> > > 
> > > #define perfc_incra(x,y)                                                \
> > >     ( (y) <= PERFC_LAST_ ## x - PERFC_ ## x ?                           \
> > > 	 ++this_cpu(perfcounters)[PERFC_ ## x + (y)] : 0 )
> > > 
> > > and the following violation
> > > 
> > > xen/arch/arm/traps.c:1407.5-1407.32:
> > >   reference to enum constant `PERFC_hypercalls' has essential type `enum
> > > perfcounter'
> > >   and standard type `int'
> > >  <preprocessed xen/arch/arm/traps.c>:11606.29-11606.44: preprocessed
> > > tokens
> > >  <scratch space>:137.1-137.16: expanded from macro `PERFC_'
> > >  xen/include/xen/perfc.h:69.35-69.45: expanded from macro `perfc_incra'
> > > xen/arch/arm/traps.c:1407.5-1407.32:
> > >   `+' addition operator expects a number or a character
> > >  <preprocessed xen/arch/arm/traps.c>:11606.46: preprocessed tokens
> > >  xen/include/xen/perfc.h:69.47: expanded from macro `perfc_incra'
> > > 
> > > the difference between enumerated values is forbidden by the Rule. In the
> > > coding standard's
> > > interpretation, named enums are unordered list of symbols, which can only
> > > be
> > > compared for
> > > equality.
> > > There are a few possible paths forward:
> > > 
> > > 1. use means different from named enums to generate these constants (such
> > > as
> > > #define-s or
> > >    constants integers);
> > 
> > This is a viable option
> > 
> > 
> > > 2. explicitly deviate subtraction of enums, therefore defining an explicit
> > > ordering on
> > >    enumerated values;
> > 
> > I would prefer to avoid a project-wide deviation, because I think in
> > general it is a good rule to have. If we go with a deviation, I think it
> > would be better to deviate PERFCOUNTER or perfc.h specifically. This is
> > a file that changes very rarely. We could make the case that this is
> > safe with GCC (most probably is) and this case was reviewed carefully
> > and doesn't change often (3 changes in the last 10 yeas).
> > 
> > 
> > > 3. use an unnamed enum, effectively considering the enumerated values as
> > > plain
> > > integers.
> > >    This does not violate the Rule.
> > 
> > What do you mean by unname enum?
> 
> e.g.
> 
> enum {
> #include <xen/perfc_defn.h>
> 	NUM_PERFCOUNTERS
> };
> 
> instead of
> 
> enum perfcounter {
> #include <xen/perfc_defn.h>
> 	NUM_PERFCOUNTERS
> };


I think this should be easy to do in this case. I gave it a quick try
and it seems to still build successfully. It could be the best way
forward for this instance.


However in general I am confused why unnamed enum can do comparisons
between members and named enums cannot. What is the reason? In any case,
I think we should clarify this detail in the notes section of
docs/misra/rules.rst, because I don't think it was clear to anyone that
there is a difference in behavior between named and unnamed enums.

