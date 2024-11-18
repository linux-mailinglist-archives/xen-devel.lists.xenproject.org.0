Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E19D1C0C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 00:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839583.1255370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBW8-0000L1-LE; Mon, 18 Nov 2024 23:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839583.1255370; Mon, 18 Nov 2024 23:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBW8-0000Ip-Ib; Mon, 18 Nov 2024 23:50:52 +0000
Received: by outflank-mailman (input) for mailman id 839583;
 Mon, 18 Nov 2024 23:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5+n=SN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDBW7-0000Fs-9q
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 23:50:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec0d5a9-a607-11ef-a0c9-8be0dac302b0;
 Tue, 19 Nov 2024 00:50:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE3F0A41FD1;
 Mon, 18 Nov 2024 23:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A91C4CED0;
 Mon, 18 Nov 2024 23:50:44 +0000 (UTC)
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
X-Inumbo-ID: eec0d5a9-a607-11ef-a0c9-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImVlYzBkNWE5LWE2MDctMTFlZi1hMGM5LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTczODQ4LjE3NTY1Nywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731973846;
	bh=M5WJtvl+fX4m4GDCSq7+VoeY9IZRLpNFjo1wiW7oCck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cVn68sDR7ObPo15zoZJjdpJPL+zQ1l3acD+/ZTh5gA7rShaEo4Z6DMvaBx5jXNh+E
	 HPtD6VHkBtr92VkLaX4uMlXkF974s9rII6MGIpui+QMA/SM9/SW7ebj707P/k1lEWE
	 oAw02h8HwmzsS8jTpAy+LzvXsuqcMGVSYZIXyeBEWWIKHN8GPFY1jI1UvDK8QdRc2T
	 VBUQ712eWHlA/Vn9kcVXjnqkeACc133DsSXJR/ltXWM0cEz5N7XBz5bcY4k/NIMZTu
	 fzD0ypO6ApapwEMN+xRwiYBlPcsGmxs1846W6kbFYPS2JYK5kCGNtyY3xlbkrtB/Xx
	 I6AllIacgQsyA==
Date: Mon, 18 Nov 2024 15:50:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    alessandro.zucchelli@bugseng.com, simone.ballarin@bugseng.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, julien@xen.org, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: increase identifiers length to 64
In-Reply-To: <eeaec89c4d4aa8abd738d8af7d068a19@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2411181550020.1160299@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop> <782b24a0-a960-4667-a183-1e270841d2a8@suse.com> <eeaec89c4d4aa8abd738d8af7d068a19@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Nicola Vetrini wrote:
> On 2024-11-18 09:58, Jan Beulich wrote:
> > On 16.11.2024 01:23, Stefano Stabellini wrote:
> > > Currently the identifiers characters limit is arbitrarily set to 40. It
> > > causes a few violations as we have some identifiers longer than 40.
> > > 
> > > Increase the limit to another rather arbitrary limit of 64. Thanks to
> > > this change, we remove a few violations, getting us one step closer to
> > > marking Rules 5.2 and 5.4 as clean.
> > > 
> > > Also update the ECLAIR config that was actually set to 63 as character
> > > limit.
> > 
> > What I don't really understand: With the Eclair config already having said
> > 63, how come we did see patches aiming at dealing with the limit being just
> > 40? IOW - how would those (supposed) issue even have been spotted.
> > 
> 
> Hi Jan,
> 
> the issue was spotted by Andrew, and therefore we made the patches to align
> the configuration with the limits chosen by the project, which makes those
> violations appear. It is also possibile to do it the other way around (align
> the rst with the ECLAIR configuration), which spares the need for additional
> deviations.
> 
> In that case, I agree that 63 is better than 64.

Actually, I was wondering the same question as Jan when writing this
patch. Thanks Jan for asking explicitly and thanks Nicola for
clarifying. I'll resend using 63.

