Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78242A4ED24
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 20:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901466.1309419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXoP-0001fC-BX; Tue, 04 Mar 2025 19:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901466.1309419; Tue, 04 Mar 2025 19:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXoP-0001cR-8t; Tue, 04 Mar 2025 19:20:17 +0000
Received: by outflank-mailman (input) for mailman id 901466;
 Tue, 04 Mar 2025 19:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpXoN-0001cL-6F
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 19:20:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe79483-f92d-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 20:20:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7C6B5C62E9;
 Tue,  4 Mar 2025 19:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B87C4CEE9;
 Tue,  4 Mar 2025 19:20:07 +0000 (UTC)
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
X-Inumbo-ID: afe79483-f92d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741116008;
	bh=Z5BIBaNIwH+oGY3G4OBh0J7GxqSN8Jy13TFVHCtWKUc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BR1KCx0qx+HM0ToG0B/GW3e2rgGD6cZv83aA7MSZKpev/KuSBmpsZTBjt49laprDn
	 xT6R3NKyobhyKb7wZKFMILr8UqdJeV8eOZg8Rnk59kO82YqEHR35vmwuH9zSJwPVDG
	 BBrS78nItJgNKwYAatpdAQgszbt0He8PRUsM7+BUzAcWfoVHUBumLeYLQdcVKBg6a+
	 zkNZTkBgSKzDIGJSjcHC7RY+xYMuIW7WfEtil+pOknbC99ElMxLwmfgSc02r+lK/E0
	 X9p2ttxpLmldWeHQozFhhOVZ1eOI53GnNKXo9eIshNgxv1FJgnwP6jE8V5HhSn+fCU
	 7loAGMNOBf6RA==
Date: Tue, 4 Mar 2025 11:20:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
In-Reply-To: <769DE9A1-0F3F-4564-9A37-0812ECCA3234@arm.com>
Message-ID: <alpine.DEB.2.22.394.2503041119450.1303386@ubuntu-linux-20-04-desktop>
References: <20250218095130.2666580-1-luca.fancellu@arm.com> <20250218095130.2666580-3-luca.fancellu@arm.com> <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com> <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com> <4b31f272-2bb2-40d8-94d9-8137586b59fa@suse.com>
 <769DE9A1-0F3F-4564-9A37-0812ECCA3234@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Mar 2025, Luca Fancellu wrote:
> Hi,
> 
> > On 18 Feb 2025, at 15:06, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 18.02.2025 16:01, Orzel, Michal wrote:
> >> On 18/02/2025 14:44, Jan Beulich wrote:
> >>> On 18.02.2025 10:51, Luca Fancellu wrote:
> >>>> LLC coloring can be used only on MMU system,
> >>> 
> >>> Just for my own education: Why is this?
> >> I read this as it refers to the feature we have in Xen, not the generic concept.
> >> You could in theory achieve cache coloring without MMU using static allocation
> >> or some custom allocator but in general we benefit from being able to map VA
> >> to PA aligning with cache coloring scheme.
> > 
> > Oh, okay. Then maybe the sentence would better be worded to express that
> > it's our present choice, rather than an inherent limitation?
> 
> Is this better? Can be addressed on commit?
> 
> Xen LLC coloring feature can be used only on MMU system, move the code
> that selects it from ARM_64 to MMU and add the ARM_64 dependency.

Hi Luca, I think that's OK. Can this patch be committed without the
previous patch in the series?

