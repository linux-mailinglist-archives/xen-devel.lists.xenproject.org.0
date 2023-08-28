Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D778BA76
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 23:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591783.924284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakA3-0002wj-Rq; Mon, 28 Aug 2023 21:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591783.924284; Mon, 28 Aug 2023 21:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakA3-0002uP-Ok; Mon, 28 Aug 2023 21:52:39 +0000
Received: by outflank-mailman (input) for mailman id 591783;
 Mon, 28 Aug 2023 21:52:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakA1-0002tw-KP
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 21:52:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e64111-45ed-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 23:52:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D9C63113;
 Mon, 28 Aug 2023 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EB8C433C8;
 Mon, 28 Aug 2023 21:52:31 +0000 (UTC)
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
X-Inumbo-ID: 31e64111-45ed-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693259553;
	bh=TxeMUgdT4N+g4UVMjRoWDS6YAs56uX+le4sa7r70bXM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kbBZ/+ivLLHtpVWRkh7sNQOyuqcPcJfV1UmoMj8g6WphaMkyC8gXeFwLMRDZFRSko
	 SDA3VCEdHa3Ixcwf5mI3jvlzMEDU9FFxn+nfiopREzYJWoK6WbMGObyqWqA6O1ilKn
	 V48emagiKiC2JGYRZwXUVY+XFi9Je+W3bfJa8ud1CT7AA1Ub+F4822DX+Ew2s2IJkm
	 ADeqbM9ajyUrvIk0u1FeNf9+iUOi0j59bfuDxS52zOWZPSI3zRDFZaKZZedqggq59g
	 OaopaYCQGNu8PDDhczMUIMRkin7NOjFAw6XkLnfFP4tD/P/HACelU5z1Pgcvu5tqxE
	 ryPoZB8Jow6WA==
Date: Mon, 28 Aug 2023 14:52:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, roger.pau@citrix.com
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <a7c68b27-4ad7-175d-2c62-85a0f1246357@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308281440480.6458@ubuntu-linux-20-04-desktop>
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com> <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com> <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com> <alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop>
 <a7c68b27-4ad7-175d-2c62-85a0f1246357@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Jan Beulich wrote:
> On 26.08.2023 00:21, Stefano Stabellini wrote:
> > Coming to unsigned int, it should be 32-bit on all supported arches,
> 
> But this isn't a requirement, even if we're using "unsigned int" in the
> C declarations / definitions: If "unsigned int" was wider, all we'd
> demand is that hypercall entry code (likely written in assembly anyway)
> zero-extend incoming values suitably to fit whatever "unsigned int" is.
> Which is no different to Andrew (aiui) suggesting to use "unsigned
> long" instead: That'll too require suitable zero-extension up front.

What you wrote assumes that "unsigned int" can only be 32-bit or wider,
such as 64-bit. However, I think that by the C standard there is no
guarantee. For instance, it could be smaller, e.g. 16-bit.

There is also another assumption: if "unsigned int" was indeed 64-bit we
could detect that a guest is 32-bit, assume that a 32-bit guest would
interpret "unsigned int" as 32-bit and only pass 32-bit, and zero-extend
the rest.

I don't think it is a good idea to make unwritten assumption about the
"unsigned int" size of the guest and as you know different OSes can
assign different sizes to the same C type.

This is why I think that in general if we wanted to use non-fixed-width
as part of an ABI we would need to do a better job at writing down all
of these assumptions. Without anything written down, it is easier to use
fixed-width types.

That said, in this case, we have been using "unsigned int" for years and
it is fixed width for all the arches we support, so I think we should
continue to use it for consistency, but ideally also help improve the
documentation to write down all the unwritten assumptions we rely on.


> > so
> > it is down to consistency, which is a bit arbitrary. We have quite a
> > good mix of unsigned int and uint32_t in hypercall-defs.c, specifically:
> > 10 uint32_t
> > 32 unsigned int
> > 
> > By popular vote, I would go with unsigned int. So, I would keep the
> > patch as is.
> 
> Well, I wouldn't quite say "as is": It clearly wants splitting for the
> two entirely unrelated changes. Then the uncontroversial part can go
> in right away, while we settle on the controversial aspect.

OK from me


> As to "popular vote" - ./CODING_STYLE also matters here, and favors
> non-fixed-width types over fixed-width ones. And as per above imo
> there's no technical reason to use fixed-width types here. Yet I
> understand Andrew takes a different perspective ...

I think internal interfaces and public ABIs can have different policies
and I understand the point that a public ABI should use only fixed-width
types. That's not where we are today, but I would understand that
argument.

