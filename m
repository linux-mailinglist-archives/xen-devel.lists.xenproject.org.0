Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2457D8C04
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 01:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624052.972447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9Mv-0000A5-C7; Thu, 26 Oct 2023 23:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624052.972447; Thu, 26 Oct 2023 23:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw9Mv-00007A-9L; Thu, 26 Oct 2023 23:02:25 +0000
Received: by outflank-mailman (input) for mailman id 624052;
 Thu, 26 Oct 2023 23:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qw9Mt-000074-M5
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 23:02:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b79c7dfb-7453-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 01:02:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1C7AAB838C9;
 Thu, 26 Oct 2023 23:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA7BC433C7;
 Thu, 26 Oct 2023 23:02:18 +0000 (UTC)
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
X-Inumbo-ID: b79c7dfb-7453-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698361340;
	bh=q8boQmflejd3juET0E3ZdVnKNtq6lNs4bqK4WoiapZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gUcChs/PZZCcCzoaxzG52y+/MkF/q82/GGSzQ71HjXx3vQtmMGnHqTPwdjl8rHOF2
	 klKi4w3i4viUZTPMJQKdYM0E1nosKpKTWhLcyRoPAh0b5g9Q42uoWGerZAznXiZrF+
	 WjeB+36YfWKJSScCMXxWE20spQkUt1xS5uWO4Mbek+Vc9gR8qe0/3Eg462a3+V3RQ+
	 YELR2bdyTYeoLWpwcdy4sM92oyQ5uFMfIRulMKbkv64nc3kykzHSz8M+LUoDWDWZbo
	 0Jft7Z/2NSkuPbDDoYIbIe3u64NLs9/LLhKY6UMzyBRa24Pa44uafYC3mpI0BRogi3
	 g22VXRQWA+uGw==
Date: Thu, 26 Oct 2023 16:02:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
In-Reply-To: <36a3412d-cbe9-4fc7-af6c-db0206d56333@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310261601540.271731@ubuntu-linux-20-04-desktop>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com> <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com> <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com> <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com> <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com> <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop> <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com> <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
 <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com> <alpine.DEB.2.22.394.2310251537460.271731@ubuntu-linux-20-04-desktop> <3cc22b2d-fbcf-899e-1d7d-036a53bd0f7f@suse.com> <ff395b4eab2e79a901516e0958647f8b@bugseng.com>
 <36a3412d-cbe9-4fc7-af6c-db0206d56333@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Julien Grall wrote:
> On 26/10/2023 11:32, Nicola Vetrini wrote:
> > On 26/10/2023 08:52, Jan Beulich wrote:
> > > On 26.10.2023 00:38, Stefano Stabellini wrote:
> > > > On Wed, 25 Oct 2023, Jan Beulich wrote:
> > > > > On 25.10.2023 16:50, Nicola Vetrini wrote:
> > > > > > Ok, I'll send a revised version using MASK_LOWEST_BIT, taking into
> > > > > > account also the
> > > > > > other comments about the explanation on the macro definition
> > > > > > (which some IDEs even show when hovering on its usage, which could
> > > > > > partially address
> > > > > > the latter concern).
> > > > > 
> > > > > You're of course free to do so, but since - as indicated before -
> > > > > MASK_LOWEST_BIT() imo isn't a better name than LOWEST_BIT(), I'll
> > > > > continue to object.
> > > > 
> > > > Jan if you are OK with that I'll ask Julien to break the tie and pick
> > > > the name to use. Julien can you please help us move forward?
> > > 
> > > Hmm, I'm having trouble seeing us at the point of breaking ties yet.
> > > First we need naming suggestions which actually unambiguously
> > > describe what's being done by the macro. I gave one suggestion which
> > > I think fulfills this property, but is a little too long for my
> > > taste. I gave another suggestion with a far-off but shorter name,
> > > which I can appreciate isn't liked. I've not seen other suggestions
> > > fulfilling this base criteria.
> > > 
> > > Jan
> > 
> > Any name is fine with me. ISOLATE_LOW_BIT may be longish, but the macro
> > would be used
> > in just a few places for a specific reason, so the loss in readability is
> > probably not
> > that high.
> 
> +1. It doesn't seem we will be able to find a name that 100% fit all the
> criteria. So of all the choice, my preference would be ISOLATE_LOW_BIT().

It is clear enough, so +1

