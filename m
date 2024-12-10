Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA69EB1C4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852370.1266181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Bg-00034Q-LZ; Tue, 10 Dec 2024 13:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852370.1266181; Tue, 10 Dec 2024 13:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Bg-00031d-Ie; Tue, 10 Dec 2024 13:22:04 +0000
Received: by outflank-mailman (input) for mailman id 852370;
 Tue, 10 Dec 2024 13:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0Bf-00031X-HN
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:22:03 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be280da0-b6f9-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 14:22:02 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862a921123so3082136f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:22:02 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386408549b9sm5336627f8f.89.2024.12.10.05.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:22:01 -0800 (PST)
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
X-Inumbo-ID: be280da0-b6f9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733836922; x=1734441722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TPUMltX8XIUJm/7wB9nigVccIpZNB3od1WZv2QsS/ZU=;
        b=KE9uyNSk1E1uPG+DMZSh5Gtc/jjIpW2EvtQbo+B5OciXKjeY2OLiSuQDz+Xrkrjc23
         j9DBM5ARE7oDXbHO15KA++KQ+Mlu7KAP8XtLKiyGYP68lrMfiJPUhU3Rom5Nf6GPlu8x
         BJJKztpu1LycF9RwzSXBgN6JdKzsrSnYbFmcm4Wk1KytZ9A10R0SL546kGJeHUijj76S
         ZT7Wx2s15N/ub8rkmGHSfsTzFcKFklI44sNopd15iWt/r+XQBcM+ofm8N/TZedRsAD2n
         0mZbTShk0+loLfa+vwJXBhIEGUDc2PbgmEYd9nR2IyfefQ8Kn1Bnni1SP7hclx5+aG4/
         E/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836922; x=1734441722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPUMltX8XIUJm/7wB9nigVccIpZNB3od1WZv2QsS/ZU=;
        b=VTu0zrA1d+vxM4A9PoruoYVHLlcAxDXaw3XxhOmJQUgl2iiNMZmRycF5NPiTkOLQtR
         I9AEh+UynQWemF8tDK2Es7xfAzjcZOt+mb49wBdo9ay3QapsHz9+bnpoK/7+rmslRsIm
         2UpXyZ8+l9IOj2hYQvQy/kaAHCRW6/B438lSFUDTh8BftXXmVySxqSbJNSZDv1MDmw33
         LEQML4wKOncFDzLQ5pl4hKnePUvkbnaQjQxfICBRgkc/qBNScAPEnTysomyegjWxJu6w
         d/sG9O1QzqkgEdH1R5T+I0QxfWmzOlExzIHwopucUqMN3k6OzbZrXs09pgBjGayHy2oJ
         CEyw==
X-Forwarded-Encrypted: i=1; AJvYcCXZR6Mz83F4gEzA5f9/fgkxGdWZ2w/HEMjoAipshnYKinOS2g9P+0/JEk24pZzLU/dMjnlNG2IDkV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkin65udYNiNgAhcNJn6jdjt8dc7ILK8XL3RcJdKHL9J0KeIjc
	pC7TpDg4xR5s8CBV4uVjTKxmCFXov8cIlqFvHqCAQn7aenUQ1IQ8dI+abWxOUA==
X-Gm-Gg: ASbGnctYXlD12G8ZgAcazaoCtAzn4ywPwWzjh7kGvI8lR/ty91pNMW6tisvm+fRnXj9
	+xHlZ/EiP17RtLyFPaC3niH3Z48idg7vOYsj+ZkDBHx8Vxs5o1woM15TwQ9DPZ7+dR2QcEjibqn
	dGZNKGBxvl2zNDm9syiF4i5UrWwcrI09ScWVljGaQ0p9wng0kOdFx1mHdZ8m/KJ37DEAIjnnnJ5
	jPof/EUC/r2lkg+UBpjN0Kgl30EWhl5CxnIV7vGqbqdPoSmgO+u5nMP+ii4LypAa0lPb1VUHPO/
	tv7XswyZzJJSC5puZhxy5FnhjKgSNjIPkD+DhCsz16ui5z88IJ1xyveNMbdln6mjEyBT214cweZ
	tyQiXHstn3g==
X-Google-Smtp-Source: AGHT+IEiOIBBwEahoL7AvBbAmDnWY9uVatHf3/+LF2azpN7mfBX+CHzx383tAeFQnV84bZYZFhR9Qg==
X-Received: by 2002:a05:6000:709:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-3862b37b40fmr14793077f8f.24.1733836922155;
        Tue, 10 Dec 2024 05:22:02 -0800 (PST)
Message-ID: <b3afb61f-0a82-4a66-ae9c-42c1106a5399@suse.com>
Date: Tue, 10 Dec 2024 14:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/35] xen/ctype: introduce isconsole()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-3-e9aa923127eb@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241205-vuart-ns8250-v1-3-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> There are several console drivers which have same checks w.r.t. printable
> characters. The check is moved to new isconsole() macro and re-used in
> the console drivers.

Something named isconsole() imo can't be expected to do what is checked for
...

> --- a/xen/arch/arm/vuart.c
> +++ b/xen/arch/arm/vuart.c
> @@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
>      struct domain *d = v->domain;
>      struct vuart *uart = &d->arch.vuart;
>  
> -    /* Accept only printable characters, newline, and horizontal tab. */
> -    if ( !isprint(c) && (c != '\n') && (c != '\t') )
> +    if ( !isconsole(c) )
>          return ;

... e.g. here. If we really want such a further abstraction (of which I'm
unconvinced), then maybe isprintable() or (getting ling-ish)
is_console_printable().

> --- a/xen/include/xen/ctype.h
> +++ b/xen/include/xen/ctype.h
> @@ -4,6 +4,8 @@
>  /*
>   * NOTE! This ctype does not handle EOF like the standard C
>   * library is required to.
> + *
> + * See Rule 21.13 in docs/misra/rules.rst.
>   */

How's this change related to the purpose of the patch?

> @@ -30,6 +32,7 @@ extern const unsigned char _ctype[];
>  #define isspace(c)	((__ismask(c)&(_S)) != 0)
>  #define isupper(c)	((__ismask(c)&(_U)) != 0)
>  #define isxdigit(c)	((__ismask(c)&(_D|_X)) != 0)
> +#define isconsole(c)	(isprint(c) || (c) == '\n' || (c) == '\t')

In a pretty general purpose macro like this one I'm afraid I view it as
risky to evaluate the parameter more than once.

Jan

