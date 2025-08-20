Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44635B2DD40
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 15:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087453.1445499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiTG-0003IE-GB; Wed, 20 Aug 2025 13:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087453.1445499; Wed, 20 Aug 2025 13:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiTG-0003Fe-Cb; Wed, 20 Aug 2025 13:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1087453;
 Wed, 20 Aug 2025 13:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZNac=3A=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uoiTE-0003FY-16
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 13:03:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078a1e9e-7dc6-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 15:03:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id DFBFE4EE3C0D;
 Wed, 20 Aug 2025 15:03:11 +0200 (CEST)
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
X-Inumbo-ID: 078a1e9e-7dc6-11f0-a32b-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755694992;
	b=W7IhvnnCyIhs82IWL9liElbtNUPiUnb/46KO462GDmUz94T9JIJrr90FciJVm7G6Lx53
	 ctGv4m5Bt6eZQMPo201UFnh7cbGHbHjviPft404lWMUiBY3oEgGkd7JTc5NMxtIdrlFw2
	 aQ9t/us5SA6w24DYcfTySe7brcCmErwYPpjIllj/4918WnmG3NOfSteTzb6sDqUNJcYwo
	 5ySe9X+6iaMRM4SUzz+9lEbCuUPmLKY3umWOe65RQD7ik88UIuOnrVdS5XlVRjp9japik
	 1Kw8ftU8n/+L8rP2j6OQXDum6M43NAC9MECDPRlOrtoUtR0AEZoyeJ2CniVhR7IZZ/sYJ
	 gcwP510VgiMyIAHOjr2ugi50LXYywfuuFsB4LH1GDslCnumbs/p5QBvK07QQsL8pkLK1H
	 koiV+oi7AJxajeNwuivQYWCQytFP827OaocDEHaXC8nGCZKg/uuA4+v/3rVwm92ubCAUO
	 CNhdnotQCBzs4DZiYYcJ6CRl/srkL5bJm4o3GpBRY9o7nTRgdQx2rTHCOs7/C4tV1B5qU
	 BSOKh5Qv5PPAQ5MwE4u4KJzSPfIHx05ekXNGTn2TMZmAAc270tTwD9Gf6KfHnm7cx+VcF
	 2iLpleBiUCBkWVaL8hjeKKXW8shWCjtIMSTWPv3cE18d8e4//6xpEgcn5eJhJ3Q=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755694992;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CB/q5y7FPjAryA9XHIdlKTQPQlU5KjrEPv8xlhx/Jp0=;
	b=OMiYFol4Atxhea15OJR/cCWNvlL2GnQXt0gfF18fSdXMfzkAJoe36vFUVPEoZL7Widgx
	 wBAzhL31DkjCQVFHu57SyehWxc+aCA5LBpfjx37c7i1A92E+prZ8DvkxxHKaK+KKuz5Ew
	 RCfu6AbRig9CTNLijX66tZ2SK+M9LDmnYKJbn6hLWnLzixBalBGsWbQ9ahYWlufVm0X+C
	 0AkVHBWATxq56GK8dR1bElL//yoGUXRk2v+GvoZlFbTPvjmWluro6dwR3zHRY3uhLSiqs
	 fgz26bpWiQ38tXk28b4idaOc1lmIwpvbE4VseUng9LEhb5MrrrmHACQZINKlalkVfK9tS
	 7eE7pVG0+hjetcBGg3gBdB1yD1gvWyBmTdgj+CGc7TOK4FOOj5G8tXIw1dIjcsg0ImF+Z
	 6U3fCLFKvDd9cS1CZIioElJkhnyVm5dfltSZ39EpKjTMcXqVIOvXkL/5tgKTAKHHnLQ9y
	 5lxPN4FscA40iuTtuXncG9WfUirk6+9LtQJEYHO/Yob1p4AhITTfbNGAtn4lFBa7V7Z3Z
	 DCdjBh6VTyixVK7JzP09rEKarfRCRuM0nGSyj76M5IOd7BeHp5ya9x6KgWJgpiYvfqTrX
	 cqrjmdDsB8tha/ZEOZQkGB7YAod2eNucEfQpGaVfH6Xd58ZT42x/WXmUFA10H1I=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755694992; bh=THbq3nhrfitahUJ/far0AZs1qme5UUHJVMgR8xdpiSU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qSK9Q/40sNaQGw790SdGQozMYW/emlCWRYU9e1BX2wcski7ttgYE143sXP7QGJfg5
	 Bq/dTPiRkbMUue9AiqYXh5YTZ/R2KX6H7mw2O/uy/Q3srn1cX35UbeJg0d1Bu8Jc6V
	 a9OMgeR0s+tONJVfhOSf9W74mLiO7798KyQSOxVtEEZyPESsB+wjoGs7dtGzakYTsd
	 ozMm6Sp3GR/m9/Aa1Oe/ka2fuxs45j40LwQ3lpYGJT80JSdJicaeVF6jDyvyerWf0j
	 ZGMAmmWEChCjmug/HIZDDTJK4QZlqWIE+BkAkQdZeKqXqOeAjgOh6aZR0mmiswtJel
	 UvLhNqcAw0m8A==
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 15:03:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 18.3
In-Reply-To: <901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro_prokopchuk1@epam.com>
References: <901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro_prokopchuk1@epam.com>
Message-ID: <ff2543e8fe894fbbc1a0b015c80c6d75@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-20 14:44, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 18.3 states:"The relational operators >, >=, < and <= 
> shall
> not be applied to objects of pointer type except where they point into
> the same object."
> 
> Comparisons in the 'find_text_region()' function are safe because 
> linker
> symbols '_stext' and '_etext' represent fixed virtual addresses within
> the same '.text' region, and the function 'addr' argument is explicitly
> compared to known valid memory bounds ('text_start' and 'text_end')
> derived from these linker symbols:
>     if ( (void *)addr >= iter->text_start &&
>          (void *)addr <  iter->text_end )
> 
> Configure Eclair to suppress violation reports occured in the function
> 'find_text_region()'. Update 'deviations.rst' file accordingly.
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

