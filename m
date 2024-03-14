Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED887C5BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693574.1081882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku7K-00043d-Oe; Thu, 14 Mar 2024 23:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693574.1081882; Thu, 14 Mar 2024 23:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku7K-00041f-Lj; Thu, 14 Mar 2024 23:04:06 +0000
Received: by outflank-mailman (input) for mailman id 693574;
 Thu, 14 Mar 2024 23:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rku7J-00041Z-4N
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 23:04:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 260374c5-e257-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 00:04:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1456614F5;
 Thu, 14 Mar 2024 23:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67891C433C7;
 Thu, 14 Mar 2024 23:04:00 +0000 (UTC)
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
X-Inumbo-ID: 260374c5-e257-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457441;
	bh=6dWZ92S77NIaPaF6pnS10UM1Y6AVRRCICA/VozF5tsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mP8HauQ9rwt21jpgUZL8gG1ADBvtEGqbwDNUluzR5ODyEUOab3/DOLNJtu2KJtaUz
	 /1wpQjZF2FS8wWojaJODBo920cmzjDoxwKjwNVHrmcIvZKwDQE2/w94jmv8vy+Z/aZ
	 KqZQfEsy3vazqxJxkmMNMRWmmQATqCdeemvr50DdwPt0pxuR4P+6SKUqRzhP+cPoc/
	 NCZ6ttbuDVNgCPLrDkCwdzvIdjgvcGYmvhpXRK/QVcWL0cEqFtI1pnERfdyGGBOAej
	 vEMyyz9k2RPUhsC9FC+0bol0TAAyQXAsr4myGFz1LGnghYg5tq2U+UZJQHJKFLtt/t
	 2Pckz1khajdcw==
Date: Thu, 14 Mar 2024 16:03:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: Re: [XEN PATCH v3 07/16] xen/common: address violations of MISRA
 C:2012 Directive 4.10
In-Reply-To: <c76b93f2e02901f2ff006f19413b113e8e0a2925.1710145041.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141603500.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <c76b93f2e02901f2ff006f19413b113e8e0a2925.1710145041.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

