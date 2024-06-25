Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85979915B22
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747055.1154344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuOZ-0002bR-27; Tue, 25 Jun 2024 00:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747055.1154344; Tue, 25 Jun 2024 00:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuOY-0002Z1-VG; Tue, 25 Jun 2024 00:50:50 +0000
Received: by outflank-mailman (input) for mailman id 747055;
 Tue, 25 Jun 2024 00:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuOX-0002Yr-RO
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:50:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f41574ab-328c-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:50:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E6EF6CE1688;
 Tue, 25 Jun 2024 00:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EA4C4AF09;
 Tue, 25 Jun 2024 00:50:38 +0000 (UTC)
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
X-Inumbo-ID: f41574ab-328c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276639;
	bh=g1K4RdYHXaz2V3p1JqSEVDirYJDWLK8jQPlYavoXfxE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DRDaypmUMX67NCmLbNytnmAOridWyFSKXwjumIqkcB0suAC9cGEaRi/0LZpx0Ukin
	 lvrrVQaqVQX2kznaFi/dHg6IWSZqdWcu0y1q1Zv2WIEqs2OlZ4UxULb82bPPePFcCU
	 Eq89cw02Be8H1dG2xpQdChQx/a7Gc8wfKZhAfr9+LoI6j+KtRbXYr6kHiWFNmMVBFJ
	 bj69EWA9HI4cRyNY6xaovdTmav2RxQKkF+LaiZiQYpMnYKsxK8pm8NZt5xOF0MGs/3
	 v+lKLvz5WqJQEpUrk4dBn1C6wlHgLIe2f3/UkhQTCzDdY0kRxLPUkiTNfJE0Gskf4B
	 ob+aneJ6TuaYA==
Date: Mon, 24 Jun 2024 17:50:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 02/13] x86/cpuid: use fallthrough pseudo keyword
In-Reply-To: <58f1ff7e94fd2bd5290a555e44d9de0d2f515eda.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241750320.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <58f1ff7e94fd2bd5290a555e44d9de0d2f515eda.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> The current comment making explicit the fallthrough intention does
> not follow the agreed syntax: replace it with the pseduo keyword.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/cpuid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index a822e80c7e..2a777436ee 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -97,9 +97,8 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          if ( is_viridian_domain(d) )
>              return cpuid_viridian_leaves(v, leaf, subleaf, res);
>  
> +        fallthrough;
>          /*
> -         * Fallthrough.
> -         *
>           * Intel reserve up until 0x4fffffff for hypervisor use.  AMD reserve
>           * only until 0x400000ff, but we already use double that.
>           */
> -- 
> 2.34.1
> 
> 

