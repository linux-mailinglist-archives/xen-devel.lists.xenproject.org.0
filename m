Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB67B3BA1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610715.950218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKSG-0007Xx-HR; Fri, 29 Sep 2023 20:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610715.950218; Fri, 29 Sep 2023 20:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKSG-0007Vy-Cq; Fri, 29 Sep 2023 20:51:20 +0000
Received: by outflank-mailman (input) for mailman id 610715;
 Fri, 29 Sep 2023 20:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKSF-0007Vr-LW
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:51:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed32887-5f09-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 22:51:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A03BBCE24A8;
 Fri, 29 Sep 2023 20:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B08C433C8;
 Fri, 29 Sep 2023 20:51:11 +0000 (UTC)
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
X-Inumbo-ID: eed32887-5f09-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020672;
	bh=dNxV4njiNUYAdQ7hT8iUuivCbfjhYNPcBNFgJPOF6LE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=idVTmv9JA4z6cG+bwRmTvIAEstjU22sY8txYN0vQbHgodFwa0IOwzoR06Lp7VBJix
	 P8T6BVkBOiwVDsaWy9SgAVEM7a5KIfXk4ucRj28BUGrdx+r9icHhY6cf3sJd9lv2Bh
	 CqiKcgLyIcRYxWuGKrjRlbHCBaLjckKh35XCnBhQsoY6enJFZsr8P5G7ZRaYUjlCwe
	 NUVvctPwJpjEQ7o0oyufVHcRHYOGnYlI2itLEQDNsynQ4bhkO5IYomDEgKPlDH0Tq+
	 eNja9MucmV6OgfrySlRJKOFk0OgHar/Hu6aXjJTvOzLu+5y7JMFl87TbrUbwirJegx
	 FoQuh182/JXPw==
Date: Fri, 29 Sep 2023 13:51:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH] x86/msi: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <d8023a832f77dc872a92e71c4df2da39ddbe06b0.1695978595.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291351012.2348112@ubuntu-linux-20-04-desktop>
References: <d8023a832f77dc872a92e71c4df2da39ddbe06b0.1695978595.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Sep 2023, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


