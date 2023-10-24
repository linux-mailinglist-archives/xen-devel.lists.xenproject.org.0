Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF37D5C68
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 22:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622611.969621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvO3H-0007Ka-Hh; Tue, 24 Oct 2023 20:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622611.969621; Tue, 24 Oct 2023 20:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvO3H-0007Ip-Dn; Tue, 24 Oct 2023 20:30:59 +0000
Received: by outflank-mailman (input) for mailman id 622611;
 Tue, 24 Oct 2023 20:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl3Y=GG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvO3F-0007Ih-UO
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 20:30:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ae65c73-72ac-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 22:30:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEB5ACE2FCB;
 Tue, 24 Oct 2023 20:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4E9C433C8;
 Tue, 24 Oct 2023 20:30:48 +0000 (UTC)
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
X-Inumbo-ID: 3ae65c73-72ac-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698179450;
	bh=R9U1HkyL9AM9BebEvSfj8VjHrOYUWaXJd8O0/8aEF1o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bPe4qCI3Lj9VfkYpHuNgYbzweoSen7n8twk5LeFs7uIEdTeWnZVSScrjZk6qoPy/g
	 ANQ3i3U3z9KROi2AlWJHX99T2Oe/tCH8Pxy9bhrTTbQle22lw04D1CVmDYSWemZAhf
	 0Zoky9awcFokrm1SWn0/aKmghkGdoWKvSPLTQluTytu44amypYwJoov5VBdUommS1K
	 dAn6W9Oqb31mV/ua/FF93ZQV+VLi4rr886nkwJiUN6Yxalqq4xdisEWyWx0okRq900
	 GL1JLiq3c/naejHhQUHa5If1wstzIGLwc2/cIS8lkV9ehhcrl/u5O86i0lCkVTN1pW
	 YGOJcv/CZht/A==
Date: Tue, 24 Oct 2023 13:30:47 -0700 (PDT)
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
Subject: Re: [XEN PATCH][for-4.19 v3] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310241329390.271731@ubuntu-linux-20-04-desktop>
References: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Nicola Vetrini wrote:
> As specified in rules.rst, these constants can be used
> in the code.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - replace some SAF deviations with configurations
> Changes in v3:
> - refine configurations and justifications
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
>  docs/misra/deviations.rst                        |  5 +++++
>  docs/misra/safe.json                             |  8 ++++++++
>  xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
>  xen/common/inflate.c                             |  4 ++--
>  5 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a27..ea5e0eb1813f 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -85,10 +85,12 @@ conform to the directive."
>  # Series 7.
>  #
>  
> --doc_begin="Usage of the following constants is safe, since they are given as-is
> -in the inflate algorithm specification and there is therefore no risk of them
> -being interpreted as decimal constants."
> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> +-doc_begin="It is safe to use certain octal constants the way they are defined in
> +specifications, manuals, and algorithm descriptions."
> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
> +-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
>  -doc_end
>  
>  -doc_begin="Violations in files that maintainers have asked to not modify in the
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a189253b..26c6dbbc9ffe 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
>           - __emulate_2op and __emulate_2op_nobyte
>           - read_debugreg and write_debugreg
>  
> +   * - R7.1
> +     - It is safe to use certain octal constants the way they are defined in
> +       specifications, manuals, and algorithm descriptions.

I think we should add that these cases have "octal-ok" as a in-code
comment. Everything else looks OK so this small change could be done on
commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R7.2
>       - Violations caused by __HYPERVISOR_VIRT_START are related to the
>         particular use of it done in xen_mk_ulong.
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 39c5c056c7d4..7ea47344ffcc 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -20,6 +20,14 @@
>          },
>          {
>              "id": "SAF-2-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R7.1"
> +            },
> +            "name": "Rule 7.1: constants defined in specifications, manuals, and algorithm descriptions",
> +            "text": "It is safe to use certain octal constants the way they are defined in specifications, manuals, and algorithm descriptions."
> +        },
> +        {
> +            "id": "SAF-3-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
> index aa2c61c433b3..93ac1d3435f9 100644
> --- a/xen/arch/x86/hvm/svm/emulate.c
> +++ b/xen/arch/x86/hvm/svm/emulate.c
> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>          if ( !instr_modrm )
>              return emul_len;
>  
> -        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
> -             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
> -             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
> +        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* octal-ok */
> +             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* octal-ok */
> +             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* octal-ok */
>              return emul_len;
>      }
>  
> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
> index 8fa4b96d12a3..be6a9115187e 100644
> --- a/xen/common/inflate.c
> +++ b/xen/common/inflate.c
> @@ -1201,8 +1201,8 @@ static int __init gunzip(void)
>      magic[1] = NEXTBYTE();
>      method   = NEXTBYTE();
>  
> -    if (magic[0] != 037 ||
> -        ((magic[1] != 0213) && (magic[1] != 0236))) {
> +    /* SAF-2-safe */
> +    if (magic[0] != 037 || ((magic[1] != 0213) && (magic[1] != 0236))) {
>          error("bad gzip magic numbers");
>          return -1;
>      }
> -- 
> 2.34.1
> 

