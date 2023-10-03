Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1A7B6E3A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 18:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612294.952156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qni5l-0000QK-Gq; Tue, 03 Oct 2023 16:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612294.952156; Tue, 03 Oct 2023 16:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qni5l-0000OG-ED; Tue, 03 Oct 2023 16:17:49 +0000
Received: by outflank-mailman (input) for mailman id 612294;
 Tue, 03 Oct 2023 16:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56qu=FR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qni5k-0000Nr-C3
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 16:17:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 639d987c-6208-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 18:17:47 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-406619b53caso10598045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Oct 2023 09:17:46 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bce08000000b004064741f855sm1606996wmc.47.2023.10.03.09.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 09:17:45 -0700 (PDT)
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
X-Inumbo-ID: 639d987c-6208-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696349866; x=1696954666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VGgNphxlo6kbHPYTl7anzbPStjCeoISbxZUvDrpuBbw=;
        b=v2nwEQ/x4j6j0Ay+rL1xQaZ31JFGwjm+BdN4LzvB0D6ImMhCaW+3hUrzqsT7qm8vY1
         VunNLVv3/QEPZokFSH9qWz1TEynvKndh4EmHvWdfbxMrb+L7VBRPiCkKhFLPXb6Xskgc
         SMAdOE/nUw4w7M7yZe7DbZwvlRMDkZj+oTODQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696349866; x=1696954666;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGgNphxlo6kbHPYTl7anzbPStjCeoISbxZUvDrpuBbw=;
        b=FttzXHyJsG/tSoar+ot3U+19JIrF4eUcfbrTWHBDbFCbGhYZsYhLejYjOH92C349Qh
         TDrHH2wynFKCttNG+90Ib0VvNbeQWcZiCfi+DdYrOgEkybyMoJwJ0lDd7U7W6wh+g3Ju
         ZL4ycLxoBakbkE/zsJ8gR25re3B/EqaJgxACnDm2VbnmbWBPB3nS5Kc0is3PIDSyVn5M
         /uhNAWCliMUW6pAqf9szCV4MQD38CeJmDtnMKreSuMgCF3XFa9iOqvpPGT7ZqOBd1qUL
         TDCxXEJBsjVqmeGkNFQRsOGdi4r+0BuAR/dUo1RcCUEqMGn36IWaKOYbFVvM6/X1SULW
         TAGA==
X-Gm-Message-State: AOJu0YyHg0ZTG7AWKp97MNDHZOcc62pXa+L7h6F3ifNDrkmIXOntCcRn
	ygsSNq/pul3pQr5OkY/IQ0R70Q==
X-Google-Smtp-Source: AGHT+IGPolOEC8KESYdYJHrsi5Hv9xtv7KDpXY2OXddF9choVe0BTJmYC4hIKxCGlA4ty3oFb9RIjw==
X-Received: by 2002:a1c:4b11:0:b0:402:cf9f:c02d with SMTP id y17-20020a1c4b11000000b00402cf9fc02dmr12374943wma.8.1696349866028;
        Tue, 03 Oct 2023 09:17:46 -0700 (PDT)
Message-ID: <1f271e93-7409-4a8d-9841-368722d6aa43@citrix.com>
Date: Tue, 3 Oct 2023 17:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, Henry.Wang@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2023 4:37 pm, Nicola Vetrini wrote:
> As specified in rules.rst, these constants can be used
> in the code.
> Their deviation is now accomplished by using a SAF comment,
> rather than an ECLAIR configuration.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
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

This is line noise, and later examples are even worse.

What does SAF mean?  It's presumably not the Scalable Agile Framework.

It is meaningless to anyone reading the code who doesn't know it's a
magic identifier to suppress violations.

Looking in scripts/xen_analysis, it appears to be a labelling scheme
we've in invented for the purpose of cross-referencing, in which case it
needs to be changed to something more obviously safety/misra/etc related
to make the code clearer to follow.

~Andrew

