Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106BAE2F4A
	for <lists+xen-devel@lfdr.de>; Sun, 22 Jun 2025 12:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021803.1397595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTHcR-0007Ee-31; Sun, 22 Jun 2025 10:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021803.1397595; Sun, 22 Jun 2025 10:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTHcQ-0007CF-RX; Sun, 22 Jun 2025 10:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1021803;
 Sun, 22 Jun 2025 10:08:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Dv8=ZF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uTHcN-0007C9-K5
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 10:08:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c90921aa-4f50-11f0-a30f-13f23c93f187;
 Sun, 22 Jun 2025 12:08:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D20F74EE3C22;
 Sun, 22 Jun 2025 12:08:02 +0200 (CEST)
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
X-Inumbo-ID: c90921aa-4f50-11f0-a30f-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750586883;
	b=RglfcUx7jio9bmDANlcYRLZGO8+4v2TEiNgGHGZBCl1zrqYcen5PrA2pnfEUJeVAdX8Z
	 otK+4aQgvMoVLcBP+c7y0Yv8UKpNq/4iqNxR8aYSl4Zti6oGAnKenu/aviWr7X1SecEZW
	 ariPqNBpl8MLXSOjUb4aB85eHM4Bsu+/TpF5Ty0mZCZW8Atn7L7ZVg2nqHiPg8NPk2KmU
	 7UQJ/wpPNA1GIIJ93hpQXX3VEoPZXuc5Z/s5m4sXkejh90SAaJdQpuazBX/hlKbtVk6eL
	 Lo/GbJn+b+IsPF6Xj5vKCVzBZZpBoNgyhWDzSQRFw2oNgfefqS0U1Hi9kIEFIjaRtuCe7
	 PscXrBfOzNFBvSKIzaYr4XEI4mb8pP+LgN+pTODzOx9wHbhXDUCyZ9uCIB2YffBAjLFFV
	 vsmUBOxpQNCSvbyKR1sDPfY79l2uzYVLl3iu+oerrROm8gZzpelnzL/dJ+enESwFZolk7
	 Aznx0nwtV27eNlGJJ/cSRGyZC6TCRI97SZJnWr1RQ5cjizNUqew5AsQuT+UDyk9GoXM9U
	 HoDJvrjyonxP7sL0jiibOSEEtLlMLacALrdAPJ48aecVKzpxGbJlW9eD+jdCcQrebDbxL
	 rkfter9W9dGnmbUTbpSPSuO8RGpjwG3GsAgEaZ8DW7Q9OuVc5PWfCFCsj1L+b/c=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750586883;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=jslcUOeICWODILH+OG6zwDsEGVQ8qCFR+XzV7l7lBfw=;
	b=H1CrQvDTEB7FwkStX5Wf5XGCHq/DmiYB2ZEWHlIojosFsmqhkASamL9uhe8knl3IXfNc
	 KTvhp4zhO1PZq9SvGPiauk4vjsH8ejNFkRIHyj9MbM8uqOm989kS5JksR4H40een64Up3
	 v0SYxuk8WnGlizKtdR6IendN1lj9Hfa1TjiJsVgfPknefpadbJbCjaGgfmsk2B7yA1x9h
	 BvqlV/oOUtFSQaINfRWPMsRy49c8ze6wbP5OnGVy1864S9QrDbph9P9aZF36aKMaxUtjG
	 WwE4ksEWNr+1KzNOfZtv/AfthzaAikxwS2iZGLyPqDmb9h1uN+Ycj8QsorF6oYikyBvub
	 RbgoHowK5UnYZy6MxHkb0gpxzpkgsBcY+Zl+3FPxGyoij4F+VlLKMt+KeL3NKyYM6PiJS
	 rGn/1z6dQUar6MNurG7QFdc5+aIjXPRm54NAsLdySSvjeG4WRnLjEg4hxwT5sAXn5sPCA
	 6TenSXrOlCX968gBtgjDy/O/m1JHI3sd0sl59T7AZR6LibBRjZhf1j96GPwo1iUHyRE2i
	 GziV9+2v/Y96Ed6jIZV/xKzU+ZlgDexfz+f3lYb7Plt9q++OMYilBovruKkFB08FG2iNZ
	 VII70nTubS1EDpIsdR9AFyONf+2IkOXCEiOrw0dk0u5F5yEFcoKVQzLYX0OJXwY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750586883; bh=YbKtVsMz4n/LtFJEa7gZzap5Od2cYSSMsHqPWLCn+dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ajhPkMa8I6LQu9SZm4Yqc5jLqD6g0ngVomVXZc0xXHyLNHILf4PfPEunZnusuIe2J
	 mOmVF2xjdLTwfmMqTgT87AlxNfdidiJkiEV82JcRttewKRvM3NaZYz5rJoYvD5fbMO
	 5qG1EJoAjCyKb9KGUs8haJyHkEnEN7Sff3bsc/S1uAlRmg6nFiSVUVVB9BSXaS4dz7
	 g7yfWI6TQzOUhVMC+/FW0/PPN4Wki49xHRQr8jdHfpsAS3dXInRnfU6xFUZvyRit62
	 zbb2+P13Y6Xq4NUYtYWn0tC/qlm0qynPDKcg6Ko9bjvXQ0YkoSRBvAQ4AmgFhR7ipn
	 zZQjyculLf8lg==
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 12:08:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, michal.orzel@amd.com, jbeulich@suse.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 federico.serafini@bugseng.com
Subject: Re: [PATCH v5] automation/eclair: update configuration of D4.10
In-Reply-To: <alpine.DEB.2.22.394.2506201918100.2978375@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506201918100.2978375@ubuntu-linux-20-04-desktop>
Message-ID: <bb73b812ea04857c29bdf64c570eaafa@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-21 04:19, Stefano Stabellini wrote:
> MISRA C Directive 4.10 states that "Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once".
> 
> Add a SAF tag to the existing comment on top of cpufeatures.h.

