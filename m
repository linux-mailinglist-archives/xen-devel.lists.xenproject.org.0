Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F5765C38
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 21:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571258.894674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6pq-0001dx-16; Thu, 27 Jul 2023 19:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571258.894674; Thu, 27 Jul 2023 19:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6pp-0001cF-Um; Thu, 27 Jul 2023 19:39:41 +0000
Received: by outflank-mailman (input) for mailman id 571258;
 Thu, 27 Jul 2023 19:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qP6po-0001c9-UH
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 19:39:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52ed892b-2cb5-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 21:39:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 608F661F20;
 Thu, 27 Jul 2023 19:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE6CC433C7;
 Thu, 27 Jul 2023 19:39:36 +0000 (UTC)
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
X-Inumbo-ID: 52ed892b-2cb5-11ee-b24a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690486777;
	bh=iy+jc/gzUnbztxUD55PAq3q//FwUt9n8Sin/+C9konM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fvIatD1pUxAAX5LbFyYti4u7+g9enMYQn9k8gsCdTdxobMalSY/AWJ5aNiPQBeDap
	 RAhYr2zanTc+r/hssaB9PTZ+64iS1cAcWWdskkOL+mxtpj0sObNAPL3se7vWhisf6R
	 DvVy4H40v2GbjJ0W7RVxlRSpRfHEFZ/L6w5IP9M19Gct0tZIq3SWs7bBUqTFnCBcAD
	 eIJ96OSybkNHcxuoeqidp5seo/sO1q8CZc+nzBTYYyuwZRQkFN6Ea43Gn+mnE39fcS
	 qPtctkxmxH6dzPRWBlAtiY0lxNjc3uwzFZxFqEh7VKAURxPQ2v4ftt62MXcP+zoEsp
	 rvnB3z73Ci/0A==
Date: Thu, 27 Jul 2023 12:39:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C:
 2012 Rules 8.2 and 8.3
In-Reply-To: <211aa6d4-d219-e429-030c-8f8b2fba815a@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307271238270.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690217195.git.federico.serafini@bugseng.com> <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com> <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com> <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
 <31b72cda-2ef0-2f3c-4e83-948d7b763f19@bugseng.com> <f479517d-10db-4723-65a2-38c85f72d96e@suse.com> <211aa6d4-d219-e429-030c-8f8b2fba815a@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jul 2023, Federico Serafini wrote:
> On 27/07/23 13:27, Jan Beulich wrote:
> > On 27.07.2023 13:02, Federico Serafini wrote:
> > > 
> > > I have ready a patch for violations of rules 8.2 and 8.3 in
> > > xen/include/xen/iommu.h.
> > > I am talking about this, in this IRQ thread, because I think the
> > > following two options also apply for an eventual v2 patch for the IRQ
> > > module, until a decision about rule 8.2 and function pointers is taken:
> > > 
> > > 1) Split patches and submit only the changes *not* involving function
> > >      pointers.
> > > 2) In the meantime that you make a decision,
> > >      I submit patches thus addressing the existing violations.
> > > 
> > > I personally prefer the second one, but please let me know what you
> > > think.
> > 
> > It's not entirely clear to me what 2 means, as I wouldn't expect you
> > intend to deal with "violations" which we may decide aren't any in
> > out world.
> > 
> > Jan
> 
> In point 2) I would like to act as if the rule 8.2 had been approved without
> any deviation, I think this will lead to a smaller number of patches and a
> smaller amount of text attached to each modified function.
> If you are concerned about inconsistency between the resulting commit
> messages and your future decision then we can go for option 1).

Basically I think we need to go with 1), which is also what Jan wrote.

Sorry about that, I know it is not great, we should have settled this
already.

