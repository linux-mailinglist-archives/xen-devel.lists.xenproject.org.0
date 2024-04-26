Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA18B3FF6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713087.1114080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0R1E-0002nh-B1; Fri, 26 Apr 2024 19:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713087.1114080; Fri, 26 Apr 2024 19:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0R1E-0002lo-85; Fri, 26 Apr 2024 19:14:00 +0000
Received: by outflank-mailman (input) for mailman id 713087;
 Fri, 26 Apr 2024 19:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0R1C-0002li-Ly
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 19:13:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d20ff68-0401-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 21:13:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3B6BDCE1B30;
 Fri, 26 Apr 2024 19:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E54EC113CD;
 Fri, 26 Apr 2024 19:13:44 +0000 (UTC)
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
X-Inumbo-ID: 1d20ff68-0401-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158825;
	bh=CRLeO6zxjZqpAiQtpFHgT+LydW5XD3RG7MvygP9KyiU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ot72C4819KADdV9kDFd1AIkF9zccq+5/rl9grfMSTgrqkbMo2/p6dHPfwFva3+9UI
	 mTMe40u7wgPi1qViBBlQo8zdb87bsNCYnZBgiQzgTcww6dWhywqMML8qZsl2bkjVcM
	 HAq1mTbsPTopxKQVFKE/0bjjz0azf2cfbKSvsEdFDkc69eBtbo+b2GJENoKURLGH5R
	 URakt9CsmphKfuxcv2YPOCudiUcFTUuDa4Ew1HilGZ1Gc6dRCTrVr7tH2H6Ja3Noll
	 KVK3bDxxLwflFPGCR6Ad44X4IAqtLa1VpNcynsJl0sgx5KpzPmGcSCRxsj8OLs28hV
	 BN9scdTa2kNNg==
Date: Fri, 26 Apr 2024 12:13:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com, 
    michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, edgar.iglesias@amd.com, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 1/1] xen/arm64: entry: Add missing code symbol
 annotations
In-Reply-To: <012320e9-c63a-450f-8e91-ebe13352e6d7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404261213300.3940@ubuntu-linux-20-04-desktop>
References: <20240415231541.4140052-1-edgar.iglesias@gmail.com> <20240415231541.4140052-2-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop> <012320e9-c63a-450f-8e91-ebe13352e6d7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Apr 2024, Jan Beulich wrote:
> On 26.04.2024 01:13, Stefano Stabellini wrote:
> > On Tue, 16 Apr 2024, Edgar E. Iglesias wrote:
> >> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >>
> >> Use the generic xen/linkage.h macros when and add missing
> >                                         ^ when what?
> > 
> >> code symbol annotations.
> >>
> >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > 
> > I am looking at the implementation of FUNC and as far as I can tell
> > there is no change compared to ENTRY. So from that point of view we are
> > good. I wonder if we should keep using "ENTRY" because it is nice to
> > mark explicitely the entry points as such but at the same time I am also
> > OK with this. I'll let the other ARM maintainers decide.
> 
> Just to mention it: ENTRY should go away (and hence why PPC and RISC-V had
> it dropped already, while x86 has patches pending to reduce its scope
> enough), not the least to finally allow the oddity near the top of xen.lds.S
> to go away.

I didn't realize that. OK, understood.

