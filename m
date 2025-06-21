Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE0AE26DF
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 03:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021427.1397424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSn1B-0003KG-SC; Sat, 21 Jun 2025 01:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021427.1397424; Sat, 21 Jun 2025 01:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSn1B-0003HX-P5; Sat, 21 Jun 2025 01:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1021427;
 Sat, 21 Jun 2025 01:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSn1A-0003HR-8O
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 01:27:40 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4f0060-4e3e-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 03:27:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 213266155F;
 Sat, 21 Jun 2025 01:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EA4C4CEE3;
 Sat, 21 Jun 2025 01:27:35 +0000 (UTC)
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
X-Inumbo-ID: ea4f0060-4e3e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750469256;
	bh=qz3aKe3XCaGcdU/ia8Vj+Al/SgLZ9sMMG88japCP4zs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EMv2npJbf4NTxJ3oEnhm4j8wqBCIQ851zqLewDPv6rbwqCE95/hRjnfvd22WBGJ/4
	 ScQu1hxV3VSFmoJCA/YKw1HkKRzcGXQeIXr49ax21qZjBv4NyXHQkxO1CRqqSihGBS
	 zXPHOacuLVhWVqS5ITCsIua6IlCr+NB4ICDC2F6RImqH2YAeAFqt2cyCT3LexURT+q
	 DCsO9brQ+7VTwojyonldWNTmRETN0p0O+9s+bL9pSsArEbyO2Ojk11SotR0OSDvSTm
	 TK6axJmLZdz2VNPopVi7sZOkj4SQ5Z3CpK7/C6PXstStlMW9ZpvSW5GBEKjhHuypai
	 y5AqRvAQLTSoA==
Date: Fri, 20 Jun 2025 18:27:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 11/12] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
In-Reply-To: <20250620182859.23378-12-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201825510.2978375@ubuntu-linux-20-04-desktop>
References: <20250620182859.23378-1-agarciav@amd.com> <20250620182859.23378-12-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Alejandro Vallejo wrote:
> device-tree.c stops requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY and may
> function with DOM0LESS_BOOT.
> 
> Without this, there's a clash with x86's definition of device_t. Because
> x86 doesn't discover devices in the DT it can simply skip the code
> to do so during the unflattening phase.
> 
> Not a functional change on architectures that currently use these files,
> as they already select CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Same comment about renaming DOM0LESS_BOOT from this commit message if
there is a decision to rename that option. Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


