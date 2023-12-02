Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789A801A2C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 04:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645919.1008485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GIB-0001l0-MS; Sat, 02 Dec 2023 03:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645919.1008485; Sat, 02 Dec 2023 03:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GIB-0001iT-JF; Sat, 02 Dec 2023 03:03:43 +0000
Received: by outflank-mailman (input) for mailman id 645919;
 Sat, 02 Dec 2023 03:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhqb=HN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9GIA-0001iN-Ax
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 03:03:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 644c3538-90bf-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 04:03:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 73D52B84918;
 Sat,  2 Dec 2023 03:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D002C433C8;
 Sat,  2 Dec 2023 03:03:35 +0000 (UTC)
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
X-Inumbo-ID: 644c3538-90bf-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701486217;
	bh=CsqC6LGUpBbTv5ShXRgk0AVbN2TJ2ScnBCKVebuofMg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cLCJ9TSnm75kpK2qag4N94W29sglI8Q34Rr/57Pdp/tja6vIJIzkZF/GW1XA1KmD7
	 c//VGoLM92tZMbx7EOzQ7ckVLesMnNG9tsbrk/tgb79GxW7JQHhtI9aJDrSv8/uFba
	 I8q9TQBsOJgXpp/sPryXj5mSoDN+CF/2XjKiYj+R6CSI50DrxbuE31DZaKT4J0EUuG
	 nY9oYH78sOhGiZ3WAa15wZpzg8bebVA+Fht0J3uNwvwRtQ8ugrzb9pkzztu/pkCiDO
	 sKoIK/5TaQj+d5Q8om1qDGPEjz/sd1UQKMp9L0AEaI029wtPohWbkymvsWZk7qt0ON
	 e+FFRMJ1UbBCg==
Date: Fri, 1 Dec 2023 19:03:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for
 MISRA C Rule 8.4
In-Reply-To: <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com> <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
 <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Dec 2023, Jan Beulich wrote:
> On 01.12.2023 03:47, Stefano Stabellini wrote:
> > On Wed, 29 Nov 2023, Nicola Vetrini wrote:
> >> No functional change.
> >>
> >> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >> ---
> >> The preferred way to deviate is to use asmlinkage, but this modification is only
> >> the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
> >> As stated in the comment above the textual deviation, first_valid_mfn will
> >> likely then become static and there would be no need for the comment anymore.
> >> This works towards having the analysis for this rule clean (i.e. no violations);
> >> the interest in having a clean rule is that then it could be used to signal
> >> newly introduced violations by making the analysis job fail.
> > 
> > Please add this text as part of the commit message. It can be done on
> > commit.
> 
> I assume you saw my reply on another of the patches in this series as to
> asmlinkage use on variables? IOW I think this paragraph would also need
> adjustment to account for that.

I was going to ask you about that: reading your reply
https://marc.info/?l=xen-devel&m=170142048615336 it is not clear to me
what you are asking or suggesting as next step in regard to asmlinkage
use on variables.

