Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF81AFBD7B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035800.1408172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtNn-0006MS-Ml; Mon, 07 Jul 2025 21:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035800.1408172; Mon, 07 Jul 2025 21:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtNn-0006Kx-JD; Mon, 07 Jul 2025 21:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1035800;
 Mon, 07 Jul 2025 21:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtNm-0006Kr-3X
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:28:14 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f10fef-5b79-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 23:28:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8455C6111F;
 Mon,  7 Jul 2025 21:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29572C4CEE3;
 Mon,  7 Jul 2025 21:28:10 +0000 (UTC)
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
X-Inumbo-ID: 48f10fef-5b79-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751923691;
	bh=KVYVfG8CX5aaKf1FEwilmWs3x76nOofkDcjyJGFabNc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t62Il/IbzlIVeHFnM3jTcsgYalGwtmRyl5rVd4lnj0KRnSS0TdJ27Anzpa0fa6UHY
	 DbmusToXEGH8X+z5Wydazp1ocAh8pqC6lnUJ55RVOc/Q1MRQCn74n94bbFQQJXeCyg
	 TYKa7UQpvTxQk5AsqUuN+aZyjeURoeb5Z7yxR/U0mqQMIQfBo5AWk6Sz+OtpwcK/Rk
	 jFWUBvIqmTmKLcLaacuy+FBsk/rsbpw2HslbL3h2zhMJRtl0jMCixfn7r6zdvFWFYn
	 VcbeQcHGVopUcDiaSYGeqGnyEArfd/ka00MWyWzBVdh2k2g/OjTcck66ZYr1uZS2ZL
	 6XhWe3CJtvp/Q==
Date: Mon, 7 Jul 2025 14:28:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/5] gnttab: address violation of MISRA C Rule 5.5
In-Reply-To: <12b31e64625806bcd82d3d820f39c44e71479e1d.1751659393.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507071426050.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com> <12b31e64625806bcd82d3d820f39c44e71479e1d.1751659393.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Dmytro Prokopchuk1 wrote:
> Address a violation of MISRA C:2012 Rule 5.5:
> "Identifiers shall be distinct from macro names".
> 
> Reports for service MC3A2.R5.5:
> xen/common/grant_table.c: non-compliant macro 'update_gnttab_par'
> xen/common/grant_table.c: non-compliant macro 'parse_gnttab_limit'
> 
> The macros above are intended to discard function arguments (unused1, unused2)
> when compiling with different configurations of CONFIG_HYPFS.
> This can lead to confusion and unexpected behavior
> because the macro name and the function name are identical.
> Split the code and create two distinct function signatures.
> This ensures that the code behaves predictably and remains compliant.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>


I realize you tried to address Jan's comment about the global deviation.
In my opinion patch #2 and #3 are still OK, but I think this patch makes
things more confusing and error prone.

Can we find a way to deviate update_gnttab_par and parse_gnttab_limit
either with a SAF in-code comment (docs/misra/safe.json) or with a new
regex deviation (docs/misra/deviations.rst,
automation/eclair_analysis/ECLAIR/deviations.ecl)?


> ---
>  xen/common/grant_table.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..f3282a1d7b 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -126,18 +126,12 @@ static void __init cf_check max_maptrack_frames_init(struct param_hypfs *par)
>      update_gnttab_par(opt_max_maptrack_frames, par,
>                        opt_max_maptrack_frames_val);
>  }
> -#else
> -#define update_gnttab_par(v, unused1, unused2)     update_gnttab_par(v)
> -#define parse_gnttab_limit(a, v, unused1, unused2) parse_gnttab_limit(a, v)
> -
> -static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
> -                              char *parval)
> -{
> -}
> -#endif
>  
>  static int parse_gnttab_limit(const char *arg, unsigned int *valp,
>                                struct param_hypfs *par, char *parval)
> +#else
> +static int parse_gnttab_limit(const char *arg, unsigned int *valp)
> +#endif
>  {
>      const char *e;
>      unsigned long val;
> @@ -150,7 +144,9 @@ static int parse_gnttab_limit(const char *arg, unsigned int *valp,
>          return -ERANGE;
>  
>      *valp = val;
> +#ifdef CONFIG_HYPFS
>      update_gnttab_par(val, par, parval);
> +#endif
>  
>      return 0;
>  }
> @@ -161,9 +157,13 @@ custom_runtime_param("gnttab_max_frames", parse_gnttab_max_frames,
>  
>  static int cf_check parse_gnttab_max_frames(const char *arg)
>  {
> +#ifdef CONFIG_HYPFS
>      return parse_gnttab_limit(arg, &opt_max_grant_frames,
>                                param_2_parfs(parse_gnttab_max_frames),
>                                opt_max_grant_frames_val);
> +#else
> +    return parse_gnttab_limit(arg, &opt_max_grant_frames);
> +#endif
>  }
>  
>  static int cf_check parse_gnttab_max_maptrack_frames(const char *arg);
> @@ -173,9 +173,13 @@ custom_runtime_param("gnttab_max_maptrack_frames",
>  
>  static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
>  {
> +#ifdef CONFIG_HYPFS
>      return parse_gnttab_limit(arg, &opt_max_maptrack_frames,
>                                param_2_parfs(parse_gnttab_max_maptrack_frames),
>                                opt_max_maptrack_frames_val);
> +#else
> +    return parse_gnttab_limit(arg, &opt_max_maptrack_frames);
> +#endif
>  }
>  
>  #ifndef GNTTAB_MAX_VERSION
> -- 
> 2.43.0
> 

