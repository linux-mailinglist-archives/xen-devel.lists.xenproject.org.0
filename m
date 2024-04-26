Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B48B428D
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713161.1114211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UmO-0005Xv-EE; Fri, 26 Apr 2024 23:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713161.1114211; Fri, 26 Apr 2024 23:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UmO-0005Uj-BB; Fri, 26 Apr 2024 23:14:56 +0000
Received: by outflank-mailman (input) for mailman id 713161;
 Fri, 26 Apr 2024 23:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0UmM-0005Ub-2h
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:14:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c79d449d-0422-11ef-b4bb-af5377834399;
 Sat, 27 Apr 2024 01:14:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 694F4CE1D47;
 Fri, 26 Apr 2024 23:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A294EC113CD;
 Fri, 26 Apr 2024 23:14:46 +0000 (UTC)
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
X-Inumbo-ID: c79d449d-0422-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714173287;
	bh=+NftBlS2Jyr/rhT6dPViUmRMbn6g4b3neRvetH/hXoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OE+wpVIcLaN4aEc7aSYP7qVpFJHL3z1MDNcKQXGI7B5uObB9iLxquxlTbuP7p1acy
	 nbmi73e40ePRoWLmwoPkUPLF1cxBSfwtKr6f0wxAnwU/5egMqljfhQeQIwDYtvI792
	 wGW2iuyL1MJOMyYvg8wDC1OP3V/T49ogbCbdBgQVDxiZTNHMbPGcJzIoqEPqKS6UxZ
	 YK15M1ymI+3B2oKIH/O2odo14prr7dZZBwjnahZkssTAOk5E3azXLLDutGYlkk36N4
	 y0r/ixIpVzSedCjaXZq/22acZPTMCOOqqqiccV1/lfQ3E39kvwI6fIb4NGEOiM4ryV
	 6SSm60uBRd56A==
Date: Fri, 26 Apr 2024 16:14:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 6/7] x86/MCE: guard call to Intel-specific
 intel_get_extended_msrs()
In-Reply-To: <6769d564725912245cb83aaf7543933b4b5fb80d.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261614290.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <6769d564725912245cb83aaf7543933b4b5fb80d.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Add check for CONFIG_INTEL build option to conditional call of this routine,
> so that if Intel support is disabled the call would be eliminated.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


