Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90564915B1B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747050.1154333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuNg-0001DI-PT; Tue, 25 Jun 2024 00:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747050.1154333; Tue, 25 Jun 2024 00:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuNg-0001Bj-Mw; Tue, 25 Jun 2024 00:49:56 +0000
Received: by outflank-mailman (input) for mailman id 747050;
 Tue, 25 Jun 2024 00:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuNf-0001Bd-Ek
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:49:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5a882dc-328c-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:49:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 02B6160AE9;
 Tue, 25 Jun 2024 00:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B628EC32786;
 Tue, 25 Jun 2024 00:49:51 +0000 (UTC)
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
X-Inumbo-ID: d5a882dc-328c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276592;
	bh=c5c/ZQcuHnqkh/VfHe/M6Q5pNg7S+63DmfD3oo9iCE8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CBqqpKuT0GNTZtV39nq7VDLGIMqQ3ESkMMd1QyJg03Envf0u+BesrXI5tloDJZNVW
	 iL7dnqxK4Si5dcQWNmOPfwXVgkbLEB8qwsxOuCtd18DvbjWOjURBuVgfSVaN4Gij8t
	 3PELo6+EJwQRX9HrUqgWRLiCqh16X0oleX1ZunRko2Zg0YeVkB0D/Ujijh/S0GjEpF
	 aBvX5mbV1qNS5qqvSe5sjPdX5YGWCKuhmEkFigWfohgu+AldJH2tcrLmEISrvM3ZjB
	 xrrib/Dm3H4OO6k96iEXFV1Q5m2WGvhw5Wh5zs2z2cISVjBMBgtmwittiskwKKCkjH
	 M1ZlL8Pg/jp3w==
Date: Mon, 24 Jun 2024 17:49:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 01/13] automation/eclair: fix deviation of MISRA
 C Rule 16.3
In-Reply-To: <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241749400.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Escape the final dot of the comment and extend the search of a
> fallthrough comment up to 2 lines after the last statement.
> 
> Fixes: a128d8da913b21eff6c6d2e2a7d4c54c054b78db "automation/eclair: add deviations for MISRA C:2012 Rule 16.3"
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


