Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D46DB0CEAA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051881.1420322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0ib-0005Wu-EJ; Tue, 22 Jul 2025 00:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051881.1420322; Tue, 22 Jul 2025 00:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0ib-0005Tn-B0; Tue, 22 Jul 2025 00:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1051881;
 Tue, 22 Jul 2025 00:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ue0iZ-0005Th-L1
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:18:51 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe6e1a2-6691-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:18:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E6AD45199;
 Tue, 22 Jul 2025 00:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA82C4CEF5;
 Tue, 22 Jul 2025 00:18:45 +0000 (UTC)
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
X-Inumbo-ID: 6fe6e1a2-6691-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753143527;
	bh=Se3gnsWZYt001Jeh4Wj0UwGyduInMljJevvPGX/fAhg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sCdbz9jnk4Gjvj8gw415m54EDH1Jbz9uvNiABylyiCrdELJanchYw4KA8FE2aRRre
	 VFrwAiJYceHc9cSuHzaTRXb5eWNUd4EjrRZdRfOPjMkKS5pinveyeCp6Y3h2/C+k14
	 +jcSssPomP1V2tF5qs3StO6WCc1K+s1A3kGiW3JfOh01URGn815xd213k80SicdmQw
	 x7sF0Llg8n0PPkK4XoW8Zqf9R/DNEtPSRvgqVlCpwxP+CH/YZSwadnVbBZiGlFjSiX
	 nxztvMzwQfoobfkRMDz1wv7j89iXmRuV7SNDX2J21pVHwQ9LdftbKcxxJjF1U2bH/P
	 y0PBhHdVcBvkA==
Date: Mon, 21 Jul 2025 17:18:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v8 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to
 include device-tree/
In-Reply-To: <20250722000525.7247-12-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507211718360.7043@ubuntu-linux-20-04-desktop>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com> <20250722000525.7247-12-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> This allows bootfdt.c and device-tree.c to be usable without
> CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


