Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16886A658
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 03:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686377.1068322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9On-0002QE-O1; Wed, 28 Feb 2024 02:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686377.1068322; Wed, 28 Feb 2024 02:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9On-0002N8-Ky; Wed, 28 Feb 2024 02:10:21 +0000
Received: by outflank-mailman (input) for mailman id 686377;
 Wed, 28 Feb 2024 02:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSf=KF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rf9Om-0002N0-Jb
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 02:10:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8390fdc2-d5de-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 03:10:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39F8DCE1F8F;
 Wed, 28 Feb 2024 02:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B29C433C7;
 Wed, 28 Feb 2024 02:10:11 +0000 (UTC)
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
X-Inumbo-ID: 8390fdc2-d5de-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709086212;
	bh=k7uotmsW7zomBtopWFDRzvX/L8saNOM2jRg3oDb+lu4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EqIWoNj9D+3lC+3+DwZVoIjZ7Q7FePP2UKhNOLnYgvgaXI2KY6n6085hMth5j9u42
	 AP4fbkstI9mR5Rniy6BJTWkH54/EYXCgiIwCclUMTna5q/pB6f3UHFA3c/oo7yfS84
	 7BDtV2Swnvo7pVsr3BNmAD3Fdy5cswgOl1CMDx5oWbZcWI27Qz8kI1SiumR8mRTM6/
	 PzqGTX8Zs4adOCEy7Baw6HOjksb7xmLJfiZYL+IDiOHDNnBtyl9htEK9MUJsyBd83i
	 OZJrZ5R9oFM3GaXVfaEWEzfNkhvBhoeR0H5YplhNUZUW/1JTtXpuN9eKP7u4no5bWQ
	 H33XRxUUR/vJA==
Date: Tue, 27 Feb 2024 18:10:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
In-Reply-To: <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402271808410.575685@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com> <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com> <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com> <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org> <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Jan Beulich wrote:
> On 27.02.2024 12:52, Julien Grall wrote:
> > Hi Jan,
> > 
> > On 27/02/2024 07:28, Jan Beulich wrote:
> >> On 27.02.2024 01:26, Stefano Stabellini wrote:
> >>> On Mon, 26 Feb 2024, Jan Beulich wrote:
> >>>> On 23.02.2024 10:35, Nicola Vetrini wrote:
> >>>>> Refactor cpu_notifier_call_chain into two functions:
> >>>>> - the variant that is allowed to fail loses the nofail flag
> >>>>> - the variant that shouldn't fail is encapsulated in a call
> >>>>>    to the failing variant, with an additional check.
> >>>>>
> >>>>> This prevents uses of the function that are not supposed to
> >>>>> fail from ignoring the return value, thus violating Rule 17.7:
> >>>>> "The value returned by a function having non-void return type shall
> >>>>> be used".
> >>>>>
> >>>>> No functional change.
> >>>>>
> >>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>
> >>>> I'm afraid I disagree with this kind of bifurcation. No matter what
> >>>> Misra thinks or says, it is normal for return values of functions to
> >>>> not always be relevant to check.
> >>>
> >>> Hi Jan, I disagree.
> >>>
> >>> Regardless of MISRA, I really think return values need to be checked.
> >>> Moreover, we decided as a group to honor MISRA Rule 17.7, which requires
> >>> return values to be checked. This patch is a good step forward.
> >>
> >> Yet splitting functions isn't the only way to deal with Misra's
> >> requirements, I suppose. After all there are functions where the
> >> return value is purely courtesy for perhaps just one of its callers.
> > 
> > You are right that we have some places where one caller care about the 
> > return value. But the problem is how do you tell whether the return was 
> > ignored on purpose or not?
> > 
> > We had at least one XSA because the return value of a function was not 
> > checked (see XSA-222). We also had plenty of smaller patches to check 
> > returns.
> > 
> > So far, we added __must_check when we believed return values should be 
> > checked. But usually at the point we notice, this is far too late.
> > 
> > To me the goal should be that we enforce __must_check everywhere. We are 
> > probably going to detect places where we forgot to check the return. For 
> > thoses that are on purpose, we can document them.
> > 
> >>
> >> Splitting simply doesn't scale very well, imo.
> > 
> > Do you have another proposal? As Stefano said, we adopted the rule 17.7. 
> > So we know need a solution to address it.
> 
> One possibility that was circulated while discussing was to add (void)
> casts. I'm not a huge fan of those, but between the two options that
> might be the lesser evil. We also use funny (should I say ugly)
> workarounds in a few cases where we have __must_check but still want
> to not really handle the return value in certain cases. Given there are
> example in the code base, extending use of such constructs is certainly
> also something that may want considering.

I asked Roberto if void casts are an option for compliance.

In any case, I don't think we should use void casts in the specific
cases this patch is dealing with. Void casts (if anything) should be a
last resort while this patch fixes the issue in a better way.

