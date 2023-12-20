Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8E81A6D0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658222.1027320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1FJ-0003ZU-LV; Wed, 20 Dec 2023 18:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658222.1027320; Wed, 20 Dec 2023 18:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1FJ-0003WP-If; Wed, 20 Dec 2023 18:24:41 +0000
Received: by outflank-mailman (input) for mailman id 658222;
 Wed, 20 Dec 2023 18:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rG1FH-0002hx-Ll
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:24:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0821bd09-9f65-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 19:24:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEAAB61727;
 Wed, 20 Dec 2023 18:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0E2C433C8;
 Wed, 20 Dec 2023 18:24:35 +0000 (UTC)
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
X-Inumbo-ID: 0821bd09-9f65-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096676;
	bh=QBN2AWkBUcJPfk8rZdnXm+mJOwUj6XGJ3eXwL0wztok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oJ87QqIhxBW/n3ioT7JxZrfubvIJeMYQxkRFcLHH4kcuN/ciTYNGNG6hcrIRsszXR
	 fZ6419nVbHbnoodl704egKDRgRaXKZddnGhJRCwyFbbI0lXGz4QGXv02ntbi92pFmK
	 SfuBAq2WLokx40ESETFjU3AbTMHauoYXiBrSKWPjwxsViWuXuHakrA1q82UwjtlDmf
	 yJo8Vqr1TCIlYX88fywyvCeBoDUy85ux57FNStzxb9Jfd0qNgwHfOlWHa3K5nT4mWk
	 NT8fi1ZmQkmyfTmvL8TOcgXKYwCyMBYXR7W+qq5sW/FvVHO1oJR9/kPmbGhL/mh+AU
	 oPsEro5deYB4A==
Date: Wed, 20 Dec 2023 10:24:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
In-Reply-To: <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312201008070.685950@ubuntu-linux-20-04-desktop>
References: <cover.1703066935.git.federico.serafini@bugseng.com> <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com> <0200354e-08b9-4136-b6e9-3220a51256af@xen.org> <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Federico Serafini wrote:
> On 20/12/23 12:55, Jan Beulich wrote:
> > On 20.12.2023 12:48, Julien Grall wrote:
> > > On 20/12/2023 11:03, Federico Serafini wrote:
> > > > --- a/xen/arch/arm/arm64/vsysreg.c
> > > > +++ b/xen/arch/arm/arm64/vsysreg.c
> > > > @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
> > > >            /* RO at EL0. RAZ/WI at EL1 */
> > > >            if ( regs_mode_is_user(regs) )
> > > >                return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr,
> > > > 0);
> > > > -        else
> > > > -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr,
> > > > 1);
> > > > +
> > > > +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> > > 
> > > I don't 100% like this change (mostly because I find if/else clearer
> > > here).
> > 
> > While (it doesn't matter here) my view on this is different, I'm still
> > puzzled why the tool would complain / why a change here is necessary.
> > It is not _one_ return statement, but there's still (and obviously) no
> > way of falling through.
> 
> The tool is configurable:
> if you prefer deviate these cases instead of refactoring the code
> I can update the configuration.
 
If you say "deviation", it implies that there is a violation. I think
Jan's point was that both code versions shouldn't be any different.

# option-1
if (a)
  return f1();
else
  return f2();

# option-2
if (a)
  return f1();
return f2();

Both options are equally guaranteed to always return. It looks like a
peculiar limitation to only recognize option-2 as something that returns
100% of the times. Also option-1 returns 100% of the times. What am I
missing?

