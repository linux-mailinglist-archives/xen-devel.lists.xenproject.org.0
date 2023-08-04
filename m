Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E978B76F6A3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576680.903089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRixF-0006UR-Rn; Fri, 04 Aug 2023 00:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576680.903089; Fri, 04 Aug 2023 00:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRixF-0006RE-Ox; Fri, 04 Aug 2023 00:46:09 +0000
Received: by outflank-mailman (input) for mailman id 576680;
 Fri, 04 Aug 2023 00:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRixE-0005oh-PN
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:46:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bb1b319-3260-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 02:46:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F305C61DC7;
 Fri,  4 Aug 2023 00:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB213C433C7;
 Fri,  4 Aug 2023 00:46:04 +0000 (UTC)
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
X-Inumbo-ID: 4bb1b319-3260-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109965;
	bh=T/Gyp8K+J/T2MSq60L3DlKPnDzhU+5aLg0S52VXWxEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OniK5GsPP4r1v/B+Xaq+PyQ/9FVT341uu39wnaF9irdRTkuDm+ruGnBG9REwLMCIM
	 k2UgO1FbT+O7RRkzfN56SLybqJYCvRv6B00oxoL6+VlBuDUj7xNGF6zSvp1UQdlwxa
	 anu1x6cl9jL7iHGs2TMALa7ySZh7XWJZXwG6JfzIFuQ2xDJX7bLdkaqt4JCh8RS1ej
	 AChg4vgztaSb0XWbKtpLsgSf+kG/tHz7QFm6TerrEWyUvn+HKIQD1QcnEA4jFiqaam
	 Q5fP0oFJ3Qw1GVMLmmDodnWBjiAaHdDvmHEQVVjqFirf+cEnyB/nQ9naAsOOhlQmBA
	 CGagW7zh8dy7w==
Date: Thu, 3 Aug 2023 17:46:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [XEN PATCH 05/13] xen/ioreq: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031745520.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

