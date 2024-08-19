Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895549565B7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779372.1189110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfxts-0001Y1-1N; Mon, 19 Aug 2024 08:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779372.1189110; Mon, 19 Aug 2024 08:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfxtr-0001WW-UW; Mon, 19 Aug 2024 08:38:03 +0000
Received: by outflank-mailman (input) for mailman id 779372;
 Mon, 19 Aug 2024 08:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfxtq-0001WO-Oi
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:38:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5869012f-5e06-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 10:38:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso396483966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:38:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935663sm609614266b.121.2024.08.19.01.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 01:38:00 -0700 (PDT)
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
X-Inumbo-ID: 5869012f-5e06-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724056681; x=1724661481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Po6rIQYyY7nYjtZw4+yf/KTdeRab1+PujHa8aubR1is=;
        b=TTdUKxTe80TlGZQASrjYeR+d3cT3ZhIIB7ieCqc71RuWNrXUHx/kVqj0K441wDTF5w
         YnpMQRxuPEge+DlJI8G/APMIsMpMauiLexPClifTDxRvoT0rZRiCZoG7TpetMXa+QfKX
         hORlk7Dr8D4ldrmEt4++gEzuAYeJ+l0UxsOKgwrB3++omHCidnuvpi9Csyh7jJk9KeOp
         fIg7EJYZuriREuHnXqgRwLhNt6hHgwLAWJRWZDZxNx4gOV6D7vNSVGVK0EHJDZTE1HzR
         Hi4PBfp1aJta9riXKszOE5lH9Hzh6jSLAvK9W006KknNRo4xka5qfzP2JcTpw7hGZf5u
         bN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056681; x=1724661481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po6rIQYyY7nYjtZw4+yf/KTdeRab1+PujHa8aubR1is=;
        b=gES06naX2ADOgwM5jMlI2YCAHgk0xVNYGyb+ls2btU8Q2nsl7T36GbDMAwO9ZRAvx2
         T4l39p7/oFxCMKMbUIu6LIhxHZp9wXJFwzdnTDyi8Hcb/pKLZPWZuo1BZrgMFtKS/KMa
         Lj3/1zKg8BCMOVcbAgbuwiAEzDrgf75PSCB98MTnn9iBFVg5JQyKuhEzSWoZuaI5P8oh
         h1XvQpDlpTV8hkq6aS7G7vJCgEAOtS5OaUhZsChHG61X1ZELwhWTNb40AkQE1PZaEsIE
         +Q0IjB+06QjeJO0D8qj/ksnt1iV+pLroRyAe7i6nKb9kVwDGwx7nMF9g4M8K37QIrsBU
         wFRw==
X-Gm-Message-State: AOJu0YyyAPlWRXn/CuH4jfIlBnRn9xZS1Ltc9egsZeePwliQ3uCIJWTg
	ETJscdKztuM5xkMCjeZm8OAOb75fxJ8/ZMpkFQqPaxb81eHIc7Li4N3+1rADQw==
X-Google-Smtp-Source: AGHT+IGtXTB04zKH+dBSwjgzTfDxcR+QE9Z24GUFUx3kJBs9f7WbJOj6izsuo5pPjrvMkVjMTJNm1A==
X-Received: by 2002:a17:906:f595:b0:a77:dd1c:6273 with SMTP id a640c23a62f3a-a83928a9930mr764928666b.12.1724056681132;
        Mon, 19 Aug 2024 01:38:01 -0700 (PDT)
Message-ID: <c5e23ad4-5415-4ea9-9b9d-806cd93fd742@suse.com>
Date: Mon, 19 Aug 2024 10:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Project statistics help
To: Stefano Stabellini <sstabellini@kernel.org>,
 Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org
References: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 20:25, Stefano Stabellini wrote:
> xen.biterg.io was created by a company called Bitergia. Bitergia was
> later contracted by the Linux Foundation to create a generic dashboard
> for all their Open Source projects. Getting access to the Linux
> Foundation dashboard is the best way to go (if it comes to no cost to
> our project).
> 
> I have used scripts like these in the past to get some data out of a
> release. You can copy/paste the output to an Excel datasheet to do
> further calculations there.
> 
> # List of contributors by name (using the commit "Author" tag) for the
> # 4.19 release. One name per commit.
> git log 4.18.0-rc4...4.19.0-rc4 --format='%aN' | sort | uniq -c | sort -rn
> 
> # List of reviewers (using the Reviewed-by and Acked-by tags) for the
> # 4.19 release. One name per review.
> git log 4.18.0-rc4...4.19.0-rc4 --pretty=format:%b | grep -E "Reviewed-by|Acked-by" | sed -E 's/.*(Reviewed-by|Acked-by):\s*(.*)\s*<.*/\2/' | sort | uniq -c | sort -rn

Just to mention it: Going by tags here doesn't come anywhere close to the
actual work put into reviewing, even when leaving aside the obvious
difference between small, large but mechanical, and large+intrusive
changes. Imo unlike commit stats, review stats would better be collected
from the mailing list.

Jan

