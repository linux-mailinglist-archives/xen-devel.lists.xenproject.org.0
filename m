Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80896E618
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 01:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791469.1201351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLbv-0001qR-Qp; Thu, 05 Sep 2024 23:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791469.1201351; Thu, 05 Sep 2024 23:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLbv-0001nG-O7; Thu, 05 Sep 2024 23:09:55 +0000
Received: by outflank-mailman (input) for mailman id 791469;
 Thu, 05 Sep 2024 23:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smLbt-0001n6-ST
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 23:09:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f41c2ce7-6bdb-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 01:09:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4BB15C5745;
 Thu,  5 Sep 2024 23:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0867C4CEC3;
 Thu,  5 Sep 2024 23:09:48 +0000 (UTC)
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
X-Inumbo-ID: f41c2ce7-6bdb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725577790;
	bh=/bJLJeR6TMxBXBZP0OQuYhvp9FwLZWXDsba7SVWfTus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ERjYUjdrHIjh7jUkuF+oy7zhkp2bP9KZszSnFyDYW6L0xzmi52n24CeabPBpAvfbP
	 0DMUKWYpoItbYaoOHHdmL4blNJHXTaJ+NDU0JJkddSXU8BRkghHZ2jP05HObyzgJCZ
	 gSyPetNOnl1/4/n4kM+knY3FipELJ5IZ+TcQsyRQWb35aUWIJDmqhI2jR6wuzPILaQ
	 dCCa+86Ro9CcLGG6ZkbxWRIPO+nOy5nt6GJcJenb81f+xJwawkwGXEhztLlWFcRf5G
	 diw/A8aT/9zEp7CTVMZtkwIRyBGdePPXgA48+OEvXFy1r2NImD1MsqWGXENSutLFrx
	 UCnGDT0LT1tPA==
Date: Thu, 5 Sep 2024 16:09:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 4/5] xen/bitops: Implement hweight64() in terms of
 hweight{l,32}()
In-Reply-To: <20240904225530.3888315-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2409051609140.53815@ubuntu-linux-20-04-desktop>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com> <20240904225530.3888315-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Sep 2024, Andrew Cooper wrote:
> ... and drop generic_hweight{32,64}().
> 
> This is identical on all architectures except ARM32.  Add one extra SELF_TEST
> to check that hweight64() works when the input is split in half.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


