Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61FABA5FD
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 00:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987618.1372812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3ip-0004ao-6e; Fri, 16 May 2025 22:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987618.1372812; Fri, 16 May 2025 22:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3ip-0004ZK-27; Fri, 16 May 2025 22:40:07 +0000
Received: by outflank-mailman (input) for mailman id 987618;
 Fri, 16 May 2025 22:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG3in-0004Oq-PH
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 22:40:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b380dd27-32a6-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 00:40:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B715B49F77;
 Fri, 16 May 2025 22:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5667CC4CEE4;
 Fri, 16 May 2025 22:39:58 +0000 (UTC)
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
X-Inumbo-ID: b380dd27-32a6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747435199;
	bh=hxKldC/IX0UM/Tbsk9wZtZvxsrn9kaAS4bw+7UafQf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bmVN9nwsreVnL/ILLgfsJA4ztBq08uIVjob+Pie+cR5aupMXqV7eKxXgFyoJeZTCq
	 BydBqH8dwIjZJXA65AvnoiWJR/bhk6y80ufoCrFtM0Xy1zZGOWQdPRG2QWsv+d9zRG
	 Ds/p5t/f/N6HfengEnXc+bhdyEfmSshZ+0Ugm6Dqk58PxICdWimRtGLAZoUqyCxnsg
	 OxpgULWRodA7Mvxh5LjphLauQTd1oTcqc7LUYycw3gbniwYCKVVAnRgj65a0ThlJki
	 3Mn9yh3akEWD3MskKVQtMN3LE2gfAM2On2IT+SYMDWNfAWgvERixGRGdnWxs5UpHUv
	 594MlM1kbyFlg==
Date: Fri, 16 May 2025 15:39:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] xen: Introduce asm inline and use it for BUG_FRAME
In-Reply-To: <01498be0-979a-4b89-a70b-050ddb5ad1b3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505161539480.145034@ubuntu-linux-20-04-desktop>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com> <20250515195549.3703017-2-andrew.cooper3@citrix.com> <01498be0-979a-4b89-a70b-050ddb5ad1b3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Jan Beulich wrote:
> On 15.05.2025 21:55, Andrew Cooper wrote:
> > Compilers estimate the size of an asm() block for inlining purposes.
> > 
> > Constructs with embedded metadata (BUG_FRAME, ALTERNATIVE, EXTABLE, etc)
> > appear large, depsite often only being a handful of instructions.  asm
> > inline() overrides the estimation to identify the block as being small.
> > 
> > This has a substantial impact on inlining decisions, expected to be for the
> > better given that the compiler has a more accurate picture to work with.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

arm:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

