Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48D446B14
	for <lists+xen-devel@lfdr.de>; Sat,  6 Nov 2021 00:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222675.384994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj8Ev-0004O9-AU; Fri, 05 Nov 2021 23:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222675.384994; Fri, 05 Nov 2021 23:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj8Ev-0004M5-73; Fri, 05 Nov 2021 23:03:17 +0000
Received: by outflank-mailman (input) for mailman id 222675;
 Fri, 05 Nov 2021 23:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj8Et-0004Lz-SX
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 23:03:15 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d6ae631-3e8c-11ec-a9d2-d9f7a1cc8784;
 Sat, 06 Nov 2021 00:03:14 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EE6961159;
 Fri,  5 Nov 2021 23:03:12 +0000 (UTC)
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
X-Inumbo-ID: 8d6ae631-3e8c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636153392;
	bh=ZioTLqifP4tPK+oG+UaCqA3huIsBqj9rTnTJB+WNAzw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X03523abx9R3xnTkVj2nYxoVAVO5igBHFfGideMW/eqkrfugII3G+lEPFqi09Qqfe
	 m0nFAxI2bDRShmHG8+r7aAAZbr31y7tPxipDJGxTya+2jV9vQLlhJgBCtjBN0Of/jG
	 0+knts4f3shsgeK0wcXhRcT+ZsT/C9gABjsA4MGE5U1KS4S96QGoxdLOJqfzfCQ+lu
	 z3SzkQv/Pync//HX+XO6wngU9s2yw2N/CXHHCYjcIcJFTqVRN25nGaDSXYyzSZy4G3
	 vzfBfTjahG8HOL6K+pgG/JILBM4G+pYnwEneSPZuWJv+7ksADqFyLqRLOkV7LJMI+4
	 I2hfsp+EzQujw==
Date: Fri, 5 Nov 2021 16:03:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Bertrand.Marquis@arm.com
Subject: RE: static-mem preventing dom0 from booting
In-Reply-To: <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2111051554000.284830@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop> <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com> <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Nov 2021, Stefano Stabellini wrote:
> The scenario is extremely simple; you can see the full device tree
> configuration in the attachment to my previous email.
> 
> - dom0
> - dom0less domU with static-mem
> 
> That's it! So basically it is just a normal dom0 + dom0less domU
> configuration, which already works fine, where I added static-mem to the
> domU and suddenly dom0 (not the domU!) stopped working.

I did some more debugging today and I found the problem. The issue is
that static-mem regions are added to the list of reserved_mem. However,
reserved_mem is automatically assigned to Dom0 by default at the bottom
of xen/arch/arm/domain_build.c:handle_node, see the second call to
make_memory_node. Really, we shouldn't give to dom0 static-mem ranges
meant for other domUs. E.g. the following change is sufficient to solve
the problem:

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 88a79247cb..dc609c4f0e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -891,6 +891,9 @@ static int __init make_memory_node(const struct domain *d,
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
+        if ( mem->bank[i].xen_domain )
+            continue;
+
         dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
However, maybe a better fix would be to purge reserved_mem of any
xen_domain items before calling make_memory_node.


I found one additional issue regarding is_domain_direct_mapped which
doesn't return true for static-mem domains. I think we need to add a
direct_map bool to arch_domain and set it for both dom0 and static-mem
dom0less domUs, so that we can change the implementation of
is_domain_direct_mapped to:

#define is_domain_direct_mapped(d) (d->arch.direct_map)

