Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28D93022A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758351.1167811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOuK-00038x-VR; Fri, 12 Jul 2024 22:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758351.1167811; Fri, 12 Jul 2024 22:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOuK-00036K-SH; Fri, 12 Jul 2024 22:38:28 +0000
Received: by outflank-mailman (input) for mailman id 758351;
 Fri, 12 Jul 2024 22:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOuJ-00036E-Lj
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:38:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7371741a-409f-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:38:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E172961A25;
 Fri, 12 Jul 2024 22:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B7DC32782;
 Fri, 12 Jul 2024 22:38:23 +0000 (UTC)
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
X-Inumbo-ID: 7371741a-409f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720823904;
	bh=Tqf6AG7C0pklLQZPX4Yqv5t049ZMcfsQkL/Pc5OyFSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RWqBwP50DzePc+WLGSKd1sdn//oWjoPhN71mzX+qbY2XpSmpwBcCk5N9MPyA9p2gH
	 ugkz1G55JPAJHRbyOSsQGLA8cVuBZzPuY53ALuuQhrkLEwlPg8p0YEwj3ciDXl6CfY
	 wNmf9146T37yt1cHrFlK0If4SakN1a92zdq+swoEaa8I7OTYV4YNzv87vs5QBDCEKx
	 nf+BqnqiYQmon+NOiCHeiDY0uvP3oPO5tpd5R85sejiGJzBBmnLxcXeQKj6qX9AOy2
	 cCcWPEHXihh7pxd+EDCz0ALwsmyPrGuytTksDXVBPtuPAFKYmjV0hXvZHIoKFTrV/R
	 tDMOyYWtxSovg==
Date: Fri, 12 Jul 2024 15:38:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com> <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jul 2024, Jan Beulich wrote:
> On 01.07.2024 15:46, Alessandro Zucchelli wrote:
> > This section explains which format should be followed by header
> > inclusion guards via a drop-down list of rules.
> 
> Ah, so this answers my earlier question regarding where the naming
> rules are spelled out. Yet why is this not much earlier in the series,
> /before/ anything trying to follow these rules?
> 
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -167,3 +167,22 @@ the end of files.  It should be:
> >   * indent-tabs-mode: nil
> >   * End:
> >   */
> 
> This footer is not just an example; it also serves that function here.
> While not strictly needed in this file, I think it should still remain
> last.

+1


> > +Header inclusion guards
> > +-----------------------
> > +
> > +Unless differently specified all header files should have proper inclusion
> > +guards in order to avoid being included multiple times.
> > +The following naming conventions have been devised:
> > +- private headers -> <dir>_<filename>_H
> > +- asm-generic headers -> ASM_GENERIC_<filename>_H
> > +    - #ifndef ASM_GENERIC_X86_PERCPU_H
> > +      #define ASM_GENERIC_X86_PERCPU_H
> > +      //...
> > +      #endif /* ASM_GENERIC_X86_PERCPU_H */
> 
> GENERIC contradicts X86. Please try to avoid giving confusing / possibly
> misleading examples.

For clarity, Jan means that GENERIC by definition is not arch-specific
so GENERIC_X86 or GENERIC_ARM is a contradiction and it would be better
not to use it as reference example for this rule


> > +- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> > +    - #ifndef ASM_X86_DOMAIN_H
> > +      #define ASM_X86_DOMAIN_H
> > +      //...
> > +      #endif /* ASM_X86_DOMAIN_H */
> 
> I'm afraid I can't connect the example to the filename pattern given:
> The example has 4 components separated by 3 underscores, when the
> pattern suggests 5 and 4 respectively.

I read the above with <subdir> being optional. But yes it is unclear
because the example should have both the header guard but also the
related file path. In this case the file path corresponding to
ASM_X86_DOMAIN_H would be arch/x86/include/asm/domain.h



> Please avoid empty lines at the bottom of files.
> 
> Having reached the end, I don't see common headers (the ones under
> xen/include/ in the tree) covered. I can only conclude that the odd
> INCLUDE_ prefixes I had asked about were derived from the "private
> headers" rule. Yet what's in xen/include/ aren't private headers.

Yeah. I proposed in a previous email to use:

- xen/include/xen/<filename>.h -> XEN_<filename>_H
- xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H

with <subdir> being optional.


> I further have to note that, as indicated during the earlier discussion,
> I still cannot see how occasional ambiguity is going to be dealt with.
> IOW from the rules above two different headers could still end up with
> the same guard identifier.

Maybe something like this?

"In the event of naming collisions, exceptions to the coding style may
be made at the discretion of the contributor and maintainers."


> Finally, it shouldn't be silently assumed that all name components are
> to be converted to upper case; everything wants spelling out imo.
 
+1

