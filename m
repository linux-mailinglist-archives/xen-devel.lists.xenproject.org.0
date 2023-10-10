Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E673C7BF035
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614558.955729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1Us-0003RL-Rh; Tue, 10 Oct 2023 01:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614558.955729; Tue, 10 Oct 2023 01:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1Us-0003Os-Oe; Tue, 10 Oct 2023 01:25:18 +0000
Received: by outflank-mailman (input) for mailman id 614558;
 Tue, 10 Oct 2023 01:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1Ur-0003Om-1M
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:25:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc170f0f-670b-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 03:25:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97D99CE0E34;
 Tue, 10 Oct 2023 01:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B6C433C8;
 Tue, 10 Oct 2023 01:25:06 +0000 (UTC)
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
X-Inumbo-ID: dc170f0f-670b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696901107;
	bh=3PbKuti3xO0kk3Lurn+1O4agBscXpO0s4wGVvCmyOHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=utFgQ1to9xnWk0a0RGlotT65X7PxZUjJw0Wop+xKayuxMYkFJO9PZE8+hcoXY3u5O
	 fwolKtA3+V/Ey2rshSXBIMPqrF+zoWLS8HZ9DQ956YmQU8I5kD8HdYSnUGBwgOPyXi
	 +ddK8HnxH9PZ5oNxDshf9UFMw1Md0Mo08N6rTu5exyTN60REDkS+ZQBUcH+LYBAQ9U
	 Lp+/bk8CmW76D/kXKHWaTj4u4Bz/GHQC0XmqQjheD/UvhQCIZBpTvbjorGs8Yi6COw
	 Kgl6ndR/6cOJkMEGTvWFEvqHB7fmxePKOrUXqXaJLBM19zxx6iDyzBiRS1sfVhWxNN
	 xtxuCJrElLnkA==
Date: Mon, 9 Oct 2023 18:25:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091824560.3431292@ubuntu-linux-20-04-desktop>
References: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Oct 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


