Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD1AAE26D3
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 03:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021406.1397394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmmn-0000SC-9M; Sat, 21 Jun 2025 01:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021406.1397394; Sat, 21 Jun 2025 01:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmmn-0000Pk-5u; Sat, 21 Jun 2025 01:12:49 +0000
Received: by outflank-mailman (input) for mailman id 1021406;
 Sat, 21 Jun 2025 01:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSmml-0000PY-Pv
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 01:12:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b41ac5-4e3c-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 03:12:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 847DA5C54B1;
 Sat, 21 Jun 2025 01:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26708C4CEE3;
 Sat, 21 Jun 2025 01:12:35 +0000 (UTC)
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
X-Inumbo-ID: d1b41ac5-4e3c-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750468356;
	bh=F+V4eG2IqR+REYm7zD75FLb9J+diHbCF/rbj8Ioxmfc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kw3CxhjKvqvKnOB5VpzuNbgnnhMqayUtjAQtQxESOe/HPbBvB4qdBIOl9AiKsLvNu
	 fSdx0c07K1uh9R5+gGf9CFitUoTruSR/QFVy/z4wxWP8QitGEvfRBEfmAtVz+Dh78R
	 V9jwl9GXiHywIQLixROL+aw8YRmqmcgpzV0CsBRBpMXSb51UTAQCOVCLACDn68t5z1
	 6mnXwETNhJVhz91N6j4gj1KT1sjO/klpPMkSo3Sh3/jWYrdkkSmlXKBYvWKhf9YIdc
	 clyjDAQx8XJWWFMA/V+qBV51V3XCEtkkAXWix84rUA85PishWPyPjgObiJ/fnLQxvK
	 dl4I/ZRrZhL+Q==
Date: Fri, 20 Jun 2025 18:12:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 03/12] x86: Replace arch-specific boot_module with
 common one
In-Reply-To: <20250620182859.23378-4-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506201812230.2978375@ubuntu-linux-20-04-desktop>
References: <20250620182859.23378-1-agarciav@amd.com> <20250620182859.23378-4-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent,
> and with "struct boot_module" already in common code it makes perfect
> sense to merge them. In order to do so, add an arch-specific area for
> x86-specific tidbits, and rename identical fields with conflicting
> names.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


