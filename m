Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F5AFBD75
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035795.1408162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtLK-0005rA-Az; Mon, 07 Jul 2025 21:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035795.1408162; Mon, 07 Jul 2025 21:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtLK-0005oj-7o; Mon, 07 Jul 2025 21:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1035795;
 Mon, 07 Jul 2025 21:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtLI-0005od-M7
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:25:40 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed599ad4-5b78-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 23:25:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC65E440D7;
 Mon,  7 Jul 2025 21:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D00AC4CEE3;
 Mon,  7 Jul 2025 21:25:36 +0000 (UTC)
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
X-Inumbo-ID: ed599ad4-5b78-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751923537;
	bh=Wx/Jif0otl9Vk3NmvuDs7UZIWLQ2rCSoYuWP9CikWGg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j2n39FHHlB7/yv/NjTr/jJDJfELKItcgf2f9LF6O3Ol2GKjs/iDDwpIofqbrh8ihd
	 mCysZ/cC2PW/wS5/D4rPD+oRG4KbOJrASSHQkHiK1Bi/364IxE9enwzCFyUarolp0t
	 Tvq1UPci7wDxiuGq+1RTFuwr1MWZEITFysSiloDYw9RIyRdIesDqSnJzzazb30im4s
	 aDH7tHrNeVlWIoem3VEcCLqyzNIOKA8Vu6CQScEFGr0i0p1B4NltLvWLGQ17ea2NW5
	 iXF/sAhk7pu2nd0Qx9AvScqFX1+ZAi8C1rCp3cfxzNpG0ctPq9flShzGfb9ByKxSzl
	 jqPriMX4z02tA==
Date: Mon, 7 Jul 2025 14:25:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 3/5] x86/irq: address violation of MISRA C Rule 5.5
In-Reply-To: <70628c7f-5d9b-43d2-8fc6-da79a62d2fc2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507071422160.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com> <0e289fdb9187902d59dce3fc7368facf5eafa2ff.1751659393.git.dmytro_prokopchuk1@epam.com> <70628c7f-5d9b-43d2-8fc6-da79a62d2fc2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Jan Beulich wrote:
> On 04.07.2025 22:39, Dmytro Prokopchuk1 wrote:
> > Address a violation of MISRA C:2012 Rule 5.5:
> > "Identifiers shall be distinct from macro names".
> > 
> > Reports for service MC3A2.R5.5:
> > xen/include/xen/irq.h: non-compliant function `pirq_cleanup_check(struct pirq*, struct domain*)'
> > xen/include/xen/irq.h: non-compliant macro `pirq_cleanup_check'
> > 
> > The primary issue stems from the macro and function
> > having identical names, which is confusing and
> > non-compliant with common coding standards.
> > 
> > Change the function name by adding two underscores at the end.
> > 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> I'm not going to NAK this, but I dislike the transformation done. The aliasing
> in this case was intentional, to avoid any caller appearing that would bypass
> the macro. Yes, the double underscores will also stand out (as much as the
> parenthesization that would have been needed to override the protection), but
> still ...

Maybe you can suggest a different name? Looking at the diff, this patch
also seems OKish.

It is possible but difficult to deviate specific instances like this: if
a SAF in-code comment works, then great, otherwise we have to resort to
a regex which makes thing harder to maintain.

Unless a SAF in-code comment works, I think this patch is the best way
to go.

