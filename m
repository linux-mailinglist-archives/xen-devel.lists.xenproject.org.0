Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F47CEB70
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 00:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618808.962943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtFGn-0000uR-IT; Wed, 18 Oct 2023 22:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618808.962943; Wed, 18 Oct 2023 22:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtFGn-0000qf-Fb; Wed, 18 Oct 2023 22:44:05 +0000
Received: by outflank-mailman (input) for mailman id 618808;
 Wed, 18 Oct 2023 22:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtFGl-0000qZ-Pr
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 22:44:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45060df-6e07-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 00:44:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9A7ECE2778;
 Wed, 18 Oct 2023 22:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B08AC433C7;
 Wed, 18 Oct 2023 22:43:56 +0000 (UTC)
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
X-Inumbo-ID: d45060df-6e07-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697669038;
	bh=KayYFwKPPJ5HPpCVo0vvslTSG6LhpnMJzpxpk/H3wWw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gD9Zd5QmKPzumoe+RZ5dyO17rdliZLr5SjuOUZ8MXP669+pO8kkDWuSRQ37Ei6TVc
	 osOiQiXQUSS8l+7cilwaaCPZeM8amsaoBTJcQXZHacuajKusvEmd0dVLifS90XY6q7
	 KyjkAWWNAX9haDgerRIBmu5V0fsIjLNVqOsBH1eRRijjiB5NBzqp6FcErM4mfKBe+8
	 ikPRnW4SDS5havkFb9JQv6tX+XSWPFX3DBxPbjrDZWDXAxg5RO9OoiTzbqKPPes+Ti
	 b0oO6UupvEYB5SyUlSWgxJGhP+d4g3cJ01UjKD1iGAH22o/BN1H9ppmfpU6dpw8tLX
	 kFTdUWVwfvzsQ==
Date: Wed, 18 Oct 2023 15:43:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com> <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Jan Beulich wrote:
> On 03.10.2023 17:24, Federico Serafini wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
> >   * a problem.
> >   */
> >  void init_or_livepatch modify_xen_mappings_lite(
> > -    unsigned long s, unsigned long e, unsigned int _nf)
> > +    unsigned long s, unsigned long e, unsigned int nf)
> >  {
> > -    unsigned long v = s, fm, nf;
> > +    unsigned long v = s, fm, flags;
> 
> While it looks correct, I consider this an unacceptably dangerous
> change: What if by the time this is to be committed some new use of
> the local "nf" appears, without resulting in fuzz while applying the
> patch? Imo this needs doing in two steps: First nf -> flags, then
> _nf -> nf.

Wouldn't it be sufficient for the committer to pay special attention
when committing this patch? We are in code freeze anyway, the rate of
changes affecting staging is low.

