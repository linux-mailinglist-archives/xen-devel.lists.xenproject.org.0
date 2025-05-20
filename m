Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCBABE750
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 00:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991212.1375098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVbj-0004qI-2f; Tue, 20 May 2025 22:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991212.1375098; Tue, 20 May 2025 22:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVbi-0004nD-VV; Tue, 20 May 2025 22:38:46 +0000
Received: by outflank-mailman (input) for mailman id 991212;
 Tue, 20 May 2025 22:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQuu=YE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHVbf-0004n7-Io
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 22:38:44 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d76d4fa-35cb-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 00:38:41 +0200 (CEST)
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
X-Inumbo-ID: 2d76d4fa-35cb-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3kmeimwcg5anvaqtqopafa2g7m.protonmail; t=1747780719; x=1748039919;
	bh=GU7U0HUUmE7hVz7GtWdDUkNOfae/4u4CfAELipLpg6g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BrWI86SSdC8RToSSBbzD6TYfQIsptKaCWjHF90UErC4DPH0oz4ydzshAMt2ZOktkZ
	 k82Rfjowmjnv4IZ2Q9p3//veRaQLzuEDnXH159J92UFJHvz4jtM16vDJ+CrCSeXjPT
	 tDkKGYU0Km/JSvgjzIIS5/rFnDn0TFYZdV6M+bjl0rGqx8h65WhDoX1ntOUDbRQ6E1
	 a8KMIx52WHgd2gaMUhdgCXw/xD3TiS1rSwew+dqrZeKX53ehtQ8tQIIRGhWO0IPOWE
	 /SfdbM4hOQ9vbGExonFbq6NR/4wpkz+FxA8biMsh6A8xY6t+RPgTKV3xD/QDRf/EY9
	 aREEdzdgwDFbA==
Date: Tue, 20 May 2025 22:38:33 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aC0EYzZgzCfOovVL@kraken>
In-Reply-To: <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com>
References: <20250516022855.1146121-1-dmukhin@ford.com> <20250516022855.1146121-3-dmukhin@ford.com> <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a0d1c2ca659a8b1d3d2a721ea0cb77cbfee0524e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 05:24:33PM +0200, Jan Beulich wrote:
> On 16.05.2025 04:29, dmkhn@proton.me wrote:
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -494,6 +494,12 @@ struct arch_domain
> >                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |     =
  \
> >                                   X86_EMU_VPCI)
> >
> > +/* User-selectable features. */
> > +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
> > +
> > +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
> > +                                                 X86_EMU_OPTIONAL))
>=20
> That is, VPCI is neither baseline nor optional. Certainly at least strang=
e.

IMO, X86_EMU_OPTIONAL should include both VPCI and PIRQ.

But that will be a behavior change: AFAIU, VPCI is injected implicitly for =
dom0
case only, "default" xl toolstack currently excludes VPCI for HVM domains.

Do I understand it correctly that "BASELINE" in the symbol name is a concer=
n?

>=20
> Jan


