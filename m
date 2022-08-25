Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D155A1864
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 20:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393558.632590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRHI6-0001uN-Bm; Thu, 25 Aug 2022 18:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393558.632590; Thu, 25 Aug 2022 18:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRHI6-0001rH-8k; Thu, 25 Aug 2022 18:09:18 +0000
Received: by outflank-mailman (input) for mailman id 393558;
 Thu, 25 Aug 2022 18:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oRHI4-0001rB-2q
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 18:09:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 067a0d0e-24a1-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 20:09:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9DD61CBF;
 Thu, 25 Aug 2022 18:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6221AC43140;
 Thu, 25 Aug 2022 18:09:11 +0000 (UTC)
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
X-Inumbo-ID: 067a0d0e-24a1-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661450952;
	bh=aIGgYcs1PlaJZMkE8Y3/dAoZJGGRaqoCWcaaKdwhScg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CfhbH//vOq7dzlEWQ/UTOnzItNHh3V1i8NGi/8YeT+sJ0fkLeb7t5+50K53VkUty6
	 x7NI1wzkEMRMkioACKl3XdSPLLubUs05ueit3Ii68KUHex6NXNwoIDU7vtzrCwbT06
	 6HBKawxktjzR+SSYNY5WcShCTEy/UhMXFJn+KwN8EoM2on2sy92GC254JVWkuG2gzc
	 +x4QGYFWU4tgYGQlBsCGvBnBTlj9j3znlVW/3I1v9OEFZG36ty4+ZdLPGLzdhyHdeX
	 TVmCBE5HEiEnlIvlODW8wdKu55tG2Hjx3Nj2qLNka8vFHEKZlYSin9QMv6VMDeHPUl
	 fYh2sVwcgHXjw==
Date: Thu, 25 Aug 2022 11:09:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    andrew.cooper3@citrix.com, bertrand.marquis@arm.com, roger.pau@citrix.com, 
    roberto.bagnara@bugseng.com
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-8-burzalodowa@gmail.com> <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com> <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com> <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com> <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

CC MISRA C working group

Short summary: we are discussing whether the following is sufficient to
address MISRA C Rule 20.7, and also in general for safety:


 #define dt_for_each_property_node(dn, pp)                   \
-    for ( pp = dn->properties; pp != NULL; pp = pp->next )
+    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )


as you can see "dn" has been parenthesizing because is used as a rhs,
while "pp" has *not* because it is used as lhs.

More below.


On Thu, 25 Aug 2022, Jan Beulich wrote:
> On 25.08.2022 10:02, Xenia Ragiadakou wrote:
> > On 8/22/22 14:48, Jan Beulich wrote:
> >> On 22.08.2022 12:43, Xenia Ragiadakou wrote:
> >>> On 8/22/22 12:59, Jan Beulich wrote:
> >>>> On 19.08.2022 21:43, Xenia Ragiadakou wrote:
> >>>>> In macros dt_for_each_property_node(), dt_for_each_device_node() and
> >>>>> dt_for_each_child_node(), add parentheses around the macro parameters that
> >>>>> have the arrow operator applied, to prevent against unintended expansions.
> >>>>
> >>>> Why is this relevant only when -> is used? For comparisons and the rhs of
> >>>> assignments it's as relevant, ad even for the lhs of assignments I doubt
> >>>> it can be generally omitted.
> >>>
> >>> Yes, I agree with you but some older patches that I sent that were
> >>> adding parentheses around the lhs of the assignments were not accepted
> >>> and I thought that the rhs of the assignments as well these comparisons
> >>> fall to the same category.
> >>>
> >>> Personally, I would expect to see parentheses, also, around the macro
> >>> parameters that are used as the lhs or the rhs of assignments, the
> >>> operands of comparison or the arguments of a function.
> >>> Not only because they can prevent against unintentional bugs but because
> >>> the parentheses help me to identify more easily the macro parameters
> >>> when reading a macro definition. I totally understand that for other
> >>> people parentheses may reduce readability.
> >>
> >> Afair Julien's comments were very specific to the lhs of assignments.
> >> So at the very least everything else ought to be parenthesized imo.
> >>
> > 
> > So, IIUC, the only deviations from the MISRA C 2012 Rule 20.7 will be 
> > for macro parameters used as the lhs of assignments and function arguments?
> 
> Afaic I don't consider that discussion settled.
> 
> > This feels a bit of a hack to parenthesize the macro parameters that are 
> > used as the rhs of an assignment but not those used as the lhs.
> 
> lhs and rhs of assignments are quite different, and hence making such a
> distinction wouldn't look to be a "hack" to me. In fact I've always
> considered this part of the language somewhat strange: To me
> parenthesizing e.g. an identifier already makes it (visually) an
> rvalue. Leaving aside odd (and easy to spot as odd) uses at the call
> sizes, I don't think I can come up with a case where parentheses are
> really needed. Anything needing parenthesizing actually yields an
> rvalue afaics, thus causing a diagnostic anyway.

Although I can see where you are coming from, parenthesizing an
identifier doesn't actually make it an rvalue. Also it is a lot simpler
to understand, review, and apply a policy that says:

"all macro parameters are parenthesized"

compared to a policy that says:

"most macro paremeters are parenthesized, let's go into the details of
which ones are parenthesized and which ones are not, including examples
and corner cases"

For simplicity, I would go with the simplest version, the MISRA version.

I am assuming that the MISRA Rule 20.7 requires that "pp" is also
parenthesized. Roberto, is that correct?


> >  From previous discussions on the topic, I understood that the 
> > parentheses are considered needed only when they eliminate operator 
> > precedence problems, while for the wrong parameter format bugs we can 
> > rely on the reviewers.
> > 
> > I think we need to decide if the rule will be applied as is and if not 
> > which will be the deviations along with their justification and add it 
> > to the document.
> 
> Yes. But this shouldn't hinder adjustments for all other, non-
> controversial cases.

It looks like we need a discussion and see where the majority of the
team is on this issue. I prefer the original MISRA version for
simplicity, but I also think it is OK if we make a small customization
to it. In that case, we would add the extra explanation and details to
docs/misra/rules.rst.

However, as we make the decision we also need to take into account that
if we don't go with the vanilla MISRA rule, there is a price to pay: all
the MISRA scanners, including cppcheck, Eclair, Coverity and others would
probably still flag these issues as violations polluting the results
and making the scanners less useful. We might have to mark each
"deviation" with a one-line in-code comment on top, or we would have to
disable automatic scanning for Rule 20.7 altogether. Either option is
not great.

This is actually the main reason why I prefer the vanillay MISRA
version: even if the resulting style might not be as good the the custom
version, we don't need to worry about reviewing this rule because we can
easily get automatic scans for it.


But first, let's confirm whether this change:


 #define dt_for_each_property_node(dn, pp)                   \
-    for ( pp = dn->properties; pp != NULL; pp = pp->next )
+    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )


is sufficient to make the violation go away in Eclair or cppcheck.  I am
assuming it is not sufficient, but let's confirm.

