Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37F808809
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649832.1014807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDfW-0000R3-K5; Thu, 07 Dec 2023 12:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649832.1014807; Thu, 07 Dec 2023 12:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDfW-0000Om-GR; Thu, 07 Dec 2023 12:39:54 +0000
Received: by outflank-mailman (input) for mailman id 649832;
 Thu, 07 Dec 2023 12:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBDfV-00006Z-KY
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:39:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b73f43ba-94fd-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 13:39:51 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so9259935e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 04:39:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0040b4ccdcffbsm1796999wmq.2.2023.12.07.04.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 04:39:51 -0800 (PST)
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
X-Inumbo-ID: b73f43ba-94fd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701952791; x=1702557591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghzOSRCn9YPrW5h2Ae8ybWvY2HHtMaCn9QSuyB913+0=;
        b=WmZvnM8vY6wbGeT9HFVj9NWevTx0XSr7qeQugPC0xoHr6AlOKpUHasJUvNwRbDoDtf
         qY/ZVqdjgm735MKrUc9Mof+QEcDjPOKeVG7Sp2iDooncA+r2az5hwLJpnv6MyBMB5ylC
         0aglcGbFF7Sy7cW2OSsmIqUpUodPuI5l3oOWUz+3ccccqxqS0339NRakYJkOg+Yy3yRh
         nK8pWNIc3q8FqVAKCt6h5PoMhCaIgnLxPIa5Airf/SxbqK0ZBqvTQGW5imtyHYC0ru+w
         y/NJwILsQfsYvNH3ovX6C06utSW8Pw4OqSfsOq8SqUEciOWJhGIzR53UbyYkZRwkxNfN
         D4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952791; x=1702557591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghzOSRCn9YPrW5h2Ae8ybWvY2HHtMaCn9QSuyB913+0=;
        b=HIMCnxl4og5ki/pi3kJmwrEUKovwn8XiQ4KKuZw/AoZ62SM6veneih1PLEvC1aPgDX
         G30ycWMiADQDxkDjpvgvm2y66o0n7B/l9sc+1FCQuYlORFUhlmkHbTB79AEc/qzdUwUT
         UxifRIicN7zqrjURa51EiajTb0BdjHw6lKZHxNLNLuGJuP7t66oYnsTegThTQxO8BzSo
         Af355Dv+3kyqIKGCGM7Eet+HGwW3eIN+9rNb7w631eAxkFkeSLXnetU/SN4EqyfXlE5O
         jgIM4M3NPZPDsVXWMGQa+HrV1MV5KNO0z2nDdFSuA4gzRtvgNX3LrOEo7GCBCo9hX8em
         ryRQ==
X-Gm-Message-State: AOJu0YwIuyb9pFtxhZpV/RSh/m2lby3f+604SQTYG0Z4LyHCKOmnNhPQ
	8Z3BvESHXpbcxm8IU7TFyqk9
X-Google-Smtp-Source: AGHT+IFtAd2nt3gNWpCVq3Xrk4iMFEc5GxoPwlP6Co6Tcl6wuZzaUcliuXi4wL+aFlL13fKQ68Lh/g==
X-Received: by 2002:a05:600c:ad5:b0:40b:37ec:41b3 with SMTP id c21-20020a05600c0ad500b0040b37ec41b3mr1374281wmr.31.1701952791312;
        Thu, 07 Dec 2023 04:39:51 -0800 (PST)
Message-ID: <c3601b9a-67c6-498c-a177-cda94c3c3d47@suse.com>
Date: Thu, 7 Dec 2023 13:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tools/xenstored: remove some command line options
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231121114048.31294-1-jgross@suse.com>
 <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
 <fab5cc9d-d97e-405d-9f7a-1b86de097aab@suse.com>
 <2763baaf-110d-457a-b302-12b06bf28b15@xen.org>
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
In-Reply-To: <2763baaf-110d-457a-b302-12b06bf28b15@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 13:14, Julien Grall wrote:
> Hi Jan,
> 
> On 07/12/2023 09:30, Jan Beulich wrote:
>> On 07.12.2023 09:26, Juergen Gross wrote:
>>> On 21.11.23 12:40, Juergen Gross wrote:
>>>> Remove some command line options which have no real use case.
>>>>
>>>> Changes in V2:
>>>> - moved removal of "-N" into last patch of the series, as this is the
>>>>     only option which seems to have a use case (OTOH using it has some
>>>>     downsides as well).
>>>>
>>>> Juergen Gross (5):
>>>>     tools/xenstored: remove "-D" command line parameter
>>>>     tools/xenstored: remove "-V" command line option
>>>>     tools/xenstored: remove the "-P" command line option
>>>>     tools/xenstored: remove the "-R" command line option
>>>>     tools/xenstored: remove "-N" command line option
>>>>
>>>>    tools/xenstored/core.c | 81 +++++++-----------------------------------
>>>>    1 file changed, 12 insertions(+), 69 deletions(-)
>>>>
>>>
>>> I think at least patches 1-4 can go in as they all have the required Acks.
>>
>> I'll try to remember to include them in the next swipe. I was kind of
>> assuming Julien would be taking care of them.
> 
> Sorry this fell through the cracks. I can do it if you haven't yet done it.

I haven't yet, no.

Jan

