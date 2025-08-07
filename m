Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEDB1D364
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 09:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072577.1435592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujv7s-0005KU-OY; Thu, 07 Aug 2025 07:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072577.1435592; Thu, 07 Aug 2025 07:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujv7s-0005Hw-LT; Thu, 07 Aug 2025 07:33:24 +0000
Received: by outflank-mailman (input) for mailman id 1072577;
 Thu, 07 Aug 2025 07:33:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qi0u=2T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ujv7r-0005Hq-4L
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 07:33:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad224b9-7360-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 09:33:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 572DA4EE3C03;
 Thu,  7 Aug 2025 09:33:19 +0200 (CEST)
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
X-Inumbo-ID: cad224b9-7360-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754551999;
	b=Wr0+ejIeO2i8/znhM933D+dzQrqfQmzvXu4gX9u6qzEWjbcjsMUoM/Zo4axG/bd5jpn7
	 BYbGJWLIoNGh3PX7JHATnnr1JPuxkLa1tilPEn8MTCC51ZGOJel6IP8FOEgLlQnjFqk46
	 eBbqMTQxQbYuvO3TPjPT45wK5/XB/sUKrWyZ8BF/ZvH5iyg9xgXgdWEKmsomqwwcYG9Du
	 ZCJarmmG+F5Gy8HIenUYnZCXTeUvjjzx27eMU9wXYlGey20K/1DicrEVJq4cTsbZ6tMDs
	 frNYv9pClLPQMTkUjaDIF65P3zM/cr/PoPawnYFcjaKfm5ApFTcmxReWpmC/mvrTnH14J
	 UXFpIfFompGSZAfQ/rNn3pGbfbpaynCOkmBUMnNkLCjjOQnpy+5rYAoiniGcKOFy9zhhh
	 n24GdBt37smTWkj8/GdNn9KGnv8DTC/ZB1ukY4QQaZ7SBCf4wyZVsqkA/wRQoyN7nTsO1
	 ZhAz7G0Hhorl5ifcb6Bk8KHKkQBV1jZaZjZVQ77QHmFvU707qtIHFP6XxTGC/cJghnagt
	 fmonePivJ60DSg19M7nOasueVaHfCuNmgEYX+f7SCouspRVboHANVV8xQni0EdcuHRXY0
	 EQcsp0g31NFZgRk7PTEl/AawWkbWe5zY3CxbRlYAuduf6c3oOtgo37Tm+OWRs/0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754551999;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=0NyDquy2rrGKeFcnHpLT7eVIK2AoUYc/czhxB9AKgGk=;
	b=dspUBgEI5eeHPnFGVLoEgPkk8B50vGZ87LWkr50YTjCTHftlbhkrb8c1A9UCBo6VY5CF
	 opGK/7Yx0YaUN4HrmBosZPWMfO0S3O0IUIWskHdiE7OamnJSbeycwoo6UlGwgXpBV/AbM
	 npGTY7Sn+00SGLZ3Y5sTmpBn2wgFZsnFPNsHzPeSNwoF61q/N72Y2Niyx9Ig3laWwzRiX
	 kf8DPy7YUaouKucDw9d1zblfHXhmwknZBRktPY3tEPDpAqxZFrX952wPqJNMFBjSmh0M4
	 uIU4UkQ2kgygRibVsnc4moYQgX6iE7Wgrq/pOEHiCqf8RTa+MEdbAXuwOTykI3UWJbvvB
	 prtjHXzgbxDEqbKiPkqXVQ5QxAppDeaFOutFqNdlGbDf+w7PNqLey0mmD+cpAtaqXqOSl
	 tMcF5YUqKKZcmg5p8ylVIYOv6oYFV9qT3Tg/dCRmkJc05fuB4UOkVcKm/i8TioF0CWGh7
	 e8dEVpdA5Ujf/pIU1gBi3WDkeCADfvoZFQ6o+GA570SrQ7EqXqYEgcWCePJkuftbPXXuY
	 Lyp+qleyvu+PTFlpiNu4caYYr2H1RUn/rAdw/ANSJc+zMYDBl782fhKHb6INuJt3UfIbV
	 ciPWBshZcbhV+COeC+/Ol7wVscOTLGOdcJbdBC90tqd2K2gMcRMuUV4zs2Vce7E=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754551999; bh=6Jc5s6lkESPMvHcmo8eTo9SxerY99KJu3uqUGD3zOd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cAI2uBa4MDoGL2J8I0hcSZ7Rm9TezOyDuIon2MbRwKKNd2UP/SnoHVNVJ7UOOwV5B
	 OSKiUQwbWDK4Cs8zwYnkAmU4NtDNpIYDsy+ZZ8bVWuaVkjb0b6yPlQ5mTyRr6lJZ1R
	 IvRfEHYOKdIdRzOmnz92GJC3gP5hDvzierKyvR9b3znWlbMiTHti/QE0g68oLsIYPu
	 tJj3in9nMMnHDeVU2dazhEgScEoH1wCT1WfuRoZSWZkKynzE62DS+5KBfHIiiVhlFJ
	 oEqWVR0Kcz5hxEUMVdI+ws1MMc2DT4J+niDFAr9v4pHjO3SCUMP6wUbV0mbHPcYnkK
	 ggFwrcsPu8mbA==
MIME-Version: 1.0
Date: Thu, 07 Aug 2025 09:33:19 +0200
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
Message-ID: <874c914eafd42020afc2087eccf4d7a3@bugseng.com>
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

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

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

