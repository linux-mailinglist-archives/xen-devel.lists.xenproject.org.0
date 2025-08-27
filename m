Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495EB38730
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096444.1451150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIXJ-0004gK-Jb; Wed, 27 Aug 2025 15:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096444.1451150; Wed, 27 Aug 2025 15:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIXJ-0004eq-Gy; Wed, 27 Aug 2025 15:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1096444;
 Wed, 27 Aug 2025 15:58:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1urIXI-0004eR-5T
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:58:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urIXG-009Igt-0N;
 Wed, 27 Aug 2025 15:58:06 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urIXF-004FWk-32;
 Wed, 27 Aug 2025 15:58:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=n83R/rRngWIHg1o05rluNflzrTW4r7FqR3kSDLPxz7A=; b=VZ8hYfk02LbM1IZ3f3RNp+S3zL
	NwV/Az2sb8BOlzdGDqDdVASQcyug1SkLpPwpaYG4bDV6ZhaQjzEw8z3FmZ0D4UCFZP/64UGKKS60r
	c6vgzBDjyPEmyduAL51jB8pW6+aWblRS/m0rkKkUwhEoJ834EhS+mpj0xb9UF3Nu84gY=;
Date: Wed, 27 Aug 2025 17:58:03 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Message-ID: <aK8rC7CLd_7Z9sC8@l14>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822105218.3601273-14-Penny.Zheng@amd.com>

On Fri, Aug 22, 2025 at 06:52:18PM +0800, Penny Zheng wrote:
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index 02981c4583..eedb745a46 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -38,6 +38,13 @@
>  static xc_interface *xc_handle;
>  static unsigned int max_cpu_nr;
>  
> +static const char cpufreq_policy_str[][12] = {

Is it necessary to hard-code an hand calculated size of the literal
strings? Can't we let the compiler do that for us? With this as type:

    static const char *cpufreq_policy_str[] = {

The compiler might not detect an issue if we write "11" instead of "12",
for example.

> +    [CPUFREQ_POLICY_UNKNOWN] = "unknown",
> +    [CPUFREQ_POLICY_POWERSAVE] = "powersave",
> +    [CPUFREQ_POLICY_PERFORMANCE] = "performance",
> +    [CPUFREQ_POLICY_ONDEMAND] = "ondemand",
> +};
> +
>  /* help message */
>  void show_help(void)
>  {

Otherwise the tool side of the patch looks fine to me,
so: Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

