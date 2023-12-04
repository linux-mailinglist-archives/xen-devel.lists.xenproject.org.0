Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EB80370F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:38:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647021.1009714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA5o-0001Fr-Ou; Mon, 04 Dec 2023 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647021.1009714; Mon, 04 Dec 2023 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA5o-0001Di-M6; Mon, 04 Dec 2023 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 647021;
 Mon, 04 Dec 2023 14:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAA5n-0001Dc-93
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:38:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee92578-92b2-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:38:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3332f1512e8so2925677f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:38:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b0033340aa3de2sm5083686wrx.14.2023.12.04.06.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 06:38:36 -0800 (PST)
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
X-Inumbo-ID: cee92578-92b2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701700716; x=1702305516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERY7B9xrhsNnqsuSdCl+RCz3BWS/9BHjcxr3X07ohtg=;
        b=ZB46NYg0AVclEvmZExyjEDRk0dgNVzpXa0yoqsdPHXj+j77aIAtm3l37q6HYXbMrfM
         LYadmg/ioAWdn0jqgY2EfM6hkoNq49mEbXClFi3/mYr3yRwEjbhOlB6iDOQNxmKLqYo8
         jFG22t/hjt4/rwJF2s4o7gTqTDeZkZ96U4Xo7HcZ3F+ARIeZLSp3Nvge5X0f+9q6xXjn
         9qxRMoGYDcwLyTIl0A557yyKbfqnBwMTIrNEBvcOOl/+1voZrCYBzoEpl6NHDKwuWVIA
         YQ0PaTpAk/tb7ywMSkE3eEygx6EQPPlZ2zo4iVbCaPNrMBjrBk93Gip5NZbeafAFCqma
         5Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700716; x=1702305516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERY7B9xrhsNnqsuSdCl+RCz3BWS/9BHjcxr3X07ohtg=;
        b=po0EQ5nXizTQVOp66Ml1xi8GI93j/Z/VppCBp6XXMH3Q8LJU6mr2/GK7Hp5FE1Gytm
         g7fIQ8EL4S7zyH6lJ4w9j+y54flTkORbkSlDHGrDxHm97dGP/UfAvcLgBI20H1hKat1r
         yzg72XpcLtcwDnpKVAQzOyj1izD+buv5/seJHnSQoSiFUWh2kwrUNBvWwwybaSDnp9EW
         rhkwRbVy7rwgZviRwqo6Wv3fjVjiiTkYUNrJrw4sJ3yp1g0zb0Ps2fjM9L7YamO2O39V
         iLYJY4t/tUyEQxDQOR1ltnwQKsjbC2SJVQcln1KC4Z76jgFGN9mm190fIVXHdJSd27U1
         E4Dw==
X-Gm-Message-State: AOJu0Yz0cAZ6llhHpoAVYhN5qiIoTS5UXjk/nBMOli1a1XpxcqssMUhi
	5U00LwTqt9s9RUPYshwG89A+
X-Google-Smtp-Source: AGHT+IGbbXnoFfeDGMsxq2HLu0QgJuMJl0EsyYa5ZSRFSk6Lxt8dmYuXfKLSqeCrWvrlIJUmKsApxw==
X-Received: by 2002:a5d:510d:0:b0:333:3fc7:f2bf with SMTP id s13-20020a5d510d000000b003333fc7f2bfmr1829023wrt.134.1701700716455;
        Mon, 04 Dec 2023 06:38:36 -0800 (PST)
Message-ID: <3b0cee73-5eb5-4724-add7-f64c199f56b3@suse.com>
Date: Mon, 4 Dec 2023 15:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 George Dunlap <george.dunlap@cloud.com>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
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
In-Reply-To: <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 15:10, Juergen Gross wrote:
> And I have again a third approach, making it crystal clear what is happening
> with which data. No need to explain what is freed via which variables. See
> attached patch (this time it should be really there).

Looks more neat to me than George's. Just one minor thing: Please can the
first parameter of sched_move_domain_cleanup() be constified?

Jan

