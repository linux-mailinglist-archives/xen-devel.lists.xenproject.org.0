Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4367EA755
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 01:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632088.986065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h5i-0002E1-Kf; Tue, 14 Nov 2023 00:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632088.986065; Tue, 14 Nov 2023 00:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2h5i-0002BW-Ga; Tue, 14 Nov 2023 00:15:42 +0000
Received: by outflank-mailman (input) for mailman id 632088;
 Tue, 14 Nov 2023 00:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2h5h-0002BO-66
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 00:15:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1552495-8282-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 01:15:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9DAF3B80EA4;
 Tue, 14 Nov 2023 00:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC926C433C8;
 Tue, 14 Nov 2023 00:15:37 +0000 (UTC)
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
X-Inumbo-ID: f1552495-8282-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699920938;
	bh=XXwebpHoGLgqzzoCPYcjVgyxmcReSMn84/NnF5OhPLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iytKT/VJDciYjo5TUh2hXP4Ya31qx/18sZlmAfyTHWhwCdffnjAdXvAglebBrVKZi
	 LNmAnAl1KQ1D/G1d7ebGWfpi9y+6OGZR24WSMzyQVmtcnTwhOHgOWWhmcvP9JL76O5
	 0itR9NCoD5IK38lOzAPjVEVr6a+07ymnfd/cLYH4C9fsqAe9Sq20LSY66sWxeMRuAW
	 7xbaUTRIHYy0zLDSCOmLWp7W13nE6IEK0h2FrWfRNWXv7zXNNQ+UKkR+qhxGE1IW4J
	 B3h6hAKjpR+mkEu3VP1PU5EMRiP2GZCTc7jKPgPn+7vSgwpM8H2bYtDsQQxbzKXrce
	 q9z5Hw6/8QZbA==
Date: Mon, 13 Nov 2023 16:15:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
In-Reply-To: <ebb51a9b-2397-4105-ad20-4cede5872f48@perard>
Message-ID: <alpine.DEB.2.22.394.2311131613470.160649@ubuntu-linux-20-04-desktop>
References: <20231109154922.49118-1-anthony.perard@citrix.com> <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com> <ebb51a9b-2397-4105-ad20-4cede5872f48@perard>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Nov 2023, Anthony PERARD wrote:
> On Thu, Nov 09, 2023 at 04:52:36PM +0000, Andrew Cooper wrote:
> > On 09/11/2023 3:49 pm, Anthony PERARD wrote:
> > > Currently, the test rely on QEMU and Xen finishing the boot in under
> > > two seconds. That's both very long and very short. Xen usually managed
> > > to print "All set up" under a second. Unless for some reason we try to
> > > run the test on a machine that's busy doing something else.
> > >
> > > Rework the test to exit as soon as Xen is done.
> > >
> > > There's two `tail -f`, the first one is there simply to monitor test
> > > progress in GitLab console. The second one is used to detect the test
> > > result as soon as QEMU add it to the file. Both `tail` exit as soon as
> > > QEMU exit.
> > >
> > > If QEMU fails at start, and exit early, both `tail` will simply exit,
> > > resulting in a failure.
> > >
> > > If the line we are looking for is never printed, the `timeout` on the
> > > second `tail` will force the test to exit with an error.
> > >
> > > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Looks plausible, but all these qemu-smoke scripts are pretty similar,
> > and copied from one-another.
> > 
> > We should make this change consistently to all testing (there's nothing
> > RISC-V specific about why this test is failing on this runner), and it
> > would be really nice if we could try to make it a bit more common than
> > it currently is.
> 
> Yes, it would be nice if a change to a qemu-smoke script was applied to
> every other one. But making those scripts more generic is a lot more
> works, which would be useful to apply a change once for all.
> 
> The problem I'm trying to resolve only appear with this script, because
> of a timeout been too short, a solution could just be to increase the
> timeout (or not allowing runners to do more than one thing at a time).
> 
> BTW, the last time I've been told to apply a change to other things, I
> never managed to finish it and the change wasn't applied at all (would
> have result in some containers been smaller).
> 
> I guess will see if anyone complain about the test randomly failing. :-)

Hi Anthony, I think it is OK if you only fix this script for now. As
part of the tests we are writing for Xen FuSa we want to improve the
basic gitlab testing infrastructure and make the code common like Andrew
asked (we haven't done it yet but soon). We should get to it in the next
few months.

