Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7ABC622B
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 19:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140047.1475188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Xop-0008Rl-EO; Wed, 08 Oct 2025 17:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140047.1475188; Wed, 08 Oct 2025 17:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Xop-0008PB-B5; Wed, 08 Oct 2025 17:19:15 +0000
Received: by outflank-mailman (input) for mailman id 1140047;
 Wed, 08 Oct 2025 17:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6Xoo-0008P5-4O
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 17:19:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e623d809-a46a-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 19:19:08 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so818685e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 10:19:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d629casm45568795e9.16.2025.10.08.10.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 10:19:07 -0700 (PDT)
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
X-Inumbo-ID: e623d809-a46a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759943948; x=1760548748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=psfUalVjLmrN7/wDADGiuZIc1BcO2TT8Xit5LXUDiYY=;
        b=BvW/Ngr9Lmfc6eIgI9XMMUBVE4gmi2i+F/Aa2mIFPmiokQ6O4E5qS9fDdnrG8FVxHk
         rmoo5tiGi+6/n0dQeIRJxPybJ4zuPCjr8wu05Qyx86eRKti3ZozbRhmV1cokkz9VwRxp
         PD0AakdetMUOSORxZkXbN8MJZ1vQDFEPYi07M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759943948; x=1760548748;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psfUalVjLmrN7/wDADGiuZIc1BcO2TT8Xit5LXUDiYY=;
        b=QcPZlbEptlGTgcU3DVGPrBOZ7czc1XAS/YqJRzeia+opXnzMVf8SJqtNZAkogJyWNw
         vLZq2Bf/pmckNDS3ugBFq7Fq5hdKa//ufAvBmsDH1V49gAF0EHqftQRz7/9F/uHaOzdA
         FmWndOY1j/pZu3Bc64WCAmdD/x5lLXbiYXu5Bh/errdhCunP+Tj9bSk+wJ+1w6r0mz45
         jObVLoXkKdnnkj/vEHvQql73rrySjctM/MyRL2rrh2hn94WK/RenI3dgw4i26yzInUxM
         +xBekrim6tdFVVT3bqDN6434+HyZWQDUNKa4CixNugdkAzF1RN5IJ5k5/tleB9iDLN82
         b2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXLSw7RKHZaYO1365tBQEJ+UjNKgrXBrO6OLh/reFnPLDSnt/kYRtUJi/frvNfIbwhxA+OR07rVXnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywy0OOg5uy15lrtEkqGkiOL9w3py/gI/BXqfLdwj0QwgxifVMJ8
	cNh88KPow9+gqrDML0efr3xm+G/f/OLDQU6h/8LPS9QDum0GcDwe5k9NgJuQltLUDFw=
X-Gm-Gg: ASbGnct1ERTIsp3wqKclsrnvVURalHBEiZDXdh1MHMgDWkB+OI+GTU9Rr44GlqbvElF
	UYABsSIuDeSsSh7HHqUMG4N2zZOd5SjEYDF7qoeuBYNcbGc9S3Pam0iEn7p4pmdTKryI685VnAj
	o1ipJ2k+4jiAszoSLtEkPer1I2aLWqGQm8mgTOsqbFjQi3nBwESa8dP1AFVyt3T/9KGqbfQuaWJ
	P9uXdRV3lDMhlaNK3/mh+fumqlEWoQhQeCnRnnj3Xef/yAbeFpSoLeu1cKaTw2COJdL73oTcOfF
	mKeli984U9ZXc1UXpwHqhOloqBzwKeMVuy7JWHe8DdbeZuQrvnIwSPkSP+xbW0ikmZw62unS42+
	9PZUeDet/qs5FUO8UlqCc4liGmeyR+McVVJ403r8NSf1qr0WDD4c2ntWGft2Lrj3HAdQ03Nb8Kb
	qPV9IfCgRlgqMI7YLos/eujPk=
X-Google-Smtp-Source: AGHT+IFl4kaavExmj68os6UCsAZb/YQx751W1gq1WtdEa4UT/LK+ZS1Gu5Jo820346/zJN4QWpfm5g==
X-Received: by 2002:a05:600c:810a:b0:46e:4937:dd1b with SMTP id 5b1f17b1804b1-46fa9af873emr30110835e9.17.1759943947791;
        Wed, 08 Oct 2025 10:19:07 -0700 (PDT)
