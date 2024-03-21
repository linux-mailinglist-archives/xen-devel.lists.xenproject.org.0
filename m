Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F71881AB8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 02:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696173.1086860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7XI-0008B6-KO; Thu, 21 Mar 2024 01:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696173.1086860; Thu, 21 Mar 2024 01:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7XI-00087v-Hg; Thu, 21 Mar 2024 01:48:04 +0000
Received: by outflank-mailman (input) for mailman id 696173;
 Thu, 21 Mar 2024 01:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rn7XG-00087p-Q1
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 01:48:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cbdc5ee-e725-11ee-afdf-a90da7624cb6;
 Thu, 21 Mar 2024 02:48:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37F4E61135;
 Thu, 21 Mar 2024 01:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15893C433C7;
 Thu, 21 Mar 2024 01:47:57 +0000 (UTC)
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
X-Inumbo-ID: 0cbdc5ee-e725-11ee-afdf-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710985679;
	bh=oy0jgCRFCq+F1iMwkJyDoi1QP4R5oXndVd0E1OzCq98=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IBmEVjSS9n0C2R30h08le1/7DMmZOujF8+/b5ThxuXi8qGk/BfwseeKCK27N3Cb6p
	 m3VfT+zZkahvdEsG8SzFDF8S/Te4hoYW6D+9Uwwl6ltKceHBmqgsAMSgxlVlXJnsTo
	 Co+TRUo9H8c0XM3lxPV4mfo5RHyAH+n9HkTQZIRehOkhqWnEKAGApOJbnlxH0z5uBz
	 6K4rExu1eDHQ6k/7DW6rWicdgjC0gz84Plw2DF+PFurROj4XxqGrFFzlYeCI4U+OGS
	 +IyYrXmfI63azmnhkEPPA4bfbjluxuSDiV7LnMF/iQzKjSZJZEuviC65xZ14RR76D7
	 EoBsg7wO5xU9w==
Date: Wed, 20 Mar 2024 18:47:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/2] xen: address violations of MISRA C Rule 17.1
In-Reply-To: <4ce30a38-5b5c-4d4c-a0c4-8c1a63759203@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403201847140.1569010@ubuntu-linux-20-04-desktop>
References: <cover.1710923235.git.simone.ballarin@bugseng.com> <f7c2f12ab1b62301cfea3a28707178950f480932.1710923235.git.simone.ballarin@bugseng.com> <4ce30a38-5b5c-4d4c-a0c4-8c1a63759203@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Mar 2024, Jan Beulich wrote:
> On 20.03.2024 09:51, Simone Ballarin wrote:
> > MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used"
> > 
> > The Xen community wants to avoid using variadic functions except for
> > specific circumstances where it feels appropriate by strict code review.
> > 
> > Functions hypercall_create_continuation and hypercall_xlat_continuation
> > are special hypercalls made to break long running hypercalls into multiple
> > calls.
> 
> Here and below: These aren't "special hypercalls". They're internal helper
> functions.

+1


> > They take a variable number of arguments depending on the original
> > hypercall they are trying to continue.
> 
> Am I misremembering or did Andrew outline a plan to eliminate the variadic-
> ness from these? From certifiability perspective avoiding the need for a
> deviation would likely be preferable?

For sure, it would be preferable. In the meantime we can have the SAF
comment?

