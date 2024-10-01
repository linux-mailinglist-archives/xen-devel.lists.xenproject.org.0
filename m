Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF898C7AB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 23:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808527.1220451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkYG-0002BV-RX; Tue, 01 Oct 2024 21:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808527.1220451; Tue, 01 Oct 2024 21:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkYG-0002A0-Oi; Tue, 01 Oct 2024 21:37:00 +0000
Received: by outflank-mailman (input) for mailman id 808527;
 Tue, 01 Oct 2024 21:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0ff=Q5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svkYF-00029u-Iz
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 21:36:59 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48677568-803d-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 23:36:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB4AAA432DF;
 Tue,  1 Oct 2024 21:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1323C4CEC6;
 Tue,  1 Oct 2024 21:36:54 +0000 (UTC)
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
X-Inumbo-ID: 48677568-803d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727818615;
	bh=Gk6tXihXCvSCwPFumkL2CxhYEa/MIBNmXvWuzxB88R8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rWdwbNEHngt+u9fVprukPnaqMg6WWy9uMP+562LxH2DJ/3A7RsFmdonct6eYK2eqD
	 PqQRTZmi2W/XypWFIaiL8tivuSIAWVOW/oaCAD6+S9q15Cl/Y6OCqq0DzTCj/tQISc
	 kFjt/0NddIO8KY5qbViEAOmP0fDgMGlm7liTxZBge8meVfP3mItn4brsl6Jzp0gkRI
	 Vt7ZvDqxdL7mw0NFDs6rTW/md8jUaoTHRVnRFMeI/Qcqidy6Wenb9sz8pUnBPOKwuc
	 R65y2Mvu465/aBwemun3G+JsdjHZSoFrI1bobY+gG+tRhMcldGvNGmfX61VrnBoVJc
	 d1rTvRyPdXc9Q==
Date: Tue, 1 Oct 2024 14:36:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule
 13.6
In-Reply-To: <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
Message-ID: <alpine.DEB.2.22.394.2410011431360.451631@ubuntu-linux-20-04-desktop>
References: <cover.1727690180.git.federico.serafini@bugseng.com> <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com> <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com> <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
 <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Oct 2024, Jan Beulich wrote:
> On 01.10.2024 07:25, Roberto Bagnara wrote:
> > On 2024-09-30 15:07, Jan Beulich wrote:
> >> On 30.09.2024 14:49, Federico Serafini wrote:
> >>> guest_handle_ok()'s expansion contains a sizeof() involving its
> >>> first argument which is guest_handle_cast().
> >>> The expansion of the latter, in turn, contains a variable
> >>> initialization.
> >>>
> >>> Since MISRA considers the initialization (even of a local variable)
> >>> a side effect, the chain of expansions mentioned above violates
> >>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
> >>> contain any expression which has potential side effect).
> >>
> >> I'm afraid I need to ask for clarification of terminology and alike here.
> >> While the Misra doc has a section on Persistent Side Effects in its
> >> Glossary appendix, what constitutes a side effect from its pov isn't
> >> really spelled out anywhere. Which in turn raises the question whether it
> >> is indeed Misra (and not just Eclair) which deems initialization a side
> >> effect. This is even more so relevant as 13.6 talks of only expressions,
> >> yet initializers fall under declarations (in turn involving an expression
> >> on the rhs of the equal sign).
> >>
> >> All the same of course affects patch 2 then, too.
> > 
> > MISRA C leaves the definition of "side effect" to the C Standard.
> > E.g., C18 5.1.2.3p2:
> > 
> >    Accessing a volatile object, modifying an object, modifying a file,
> >    or calling a function that does any of those operations are all
> >    side effects,[omitted irrelevant footnote reference] which are
> >    changes in the state of the execution environment.
> > 
> > The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
> > indirectly confirms that initialization is always a side effect.
> 
> Hmm, that's interesting: There's indeed an example with an initializer
> there. Yet to me the text you quote from the C standard does not say
> that initialization is a side effect - it would be "modifying an
> object" aiui, yet ahead of initialization being complete the object
> doesn't "exist" imo, and hence can be "modified" only afterwards.

Hi Jan,

I feel it's becoming a bit too philosophical. Since there's some room
for interpretation and only two violations left to address, I believe
it's best to stick with the stricter interpretation of the definition.
Therefore, I'd proceed with this series in its current form.

