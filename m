Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84974B2174E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 23:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078093.1439099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ula1X-0002Me-2B; Mon, 11 Aug 2025 21:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078093.1439099; Mon, 11 Aug 2025 21:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ula1W-0002KE-UX; Mon, 11 Aug 2025 21:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1078093;
 Mon, 11 Aug 2025 21:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn8B=2X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ula1V-0002K8-3P
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 21:25:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9f4e13d-76f9-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 23:25:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5FC5C4EE0744;
 Mon, 11 Aug 2025 23:25:37 +0200 (CEST)
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
X-Inumbo-ID: b9f4e13d-76f9-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754947537;
	b=PDLqaUigEukRZs4b8BBjZVlq4phnPjphoykEWpjxQ/qihUbeb6cMhjUaIFGKY+axkSZg
	 dpAdIBDEFLH4s5fbp5IGzwd3GcrAZQXENu+KTlNjnXHdlXlAL5H0eOhz/4TFsqr8xbA0O
	 ZJVijniCyeYd4BwCVo4i2GWtu4Vdt8iaLlPvMUdn2ActPYv9r9wTdh9p+N31gEAlRKj6C
	 3gdtBXpzRd+SUfW7yGk72bA1b+QgQ9xQJSkrDs267FFKtHrBQ2bPVvIC0Ni5VH1e6JzI8
	 bPLMi9a9NUku6BcirEzQhuCDDueQPyIi/FbENFG9mAH1u7nLyUNLRzL4xNXKunPui07MN
	 SaXYyUWEULswYkUbQgjnAFwkU5LrrM4qRTI658U/4IDlvxLeK/RPla8qhlPOzjFxR0A19
	 PmhFTyYxNizxqhCdVexWEEZ+GZEq7JYJJ95mMOFVniXJW71T26WnqKKHsdn526Z3C/lhT
	 bYpHGmPw2v4Vuks23Nn6HAUIYtS1uk3bFrglI4zBekvHg6z/FbGymBXg9PyQjkfrV3fQw
	 ubgf6m/ZmOhTxRdtMROlePl7xTUD9i59WF99z+7ZGszorWu86s/JJyLjLl2KLIQvYRspT
	 5nQLdDrg58a0xaoHeouTcG5J1RN84+j0u36quGS+AReqL4Ma/XEEpnpFwa1umRA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754947537;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=UgZ4TG4o7/7PqJ4miBtWdDBiHVQ9ECM+PYUK+LLCT5s=;
	b=UJKR4dnQZ7M/ceM8XeO7491ETe8WwiyxwvNiP6zv7zI5J8wVMNOYUwMiyRi951W1JY9c
	 U449ABrmkoKOsi5qWw54vexroAu31TN995YtVQ1oxgT1R5hBd1rnPJCixHhjvhCIjVXzR
	 dyoLwC9JtT/8KhDZU+WGo4XQ8Zom5TeR4A2q9wWUd9y52A2wpEkqfK26ReRJ3ABuukhKd
	 KWVvj9s6S8M3pbgz8wbwagPXM8X+b0a1tQgXsTeUyWbloVDV0XPx6snV6Wm05MckjtP+L
	 kpLd1wlKyQGXtrP4SRUNCq1tYlk7CReZSrDkmQdJv5jnNCWefWz0tDdLeFbGagygHt6Nl
	 7ib3MKxTarXFDZXBkgQJrx1x8/GnNLD90vLNxeowcuVOIL2NpUuQKz3s3bmP9HZX+yoG/
	 g/dtfOmG3totadCRjxe7GjTmDjGZslUHZuu9ppGX4gDHxDoWLilg1bI+B81+2dqppBygJ
	 N1rlmsHey0HQkbbH/N06qQR+7arxuHecjlOvWN8Ztmp/EH7Pp/UTV/qeCpzf0MMSicAi6
	 MPD/vzuxyjjXx4CJD/MO54IpmBI1oKm4I6Vut5kdeDxdAId68Ug5j/e2FNnHorBzQpaB0
	 /TxGWdrAmk23pdx/QUt8W7K1rQz8vFroRgO8j54KYY3qSGp08R0Hdi2KdhfZH/0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754947537; bh=JYz7HgVB1qnQRIYKNZdmeJ5xyFJJfcd93eXhDO1dtNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pctmzz4VCytXQ6lIYYgEUV0Acn9CBWw6cEg6VWUL/pLO8R96TEPu78FsM5eiYNL3i
	 ijw/Mbhd8CKi9EfBp1jeT9IG2WzR+4CfgN5/wqEAGHbP+ZWsPP/qqpEbX+m1wrUvbK
	 Wuu0/kfEax1+YqXoBiECj37E4E02V4c1Dp2ukrB8wmcAgoats94MVWMrDiO6inuTZk
	 5UK2r2x3laq+BTFgZ1IGrEtQ/HW7vKwGBDNzXuXLN0LGCwhYCIChiGA91tAB3BiF5m
	 hgJ5hH0VOjs8H+UxJx+xtSKJ5qTEw8NzblBTdcQw09qMvkfUG0PrRxiXdlfoUGhw9c
	 +60s7zDu1B1dw==
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 23:25:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
In-Reply-To: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
Message-ID: <a318ef2d5cad37d2fda0bb4a52c90964@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-11 22:30, Dmytro Prokopchuk1 wrote:
> MISRA Rule 16.4: Every switch statement shall have a default label.
> The default clause must contain either a statement or a comment
> prior to its terminating break statement.
> 
> However, there is a documented rule that apply to the Xen in
> 'docs/misra/rules.rst':
> Switch statements with integer types as controlling expression
> should have a default label:
>  - if the switch is expected to handle all possible cases
>   explicitly, then a default label shall be added to handle
>   unexpected error conditions, using BUG(), ASSERT(), WARN(),
>   domain_crash(), or other appropriate methods;
> 
> These changes add `ASSERT_UNREACHABLE()` macro to the default clause of
> switch statements that already explicitly handle all possible cases. 
> This
> ensures compliance with MISRA, avoids undefined behavior in unreachable
> paths, and helps detect errors during development.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/arch/arm/decode.c      |  3 +++
>  xen/arch/arm/guest_walk.c  |  4 ++++
>  xen/common/grant_table.c   | 10 ++++++++--
>  xen/drivers/char/console.c |  3 +++
>  4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 2537dbebc1..cb64137b3b 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct 
> hsr_dabt *dabt)
>          case 3: /* Signed byte */
>              update_dabt(dabt, reg, 0, true);
>              break;
> +        default:
> +            ASSERT_UNREACHABLE();
> +            break;
>          }
> 

