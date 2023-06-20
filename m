Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA509737643
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:44:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552312.862319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiDU-0005aF-E2; Tue, 20 Jun 2023 20:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552312.862319; Tue, 20 Jun 2023 20:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiDU-0005YY-A5; Tue, 20 Jun 2023 20:44:44 +0000
Received: by outflank-mailman (input) for mailman id 552312;
 Tue, 20 Jun 2023 20:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiDS-0005YQ-5u
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:44:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46eea82c-0fab-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 22:44:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98503611BF;
 Tue, 20 Jun 2023 20:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DE0C433C8;
 Tue, 20 Jun 2023 20:44:37 +0000 (UTC)
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
X-Inumbo-ID: 46eea82c-0fab-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687293879;
	bh=/AthUgBrpdYZOdtlXuvt0N4TJYl3rpdDAqJA/wXBoCA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=liaMxfEjLIyF5O5pwxnjbRfi7NRAFEoAloixQuTRMNMR2cZ8rsC95usBq0pnSmnaG
	 RJPE8w5Xj8yd9gZ5EMLZn6c8yXVCubaBuawjJt/aSk+yRBlTa84yw6W4nwOihZrvdg
	 CdHtfhFdex4yZIFWSwjqzYJd1gl73bKaPXNVByXqHFg0co1fW+RJgSQdDEvhzkjPbV
	 ykNtLJcDoxNC2qacxf7Vrin431v6JVgrsSxZ4NGCX2RxtWpL4Ff5Uo+ebpPz09vnmT
	 aXcl1ElWtIy+5kIVi0rcxWIm3zuJQzVjnCUoNTqjG3RFTx8bxpdIcQGNKqEpvE4CF3
	 E6Vxkv5OeR+UA==
Date: Tue, 20 Jun 2023 13:44:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 01/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <c21f0bdd-ca78-d18d-2084-78eb094fc41e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306201342290.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <5aa3a54af456b8faee681a1d737c361abe89296f.1687250177.git.gianluca.luparini@bugseng.com> <c21f0bdd-ca78-d18d-2084-78eb094fc41e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Jan Beulich wrote:
> On 20.06.2023 12:34, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> > "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> > 
> > I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> 
> The code adjustments here are certainly fine, but I'd like to ask that
> patch descriptions be written as such. "I propose ..." in particular
> may be okay in an upfront discussion, but for a patch you want to
> describe what the patch does, and why (the latter part you're dealing
> with already).
> 
> Furthermore I continue to have trouble with the wording "is represented
> in an unsigned type": As previously pointed out, what type a constant
> is going to be represented in depends on the ABI and eventual variables
> (specifically their types) that the value might then be assigned to, or
> expressions that the value might be used in. A possible future
> architecture with "int" wider than 32 bits would represent all the
> constants touched here in a signed type. I think what is meant instead
> (despite Misra's imo unhelpful wording) is that you add suffixes for
> constants which are meant to have unsigned values (no matter what type
> variable they would be stored in, or what expression they would appear
> in, and hence independent of their eventual representation).
> 
> Furthermore the U suffix (as an example) doesn't help at all when the
> value then is assigned to a variable of type long, and long is wider
> than int. The value would then _still_ be represented in a signed type.
> 
> Taken together, how about 'Use "U" as a suffix to explicitly state when
> an integer constant is intended to be an unsigned one'?
> 
> I expect both remarks will apply throughout the series, so I'm not
> going to repeat them for later patches.


Hi Jan, I agree with you. To further help Gianluca undestand better your
suggestion, I think the commit message wants to be:


    xen/x86/acpi/cpufreq: fixed violations of MISRA C:2012 Rule 7.2

    The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
    headline states: "A "u" or "U" suffix shall be applied to all
    integer constants that are represented in an unsigned type".

    Use "U" as a suffix to explicitly state when an integer constant is
    intended to be an unsigned one

    For homogeneity, also add the "U" suffix in other cases that the
    tool didn't report as violations.


I also took the opportunity to make the title unique. Jan, if you are
happy with this wording it could be applied to all patches in this
series (with the titles being made unique).

