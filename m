Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF2440D768
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 12:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188332.337464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQoeS-0005gn-Po; Thu, 16 Sep 2021 10:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188332.337464; Thu, 16 Sep 2021 10:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQoeS-0005ey-MZ; Thu, 16 Sep 2021 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 188332;
 Thu, 16 Sep 2021 10:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SzYQ=OG=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1mQoeR-0005el-5U
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 10:29:55 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d14273e-8dc6-4da1-a940-28d85bde6683;
 Thu, 16 Sep 2021 10:29:53 +0000 (UTC)
Received: from zn.tnic (p200300ec2f11c600b77f9e345fbfb487.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:c600:b77f:9e34:5fbf:b487])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1E3DB1EC01DF;
 Thu, 16 Sep 2021 12:29:48 +0200 (CEST)
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
X-Inumbo-ID: 1d14273e-8dc6-4da1-a940-28d85bde6683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1631788188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=EXpt8wshiO7ImZN+Zx5zekJn4i6gD7QW4fNVEzzyMB0=;
	b=jdKCZeacNO/kKHUWytZdn5Fjo98CAZEQp+DgI7I37Kq2atS39x82DLxp+PzrfJ6w/OMpOx
	2kRvyfMEU9NGc0BdDMyQFTyKr41mebgtFFj1rEwSkta4odAJx3N6y0DSrQaVrO5hfk6wCD
	w9bRZIOCbxUdY5+wJ29B3EVPzm2K9/U=
Date: Thu, 16 Sep 2021 12:29:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUMclVZ5uxKV/bRZ@zn.tnic>
References: <20210914094108.22482-1-jgross@suse.com>
 <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
 <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>
 <YUHSRKubsGT2Jvur@zn.tnic>
 <YUMJx2ckLlWKi3VF@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUMJx2ckLlWKi3VF@kernel.org>

On Thu, Sep 16, 2021 at 12:09:27PM +0300, Mike Rapoport wrote:
> I think the first sentence about reserving memory before memblock
> allocations are possible is important and I think we should keep it.

I expanded that comment this way:

        /*
         * Do some memory reservations *before* memory is added to memblock, so
         * memblock allocations won't overwrite it.
         *
         * After this point, everything still needed from the boot loader or
         * firmware or kernel text should be early reserved or marked not RAM in
         * e820. All other memory is free game.
         *
         * This call needs to happen before e820__memory_setup() which calls the
         * xen_memory_setup() on Xen dom0 which relies on the fact that those
         * early reservations have happened already.
         */

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

