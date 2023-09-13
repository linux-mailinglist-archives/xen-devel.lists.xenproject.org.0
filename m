Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64A79DD75
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600906.936737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEUZ-0007RB-Ur; Wed, 13 Sep 2023 01:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600906.936737; Wed, 13 Sep 2023 01:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEUZ-0007N9-Q3; Wed, 13 Sep 2023 01:16:31 +0000
Received: by outflank-mailman (input) for mailman id 600906;
 Wed, 13 Sep 2023 01:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgEUY-0007N3-VA
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:16:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a1d47f8-51d3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 03:16:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6C34B821AF;
 Wed, 13 Sep 2023 01:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8653C433C7;
 Wed, 13 Sep 2023 01:16:25 +0000 (UTC)
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
X-Inumbo-ID: 2a1d47f8-51d3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694567786;
	bh=mbI3rxX23vB6aNPI4tOpZCvisEZvVv//Qhz0UcPdPoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CnL2mVCXxj1QcORxNNncag7xl2u08cqXnR2//ZvF3P/3en+2lS/ImGKTfkHc/zrXE
	 9KTAhDeMwslgVLmDxdiaZTeDrnqAnk50bgNK6ia4Tu4tE1W7ZacmAvosMR8DoPq3iz
	 UEgbISjkBMJOXCsDK2czPeWSu4bdTiyxQaKVTEqS9OfzgQYrmIJd1JOddZkF9zqtp3
	 qc2c6dWUN9H3QCJG17zWQ9nyqTv7sVxhE7X7IT98S1B4eVDYoQZ3uSFPqRJjL3Nd9w
	 Im3r3PkTjJa7FnPB8QZnLblp+Fld7FIzny4Q7wjSxuko0LOkWiprwoukYR4dt4pjV0
	 NHhQKuE39ZkeQ==
Date: Tue, 12 Sep 2023 18:16:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 08/10] xen/efi: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <5585708f62883ada3e7900c45a2c97dbcf927294.1694510856.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121816170.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <5585708f62883ada3e7900c45a2c97dbcf927294.1694510856.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

