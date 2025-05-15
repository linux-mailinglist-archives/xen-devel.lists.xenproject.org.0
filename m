Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84371AB7A57
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 02:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984671.1370701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFM8N-0004lo-Qs; Thu, 15 May 2025 00:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984671.1370701; Thu, 15 May 2025 00:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFM8N-0004jJ-O6; Thu, 15 May 2025 00:07:35 +0000
Received: by outflank-mailman (input) for mailman id 984671;
 Thu, 15 May 2025 00:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xban=X7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uFM8M-0004jD-C2
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 00:07:34 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98362e31-3120-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 02:07:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 69CD74A4F7;
 Thu, 15 May 2025 00:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD763C4CEE3;
 Thu, 15 May 2025 00:07:28 +0000 (UTC)
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
X-Inumbo-ID: 98362e31-3120-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747267650;
	bh=1U6oYZJvUXRtgGFH1POvW7251fxzm9OGOMX59lSq5rM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jMt9vZw1FUjNbamBZrlQkOapp9zPMSIMujAEzbtv4xuBHniO86WtbZcSmq56PIbXR
	 FfmKVzVX/LLjsXR1q+rafpS14aIPIp8+Hy+tsOE3Tq81S8yfm/mAwusGEfuyAkVpkx
	 TjCRx3fvRkbrWVuLOdk7MZwZkA/0ICbUu3PkNmVIIjkHwgG7pluFAWSkrxd9y1IQ83
	 LaJwMrGUxKfqJCQoQwV8b68XDcGLaDFRKH2SgsaEIUuJmtiacg9wxZOidyRfv+Lcl8
	 k/pX92p/w0CCz+eN6x7cL1rIv2nUmzRhPmOZtYrCIrU/DLGm7zVUnUhhLl9a03pVGh
	 9tsI7+R757RKA==
Date: Wed, 14 May 2025 17:07:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
In-Reply-To: <aed77ddd-3db9-49a9-8a51-2df50b768e24@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505141702120.145034@ubuntu-linux-20-04-desktop>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com> <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com> <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org> <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
 <44143db1-1766-4851-9a0c-7428dce9087d@xen.org> <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com> <aa6a1f7c-8abf-4af0-97a0-e0e265839bd2@xen.org> <aed77ddd-3db9-49a9-8a51-2df50b768e24@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 May 2025, Orzel, Michal wrote:
> > Sure. But my point is rather more that static memory is not a feature 
> > described by the Arm Arm. Instead, it is a feature of Xen that is ti to 
> > device-tree. So inherently there is no reason to be implemented in arch/arm.
> I agree, it can and should be made common. But exposing only callers makes no
> sense at all for me. Callers should be exposed together with feature code movement.

[...]

> >>> back to Arm for then moving back to common potentially in a few weeks time.
> >> What about static memory code? With the recent Oleksii code movement, the inline
> >> helpers like allocate_static_memory() became unreachable when the feature is
> >> disabled and the main purpose for helpers was to avoid ifdefery.
> > 
> > Sorry I am not sure which part you are referring to.
> With the current code, allocate_static_memory(), assign_static_memory_11()
> callers (that were moved to common) are protected with #ifdef. This causes the
> helpers defined in case CONFIG_STATIC_MEMORY is not defined to be unreachable
> (see static-memory.h).

At a high level I agree with Julien, this is the kind of feature that
should be common. In fact, I would even say that I consider the related
device tree bindings common.  But looking at the code movements and the
#ifdef's, I think that as of today, this patch series is improving
things.

So my Ack was not at all a statement to say that the feature should be
Arm-only. To the contrary. But it was only a practical consideration
about the state of the code right now.

I do think that RISC-V should gain support for it at some point and we
should share the code as much as possible.