Message-ID: <3601abf2-c556-4126-9e42-1c08803e2613@citrix.com>
Date: Wed, 8 Oct 2025 18:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2025 11:48 am, Jan Beulich wrote:
> While adding new enumerators one may overlook the (rare) need to bump
> X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
> checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
> other changes, as the expansion may not appear in the assembly produced.
> Furthermore inputs to file-scope asm() are only supported in gcc15 (or
> newer).
>
> No difference in generated code (debug info, however, grows quite a bit).
>
> An implication from the changes is that users of the alternatives patching
> macros may not use unnamed asm() input operands anymore, as the "injected"
> new operands would break numbering expectations.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -70,12 +70,12 @@ extern void alternative_instructions(voi
>                      alt_repl_len(n2)) "-" alt_orig_len)
>  
>  #define ALTINSTR_ENTRY(feature, num)                                    \
> -        " .if (" STR(feature & ~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
> +        " .if (%c" #feature " & " STR(~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
>          " .error \"alternative feature outside of featureset range\"\n" \
>          " .endif\n"                                                     \
>          " .long .LXEN%=_orig_s - .\n"             /* label           */ \
>          " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
> -        " .word " STR(feature) "\n"               /* feature bit     */ \
> +        " .word %c" #feature "\n"                 /* feature bit     */ \
>          " .byte " alt_orig_len "\n"               /* source len      */ \
>          " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
>          " .byte " alt_pad_len "\n"                /* padding len     */ \
> @@ -127,14 +127,14 @@ extern void alternative_instructions(voi
>   */
>  #define alternative(oldinstr, newinstr, feature)                        \
>      asm_inline volatile (                                               \
> -        ALTERNATIVE(oldinstr, newinstr, feature)                        \
> -        ::: "memory" )
> +        ALTERNATIVE(oldinstr, newinstr, [feat])                         \
> +        :: [feat] "i" (feature) : "memory" )

I don't understand.  How is this related to putting the guard in place?


> --- a/xen/arch/x86/include/asm/cpufeatureset.h
> +++ b/xen/arch/x86/include/asm/cpufeatureset.h
> @@ -12,8 +12,13 @@ enum {
>  };
>  #undef XEN_CPUFEATURE
>  
> +#if __GNUC__ >= 15
> +#define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", %c0" \
> +                                         :: "i" (X86_FEATURE_##name));
> +#else
>  #define XEN_CPUFEATURE(name, value) asm (".equ X86_FEATURE_" #name ", " \
>                                           __stringify(value));
> +#endif

Again - why are we making a no-op change for the sake of it?

>  #include <public/arch-x86/cpufeatureset.h>
>  #include <asm/cpufeatures.h>
>  
> --- a/xen/arch/x86/include/asm/pdx.h
> +++ b/xen/arch/x86/include/asm/pdx.h
> @@ -13,9 +13,9 @@
>      asm_inline goto (                               \
>          ALTERNATIVE(                                \
>              "",                                     \
> -            "jmp %l0",                              \
> -            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
> -        : : : : label )
> +            "jmp %l1",                              \
> +            [feat])                                 \
> +        : : [feat] "i" (ALT_NOT(X86_FEATURE_PDX_COMPRESSION)) : : label )

Not a bug in this change, but the pre-existing use of positional labels
is something I was expecting not to introduce at all seeing as we
started cleanly with named labels.

The jmp wants to be:

  "jmp %l" #label

to cope with the fact it's a macro parameter too.

>  
>  static inline unsigned long pfn_to_pdx(unsigned long pfn)
>  {
> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>  
>      /* (ab)use alternative_input() to specify clobbers. */
>      alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
> -                      : "rax", "rcx");
> +                      "i" (0) : "rax", "rcx");
>  }

As the comment says, this is already an abuse of the macro for a purpose
it wasn't intended for.

Now requiring an extra "nop" parameter to get the abuse to compile is
too far.  It can turn into a plain ALTERNATIVE(), and then both disappear.

~Andrew

