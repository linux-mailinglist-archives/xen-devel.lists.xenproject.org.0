Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376ACB17926
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 00:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066539.1431719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhbpc-0002kP-TN; Thu, 31 Jul 2025 22:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066539.1431719; Thu, 31 Jul 2025 22:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhbpc-0002i0-QV; Thu, 31 Jul 2025 22:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1066539;
 Thu, 31 Jul 2025 22:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYFp=2M=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uhbpa-0002hu-IX
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 22:32:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd03795-6e5e-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 00:32:56 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6633C4EE3C02;
 Fri,  1 Aug 2025 00:32:54 +0200 (CEST)
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
X-Inumbo-ID: 4dd03795-6e5e-11f0-a320-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754001174;
	b=OKFCFK2i8o0vBdrVfvq5tuBqh05WFchv9u08G5vabuF/4qMhujwqhFADQumjjNlS4KmI
	 YJ8RAtJ5uYZEFdiwfHb5rnFo8rEbneW81HiYE/NdkI1eZsLvxGpv8TcEn6bzX8k+2DdHY
	 9HorzHOuBis0vnJLaDKN2QJSraBUfcMMji/WMmwvQRZgE9tQ2lFrZsbfoLmVIJrD0WJ5h
	 JJpIXHvOj1pZckbI5UXAhT7jD45awouTNpA7eMrWG7rjLOj4iIOmpuhII8GvDUTtmJI12
	 8DD22E374Ur26GhUeTKnxPz6HdTK6T6KDuSZofK0U4d7MTx0txlQ8frbeD0n8at4GUXMR
	 iT1hR1kgCbAfowgvT51x47AsFiGjCW3jFWn3/ZTrepHoNmUXRAuvAg+ZhSBaL7+FBJ5+z
	 G2dYBm5gVqRgzFn6HEMh/XuTZCF0stoSIdGKFN8iSvCZHa4abB7zPnDzH4zA1llIXnn0c
	 KKAxtlwh7quZaP8QDirXRZZf4Rw3zAX8lUCggAVOLjPQs56Z598OfljLVFUpaCkMmoLfK
	 lAFWNUMlG77Qhjm3jjNZIc4YxfgjJ101VWBkDr4xyAMDmTdhlI8Q8j6cL06/BtfSMynbk
	 of8iLlPNe8H1aR4tqM4jIBlRT9dV4nlyl64fwCykQuEdPWSMFNTLjNdMwvWbsWc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754001174;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Js3edl4FHYMHbUOuNb6xr4SuaxZR/EzEmYzKQMXsvwQ=;
	b=or6xhatZbQZpVyy21JshXABMiRv60RJun9zvPQWRk1MHSpcIFuiND53Dl4Qcc0VAEdF6
	 2uObZWRgX3pBF0Rr0r860sEr+toqYiYcx20iKcMR6LC/jXJ4/i/Rc89hgMxNKlnVDTZ23
	 /xwzBuKVtWQtJJbnHgItc3hntL9sBpWkAUSBIv2wO7CoxIqww/LgOU7fvsI4jewywZU+Y
	 ctUJGF+IJp9QqDwm/AdsU+D/CI0/luWszhnk+YxQG1d3vUi6YjRqGmQEtUYs+ZbZJIm5F
	 uEcVADR7jVGlAMKvLkrAej9RqC1NSO+5bbCKZTVpnCfA9TGpnLG4YacBNwAKuOkFnyn8c
	 r9TMdmvetZXKGoaqTzCW/o5jQ7EMJKHvgdgH9wSBgldVmln1tqv0zJ1Usfge/nyMT3a55
	 SPOzurp6KcRDfa8FyzW7NxKIIHirIHWONCOSKYNPqYo8AWGjin8cBwQoea1jCAehiKc0R
	 oxWV7jc8yHiAjWlsg/Hlp6zxmqQaBllJPpvW2DWdM5bPUW4jJqm/t7/A69HtHFgf8o533
	 3lhqEE/v9sEPaawOGSN+EOfrD2ixDB+jDU4fc4XpYLeLS4Clac1ugEMXZloAo7HvDHms3
	 x6lZQecIMS3WNrbBrnqRe/Jh23rNjCywZHmdOakD6KjI/5I0Fyjba7dFpzaVC9I=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754001174; bh=SiJSZ2rr4q1zLKtg9GUzHhK+jIRcAMxovzXLdzrzQ/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VGMNOMSUaw1UMmAXfNWb/ShQDMQuN80/6s+DIXtftE2U3H1LqAA/EK6WSL0yXCyne
	 3RobZvu66cKIAEcRiqvTD6izKMS+5iS0rztgN7QopS97KGeRaZN67U4Z8mjVMg5149
	 Y8vlxfoKa6E0xbscpCsftCkzcCU6RMnOOmnspniyHIoN+vX7uby8GU7n0nJKNBdKul
	 aMX+zRaDDO+KJGSBea98LGVG4HObpJVHW2YR2Jx2oNL9jg9y5asQv+dxtYMdSB8vak
	 zFH++sYGOpmQVyd1MgWw77AGs4y5l7GQFPg6nmFe1AfqiVi8Kgy2zSlQILT5lWEkOM
	 SOSYDEg9zf+bg==
