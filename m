Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7232B7B72AD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 22:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612363.952280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmHd-0001H4-U6; Tue, 03 Oct 2023 20:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612363.952280; Tue, 03 Oct 2023 20:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmHd-0001Er-Pl; Tue, 03 Oct 2023 20:46:21 +0000
Received: by outflank-mailman (input) for mailman id 612363;
 Tue, 03 Oct 2023 20:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnmHc-0001El-Dy
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:46:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c099b6-622d-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 22:46:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A3ECACE13FE;
 Tue,  3 Oct 2023 20:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA90C433C8;
 Tue,  3 Oct 2023 20:46:12 +0000 (UTC)
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
X-Inumbo-ID: e5c099b6-622d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696365974;
	bh=fMzg/IHPf9jCIQPQiveaKSxlZ8+YcFiE1As8yVoEpMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mnHNkp54HXMwCt5aveZ99WVcLEGpBfUROWT+gifQET7SNzphQfIrLGmpSOHMa/77e
	 p0yTqd1cBhYsQubCvL76yRHwheSTcRp8UhKhUslbej9AEoBgsAeqmmOTPTsNHcc2cC
	 SQPkhE0bta8M465mgQRHuo5FeLWfVvviYkBvXyONswhNpvLui5IVPR/jGSfhD1mRja
	 pwjaI7egDZke+o5DVgIioQw7jAZ6OBWTMhRXaffpPGRNZBtJaYWjNd2wrEOqZheeON
	 R4L35SEugJxe5FZSDceryTwEvTMQufx9WCsDU7MTYG6Wa3w7r8wcuaQw/eml1da5kX
	 7A6JKLZnfjm/A==
Date: Tue, 3 Oct 2023 13:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Oct 2023, Nicola Vetrini wrote:
> As specified in rules.rst, these constants can be used
> in the code.
> Their deviation is now accomplished by using a SAF comment,
> rather than an ECLAIR configuration.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

"SAF" discussion aside that can be resolved elsewhere:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ------
>  docs/misra/safe.json                             | 8 ++++++++
>  xen/arch/x86/hvm/svm/emulate.c                   | 6 +++---
>  xen/arch/x86/hvm/svm/svm.h                       | 9 +++++++++
>  xen/common/inflate.c                             | 4 ++--
>  5 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b449..fbb806a75d73 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -132,12 +132,6 @@ safe."
>  # Series 7.
>  #
>  
> --doc_begin="Usage of the following constants is safe, since they are given as-is
> -in the inflate algorithm specification and there is therefore no risk of them
> -being interpreted as decimal constants."
> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> --doc_end
> -
>  -doc_begin="Violations in files that maintainers have asked to not modify in the
>  context of R7.2."
>  -file_tag+={adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
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
> index aa2c61c433b3..c5e3341c6316 100644
> --- a/xen/arch/x86/hvm/svm/emulate.c
> +++ b/xen/arch/x86/hvm/svm/emulate.c
> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>          if ( !instr_modrm )
>              return emul_len;
>  
> -        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
> -             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
> -             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
> +        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
> +             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
> +             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* SAF-2-safe */
>              return emul_len;
>      }
>  
> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> index d2a781fc3fb5..d0623b72ccfa 100644
> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>  #define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>  #define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>  #define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
> +/* SAF-2-safe */
>  #define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
> +/* SAF-2-safe */
>  #define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
> +/* SAF-2-safe */
>  #define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
> +/* SAF-2-safe */
>  #define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
> +/* SAF-2-safe */
>  #define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
> +/* SAF-2-safe */
>  #define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
> +/* SAF-2-safe */
>  #define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
> +/* SAF-2-safe */
>  #define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
> +/* SAF-2-safe */
>  #define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
>  #define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>  #define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
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

