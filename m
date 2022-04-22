Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C831C50ACA2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 02:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310539.527437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhglz-0006rV-L3; Fri, 22 Apr 2022 00:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310539.527437; Fri, 22 Apr 2022 00:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhglz-0006oV-Ha; Fri, 22 Apr 2022 00:03:43 +0000
Received: by outflank-mailman (input) for mailman id 310539;
 Fri, 22 Apr 2022 00:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhgly-0006oP-1V
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 00:03:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3b633a-c1cf-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 02:03:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94B6261EE7;
 Fri, 22 Apr 2022 00:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9943BC385A7;
 Fri, 22 Apr 2022 00:03:38 +0000 (UTC)
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
X-Inumbo-ID: aa3b633a-c1cf-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650585819;
	bh=ROR6Gdgt9my5XqbGGDRFeSrSNlmuUJyzMdLwP1EFD2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=muY203xxbEkaAcASdbLhi5+ByB1SLuSvVb7EUi4Q/wOu09DBwQBs/gMzF68QJCBcV
	 KElUnADL7TuQQaoPom8PjmAwNglYPfHdjwRZ5KZ5oHjVXinYLkgMlmkfgeonpXPOxb
	 58CxzlU3nt9v6fQXyEtA6cpR21bnr4l4+dV6yEmQ1DUJfsT4hWmxpJqbfHKPbwNNNh
	 iFXWqIhH93tj0tun0rf9HgCkwMt7WsO3D/9TWMOGqo1nwkMm6pKv7J4Z9JfsdvFsO5
	 OZnlfFcB15OwgbuYaj+kXWqQUgrS/A1RybpkCUVj8jqe0th6MweJ2YRgYl1tqnLkTz
	 VwTwJIyAatd6A==
Date: Thu, 21 Apr 2022 17:03:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Paran Lee <p4ranlee@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Austin Kim <austindh.kim@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning
 error
In-Reply-To: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
Message-ID: <alpine.DEB.2.22.394.2204211654380.915916@ubuntu-linux-20-04-desktop>
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-547296852-1650585819=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-547296852-1650585819=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Apr 2022, Paran Lee wrote:

> GCC with "-g -Wall -Wextra" option throws warning message as below:
> 
> error: comparison of integer expressions of different signedness:
>  ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
> 
> Silence the warning by correcting the integer type.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>

Thanks for the cleanup!


> ---
>  xen/arch/arm/gic-v3.c | 5 +++--
>  xen/arch/arm/setup.c  | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 3c472ed768..81ac25f528 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
>      isb();
>  }
>  
> -static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask *mask,
> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
> +                                     const struct cpumask *mask,
>                                       uint64_t cluster_id)
>  {
>      int cpu = *base_cpu;

I think we need to change cpu to unsigned int too to make it consistent


> @@ -953,7 +954,7 @@ out:
>  
>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t *cpumask)
>  {
> -    int cpu = 0;
> +    unsigned int cpu = 0;
>      uint64_t val;
>  
>      for_each_cpu(cpu, cpumask)
>
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..5ab2aaecaf 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>                        unsigned long fdt_paddr)
>  {
>      size_t fdt_size;
> -    int cpus, i;
> +    unsigned int cpus, i;
>      const char *cmdline;
>      struct bootmodule *xen_bootmodule;
>      struct domain *d;

I can see that we should change i to unsigned int.

cpus could cause a comparison between signed and unsigned int here:

  if ( (num_online_cpus() < cpus) && !cpu_online(i) )

num_online_cpus returns an int
--8323329-547296852-1650585819=:915916--

