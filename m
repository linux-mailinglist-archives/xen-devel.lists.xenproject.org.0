Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9EB38677
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096385.1451109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHys-00073L-7v; Wed, 27 Aug 2025 15:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096385.1451109; Wed, 27 Aug 2025 15:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHys-00070a-5M; Wed, 27 Aug 2025 15:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1096385;
 Wed, 27 Aug 2025 15:22:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1urHyq-00070S-Pe
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:22:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urHyq-009I0B-03;
 Wed, 27 Aug 2025 15:22:32 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urHyp-004CcG-34;
 Wed, 27 Aug 2025 15:22:32 +0000
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
	bh=8srNdS1P6Vamy9xuleAXhqisS5VIfUS7W7O2wA7G5X4=; b=QQw8dzd9USKCvqtguW1JIkLBCd
	7czFHp7cFDAn5UVAXkmPlDUIYS00Ai+WKeiiKhW7cVix3LkGTvgzICDJNSu62ESbNcpJOsc3YTk7g
	s1j0+tw0eKTCj9WSABctSjFo1GY5n8lrmnOeYpl9wNygJsvWP1IFc1+XOWlUkT3knMKw=;
Date: Wed, 27 Aug 2025 17:22:29 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Message-ID: <aK8itT5YOUkY21n1@l14>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822105218.3601273-12-Penny.Zheng@amd.com>

On Fri, Aug 22, 2025 at 06:52:16PM +0800, Penny Zheng wrote:
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index 6b054b10a4..8fc1d7cc65 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -898,6 +900,23 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>      printf("\n");
>  }
>  
> +/* show cpu cppc parameters information on CPU cpuid */
> +static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
> +{
> +    int ret;
> +    xc_cppc_para_t cppc_para;
> +
> +    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
> +    if ( !ret )
> +        print_cppc_para(cpuid, &cppc_para);
> +    else if ( errno == ENODEV )
> +        ret = 0; /* Ignore unsupported platform */
> +    else
> +        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n", cpuid);

You might want to add ": %s" strerror(errno) to the error printed, which
could help figure out why we failed to get the parameters.


The rest of the tool side of the patch, with Jan suggestion, looks good
to me, so Acked-by: Anthony PERARD <anthony.perard@vates.tech> for the
next round.

Thanks,

-- 
Anthony PERARD

