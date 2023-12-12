Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493C80FA8E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 23:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653628.1020068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBbo-0001RN-4n; Tue, 12 Dec 2023 22:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653628.1020068; Tue, 12 Dec 2023 22:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBbo-0001PN-1y; Tue, 12 Dec 2023 22:52:12 +0000
Received: by outflank-mailman (input) for mailman id 653628;
 Tue, 12 Dec 2023 22:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBbm-0001P5-JB
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 22:52:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13b5bf47-9941-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 23:52:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1BEE4CE1C5D;
 Tue, 12 Dec 2023 22:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776E6C433C7;
 Tue, 12 Dec 2023 22:52:05 +0000 (UTC)
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
X-Inumbo-ID: 13b5bf47-9941-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702421526;
	bh=sfOS8IONgwZIj0jRAhO2P1Zm49dhdHSiHzzNWwHrgOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=unVOmqqXMyP8gKV/HnKlgKCa/+qQoQf6Y6z/DDZZCuelwtuQvnQLbG5pD3sz6OU/4
	 CsZKFdvnDVzNzE4iBAm9D9lm801UHbDLJ92ByM5kxi6LYny9u3WZ4oYzaj6q5+IA2H
	 AnwRYcC3+rO6SuWu9/BjKCU869b4ufDM5lS8KcR5tFFNToEfFnk6I1pM07TkaLsSWP
	 78hVZXmhezQVRyPD/NeqHNAs6/pFheWJp9JJyki0hbCbH/pwzOZqh7bSBPxjr1haQE
	 pRJMIY7TC/rzt1yTuIw85NDv0x57u2uFSDnvnKnTrQ5cHb7qn9AT+TZdYQu7GX6aR4
	 K/YYbbHKA7Iyg==
Date: Tue, 12 Dec 2023 14:52:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 4/4] xen/iommu: address leftover violation of MISRA
 C:2012 Rule 8.2
In-Reply-To: <443dc3828fd6cdfb97d2e9d0c9ec93bb23228d5b.1702394721.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121451580.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702394721.git.federico.serafini@bugseng.com> <443dc3828fd6cdfb97d2e9d0c9ec93bb23228d5b.1702394721.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

