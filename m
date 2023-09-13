Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9B79DD77
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600911.936747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEWU-000861-8M; Wed, 13 Sep 2023 01:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600911.936747; Wed, 13 Sep 2023 01:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEWU-000840-5S; Wed, 13 Sep 2023 01:18:30 +0000
Received: by outflank-mailman (input) for mailman id 600911;
 Wed, 13 Sep 2023 01:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgEWS-00083u-DM
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:18:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ff2588a-51d3-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 03:18:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF29E6170E;
 Wed, 13 Sep 2023 01:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB56C433C7;
 Wed, 13 Sep 2023 01:18:22 +0000 (UTC)
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
X-Inumbo-ID: 6ff2588a-51d3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694567904;
	bh=F/JkfOb9SfMX4O+grOm4Br4LbSzNokgc9HLS4nRKr0U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LCp1nS30bvuWESP3VL+H1pz+PtgUM7PqnIYT4qHTP1TA01jqdXdb2PGexFLyGjYU5
	 zP1E+tnqVz8q0r/yRWdSxZxW+zMHMzX97QLyUoNC4pWvQHLb0yqSeYXP6kisXDyH/D
	 PryAL1HelR+sJPUIraM4fOwnhAwibjYOKR4xsQ6Moo6n2/iv3LIvczsld1PV+DVlcs
	 AgUHD2AZGrH8BE+OYWYWcDkHmD1yoGA7A8Cumb2h+qeFvk2YqZ309Ca4JFmtY8+yy8
	 8orJezD8d8mOPl0RDnp3juhn2vVaecsnlom7sLHcJn3EMuCNMzEajbD3lRMawqTgOZ
	 +kGeUmB5Qi5ww==
Date: Tue, 12 Sep 2023 18:18:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 09/10] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <d1e081345c8dd35bc3e5baf91e95db830b5c68e4.1694510856.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121816490.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <d1e081345c8dd35bc3e5baf91e95db830b5c68e4.1694510856.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> Amended inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Mechanical change.

Missing signed-off-by line

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


