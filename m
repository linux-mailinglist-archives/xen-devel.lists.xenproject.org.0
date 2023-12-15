Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC38815185
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655371.1023148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKY-0004Zn-7r; Fri, 15 Dec 2023 21:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655371.1023148; Fri, 15 Dec 2023 21:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKY-0004WS-3n; Fri, 15 Dec 2023 21:02:46 +0000
Received: by outflank-mailman (input) for mailman id 655371;
 Fri, 15 Dec 2023 21:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFKW-0003HQ-Iz
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:02:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b6df3d-9b8d-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 22:02:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C013CE2D95;
 Fri, 15 Dec 2023 21:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4A1C433C7;
 Fri, 15 Dec 2023 21:02:38 +0000 (UTC)
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
X-Inumbo-ID: 48b6df3d-9b8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674159;
	bh=C/xgDUM5yXFR5uoImC9gd6W6nfxkpEJQwSOEfxy6g9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tzNl4cr/3DJa+9tOA1PHc+xhS7e3WeSawfLF5ukSP2aqpNa33zW6a6oGhWkBX3zx8
	 1cUcD2N2XPE1pzB8tvY7OoWJzvjD5LSZiCZ08qIkBUphb0DG+KsFlkdT5z0cx6s2Gn
	 s+Yc4XysUo2lq4WXtjUnr5fvM9jrx7SLPr7W8vbs3PeGL/1OtYf2q3+npykeOfVDl8
	 dFxtPG0uxnJI5cpSjcEVsYjh0WRkx3OViPw11I7TG3hTb53S3mOSzrM56tC9nI3rLb
	 a+EesSzfmdFg+5u2UvzsS2IilfhOX6gsFbtmwkv1cQ/mihTTWTQL6PrJfzoYppUzY+
	 1yg57oSoENvjQ==
Date: Fri, 15 Dec 2023 13:02:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312151232580.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com> <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org> <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
 <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com> <2b4eec7c-3657-4542-96b9-56b272e8723b@xen.org> <alpine.DEB.2.22.394.2312141418160.3175268@ubuntu-linux-20-04-desktop> <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Nicola Vetrini wrote:
> On 2023-12-14 23:32, Stefano Stabellini wrote:
> > On Thu, 14 Dec 2023, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 13/12/2023 14:02, Nicola Vetrini wrote:
> > > > On 2023-12-12 16:49, Julien Grall wrote:
> > > > > Hi,
> > > > >
> > > > > On 11/12/2023 12:32, Julien Grall wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 11/12/2023 10:30, Nicola Vetrini wrote:
> > > > > > > The branches of the switch after a call to 'do_unexpected_trap'
> > > > > > > cannot return, but there is one path that may return, hence
> > > > > > > only some clauses are marked with ASSERT_UNREACHABLE().
> > > > > > I don't understand why this is necessary. The code should never be
> > > > > > reachable because do_unexpected_trap() is a noreturn().
> > > > >
> > > > > From the matrix discussion, it wasn't clear what was my position on
> > > this
> > > > > patch.
> > > > >
> > > > > I would much prefer if the breaks are kept. I could accept:
> > > > >
> > > > > ASSERT_UNREACHABLE();
> > > > > break;
> > > > >
> > > > > But this solution is a Nack because if you are concerned about
> > > functions
> > > > > like do_unexpected_trap() to return by mistaken, then it needs to also
> > > be
> > > > > safe in production.
> > > > >
> > > > > The current proposal is not safe.
> > 
> > I re-read the email thread. I also do not think that this is useful:
> > 
> >          do_unexpected_trap("SVE trap at EL2", regs);
> > -        break;
> > +        ASSERT_UNREACHABLE();
> > 
> > I also do not think that we should be concerned about functions like
> > do_unexpected_trap() to return by mistaken.
> > 
> > That said, what is the problem from MISRA point of view that we are
> > trying to fix? Is the only problem the presence of break; after the call
> > to a noreturn function?
> > 
> > If that's not allowed, I would suggest to do this:
> > 
> > 
> >          do_unexpected_trap("SVE trap at EL2", regs);
> > -        break;
> > +        /* break; */
> > 
> > 
> > Or deviate "break" globally as it doesn't seem to be a safety risk in my
> > opinion. If nothing else, it should make the code a bit safer because in
> > case of mistakes in do_unexpected_trap, at least we would continue to
> > follow a more reasonable code path rather than blindly falling through
> > the next switch case by accident.
> > 
> > 
> 
> That doesn't seem like a good idea to deviate just "break". However, Julien's
> earlier proposal
> 
> ASSERT_UNREACHABLE();
> break;
> 
> is ok, though it could be shrunk in a macro
> 
> #define unreachable_break ASSERT_UNREACHABLE(); break;
> 
> or just
> 
> #define unreachable_break break;
> 
> so that "unreachable_break" can be deviated.

Let's just go with:

ASSERT_UNREACHABLE();
break;

If Julien is OK with it too.


Just to make sure we are all aligned on what the problem and solution
are:
- we are not concerned that do_unexpected_trap could return
- it is just forbidden to have any code after something that doesn't
  return
- not even a break;
- so we need to use ASSERT_UNREACHABLE() as a marker to tell ECLAIR to
  ignore the violation