I think this is fine, and there should be no problems with the break 
being unreachable in some configs due to the call property for 
ASSERT_UNREACHABLE

-doc_begin="Calls to function `__builtin_unreachable()' in the expansion 
of macro
`ASSERT_UNREACHABLE()' are not considered to have the `noreturn' 
property."
-call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))", 
{"noreturn(false)"}}
-doc_end


>          break;
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 09fe486598..9199a29602 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -167,6 +167,10 @@ static bool guest_walk_sd(const struct vcpu *v,
>              *perms |= GV2M_EXEC;
> 
>          break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +            break;
>      }
> 

This one instead, besides being indented misleadingly IMO, should 
instead be on an enum instead of

/*
  * First level translation table descriptor types used by the AArch32
  * short-descriptor translation table format.
  */
#define L1DESC_INVALID                      (0)
#define L1DESC_PAGE_TABLE                   (1)
#define L1DESC_SECTION                      (2)
#define L1DESC_SECTION_PXN                  (3)

so that

-doc_begin="Switch statements having a controlling expression of enum 
type deliberately do not have a default case: gcc -Wall enables -Wswitch 
which warns (and breaks the build as we use -Werror) if one of the enum 
labels is missing from the switch."
-config=MC3A2.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* 
has no 
`default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
-doc_end

applies. What do you think?

>      return true;
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..60fc47f0c8 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -330,9 +330,12 @@ shared_entry_header(struct grant_table *t, 
> grant_ref_t ref)
>          /* Returned values should be independent of speculative 
> execution */
>          block_speculation();
>          return &shared_entry_v2(t, ref).hdr;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
>      }
> 
> -    ASSERT_UNREACHABLE();
>      block_speculation();
> 

This is ok I think, same as (1).

>      return NULL;
> @@ -727,10 +730,13 @@ static unsigned int nr_grant_entries(struct 
> grant_table *gt)
>          /* Make sure we return a value independently of speculative 
> execution */
>          block_speculation();
>          return f2e(nr_grant_frames(gt), 2);
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
>  #undef f2e
>      }
> 
> -    ASSERT_UNREACHABLE();
>      block_speculation();
> 

Same here.

>      return 0;
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9bd5b4825d..608616f2af 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -889,6 +889,9 @@ static int cf_check parse_console_timestamps(const 
> char *s)
>          opt_con_timestamp_mode = TSM_DATE;
>          
> con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
>          return 0;
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
>      }
>      if ( *s == '\0' || /* Compat for old booleanparam() */
>           !strcmp(s, "date") )

And here as well.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

