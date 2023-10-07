Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839F7BC351
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 02:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613878.954721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovGf-000816-W5; Sat, 07 Oct 2023 00:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613878.954721; Sat, 07 Oct 2023 00:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovGf-0007zE-T5; Sat, 07 Oct 2023 00:34:05 +0000
Received: by outflank-mailman (input) for mailman id 613878;
 Sat, 07 Oct 2023 00:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qovGe-0007z8-9z
 for xen-devel@lists.xenproject.org; Sat, 07 Oct 2023 00:34:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3702f99d-64a9-11ee-98d3-6d05b1d4d9a1;
 Sat, 07 Oct 2023 02:34:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 82AD9B82AE9;
 Sat,  7 Oct 2023 00:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D61C433C7;
 Sat,  7 Oct 2023 00:33:59 +0000 (UTC)
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
X-Inumbo-ID: 3702f99d-64a9-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696638841;
	bh=iOu2P33iWZBrA99bkQvEGJANMGZ9a1TdEVWLZysdn/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fD1EkUDiz3VgKlXD2+2Tb7RZG43Tq3AkAXE+cC5zx6Evexa1FnSgrMwzI+Yz6FhHS
	 pL24wW/s+2+YFUq+PcASLfGG0XTF5jTJXLtGIP990O3LqryVdoPV9sm+ZxetUqL5VQ
	 L44MZQE7pzNenhsj4CvYhfmcQEH06sxjx4E3HjidRQwWt1hqVL+4JscUc8vDIHzfem
	 jV+WG0Lf1Z6X5LDOcw2i2mC6L7S3D2e8QsgVyoG7iwQdRBaUeIpxwRYCdYDu/DXlzd
	 CJ3j7SCsZMHM7y4kvQYXvXh3iTI+ZF7Y7Tik0UcgdAuETQoPLWJXSki1CuKieFaav0
	 nukOWRXFXhCxw==
Date: Fri, 6 Oct 2023 17:33:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/2] xen: introduce a deviation for Rule
 11.9
In-Reply-To: <c97bd628-1be1-46bf-a506-6ffb90cf801e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310061730460.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com> <98bc1d90b93856ed7516a19114facf6528120248.1696494834.git.nicola.vetrini@bugseng.com> <605f8045-754d-4d3c-b1b3-3bb34112bfc8@xen.org> <2aafb9710b4754e8d57acc1f769693b4@bugseng.com>
 <c97bd628-1be1-46bf-a506-6ffb90cf801e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Julien Grall wrote:
> On 06/10/2023 10:58, Nicola Vetrini wrote:
> > On 06/10/2023 11:27, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 05/10/2023 09:45, Nicola Vetrini wrote:
> > > > The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> > > > compile-time check to detect non-scalar types; its usage for this
> > > > purpose is documented in rules.rst as an exception.
> > > Documenting ACCESS_ONCE() in rules.rst seems a bit odd. I am guessing
> > > that other analysis tool may point out the same error and therefore it
> > > would seem more appropriate to use a deviation.
> > > 
> > > This would also avoid having a specific rule in the Eclair
> > > configuration for __ACCESS_ONCE().
> > > 
> > 
> > I figured a single accepted use would benefit from an explicit exclusion.
> > I can rework it to use an in-code comment to deviate, in whatever form that
> > comment may be
> > (still with some bits of ECLAIR-specific configuration anyway, as discussed
> > for R2.1).
> 
> I think it would be preferrable to have a deviation in the code. This would be
> helpful for other analysis tools.

Yes exactly, see my reply:
https://marc.info/?l=xen-devel&m=169663696228889

I know I acked the patch but I agree with Julien. A deviation as an
in-code comment (SAF-x-safe) is always the best option. If that doesn't
work, we cannot keep adding stuff in the notes section of rules.rst. It
doesn't scale. We should create a new document, like deviations.rst, or
add a new section at the bottom of documenting-violations.rst or
possibly safe.json.

