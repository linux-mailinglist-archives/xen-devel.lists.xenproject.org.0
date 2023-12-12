Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EC80FA8B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 23:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653623.1020047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBa2-0000MF-Iz; Tue, 12 Dec 2023 22:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653623.1020047; Tue, 12 Dec 2023 22:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBa2-0000K8-GF; Tue, 12 Dec 2023 22:50:22 +0000
Received: by outflank-mailman (input) for mailman id 653623;
 Tue, 12 Dec 2023 22:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBa1-0000K2-0K
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 22:50:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2d488d6-9940-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 23:50:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A1382B818A2;
 Tue, 12 Dec 2023 22:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06890C433C8;
 Tue, 12 Dec 2023 22:50:16 +0000 (UTC)
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
X-Inumbo-ID: d2d488d6-9940-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702421418;
	bh=FWunfJukoEf8uv3S6Blf40SDiYHQAMZe9Gql3B5kJ9g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oOdCoGJo4+5g1LoBnnvR658c9GW8ocpeW4jfjzZzE01z5xwtoZITWdMrXFcKkUxR1
	 nzhY+7MMj58SwqyFtLkZwf150lwgWA6nR+dRFq6q9hky2QFdgevRv81NjsLyeZt7KU
	 8ew9M4aWQDK4V64UIqBdtYloMPBWwyZ+w8JYKICJ7dydVcJCr2HS5AHYPQXrz69bE+
	 0iXc42t67K1gjKFXnEokMTNjlvcJ46l/yRsvmLPfy/XC1p1+W5hPZmJLXq2P87oQQn
	 7HhZflF+b4Vot+piDMth4w6qNKs9kZ48OYmT1PT1X6+AAz0ZhlePvvl15VGx9FEF4+
	 ozSDfrTwLmxkQ==
Date: Tue, 12 Dec 2023 14:50:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/4] x86/asm: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <0db906df2d3649fc8652be6b80e14870b78b0f56.1702394721.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121450100.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702394721.git.federico.serafini@bugseng.com> <0db906df2d3649fc8652be6b80e14870b78b0f56.1702394721.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


