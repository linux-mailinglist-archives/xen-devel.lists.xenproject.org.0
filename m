Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E169E915F42
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747278.1154639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0CS-0001fn-UI; Tue, 25 Jun 2024 07:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747278.1154639; Tue, 25 Jun 2024 07:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0CS-0001da-RT; Tue, 25 Jun 2024 07:02:44 +0000
Received: by outflank-mailman (input) for mailman id 747278;
 Tue, 25 Jun 2024 07:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM0CR-0001dN-AB
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:02:43 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea592272-32c0-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:02:42 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so56865091fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:02:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb321a62sm74079635ad.72.2024.06.25.00.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:02:40 -0700 (PDT)
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
X-Inumbo-ID: ea592272-32c0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719298961; x=1719903761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KKYdr07VWNFGfoxsvowZuZ+1cm3EVnL5fFDDNSg0l0I=;
        b=MEqdc18nOoO5T+GbqOqYJHD2xkyvJRfobXB88QjHSS500cbZyMoxFitJ6pW4ZFNPyA
         fsnRmU/zdE43RA76Sy6lpk1fVW1+cFUkVEunB/G8W/iqo+WsVRhhDSzkTP2hchRh/6Nn
         Wbqe+vc14ci8ARj0z523PZqdPHE+OKe0NvnLWhE3gVSdjXViYnHPjBHb+FDUVGOz7X33
         fMKYTtncSOTvBVkoeigYxOT5yCgOUnmNDGhnk1jq60M7lRcWY6kBRKehWJKaQVMdef9U
         sWMUYkhnrbk3v4wnQlwKjlAFISwY8woiXj6M3YrcvxDJP0wWlfyTlftKQl8bmUzylqPp
         1dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719298961; x=1719903761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKYdr07VWNFGfoxsvowZuZ+1cm3EVnL5fFDDNSg0l0I=;
        b=Wp6zP71Hjw9qQFWoAFIdA3TcH1+E+qMPjqqf+Kv3vA8t8wxxb09GupZo8yUJ9HYOcE
         1YBPyrgSA9YV+Wnyox0ITqPyL6wOlp1BzLMrE4Itj1GDKD7UhvzkXkZCyIpz8mxQyUF6
         geXzveg4lBMVqqT5A8xEXZs6FUnm60F9tsCcG1CzxkRL0ApoTHP8sYv+25zGMWHivnFq
         7QSo025sDbZvU0WIsZzV0hVS7msjbsiTFcfKWwYrtSuQXMV+kR6tdS8adxOHJi31dmyY
         zuco96WCmNjGEITILHvaVwUighI9b4aDzb27/3bLStTWuktM8sQ0BE6hLNjEzeFKM2vU
         nYKg==
X-Forwarded-Encrypted: i=1; AJvYcCVskMz6rGoWXrfyzQGpt3V5X/NaCERM7lLBwc4jApSef2yjJUwC5JrobcQtV+BNJTrG7FD5iJuDqhYxMZRjnkOCCdT2Kp4TA2fi2AJhuMU=
X-Gm-Message-State: AOJu0YxFeiB3OXRnajTxsSFDvkm3XQKlwzPSutUgiEZztXhBpb7TWdnU
	6aO8cAyNMOt+KvLLXfYxEScUXfVd4uEUNTBhysEZTp+IUNxQQpf/DoLauYBmKA==
X-Google-Smtp-Source: AGHT+IG02nhaGbz5bNc07bPR2v4g6/t9kcdQYTiURh+4gaxUaXo/kjTQ2tm0ITGQ1klEXTzH0CCQFg==
X-Received: by 2002:a05:651c:ca:b0:2ec:140c:8985 with SMTP id 38308e7fff4ca-2ec5936fb10mr55379661fa.36.1719298961408;
        Tue, 25 Jun 2024 00:02:41 -0700 (PDT)
Message-ID: <c2098800-2565-4eff-90b5-0d285862bf26@suse.com>
Date: Tue, 25 Jun 2024 09:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <90044547484dac6fcb4748ae8758e38234b3261a.1719297249.git.federico.serafini@bugseng.com>
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
In-Reply-To: <90044547484dac6fcb4748ae8758e38234b3261a.1719297249.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 08:46, Federico Serafini wrote:
> Update ECLAIR configuration to deviate more cases where an
> unintentional fallthrough cannot happen.
> 
> Tag Rule 16.3 as clean for arm.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

To add to my reply on the other series: As per above you even acked ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -330,12 +330,34 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `deliberate` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Statements that change the control flow (i.e., break, continue, goto,
> +       return) and calls to functions that do not return the control back are
> +       \"allowed terminal statements\".
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with a call to a function that does not give
> -       the control back (i.e., a function with attribute noreturn) are safe.
> +     - An if-else statement having both branches ending with one of the allowed
> +       terminal statemets is itself an allowed terminal statements.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - An if-else statement having an always true condition and the true
> +       branch ending with an allowed terminal statement is itself an allowed
> +       terminal statement.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - A switch clause ending with a statement expression which, in turn, ends
> +       with an allowed terminal statement (e.g., the expansion of
> +       generate_exception()) is safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - A switch clause ending with a do-while-false the body of which, in turn,
> +       ends with an allowed terminal statement (e.g., PARSE_ERR_RET()) is safe.
> +       An exception to that is the macro ASSERT_UNREACHABLE() which is
> +       effective in debug build only: a switch clause ending with
> +       ASSERT_UNREACHABLE() is not considered safe.
>       - Tagged as `safe` for ECLAIR.

... this explicit statement regarding ASSERT_UNREACHABLE().

Jan

