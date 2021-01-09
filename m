Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC12EFCCB
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 02:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63955.113375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3J6-0008Kt-Fl; Sat, 09 Jan 2021 01:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63955.113375; Sat, 09 Jan 2021 01:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3J6-0008KX-CH; Sat, 09 Jan 2021 01:44:44 +0000
Received: by outflank-mailman (input) for mailman id 63955;
 Sat, 09 Jan 2021 01:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky3J4-0008KS-8z
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 01:44:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a30813-12f9-49a0-96e8-05f007125935;
 Sat, 09 Jan 2021 01:44:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 884D123A1E;
 Sat,  9 Jan 2021 01:44:39 +0000 (UTC)
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
X-Inumbo-ID: e3a30813-12f9-49a0-96e8-05f007125935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610156680;
	bh=351HKwkGWVcvQsgEaoO4Vmz/waATAbhe/CLgZBfwiEw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NKwgJPIFzW6zmOe0NztlOV/STl1syOGwItT2n0eX8yi7cu0+H+zv//pAwI48ojiih
	 0oyKA4i5b/iyorTGNCZ3Ryq7r+oiO5XBc72xiLO2O4gEIVjNZhafKCpLb/maWiZF0A
	 qj26d5fbNqFcE5wLTbrmDRqbDqMu/6kRiqU8Unc0Lgl8OZM+Ub5aDSITTcKReq12PK
	 NZUPnOfJaUzNodcxZqLD5TkxTttP5zSc5fTp9DpATozbMjdi4qKAIb0/9ljfvDSsZ6
	 DqXrZv+mHQ3hOWOVllyoD+HyAR/tkkeFsJGpMy0KHNkg5MOCO52N72QXq1Uu2ErHlq
	 MLSpYa2GS8iOQ==
Date: Fri, 8 Jan 2021 17:44:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
In-Reply-To: <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081626460.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> -Wimplicit-fallthrough warns when a switch case falls through. Warning
> can be suppress by either adding a /* fallthrough */ comment, or by
> using a null statement: __attribute__ ((fallthrough))
> 
> Define the pseudo keyword 'fallthrough' for the ability to convert the
> various case block /* fallthrough */ style comments to null statement
> "__attribute__((__fallthrough__))"
> 
> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> the same time the warning and the comment parsing were introduced.
> 
> fallthrough devolves to an empty "do {} while (0)" if the compiler
> version (any version less than gcc 7) does not support the attribute.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V4:
>  - This patch is introduce in this verison.
> ---
>  xen/include/xen/compiler.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index e643e69128..0ec0b4698e 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -33,6 +33,22 @@
>  #define unreachable() __builtin_unreachable()
>  #endif
>  
> +/*
> + * Add the pseudo keyword 'fallthrough' so case statement blocks
> + * must end with any of these keywords:
> + *   break;
> + *   fallthrough;
> + *   goto <label>;
> + *   return [expression];
> + *
> + *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
> + */
> +#if (!defined(__clang__) && (__GNUC__ >= 7))
> +# define fallthrough        __attribute__((__fallthrough__))
> +#else
> +# define fallthrough        do {} while (0)  /* fallthrough */
> +#endif
> +
>  #ifdef __clang__
>  /* Clang can replace some vars with new automatic ones that go in .data;
>   * mark all explicit-segment vars 'used' to prevent that. */

It would be nicer to use __has_attribute to check if fallthrough is
supported by the compiler, but I wouldn't want to have to implement
__has_attribute by hand for the old compilers that don't have it. If we
are in doubt whether the compiler has has_attribute or not, then I think
it is better to do what you did here and avoid the problem altogether.


Linux states:

 * __has_attribute is supported on gcc >= 5, clang >= 2.9 and icc >= 17.


Unfortunately gcc 4.9 is old but still around. I don't think we made any
statements in Xen about gcc support >= 5. Hence, I think your patch is
good as it is.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

