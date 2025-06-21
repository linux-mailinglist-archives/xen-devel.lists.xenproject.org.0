Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7BAE26DE
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 03:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021419.1397414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmyu-0002nH-FT; Sat, 21 Jun 2025 01:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021419.1397414; Sat, 21 Jun 2025 01:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmyu-0002lD-CQ; Sat, 21 Jun 2025 01:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1021419;
 Sat, 21 Jun 2025 01:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSmys-0002l7-T4
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 01:25:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95b8b40c-4e3e-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 03:25:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CABC4A30D;
 Sat, 21 Jun 2025 01:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C93C4CEE3;
 Sat, 21 Jun 2025 01:25:11 +0000 (UTC)
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
X-Inumbo-ID: 95b8b40c-4e3e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750469114;
	bh=dbLRfmy/B/+nlOeWoqyXelG/0Ds1TdixPIfOFAx/GgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QF1aF2iAy0RKWnB59E6zlF71aFfY6iSyLcPa7uQge+gZAfwLQj5hRZHLl2JCmZrTx
	 5JtRbfFISGRWKiSXyGyJzGcZ3PaO0PFOUpXtdQ5CoZTkZsOJHcJYWs3X5lcSk5HkVw
	 DaqywLFvca2vaJ0Tl298GdBTjZ+WYv6IeVtjqjfiMaDli3xTmzjDzLeWnli2S763ep
	 IeaQLufqVsjtxrlM2qPrcyWAgdcy1OyxXo6DwmidulQ+0k/U1ShrUtx2wZZsFHH1IR
	 9/fpWrUR8qkiPrGRjsVGPc+YNTJTjnZ3wu2hRMw9AFyb4+ndYYAk70CW424rcvkeGy
	 CKu5Vef+1n3Bw==
Date: Fri, 20 Jun 2025 18:25:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
In-Reply-To: <20250620182859.23378-11-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201823190.2978375@ubuntu-linux-20-04-desktop>
References: <20250620182859.23378-1-agarciav@amd.com> <20250620182859.23378-11-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Alejandro Vallejo wrote:
> Moving forward the idea is for there to be:
>   1. Basic DT support: used by dom0less/hyperlaunch.
>   2. Full DT support: used for device discovery and HW setup.
> 
> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
> DOM0LESS_BOOT is left to describe (1).
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

This patch is a plain HAS_DEVICE_TREE -> HAS_DEVICE_TREE_DISCOVERY
search and replace. It looks consistent and correct.

I am not sure others will be happy with the name DOM0LESS_BOOT for (1)
but if not the part of the commit message mentioning DOM0LESS_BOOT
should be changed. Aside from that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

