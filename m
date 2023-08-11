Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6F77852B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 03:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582233.911875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHNq-0000L5-72; Fri, 11 Aug 2023 01:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582233.911875; Fri, 11 Aug 2023 01:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHNq-0000JF-4M; Fri, 11 Aug 2023 01:56:10 +0000
Received: by outflank-mailman (input) for mailman id 582233;
 Fri, 11 Aug 2023 01:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUHNo-0008T2-TR
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 01:56:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c91920d-37ea-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 03:56:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09CF5666DE;
 Fri, 11 Aug 2023 01:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93768C433CD;
 Fri, 11 Aug 2023 01:56:05 +0000 (UTC)
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
X-Inumbo-ID: 3c91920d-37ea-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691718966;
	bh=i8IPE+UjAwW58njxwkt29XTvoehoyO84GQsyplLavZE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=icoPaQXj3Pqe36cXHo5OiTH71XtEy0t1eXhviBIls+8XQzNvRZiV15BFlc8ElDyGr
	 tD4FvfYrbYcrE7h7FUm9vcDxvb9kHhqKelWlT1vAMUfbzmp89OocBm6PqFaIbHq5AU
	 X9D4VBH+jTw4w0UgXqov+L3oTs6+fEGKUZFRS4HDzK2YdK7GwMQAE6Idz5Y1jFTkea
	 WhJcduYeNCq0PuJaLUbwMa4uGkAHRtImOzg2bqVt1Diw1VX6mJxf/4e4yBw7epLqe6
	 L93xkuAx6PZU0DUyseSqcP+NGXFwyS0FW40eqaUq3oO2Wy3jz1dYaQbzDfpY4+Zb2g
	 dq6PSn9m2l/GQ==
Date: Thu, 10 Aug 2023 18:56:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Skip inclusion of domU nodes into hwdom dt
 /chosen node
In-Reply-To: <E3D0146D-9E5B-4CC6-A864-A6F51C9B599A@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308101855570.2127516@ubuntu-linux-20-04-desktop>
References: <20230810112544.17365-1-michal.orzel@amd.com> <20230810112544.17365-3-michal.orzel@amd.com> <E3D0146D-9E5B-4CC6-A864-A6F51C9B599A@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Aug 2023, Luca Fancellu wrote:
> > On 10 Aug 2023, at 12:25, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Configuration for dom0less domUs is stored under /chosen/<domu> nodes
> > present in the host device tree provided to Xen. All the properties and
> > sub nodes there are meant only for Xen. However, at the moment we still
> > copy them (except for modules that we skip) into hardware domain /chosen
> > node. Fix it by adding "xen,domain" compatible into the list of nodes to
> > skip in handle_node().
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

