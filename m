Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF942A96D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207553.363429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKf3-0006Xa-6R; Tue, 12 Oct 2021 16:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207553.363429; Tue, 12 Oct 2021 16:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKf3-0006VZ-3U; Tue, 12 Oct 2021 16:29:53 +0000
Received: by outflank-mailman (input) for mailman id 207553;
 Tue, 12 Oct 2021 16:29:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKf0-0006VT-Rf
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:29:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKf0-0005b4-JF
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:29:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKf0-0002qo-IJ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:29:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maKes-0004xy-Bo; Tue, 12 Oct 2021 17:29:42 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=EBkK6viJRmkY+pR9mowse6hT7mAhVZEi3oWpREtJ/Pc=; b=ZDqVc1/GGeCofWRwqPQibMHtzR
	Fw1LsOrWvn2OSL3b60VAbB6qfEublh9Sw0H8Ix5OSGwGkhPvGKs7juqiIMHZAj6oOmgW1ACUw5xcJ
	LsOMmpaRG5Yv5NeCInGLL+bA+Wv0+ZElds9J/vHHVEWiPdHXf8JI4SQcJdw6Si61jhUc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.47094.43672.782143@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 17:29:42 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    Rahul Singh <Rahul.Singh@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andre  Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
In-Reply-To: <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
	<YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
	<77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
	<YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
	<53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
	<YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
	<FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
	<ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
	<ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
	<0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
	<c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
	<c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
	<c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
	<09656882-b297-7144-c291-1ee997edb119@suse.com>
	<69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
	<24933.41349.893363.203683@mariner.uk.xensource.com>
	<AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> I can add something in the commit message about the fact that we improve
> performance and prevent to do a call that is and will not be supported in Xen.

Thanks but I'm afraid I don't think that is a correct summary of the
thread.  Nor would it be an adequate justification for the change.  At
least, not unless you plan to write something considerably longer (and
more precise).

Firstly, I'm not convinced this change would be justified by the
performance impact.  This is a small number of hypercalls during
domain startup.  Usually none, I think ?  If someone wants to optimise
domain startup speed then I am very open to that but I think this
change will make negligible change in practice.  Unless someone wants
to tell me I'm wrong about that ?  And if I am wrong about that then
an explanation of why my suppositions are wrong ought to go in the
commit message.

Secondly, there is no justification there for the change in error
status.

Why is this change needed ?  (What goes wrong if it is omitted ?)
That is what the commit message ought to answer.

Plus, given that it stubs out a function to make it into a no-op, that
itself requires an explanation.  Why is it OK for this function which
is supposed to do a thing, to in fact not do anything at all and
return successfully saying "yes I did that" ?

I think (having read the thread) that I know the answers to these
questions but it needs to be clearly and explicitly written down.

> I saw your change in CODING_STYLE and I understand the request.
> I will try to see if we can handle this change before the feature freeze.

Thanks.  I doubt that this will be hard.  I am more worried about the
commit message.

Indeed, since we haven't had the rationale for this change explicitly
written down, there is a risk that when we do so, we will discover
some problem with the approach that we had previously overlooked.

Discovering that kind of thing is one reason to explicitly write down
why we are doing what we are doing, but this situation does mean we
shouldn't feel we've yet achieved confidence that this patch is right.

Sorry,
Ian.