MIME-Version: 1.0
Date: Fri, 01 Aug 2025 00:32:54 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v4] misra: add deviations of MISRA C Rule 5.5
In-Reply-To: <afe942916b8a2408f575d2acda49699f74718161.1753991597.git.dmytro_prokopchuk1@epam.com>
References: <afe942916b8a2408f575d2acda49699f74718161.1753991597.git.dmytro_prokopchuk1@epam.com>
Message-ID: <a3ac54d4fa69bfde695a55791a89eab6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-31 22:43, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro 
> names".
> 
> Update ECLAIR configuration to deviate clashes: specify the macros that
> should be ignored. Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # ECLAIR

> ---
> Changes in v4:
> - fixed formatting (aligned length chars per line)
> - set 'ignored_macros' as a regex expression
> - set a deviation restriction on xen/common/grant_table.c
> - s/ensures/to ensure/
> - fixed grammar errors
> 
> Link to v3:
> https://patchew.org/Xen/e681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro._5Fprokopchuk1@epam.com/
> 
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1960066579
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++++++++
>  docs/misra/deviations.rst                     | 22 +++++++++++++++++++
>  docs/misra/rules.rst                          | 17 ++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 483507e7b9..ab3400fc89 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -117,6 +117,16 @@ it defines would (in the common case) be already 
> defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
> 
> +-doc_begin="Clashes between bitops functions and macro names are 
> deliberate.
> +These macros are needed for input validation and error handling."
> +-config=MC3A2.R5.5,ignored_macros+="^(__)?(test|set|clear|change|test_and_(set|clear|change))_bit$"
> +-doc_end
> +
> +-doc_begin="Clashes between grant table functions and macro names in 
> 'xen/common/grant_table.c' are deliberate.
> +These macros address differences in argument count during 
> compile-time, effectively discarding unused parameters to avoid 
> warnings or errors related to them."
> +-config=MC3A2.R5.5,ignored_macros+="name(update_gnttab_par||parse_gnttab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
> +-doc_end
> +
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  
> -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index e78179fcb8..4c64a8be62 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - R5.5
> +     - Clashes between bitops ('__test_and_set_bit', 
> '__test_and_clear_bit',
> +       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 
> 'change_bit',
> +       'test_and_set_bit', 'test_and_clear_bit', 
> 'test_and_change_bit')
> +       functions and macro names are intentional. These are necessary 
> for error
> +       handling and input validation to ensure that the size of the 
> object being
> +       referenced by the memory address (passed as an argument to the 
> macro)
> +       meets the minimum requirements for the bit operation. This 
> prevents unsafe
> +       operations on improperly sized data types that could lead to 
> undefined
> +       behavior or memory corruption. The macros encapsulate this 
> conditional
> +       logic into a single, reusable form, simplifying the code and 
> avoiding
> +       function call overhead. Also this bit operations API was 
> inherited from
> +       Linux and should be kept for familiarity.
> +     - ECLAIR has been configured to ignore these macros.
> +
> +   * - R5.5
> +     - Clashes between grant table ('update_gnttab_par', 
> 'parse_gnttab_limit')
> +       functions and macro names are intentional. These macros address
> +       differences in argument count during compile-time, effectively 
> discarding
> +       unused 2nd and 3rd parameters to avoid warnings or errors 
> related to them.
> +     - ECLAIR has been configured to ignore these macros.
> +
>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending 
> on the
>         type of guest to service.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 3e014a6298..cba15933fe 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -196,6 +196,23 @@ maintainers if you want to suggest a change.
>             #define f(x, y) f(x, y)
>             void f(int x, int y);
> 
> +       Clashes between bitops functions and macro names are allowed
> +       because they are used for input validation and error handling.
> +       Example::
> +
> +           static inline void set_bit(int nr, volatile void *addr)
> +           {
> +               asm volatile ( "lock btsl %1,%0"
> +                              : "+m" (ADDR) : "Ir" (nr) : "memory");
> +           }
> +           #define set_bit(nr, addr) ({                            \
> +               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> +               set_bit(nr, addr);                                  \
> +           })
> +
> +       Clashes between grant table functions and macro names are 
> allowed
> +       because they are used for discarding unused parameters.
> +
>     * - `Rule 5.6 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>       - Required
>       - A typedef name shall be a unique identifier

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

