Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A022558737
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355116.582583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RUC-0002Ty-Ff; Thu, 23 Jun 2022 18:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355116.582583; Thu, 23 Jun 2022 18:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RUC-0002SB-Cj; Thu, 23 Jun 2022 18:23:24 +0000
Received: by outflank-mailman (input) for mailman id 355116;
 Thu, 23 Jun 2022 18:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLWc=W6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4RUB-0002S5-Le
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:23:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9879eb-f321-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 20:23:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA77961FE2;
 Thu, 23 Jun 2022 18:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693DEC341C4;
 Thu, 23 Jun 2022 18:23:17 +0000 (UTC)
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
X-Inumbo-ID: 8e9879eb-f321-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656008598;
	bh=MqsWdnARlOOVZyzfD2d21CRHrVDPsGOz4Y94XZGbPGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EWV2O7MqdT4KjzCJtNncdX9IeLJr0S4i4i2VzxHs3fKAx/nd7JetgNt20Boae/KSM
	 uyI844C9XyUexgG6ZMB86nCnMIJjewsJIXxrprXLqOS7yb9Ti/9QmQQ6yOLpOixTUS
	 hEUnhzwnGrbO0ThWTjzIG7FuS0BRUtgywEy/eUkNh3GLPokUEczt29U/RiLDPCJdJg
	 2HZztXowRHO9qX5JaWyH/jcf6qXftfzJCEfYTvmZekUhZs1Qg15Iup+u31AVVzMNqW
	 BuU3+ui4IwpeZh0oK6ixb8oUrwc6O2RYPj6rSeGGxNgmapywtFpH1d5zeJxrai5dKR
	 g1MikmGUyboUA==
Date: Thu, 23 Jun 2022 11:23:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
In-Reply-To: <3e86d233-7c9a-cd80-a744-c4bdd42ac85c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206231117460.2410338@ubuntu-linux-20-04-desktop>
References: <20220620070245.77979-1-michal.orzel@arm.com> <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com> <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com> <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com> <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com> <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com> <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com> <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop> <8610703e-fd15-bba1-3bb1-cfe038f9b11c@bugseng.com>
 <3e86d233-7c9a-cd80-a744-c4bdd42ac85c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jun 2022, Jan Beulich wrote:
> On 23.06.2022 09:37, Roberto Bagnara wrote:
> > Rule 8.1 only applies to C90 code, as all the violating instances are
> > syntax errors in C99 and later versions of the language.  So,
> > the following line does not contain a violation of Rule 8.1:
> > 
> >      unsigned x;
> > 
> > It does contain a violation of Directive 4.6, though, whose correct
> > handling depends on the intention (uint32_t, uin64_t, size_t, ...).

Hi Roberto,

Thank you very much for the quick reply and very clear answer!


> Interesting - this goes straight against a rule we have set in
> ./CODING_STYLE. I'm also puzzled by you including size_t in your list
> of examples, when the spec doesn't. The sole "goal" of the directive
> (which is advisory only anyway) is to be able to determine allocation
> size. size_t size, however, varies as much as short, int, long, etc
> do.

I wouldn't worry about Directive 4.6 for now. We'll talk about it when
we get to it. (Also we already require uint32_t, uint64_t, etc. in all
external interfaces and ABIs which I think is what Dir 4.6 cares about
the most.)

For this series, I suggest to keep the patches because "unsigned int" is
better than "unsigned" from a style perspective, but we need to rephrase
the commit messages because we cannot claim they are fixing Rule 8.1.
Also, thank Jan for spotting the misunderstanding!