with two NITs below:

> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1993673043
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7f3fd35a33..32b596c9da 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -590,6 +590,12 @@ C99 Undefined Behaviour 45: Pointers that do not 
> point into, or just beyond, the
>  -config=MC3A2.R18.2,reports+={safe, 
> "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
>  -doc_end
> 
> +-doc_begin="Comparisons in the 'find_text_region()' function are safe 
> because linker symbols '_stext' and '_etext' represent fixed
> +virtual addresses within the same '.text' region, and the function 
> 'addr' argument is explicitly compared to known valid memory
> +bounds ('text_start' and 'text_end') derived from these linker 
> symbols."

Maybe ['text_start', 'text_end') here and below to emphasize that this 
is a range?

> +-config=MC3A2.R18.3,reports+={safe, 
> "any_area(any_loc(file(^xen/common/virtual_region\\.c$))&&context(name(find_text_region)))"}
> +-doc_end
> +
>  -doc_begin="Flexible array members are deliberately used and XEN 
> developers are aware of the dangers related to them:
>  unexpected result when the structure is given as argument to a 
> sizeof() operator and the truncation in assignment between structures."
>  -config=MC3A2.R18.7,reports+={deliberate, "any()"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 2119066531..a726fb22a8 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -586,6 +586,14 @@ Deviations related to MISRA C:2012 Rules:
>         are safe.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R18.3
> +     - Comparisons in the 'find_text_region()' function are safe 
> because
> +       linker symbols '_stext' and '_etext' represent fixed virtual
> +       addresses within the same '.text' region, and the function 
> 'addr'

s/function 'addr' argument/function parameter 'addr'/

> +       argument is explicitly compared to known valid memory bounds
> +       ('text_start' and 'text_end') derived from these linker 
> symbols.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R20.4
>       - The override of the keyword \"inline\" in xen/compiler.h is 
> present so
>         that section contents checks pass when the compiler chooses not 
> to

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

