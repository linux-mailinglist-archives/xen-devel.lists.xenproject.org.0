Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C1547009
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 01:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346828.572763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzoAR-00026s-3y; Fri, 10 Jun 2022 23:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346828.572763; Fri, 10 Jun 2022 23:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzoAR-00024H-1B; Fri, 10 Jun 2022 23:35:51 +0000
Received: by outflank-mailman (input) for mailman id 346828;
 Fri, 10 Jun 2022 23:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzoAQ-00024B-3z
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 23:35:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e3920e6-e916-11ec-bd2c-47488cf2e6aa;
 Sat, 11 Jun 2022 01:35:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FD86B837EF;
 Fri, 10 Jun 2022 23:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F63BC36B0C;
 Fri, 10 Jun 2022 23:35:45 +0000 (UTC)
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
X-Inumbo-ID: 0e3920e6-e916-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654904145;
	bh=BuqirxjS9JtGtMwszroJhztNGlaevYs4Gdo6iCFAnZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E99QUel3G9pDHo9Q8vDeRwaVja1I5FRHOpS/4YJnsprWcSbnWAbuGVw/DW+L8rzxA
	 dQC9sakJ7gxxFecoQG1aqgvHwKynaL0V5TSUIuu6JpCmY5Qi+Ll6qzkwsypvBBB1x0
	 F6DfpUy1EkIvfi0oDFRJEUIGsC0+2OtGiZTE3UZ3EPbV1yR4CF9oi3mOLhC6k1vWCl
	 0Id6GkNxxRSEmVyx5CTHmm+T6yXhzsFXwVn4YHCtLJ8OHvt0jFYS40iNEVqWUaXniM
	 lg/9qRLFSkUIuVSpkMfL5ln/k4TFCi2OuNmpGwCJ17PjC1y6ddyaZWxwbRskWrPque
	 N41EbPT5oxGzg==
Date: Fri, 10 Jun 2022 16:35:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, Michal Orzel <michal.orzel@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct
 tm members
In-Reply-To: <295e9c7e-e0de-bbd3-eec4-0864cb2ef086@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206101630520.756493@ubuntu-linux-20-04-desktop>
References: <20220610083358.101412-1-michal.orzel@arm.com> <20220610083358.101412-4-michal.orzel@arm.com> <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com> <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com> <295e9c7e-e0de-bbd3-eec4-0864cb2ef086@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jun 2022, Jan Beulich wrote:
> On 10.06.2022 11:51, Juergen Gross wrote:
> > On 10.06.22 11:44, Jan Beulich wrote:
> >> On 10.06.2022 10:33, Michal Orzel wrote:
> >>> All the members of struct tm are defined as integers but the format tags
> >>> used in console driver for snprintf wrongly expect unsigned values. Fix
> >>> the tags to expect integers.
> >>
> >> Perhaps do things the other way around - convert field types to unsigned
> >> unless negative values can be stored there? This would match our general
> >> aim of using unsigned types when only non-negative values can be held in
> >> variables / parameters / fields.
> > 
> > Don't you think keeping struct tm in sync with the Posix definition should
> > be preferred here?
> 
> Not necessarily, no. It's not just POSIX which has a (imo bad) habit of
> using plain "int" even for values which can never go negative.

I committed the other two patches in the series because already acked
and straightforward.

In this case, I think the straightforward/mechanical fix is the one
Michal suggested in this patch: fixing %u to be %d. We could of course
consider changing the definition of tm, and there are valid reasons to
do that as Jan pointed out, but I think this patch is valid as-in
anyway.

So I am happy to give my reviewed-by for this version of the patch, and
we can still consider changing tm to use unsigned if someone feels like
proposing a patch for that.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Cheers,

Stefano

