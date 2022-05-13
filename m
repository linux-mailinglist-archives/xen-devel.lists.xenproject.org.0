Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACD52590B
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 02:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328095.551014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJOc-00065L-A4; Fri, 13 May 2022 00:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328095.551014; Fri, 13 May 2022 00:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npJOc-000634-6k; Fri, 13 May 2022 00:43:06 +0000
Received: by outflank-mailman (input) for mailman id 328095;
 Fri, 13 May 2022 00:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npJOa-00062y-OQ
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 00:43:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59a58aa-d255-11ec-a406-831a346695d4;
 Fri, 13 May 2022 02:43:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7827B82BA8;
 Fri, 13 May 2022 00:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F606C385B8;
 Fri, 13 May 2022 00:43:00 +0000 (UTC)
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
X-Inumbo-ID: a59a58aa-d255-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652402580;
	bh=GftiBl3MxVgceXxWJkt1OZ96GW6H0KC6Xjrc58U0t5w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJ6dtMx+uTKIhg1ihxrOFIu4WJQ9VLhwt9ZKJFvy3U0uVR0EJrMno/FlJz3sUruYf
	 0lNMZCEQbgQOiveV1RFXIXwlDYzfvx+t88mPBK/cuUExyI7heJWes61dDKgsSClzN8
	 vGobvVP19jQr/gkiQ3RElacW0T3n4xcZM8bYaIhdTQOclN6M0k7uduxZhQlHnjow+E
	 EI/67BvDiD8EnwwMGIfgNWAlYC5SAOg/Rdp+0L8PPyqtfmc55FsqiGYZW79TjsTZHa
	 YjUhQQw2Xv71juaGoN8y63C/XdukBL3SF/F7yamOs2LEjpyVCXrQ3CwY4cw2TGbaZX
	 2A1y9FdXNda9w==
Date: Thu, 12 May 2022 17:43:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ECLAIR Xen x86 results and progress
In-Reply-To: <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2205121739510.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop> <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com> <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 May 2022, Stefano Stabellini wrote:
> On Mon, 9 May 2022, Bertrand Marquis wrote:
> > > On 6 May 2022, at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > 
> > > Hi all,
> > > 
> > > Roberto kindly provided the ECLAIR x86 results:
> > > 
> > > https://eclairit.com:8443/job/XEN/Target=X86_64,agent=public/lastSuccessfulBuild/eclair/
> > > 
> > > Click on "See ECLAIR in action", then you can select "Show 100 entries"
> > > and see all the results in one page. As an example MC3R1.R1.3
> > > corresponds to Rule 1.3 in the spreadsheet.
> > > 
> > > 
> > > If you are OK with this, I would like to aim at a follow-up meeting on
> > > Tue May 17 at the same time (8AM California / 4PM UK). If the date/time
> > > doesn't work, I'll run another Doodle poll.
> > 
> > Works for me.
> 
> Actually, to make sure more people are able to attend, I would like to
> suggest May 19 8AM California / 4PM UK / 5PM Europe (which is the same
> slot typically used by the Xen Community Call). Please let me know if
> that works or if it is a problem.

Quick update: we are making excellent progress with the spreadsheet, 4
out of 6 people have already completed scoring the first set of 20
rules.

I'll send a calendar invite for May 19 8AM California as it looks like
we'll be able to make it.

