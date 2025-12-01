Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14260C963BB
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 09:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175595.1500219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzXz-00078k-0M; Mon, 01 Dec 2025 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175595.1500219; Mon, 01 Dec 2025 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzXy-00076r-Su; Mon, 01 Dec 2025 08:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1175595;
 Mon, 01 Dec 2025 08:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vPzXx-00076l-K5
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 08:46:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30217518-ce92-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 09:46:11 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so33770715e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 00:46:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791163e3dasm228776155e9.11.2025.12.01.00.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 00:46:10 -0800 (PST)
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
X-Inumbo-ID: 30217518-ce92-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764578771; x=1765183571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ym9Pa61uD2HCgrEVuAXTcCAPEqptH/G26aB7H4L0n90=;
        b=RG8HhuOEucVKVEH4hZZu9eDefRpe5GayF8JN2t9PbQS7J0C62U+Gm3293yII/k+a1U
         IXa2c/gjKWtZTIBnVuCnjsv8+buwZZCDLpaDxfirJctFuA+5mRXmDOsKfkjs0K9rFVYR
         K7sP0UNIVIvmiw94aTscEcuRl79nL4Nh2JePplmROoJUpFRJu34nsLyqNUhXq+/YBqO9
         bby2shUZgRh5XwJvBJa9HAxE/137n7rSNsKDBW93cgdWcE7Vkv5U1H9/zwWakA25kquc
         rAPMDNuJavIIZof+M2U0yw/8BY73qb6inCO2rRPSwqsk3+cKiSpLH4Cqg468hkBI4rx4
         +P+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578771; x=1765183571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym9Pa61uD2HCgrEVuAXTcCAPEqptH/G26aB7H4L0n90=;
        b=uShDI2DgdMPabd6wNQnbZ3tK/z8lJMGDPW7deNWojaintm7kEdj7J9xoom4hnDm+Ba
         5i1ftsVbrT9mvmChq2DKuQTZYqIXe40kBQzY5xg+grbZIe+Z4S2QZJKBEJVxNBAdxtux
         b8kfKQcADrunKDO5rvINnIPzQzI/HnLGoNxbUUHaSMhu5uZEcgyAC7RbqzY85U9xkV9p
         PoAKYUxQGy9SFl19PedqnYUbpNMMKzvGxfu3X5IhLk+8XHj2eJBsX0b4IcUjDKka/9iV
         RrOLusyjcrg+VJcJ0FgsJU6AUdSSQaH72S+9T2Ow2BHxZcyfo9mAazsKE0LiwuGZaJgW
         vCeA==
X-Forwarded-Encrypted: i=1; AJvYcCXzeTpUN9cl6DJjiJmnqcm92tUl370mNoN4uyO7/viVk+ykO1b3RXBJJ6qDnCeWLQEviSOOrS6qQmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKJGHkzEuUGG2xPEZmjAedgvY1IYJqf6boCH6jnhvWVgOsq2d0
	J2i3MqF4QJVxQ6JVSbRU1vJ4bkH06ptGnBCuqr7DGqsTpdqIYlko6rWZjKd8Pkv8QA==
X-Gm-Gg: ASbGncueh2TMKG+QDUone2WSvSvpRgu9kmv8G6IYfEwn1NNfpmIXL0Hg8A9XgRfF6KO
	4kh6Je/a/upLj2xiMj5jErOZfKmNj9gXe3K/sOZbWXSH9DQxVoQRAuqvnAR9MwB4mjVQJridxDi
	YE9Il9YJJG1i1nWOhQUKYGZ+yzn4pRg7Kf+QdoBCNebjUCHlpkIBhtxPKJij4TwZpWU+b0jINyX
	fFleJOPTNVytktpOmA+jsZItHKzqRGVfjOlswI1bf5Q0JS2ysH6N/TV699Rr1/ex9pTgdUK0qSE
	g5C3zfQ9c8nhOt1Ni4bAyd4IM0pCjW4sq/dxwgu1cwSB70Qyp02y4lD4w120Q+Bm5gfAyfACNYy
	eLcqb28X3/bPFeGdpNy2Fl5z68kBDwv9bRHCVIb6ib43hU4brE7T+lUl8fHotpi9OQQHru0ur7p
	Ke3sdVvf1VsUe0kcAJz/X234ArEoRSpfcvogGvUm49nWTM1we0puM7y/tFYJbnXfKo6FOkP6fEd
	sI=
X-Google-Smtp-Source: AGHT+IERkxTGhESXDtXeJdixKysHkxGDfItGmPqbAX/tzpRupC+qkBT3CNxU5azPu/YTWr6fZ1UhYQ==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477c11325c2mr394797695e9.31.1764578771175;
        Mon, 01 Dec 2025 00:46:11 -0800 (PST)
Message-ID: <bb4ca936-da10-46f2-bf9c-055e19990d82@suse.com>
Date: Mon, 1 Dec 2025 09:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/lib: Introduce SHA-1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
 <20251128184757.1243678-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251128184757.1243678-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 19:47, Andrew Cooper wrote:
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -17,6 +17,7 @@ lib-y += memset.o
>  lib-y += muldiv64.o
>  lib-y += parse-size.o
>  lib-y += rbtree.o
> +lib-$(CONFIG_X86) += sha1.o
>  lib-$(CONFIG_X86) += sha2-256.o
>  lib-y += sort.o
>  lib-y += strcasecmp.o

Why exactly are we confining the two SHA<n> to x86? They're both plain C
implementations, so ought to be fine to build everywhere. Being in $(lib-y)
they also wouldn't make it into the final binary until a reference would
appear.

Jan

