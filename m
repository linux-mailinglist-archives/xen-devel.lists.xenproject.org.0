Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B91B279B1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 09:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082843.1442550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umoZV-0005nQ-8Y; Fri, 15 Aug 2025 07:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082843.1442550; Fri, 15 Aug 2025 07:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umoZV-0005kD-5J; Fri, 15 Aug 2025 07:09:53 +0000
Received: by outflank-mailman (input) for mailman id 1082843;
 Fri, 15 Aug 2025 07:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXrH=23=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umoZU-0005jr-3W
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 07:09:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d49be02e-79a6-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 09:09:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E0ED84EE0742;
 Fri, 15 Aug 2025 09:09:47 +0200 (CEST)
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
X-Inumbo-ID: d49be02e-79a6-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755241788;
	b=idRZ+J/Ymvkbav0qXAOUvaNWsUx2sHuBUz57PGFgcMp71uleFyVveQWS0+M5yFSMWBoF
	 ztkniDOkAP+9mGdjLz5QyyBaDFr0oXupOmVj2qDvArYc1eJ3ffz6/N4+6LrSvVEQjgteO
	 r2rqp0+LhshcAZQ+S8z66oUpZRb5hQ1WlrraJ/gUhCGFQnL9sxfEzz88p+QwAilJbxXkZ
	 Ysajn8O3AHpl64yIZNkz5lEaye4L+XgOgCKhEPvwW6i9KV9+VZfFgxUezgNq/W+jdHl0v
	 jJl/JpF0sxFHB5Sw/Plm61ZJ06h4Q+sE7mOlhLRI6Do2Nj403Wbrstzc1A5mgONXVidZd
	 v0vxXcPFqR/VvIGy7xuC6q2ptswv+V+gQzDE+o9BacUr3Xpzk4+PcKmOGoDtbdX5RGfnk
	 eAz0UWao1A+3+734ksMDN5gCnj3Re4uc9Esbctw+V7Mr0i4vzSMltwH2r1+ApBPWRnDC+
	 1NNwprzumSDq9sU0O4610ImMced/aIpomOrt1Yby6sya4ml+IT6nKljYzd0PIfItLZXx6
	 DNsIkyhX5PTGeMQmn07zzTgPYwrNKu+qe01eIeSK5ugdiQ1SZkJ91hjRGXU9/orexI/CQ
	 bWHSjD2SG2dsgniIABvgZm7eLWVxYnNEvmixg7p1vVAi7i51DdbBu/UDkC4UHNg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755241788;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=KFiRFFK7OFgSMVoQTACXyR8v6u0l5skmrJA/2+R6tUo=;
	b=hPoiQZtspB6O70lvz9BzaMLYnYHeg0kSyR1QXs1yymbf63FkkvMlGmP6eznkYezyDZNr
	 T+FtKkzgPhfOyPzCHTHI5WrRAHDWVmeqNz73koQTbvEjcEc71FaoVLVEfNrlmDWzJZ6fV
	 9z8r0rAFy213TPbE+zU2HVdODNEEnZyUaiW2Cf5bBuI6xUlxrZC3wgFeRi+Xb9KH74gNl
	 Ym6PqvubRSkXtxLCJUAfoGkMJSeXt2KjLTxpTS4QgLAVONTi7qsiSQajRe2n9Z5qCq0Ju
	 xy7TXfYQODAZBwBKjHn6hmTC5en+H2cLr5vNGgRBg3IJDyCKdOSsRer7uUgldrf53YuL/
	 jBbCENZGSuC8qDosV6Ox8akeM4NlESUQHlNO2Co0D6pJpuyTVrza54CT2Do7nf8aqoj4F
	 GfUDQ+6CETy1oCsnrDKa134WA/sNICZKllUitpe2FA2geikPxLRW0P89uH4ebLylPgzbi
	 2+OMBN+PeNMFUauPSju9j5z9C2qiB/4MARoGKweNm6FHjQsV8TsbuKvrJvIoGCFBc1pfO
	 RWmYfqtBdmoU5C2XcLai0qR8ucO9bqN20+x8Y2Dljh+oCCehqsGKXPT7maZy3Hoi+NWvc
	 nrmhm2oIDB+8PNLUw5xNvYMYTWN+FU5QlYGHAqRZxVIXNKHACoS9/vua8mTJ3ZI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755241788; bh=hgtYGugSWg0TBHG86mCkJsmhYi3+GD9ttE0Cwa5tG80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qh+bRco20XRD5YQhG3oKpt2CD65NEB81IUm7LvRzXUG00YHPBeFB1uryLXyDg5rVn
	 MLxqEaXqJYcoGOQmrEFSiGeDj98wHXRLWA7nPEnik/SJTa2Js1Fzki96GfPAELaRNi
	 gKAjEQs3LbsTPE3flz/2Gt1ZqZXqgIzYQ3yTZukOA9LS8hww1/YbXmjUbg+JWba0Ku
	 lN2Xfdt6ooBuAiiNs6S5CTGaXhRh6sWLHJmiLBe635xkh1+B7aHop2ZMzqQYwLxQxk
	 A90T1xM8HvZ3ltkHO/aFvFwGZQ/TRAql5KXYeD6mWys1IDbRIcdDsA4ys7QsNtCPE6
	 085a5Com2AqRQ==
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 09:09:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
In-Reply-To: <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
References: <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
Message-ID: <c7d9513dfc7201c5d3c6e6cbd99db481@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-15 09:00, Dmytro Prokopchuk1 wrote:
> Fix the following issues:
> 1. xen/docs/misra/deviations.rst:90: WARNING: Inline interpreted text 
> or
> phrase reference start-string without end-string. [docutils]
> 2. xen/docs/misra/deviations.rst:54: ERROR: Error parsing content block
> for the "list-table" directive: uniform two-level bullet list expected,
> but row 6 does not contain the same number of items as row 1 (2 vs 3).
> * - R2.1
>   - Calls to the `__builtin_unreachable()` function inside the 
> expansion of
>     the `ASSERT_UNREACHABLE()` macro may cause a function to be marked 
> as
>     non-returning. This behavior occurs only in configurations where
>     assertions are enabled. To address this, the `noreturn` property 
> for
>     `__builtin_unreachable()` is overridden in these contexts, 
> resulting in
>     the absence of reports that do not have an impact on safety, 
> despite
>     being true positives.
>     Xen expects developers to ensure code remains safe and reliable in 
> builds,
>     even when debug-only assertions like `ASSERT_UNREACHABLE() are 
> removed.
> 3. xen/docs/misra/rules.rst:127: WARNING: Inline interpreted text or 
> phrase
> reference start-string without end-string. [docutils]
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I recall that Andrew wanted to add a doc build test to avoid introducing 
warnings. On that front, with my Sphinx version I also see this build 
warning:

Running Sphinx v8.1.3
WARNING: Calling get_html_theme_path is deprecated. If you are calling 
it to define html_theme_path, you are safe to remove that code.

> ---
>  docs/misra/deviations.rst | 3 ++-
>  docs/misra/rules.rst      | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 3c46a1e47a..2be49076e1 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -95,7 +95,8 @@ Deviations related to MISRA C:2012 Rules:
>         the absence of reports that do not have an impact on safety, 
> despite
>         being true positives.
>         Xen expects developers to ensure code remains safe and reliable 
> in builds,
> -       even when debug-only assertions like `ASSERT_UNREACHABLE() are 
> removed.
> +       even when debug-only assertions like `ASSERT_UNREACHABLE()` are 
> removed.
> +     - ECLAIR has been configured to ignore those statements.
> 
>     * - R2.2
>       - Proving compliance with respect to Rule 2.2 is generally 
> impossible:
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 6812eb7e8a..382331447e 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -124,7 +124,7 @@ maintainers if you want to suggest a change.
>             they are used to generate definitions for asm modules
>           - Declarations without initializer are safe, as they are not
>             executed
> -         - Functions that are no-return due to calls to the 
> `ASSERT_UNREACHABLE()'
> +         - Functions that are no-return due to calls to the 
> 'ASSERT_UNREACHABLE()'
>             macro in debug build configurations are not considered 
> violations::
> 
>                static inline bool

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

