Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E5813CF4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654777.1022136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtcR-000810-K2; Thu, 14 Dec 2023 21:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654777.1022136; Thu, 14 Dec 2023 21:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtcR-0007yT-Gf; Thu, 14 Dec 2023 21:51:47 +0000
Received: by outflank-mailman (input) for mailman id 654777;
 Thu, 14 Dec 2023 21:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtcQ-0007x9-Oe
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:51:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7f34884-9aca-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 22:51:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 411B2CE2075;
 Thu, 14 Dec 2023 21:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A66C433C7;
 Thu, 14 Dec 2023 21:51:40 +0000 (UTC)
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
X-Inumbo-ID: f7f34884-9aca-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702590701;
	bh=HI5d78YTA7qAVlFkFnEl2H5ELDpWk8VWXhPQUNA1+ug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t+kRf1jciZu0QobOst+AzVjfp45qSiP1DIE7yl9ivx9WCmEnKzyXN0NMTxdnrtTtg
	 7nSW7fdLpKZwfGBwFVa5RCObroETyG8a5iK744KEkTNhCEQy3M5EE3H1/73RBLoQ/0
	 6o/3SNPCBQqDAWzk9UNU7Le0168BfMY3Iefx4272ufi+lgZabDv8lxoLsQdW0gHLjd
	 /Io9TKVP8rZwKa4XlCURP/5JRUrFE9i5zAx5qNBapXbhU25laC13J9W42tHPLoaqVU
	 cbEvtlxMNws2f0X8EIoHPqYPk37HGCNiU6NKaOb4hs+ObZyZuyMBmB5g2NPhzYb2b4
	 iY3hKagCYUrjQ==
Date: Thu, 14 Dec 2023 13:51:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 6/9] xen/ppc: address violations of MISRA C:2012 Rule
 11.8.
In-Reply-To: <0dcaf3a85f3293168b993c42303dfd55684a7bb7.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141351320.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <0dcaf3a85f3293168b993c42303dfd55684a7bb7.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Fix violation by adding missing const qualifier in cast.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

