Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B50919C35
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749615.1157846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdQW-0000R1-8l; Thu, 27 Jun 2024 00:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749615.1157846; Thu, 27 Jun 2024 00:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdQW-0000Oi-4e; Thu, 27 Jun 2024 00:55:52 +0000
Received: by outflank-mailman (input) for mailman id 749615;
 Thu, 27 Jun 2024 00:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdQU-0008NF-Nf
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:55:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe167cd7-341f-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:55:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8ABC961D61;
 Thu, 27 Jun 2024 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239ECC2BD10;
 Thu, 27 Jun 2024 00:55:46 +0000 (UTC)
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
X-Inumbo-ID: fe167cd7-341f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449746;
	bh=8cYXP6GXhRYzZHoFc11LDUVtqk5BDpi6YkYifjZ+MNg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f0jc+l6LOiIuAOCKj3DLRNHFZ4KOWp8gQrSjDJXpfBuFn7dE9XVXyxlxmHx2Gqkeg
	 KWxlmyitLFUnO+pX0MYgmAGGF5gguG+P1+pw60dMMDkOQW8IPnDk96CtiEMmQ8rKs6
	 aiH4ZeERZJGFoa/4GJ0Vv0e4HWydZvUxubLEzvyQZUiT6yYoGqund5Bm/1qonm62qr
	 q4hdNgc2u8bZ01ZOyi0zKcruthbCrZSoqp5uXCUq7jZIxJkW+hk8MPjNPNnuuH74pw
	 +CvgyGgAJXZnfR97UhVdXtk9qdYoFGzcbrSAsrGVq8TcZoZCyIMvR3qJl1AcmPd44q
	 0iRmhoRngcLPQ==
Date: Wed, 26 Jun 2024 17:55:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 08/12] x86/vpt: address a violation of MISRA C
 Rule 16.3
In-Reply-To: <453ef39f5a2a1871d8b0c74d921ed6a413b179b4.1719383180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261755380.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719383180.git.federico.serafini@bugseng.com> <453ef39f5a2a1871d8b0c74d921ed6a413b179b4.1719383180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Federico Serafini wrote:
> Add pseudo keyword fallthrough to meet the requirements to deviate
> a violation of MISRA C Rule 16.3 ("An unconditional `break'
> statement shall terminate every switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


