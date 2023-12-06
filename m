Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF5806590
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648815.1012826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiSG-0000JO-Nv; Wed, 06 Dec 2023 03:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648815.1012826; Wed, 06 Dec 2023 03:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiSG-0000HQ-Jx; Wed, 06 Dec 2023 03:20:08 +0000
Received: by outflank-mailman (input) for mailman id 648815;
 Wed, 06 Dec 2023 03:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiSF-0000HD-4t
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:20:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a16d4c5-93e6-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 04:20:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 96AE2B81D12;
 Wed,  6 Dec 2023 03:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEEBC433C7;
 Wed,  6 Dec 2023 03:20:03 +0000 (UTC)
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
X-Inumbo-ID: 5a16d4c5-93e6-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832805;
	bh=FXYY164mllVjQqqAuvBD21NnwB3w7xE6E4IfS87ntQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DI4dEnbQ0k/tWU8u9QmERY04LhLDJCL/RMzZcL+yBEoxxCbdHgnlyaKibLnSH4eMW
	 ykYu1Y8osw/P+GNu2986rdxjHCIAemcg0B2qnkJpnp/L7+Wa1yPrZH9P34mXIK7YQ8
	 xCOlG9IHrHhaBdpjn12BHMaKOb1tHfAWg6xCALQXBe6VxNba7SvSPbP3FwXW9S/I2n
	 W41VLgZ2Prfl/HbBsh4f1J26ebAj8aB6vEBOWVu7GxH7AX7vF/YPudnR7p8EtzGrRa
	 7MpaESX41V10Xx2HyM86q/xQgHon24D9bswwRUzSZ3JfFy7llFKuwBI/OFA+Tq9y/V
	 IEAtPHiS+xo1w==
Date: Tue, 5 Dec 2023 19:20:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 6/6] xen/pci: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <f84479a28a7f9d6e44829259229460dcf7c497c4.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051919560.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <f84479a28a7f9d6e44829259229460dcf7c497c4.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2. Furthermore, use C standard types to comply with XEN coding style.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

