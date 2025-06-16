Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08DADBDCC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 01:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017575.1394549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJWH-0008VC-7U; Mon, 16 Jun 2025 23:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017575.1394549; Mon, 16 Jun 2025 23:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJWH-0008T0-4p; Mon, 16 Jun 2025 23:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1017575;
 Mon, 16 Jun 2025 23:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jr=Y7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRJWF-0008Si-21
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 23:45:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009febd6-4b0c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 01:45:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D9405C59CE;
 Mon, 16 Jun 2025 23:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BAC4CEEA;
 Mon, 16 Jun 2025 23:45:34 +0000 (UTC)
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
X-Inumbo-ID: 009febd6-4b0c-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750117536;
	bh=nvHZW6lSsrrSxdMrAt8qSEvrG6flsT2JbPu7qbHA84E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kLiVQlJ3j1n/apla7CA52s03MEWVXNq67ZzUsgTBXt5NgD7bMDPJM5CJFR8z9GoNt
	 xTzOigUnmHwlhQFf0oMTFzUqQ1csnm3N9dQCKkLvw8y+eyYnk2Hbpk5HTtJB4qdDO/
	 /dwE6HPuCqdn7BG/5uqV43mie8oU1JPRpwVIP/BPQc2kohCoYBW/+6y+f7+kvcJuqo
	 rGthT9A7reyVonX1gGfgWUJXoA5I4uXJ1Tr8K3vVF3Jcu3AxG41AnbTnyuKmm3fNzg
	 M2P0zRWYlNW+aXKInB9EM6Nlnq2f850aFvcp2f3Cs+fOUioP9Bfwg2Euw+2/4KjPYx
	 JVnjLEdcbhH1Q==
Date: Mon, 16 Jun 2025 16:45:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: rosbrookn@gmail.com
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, rosbrookn@gmail.com, 
    gwd@xenproject.org, edgar.iglesias@amd.com, edgar.iglesias@gmail.com
Subject: Golang review, was: [PATCH v5 5/5] tools/golang: Regenerate bindings
 for trap_unmapped_accesses
In-Reply-To: <20250616155306.405257-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506161643080.1384757@ubuntu-linux-20-04-desktop>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com> <20250616155306.405257-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Nick,

It would be good for you to review this patch.

If you are unable to do so, please let us know if you have any
objections to us committing this patch without your ack.

Cheers,

Stefano


On Mon, 16 Jun 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  tools/golang/xenlight/helpers.gen.go | 6 ++++++
>  tools/golang/xenlight/types.gen.go   | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index 90846ea8e8..191be87297 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1170,6 +1170,9 @@ x.Altp2M = Altp2MMode(xc.altp2m)
>  x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
>  if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
>  return fmt.Errorf("converting field Vpmu: %v", err)
> +}
> +if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
> +return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  
>   return nil}
> @@ -1695,6 +1698,9 @@ xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>  xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
>  if err := x.Vpmu.toC(&xc.vpmu); err != nil {
>  return fmt.Errorf("converting field Vpmu: %v", err)
> +}
> +if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
> +return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  
>   return nil
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index e7667f1ce3..656933c6c9 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -606,6 +606,7 @@ MsrRelaxed Defbool
>  Altp2M Altp2MMode
>  VmtraceBufKb int
>  Vpmu Defbool
> +TrapUnmappedAccesses Defbool
>  }
>  
>  type DomainBuildInfoTypeUnion interface {
> -- 
> 2.43.0
> 

