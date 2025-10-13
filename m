Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63518BD1B87
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 08:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141726.1475888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CWY-0003Tu-DS; Mon, 13 Oct 2025 06:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141726.1475888; Mon, 13 Oct 2025 06:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CWY-0003ST-AZ; Mon, 13 Oct 2025 06:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1141726;
 Mon, 13 Oct 2025 06:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8CWX-0003SK-2C
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 06:59:13 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e9a60c3-a802-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 08:59:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso28397935e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 23:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab4e22d8sm118354975e9.5.2025.10.12.23.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 23:59:09 -0700 (PDT)
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
X-Inumbo-ID: 1e9a60c3-a802-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760338750; x=1760943550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZpLoWSAxU2G8AVHL931DUMQsZx2voyuF6q/+oeSly4=;
        b=FwJxaiW4UPGS53GjgR+18v8ATJcnYtc5r2m+jNPnsEKu2hFn1fW/KKtfBHUyoch8/H
         xAzmztBIljozNY60eMwV+HxmGR70FI9iH97XlcrAh2GLV9N9ZGrN3uSCROwfbyzOb7eh
         jcq0f9iM/3laTcTwFdoP+XHjMA4z4YYD62GQboA7y9Z3w6wyTuF83eq3SpMlz17bnwlv
         nsyWt5dl4/QON5pcclTbdYou5jPMwj9qWM/e/r1E12OmH9r/W5nuoOYkF1zre8yUyCce
         IqRQucILkwb/P/TYCv38FGNS/NGZli2CzZA2h4N8F+97rjyt53rj4/B/qlLyiQmxnuH/
         mcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338750; x=1760943550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZpLoWSAxU2G8AVHL931DUMQsZx2voyuF6q/+oeSly4=;
        b=Vfu2MIk9JsFTzInxphWbwMzAO8liiqHBNC7kYi4AeuISa2P8O4f+S8KFoE4tlvfRD7
         xyarOrk+hb+tb5cJKzLOs4B7jCNFPGsuln5oQ3KyHfADzNEz+7jO+B7GQK4J1HVsLNw2
         XHSEzvDVhONv5yf5KIc/MtkYDh0mD3/7y0GvPI6gd2jAMcbOcRQb+/ntxAnMQKaY/inh
         gocPNMBEV05lcI5tPEw+ooTPocMvMXN0ONuBpN9yWvuEt6MlGdlyAj0iF8gpMLfzcXSo
         FvCzdJR/8Z2vFQe1ABN/WapXtoKElTVXoIoNhsM+47eoXB2liK728JqXngkX8LcEpo0b
         F+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwJl6O1xCL41DrFI4vKbsTBrSyd7mimyeWvO5v4VuyvH9HeD1tfy+dlyGK5uRdd5iWka09T9b7hfU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs+GX7Sgp1wQiJOWEPNKM1xUJyk+9cwiaP9yl3D0lPSY2C26lm
	newTcvISi3Xasy1kMjrpow3CJ7M63Qz7hG1cUB4N9pZBkskLAul/RZ0ezuxQ6nOs5g==
X-Gm-Gg: ASbGncvOvARIc9H7ZuXb3OIr3bEB5/aUfqUQ1fauKxQbXcP9PYk9AtihlzO0WMiPyd+
	cWW7iQgJQSxmxeCpWYveLjYnO/wRQCEBO37twpwzaV6m5gon4lm3jqhcK4ONjhrCxvpezyeCpbP
	xxlT3EYciyEoAPD62z168hXF97VMeUa8kGJ7/rXVOkzYigge9lRT09Ko+otGSXQ2LK0dAFe+Hv9
	7g8T8kCEFFmAnzgcStJl12q7672HHnpRjlJWHKM50uyWUr44O2ljvfq3LFQuL3B+pmccPxPJLGp
	94IW60pMyb6I8GxyICoTvxpwaSR5fgp5SiGWP88Uh1ICWWrPMt+ODesOKMR9JUMkDme1SQimpIJ
	fOMed0mTKgM4+QWuIij51fexVcXeKhaaQr75JaM58b9q/d8ZgGeVUrPBq3VmOC3cX107cSDHGk4
	VY4pr0rm7tg0XQVvtVTydfdJJzIA==
X-Google-Smtp-Source: AGHT+IH5VvluhJwPowoICILvdjdM0MHl+DmVnGQ43MOA2t6u7NnLqzoJ6LIu68iyp4i8VDiHpwKChg==
X-Received: by 2002:a05:600c:5488:b0:46e:45f7:34fc with SMTP id 5b1f17b1804b1-46fa9b105ffmr133685265e9.29.1760338750080;
        Sun, 12 Oct 2025 23:59:10 -0700 (PDT)
Message-ID: <ebee3406-d515-4e29-9d7c-f54bdb143080@suse.com>
Date: Mon, 13 Oct 2025 08:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
References: <20251012195514.39003-2-thorsten.blum@linux.dev>
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
In-Reply-To: <20251012195514.39003-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.10.2025 21:55, Thorsten Blum wrote:
> --- a/drivers/xen/xenbus/xenbus_xs.c
> +++ b/drivers/xen/xenbus/xenbus_xs.c
> @@ -546,16 +546,13 @@ int xenbus_transaction_start(struct xenbus_transaction *t)
>  EXPORT_SYMBOL_GPL(xenbus_transaction_start);
>  
>  /* End a transaction.
> - * If abandon is true, transaction is discarded instead of committed.
> + * If abort is true, transaction is discarded instead of committed.
>   */
> -int xenbus_transaction_end(struct xenbus_transaction t, int abort)
> +int xenbus_transaction_end(struct xenbus_transaction t, bool abort)
>  {
>  	char abortstr[2];
>  
> -	if (abort)
> -		strcpy(abortstr, "F");
> -	else
> -		strcpy(abortstr, "T");

While at least in principle a compiler might be able to transform this into
code not using any library function at all, ...

> +	strscpy(abortstr, abort ? "F" : "T");

... the use of a n on-standard function (without equivalent compiler builtin)
doesn't permit this. IOW why not simply switch to e.g.

    char abortstr[2] = { [0] = abort ? 'F' : 'T' };

Jan