You say this, but technically the comment is not a SAF comment, just a 
regular one that is interpreted to tailor the guideline.

> Add a header inclusion guard to compile.h.
> 
> Update ECLAIR configuration to:
> - extend existing deviation to other comments explicitly saying a file
>   is intended for multiple inclusion;
> - extend existing deviation to other autogenerated files;
> - tag the guidelines as clean.
> 
> Update deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v5:
> - add missing spaces in in-code comment
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++----
>  automation/eclair_analysis/ECLAIR/tagging.ecl    |  1 +
>  docs/misra/deviations.rst                        | 12 ++++++++++++
>  xen/arch/x86/include/asm/cpufeatures.h           |  8 +++++---
>  xen/include/xen/compile.h.in                     |  3 +++
>  xen/tools/process-banner.sed                     |  5 +++++
>  6 files changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9c67358d46..3b5bc87e1d 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -72,11 +72,14 @@ they are not instances of commented-out code."
>  -config=MC3A2.D4.3,reports+={deliberate, 
> "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
>  -doc_end
> 
> --doc_begin="Files that are intended to be included more than once do 
> not need to
> -conform to the directive."
> +-doc_begin="Files that are intended to be included more than once (and 
> have
> +a comment that says this explicitly) do not need to conform to the 
> directive."
>  -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file 
> is intended to be included multiple times\\. \\*/$, begin-4))"}

[1] Here

> --config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated 
> file, do not edit! \\*/$, begin-3))"}
> --config=MC3A2.D4.10,reports+={safe, 
> "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated 
> file, do not edit! \\*/$, begin-3...begin-2))"}
> +-doc_end
> +
> +-doc_begin="Autogenerated files that do not need to conform to the 
> directive."
> +-config=MC3A2.D4.10,reports+={safe, 
> "all_area(all_loc(file(^xen/include/generated/autoconf\\.h$)))"}
>  -doc_end
> 
>  -doc_begin="Including multiple times a .c file is safe because every 
> function or data item
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
> b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index f9da5d5f4d..b95f07feb0 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -23,6 +23,7 @@
>  "MC3A2.D1.1||
>  MC3A2.D2.1||
>  MC3A2.D4.1||
> +MC3A2.D4.10||
>  MC3A2.D4.11||
>  MC3A2.D4.14||
>  MC3A2.R1.1||
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..63caa8f4a2 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -30,6 +30,18 @@ Deviations related to MISRA C:2012 Directives:
>         not to add an additional encapsulation layer.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - D4.10
> +     - Files that are intended to be included more than once (and have
> +       a comment that says this explicitly) do not need to conform to 
> the
> +       directive.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - D4.10
> +     - There are autogenerated files that do not need to comply to the
> +       directive.
> +     - Tagged as `safe` for ECLAIR. Such files are:
> +        - xen/include/generated/autoconf.h
> +
>     * - D4.10
>       - Including multiple times a .c file is safe because every 
> function or data item
>         it defines would in (the common case) be already defined.
> diff --git a/xen/arch/x86/include/asm/cpufeatures.h 
> b/xen/arch/x86/include/asm/cpufeatures.h
> index 9e3ed21c02..69041219cb 100644
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -1,6 +1,6 @@
> -/*
> - * Explicitly intended for multiple inclusion.
> - */
> +/* This file is intended to be included multiple times. */
> +/* #ifndef X86_CPUFEATURES_H */
> +/* #define X86_CPUFEATURES_H */
> 

Are these two lines really needed? I may be mistaken, but I think the 
violation's first location would be the #include below with a comment a 
couple of lines above captured by the config at the top [1]. @Federico 
thoughts?

>  #include <xen/lib/x86/cpuid-autogen.h>
> 
> @@ -63,3 +63,5 @@ XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* 
> Use VMCALL instead of VMMCAL
> 
>  /* Total number of capability words, inc synth and bug words. */
>  #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit 
> words worth of info */
> +
> +/* #endif X86_CPUFEATURES_H */
> diff --git a/xen/include/xen/compile.h.in 
> b/xen/include/xen/compile.h.in
> index 3151d1e7d1..9206341ba6 100644
> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -1,3 +1,6 @@
> +#ifndef XEN_COMPILE_H
> +#define XEN_COMPILE_H
> +
>  #define XEN_COMPILE_DATE	"@@date@@"
>  #define XEN_COMPILE_TIME	"@@time@@"
>  #define XEN_COMPILE_BY		"@@whoami@@"
> diff --git a/xen/tools/process-banner.sed 
> b/xen/tools/process-banner.sed
> index 56c76558bc..4cf3f9a116 100755
> --- a/xen/tools/process-banner.sed
> +++ b/xen/tools/process-banner.sed
> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
> 
>  # Trailing \ on all but the final line.
>  $!s_$_ \\_
> +
> +# Append closing header guard
> +$a\
> +\
> +#endif /* XEN_COMPILE_H */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

