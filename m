Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F839A753AB
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931378.1333742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJxY-0002di-NE; Sat, 29 Mar 2025 00:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931378.1333742; Sat, 29 Mar 2025 00:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJxY-0002c3-K7; Sat, 29 Mar 2025 00:22:00 +0000
Received: by outflank-mailman (input) for mailman id 931378;
 Sat, 29 Mar 2025 00:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJxX-0002XO-6M
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:21:59 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10e2c2f-0c33-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:21:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8EEE3A426E4;
 Sat, 29 Mar 2025 00:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF39C4CEE4;
 Sat, 29 Mar 2025 00:21:50 +0000 (UTC)
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
X-Inumbo-ID: d10e2c2f-0c33-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743207713;
	bh=WnF8sxgVwrxXVeSOjHnb/6TmlKUOcRZyolJhh7aPApg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V5huz+Ht0ZAWql8OxzSpQTWTHIRpqPX14LIel5K1UmoSmdPdMeQolBpalXYkgN78w
	 nKFKXTTaHyU3kk5CbIworcdlNnIleMJCoE/IiaZWrXpYaiEsXQjNR8QDRw7Y4ZoFVb
	 uPS4Z0c8Vjv1Ghil0iqQk9b6PAgEwLFkUbE30dFEXQJFlKBefXYW8QlZ3xH/zufBHS
	 jBSqyymh7svDhBh2ZG99G5IPzSec29fCKH6fJotWIFTMtVjsymluWVp/359xfHVY6I
	 LeqrZLtIZAXu+qhAnY36/k4RXBOAhNg6lOhswAf50hIp391VBAlkMhzYHNub96FRbs
	 C+iC1ElXxO8sQ==
Date: Fri, 28 Mar 2025 17:21:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
In-Reply-To: <20250326055053.3313146-19-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281721390.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-19-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> Function arch_do_sysctl is to perform arch-specific sysctl op.
> Some functions, like psr_get_info for x86, DTB overlay support for arm,
> are solely available through sysctl op, then they all shall be wrapped
> with CONFIG_SYSCTL
> Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
> we put the guardian in Makefile for the whole file.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


