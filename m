Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AEB7C7A6E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616191.958016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr595-0007kX-Nz; Thu, 12 Oct 2023 23:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616191.958016; Thu, 12 Oct 2023 23:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr595-0007i2-LF; Thu, 12 Oct 2023 23:31:11 +0000
Received: by outflank-mailman (input) for mailman id 616191;
 Thu, 12 Oct 2023 23:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr594-0007hg-NE
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:31:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bde757b-6957-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 01:31:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 80280B81F4C;
 Thu, 12 Oct 2023 23:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BC1C433C7;
 Thu, 12 Oct 2023 23:31:05 +0000 (UTC)
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
X-Inumbo-ID: 6bde757b-6957-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153467;
	bh=mzaKHUjRGUbbdcC/dvf2IP7aDBbCPJOj9cbVR0IrkAk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GndQF4q5Ji0jfiBXzfmmidIUM0NyMmfRmey8eBke2ZAHD9a2lHd3JnB9StzUM0Rhe
	 PVAgiQcqyDF8OdV32wvHO5/U7JERgcJlyuio6ylf4wy0qoVEIkXofjmxMhyLApJak/
	 kvPmmTGkPaTgoNbep3EmCgwSNDKorluW2q/zUWKEEb2NGs3Meeql9/tUHQmRzWjiNW
	 9Hn/4OnEOfodyw3/dnwRYdPKnEgS9I9OSMgf0cpM2qPGLJs0GNB05E/1ms+uUzhlXL
	 wrETA5KYJ7UXJpnlSQMj24BEfulw+lqNneH3KjUPSHuE3hrkNKQMm4UIEFrh+DT7kb
	 Rge0or4H9pCxA==
Date: Thu, 12 Oct 2023 16:31:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121629350.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> The purpose of this macro is to encapsulate the well-known expression
> 'x & -x', that in 2's complement architectures on unsigned integers will
> give 2^ffs(x), where ffs(x) is the position of the lowest set bit in x.
> 
> A deviation for ECLAIR is also introduced.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - rename to LOWEST_BIT
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  xen/include/xen/macros.h                         | 6 ++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b449..b8e1155ee49d 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,12 @@ still non-negative."
>  -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
> 
> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
> +2^ffs(x) for unsigned integers on two's complement architectures
> +(all the architectures supported by Xen satisfy this requirement)."
> +-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
> +-doc_end

Please also add the same deviation and explanation to
docs/misra/deviations.rst. Other than that, this looks fine.


>  ### Set 3 ###
> 
>  #
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index d0caae7db298..af47179d1056 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,10 @@
>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> 
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +#define LOWEST_BIT(x) ((x) & -(x))
> +
> +#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_BIT(m))
> +#define MASK_INSR(v, m) (((v) * LOWEST_BIT(m)) & (m))
> 
>  #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
>  #define count_args(args...) \
> --
> 2.34.1
> 

