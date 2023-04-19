Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D56E7080
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 02:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523098.812837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1povvp-00014W-EQ; Wed, 19 Apr 2023 00:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523098.812837; Wed, 19 Apr 2023 00:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1povvp-00011v-B4; Wed, 19 Apr 2023 00:44:21 +0000
Received: by outflank-mailman (input) for mailman id 523098;
 Wed, 19 Apr 2023 00:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1povvo-00011p-P6
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 00:44:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 502df9e8-de4b-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 02:44:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6674262F6A;
 Wed, 19 Apr 2023 00:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613FAC433D2;
 Wed, 19 Apr 2023 00:44:14 +0000 (UTC)
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
X-Inumbo-ID: 502df9e8-de4b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681865055;
	bh=RVRfQO5esDlerePnzZ5V1QxEUUsFiDgRsMwmpFYjjAg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mAOhyMH6MBAEvqL7onW4AW6qU5ZGQyWQWR2kpMg28fQYv/HB2BFcfsI7+j17zi3ld
	 Vg5UNMQZPf/qq/gV6WcU+NPcIT8CUQX56JrqlU+6ed+XubuxQkJna08056TNvqq8D6
	 wNKrx1kLDpzQdxHthjaQrVocCrRzqWvSCmof7Uh/7g5rSjLYdbBPpT9gGFeBSUvPvr
	 FrrGTJaY0S6R7GdTDyf50t+rqGljy0tEa0ZvcByjlRVNUSkws1uy8AL//qsQ8WrIJR
	 nYCLloM1T2gblN5RHEILZIyvygwPgeMgmHUlj+MtZg0xswGR9BbSOHLcHSxdqapnJ7
	 zS/WlaPz9hKQg==
Date: Tue, 18 Apr 2023 17:44:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] arm/alternatives: Rename alt_instr fields which
 are used in common code
In-Reply-To: <20230417121357.3738919-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304181744060.15580@ubuntu-linux-20-04-desktop>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com> <20230417121357.3738919-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-399832817-1681865055=:15580"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-399832817-1681865055=:15580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Apr 2023, Andrew Cooper wrote:
> Alternatives auditing for livepatches is currently broken.  To fix it, the
> livepatch code needs to inspect more fields of alt_instr.
> 
> Rename ARM's fields to match x86's, because:
> 
>  * ARM already exposes alt_offset under the repl name via ALT_REPL_PTR()
>  * "alt" is somewhat ambiguous in a structure entirely about alternatives
>    already.
>  * "repl", being the same number of character as orig leads to slightly neater
>    code.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> The other option is to make alt_instr an entirely common structure, but it's
> already different between ARM and x86 and I'm not sure the result of doing
> this would result in nicer code.
> ---
>  xen/arch/arm/alternative.c             |  6 +++---
>  xen/arch/arm/include/asm/alternative.h | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index f00e3b9b3c11..7366af4ea646 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -44,7 +44,7 @@ static bool branch_insn_requires_update(const struct alt_instr *alt,
>          return true;
>  
>      replptr = (unsigned long)ALT_REPL_PTR(alt);
> -    if ( pc >= replptr && pc <= (replptr + alt->alt_len) )
> +    if ( pc >= replptr && pc <= (replptr + alt->repl_len) )
>          return false;
>  
>      /*
> @@ -128,9 +128,9 @@ static int __apply_alternatives(const struct alt_region *region,
>              continue;
>  
>          if ( alt->cpufeature == ARM_CB_PATCH )
> -            BUG_ON(alt->alt_len != 0);
> +            BUG_ON(alt->repl_len != 0);
>          else
> -            BUG_ON(alt->alt_len != alt->orig_len);
> +            BUG_ON(alt->repl_len != alt->orig_len);
>  
>          origptr = ALT_ORIG_PTR(alt);
>          updptr = (void *)origptr + update_offset;
> diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
> index 1eb4b60fbb3e..d3210e82f9e5 100644
> --- a/xen/arch/arm/include/asm/alternative.h
> +++ b/xen/arch/arm/include/asm/alternative.h
> @@ -13,16 +13,16 @@
>  
>  struct alt_instr {
>  	s32 orig_offset;	/* offset to original instruction */
> -	s32 alt_offset;		/* offset to replacement instruction */
> +	s32 repl_offset;	/* offset to replacement instruction */
>  	u16 cpufeature;		/* cpufeature bit set for replacement */
>  	u8  orig_len;		/* size of original instruction(s) */
> -	u8  alt_len;		/* size of new instruction(s), <= orig_len */
> +	u8  repl_len;		/* size of new instruction(s), <= orig_len */
>  };
>  
>  /* Xen: helpers used by common code. */
>  #define __ALT_PTR(a,f)		((void *)&(a)->f + (a)->f)
>  #define ALT_ORIG_PTR(a)		__ALT_PTR(a, orig_offset)
> -#define ALT_REPL_PTR(a)		__ALT_PTR(a, alt_offset)
> +#define ALT_REPL_PTR(a)		__ALT_PTR(a, repl_offset)
>  
>  typedef void (*alternative_cb_t)(const struct alt_instr *alt,
>  				 const uint32_t *origptr, uint32_t *updptr,
> @@ -90,12 +90,12 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
>  #include <asm/asm_defns.h>
>  #include <asm/macros.h>
>  
> -.macro altinstruction_entry orig_offset alt_offset feature orig_len alt_len
> +.macro altinstruction_entry orig_offset repl_offset feature orig_len repl_len
>  	.word \orig_offset - .
> -	.word \alt_offset - .
> +	.word \repl_offset - .
>  	.hword \feature
>  	.byte \orig_len
> -	.byte \alt_len
> +	.byte \repl_len
>  .endm
>  
>  .macro alternative_insn insn1, insn2, cap, enable = 1
> -- 
> 2.30.2
> 
--8323329-399832817-1681865055=:15580--

