Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E39F5148
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859509.1271652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNacJ-0007GJ-SZ; Tue, 17 Dec 2024 16:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859509.1271652; Tue, 17 Dec 2024 16:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNacJ-0007DA-PL; Tue, 17 Dec 2024 16:40:15 +0000
Received: by outflank-mailman (input) for mailman id 859509;
 Tue, 17 Dec 2024 16:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNacH-0007D4-UO
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:40:13 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960eafe6-bc95-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:40:12 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso60184845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:40:12 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806115asm11501922f8f.107.2024.12.17.08.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:40:11 -0800 (PST)
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
X-Inumbo-ID: 960eafe6-bc95-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734453612; x=1735058412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+h5IHszmdCfJMa7GLGaIQ7wO/yzbbPzBB/DqRFfpn4Q=;
        b=PNKSIsDgheQZEEcrRF+rRS1scVBD1SsUcRf8WeNA4o/Ycgzod7S444x1SC4ePkNrTp
         AkZvPa/zgcqxhHdKDuGjcxmdtfeS/Ej0VAkBqmjl8HHSlmTJLuQtSZe0+0a6aYwb/Zrx
         E6jKZRoalz8RD6nKDVhB8AdRqAFKDTTNUCvvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453612; x=1735058412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h5IHszmdCfJMa7GLGaIQ7wO/yzbbPzBB/DqRFfpn4Q=;
        b=TDVAhqaucM8EsKTMtpAk2JPOmhdrpqtEDzyWfz9fyYCXqvjJZqA2tAcNr0fGFKz802
         1biXsAP61NbnjsbR8EQNzQP/0EcwlMA4yhQ+1Oik1n8qgJFq35s0+VYVAkZEBJ7ZdvvB
         P7+PEUfpyv1TgM9URK7X9+BKeTMUYP/Lj+t4w+GN/Ch/rnOQAs/f4r4eXGnAPNhcGhOC
         G6fjshnY4MfvakLH1iOI4Pu3yrJNfR8zjTOH4iCC6lB8+/BmuOXbhlh8RxykTvro69Se
         2JovGcC5tqcX74JOlf63rsS/KnvRW7yeh2rviOYB2DCtUUicBfaDl/PutM0GS0jW5+/e
         ixYA==
X-Forwarded-Encrypted: i=1; AJvYcCUAGi9Nl4AU9ytyNOVhRUlgN46YU3Ys5lGeMqZmah4lBXsbknwWiEw6azUJUGIOnObMMM15Xs79XUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEJ66e3L3wesJZasTbjwZbAbhLNqsL3phLlEVe61WzxlCPdES8
	xcedAum4pu3GcTWjQDgocmc/5r7a9xpQAgN+947iXKOYvPdAE38BRT3uy24/0vQ=
X-Gm-Gg: ASbGnctsTe3tr126lDO4bzhs7Pnrol2/aCkh0xWQ2Gq+xq9qg50K5N8FZF9rD7VYjYS
	Z1wQ688HtcL787/IQv8G6uRi6TZciHpERQsft30qfi9LlsTw2S5Gc5R8S81+hhBy/Z8Sk+DuZXh
	Nh2Cn699nceEgLqM+TSoPhZvO6G70yL3DYCaLzk0ucetM5AwQzOFKN1jmJGP1VNunMaRBVgWwTb
	T4rjsUSoWTZsygD9WPf+4fZ71M+O2g6s4OLT5txS6JsoYAX+QPRDFDK99Z7Mrszudfvb5TaAng2
	7HD6TTSL5dRwPlxKqsDW
X-Google-Smtp-Source: AGHT+IF/a8vsCCP6i5jBSOWNtlJm69++P7IWYOaxYwvgNgQ5Lizml7duMZpKUy12SjY85gqGbU1BEQ==
X-Received: by 2002:a05:600c:b95:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-4362aa3d1d2mr140045925e9.19.1734453612122;
        Tue, 17 Dec 2024 08:40:12 -0800 (PST)
Message-ID: <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
Date: Tue, 17 Dec 2024 16:40:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 4:24 pm, Nicola Vetrini wrote:
> This extension name is missing from the current list of extension used
> by Xen, therefore is must be added to that configuration in order to
> avoid violations for MISRA C Rule 1.1.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Given CI is broken, I've put this in for testing:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1592826906

But, a question:

> ---
>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index 86e9a79b5231..9b419e562afa 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -100,8 +100,8 @@
>      ext_enum_value_not_int: non-documented GCC extension.
>      ext_gnu_array_range: see Section \"6.29 Designated Initializers\" of "GCC_MANUAL".
>  "
> --config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
> --config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
> +-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
> +-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>  -doc_end

We're adding ext_c_missing_varargs_arg to the list.  But there's also
ext_missing_varargs_arg.

What's the difference between the two?

~Andrew

