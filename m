Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D2838D56
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670386.1043122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSErv-0005xk-Co; Tue, 23 Jan 2024 11:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670386.1043122; Tue, 23 Jan 2024 11:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSErv-0005un-9K; Tue, 23 Jan 2024 11:23:03 +0000
Received: by outflank-mailman (input) for mailman id 670386;
 Tue, 23 Jan 2024 11:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSErt-0005pW-Lz
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:23:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c02c9b-b9e1-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 12:22:59 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a30b2f032b1so110291266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:22:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v10-20020a02cbaa000000b0046e4ca1f8e6sm3504332jap.70.2024.01.23.03.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:22:58 -0800 (PST)
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
X-Inumbo-ID: c3c02c9b-b9e1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706008979; x=1706613779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBkl2yDQyojvmdOWO8oPi0dobT0YB24H+X8IzO9rtSc=;
        b=MSdC6nr0w1KR6dhbBRneiLgg7B6PG52d+lI5R/qx1S27A31c2eqyKD3BFEq7bdX4Gv
         QA1xXNU4DC1PBPqK/AwBFsoKCDL3mmM5wt6vgJQcy5ZlcJR2X0KjPhcV3xICbnI8DmJ3
         KlbHb6JztLhniCTn8aIg91GKwt3w6AxZZuZ4ojHpE8BNL5YzwJmMC8IT3EHrBIDC10ic
         OJPkAMjsDSkY6MX/IqS1+OLc2JO03iEU1Jh+YNVmeBDGXphbryu1xMKXsE9czgHbuxV4
         3yNvMGVh1kVvZqkWOeLHLCGxio0lc5pNnJbIjlNQD51zn+onA0jOLwFcNZkerS7YYNvn
         0N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706008979; x=1706613779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBkl2yDQyojvmdOWO8oPi0dobT0YB24H+X8IzO9rtSc=;
        b=fTZW8D1TRB5M+RzIdj6rjEp/bBZGJk2MYA2SFOR/ezQt81holxvWXgLB0T9HdV0BYc
         9OjGVoA0SE9TQDVFIgu23ciI3lNMPhWGKPsVpaiEsYuF90D7sbJrHyHzeLm1rX5XquTa
         7EtehykixKPix1EjlfM98AnLBUgWBkCGwY9H9sUil1mqpjBexNQ2gC1vJKru5XuZIb7J
         BG8+YpAOl8qixbB0xUImGXKOHbWp9Gsyl2DmtWN81ZS0Bw/wP+wgbK7qCGEnuBeyWhgm
         oHybJDQxWlV4+2V0zLNYJ75lCwV29JqyNKoYtYM47L1egAeqfFFaIQnDB+y0Exmmv0R5
         XW2Q==
X-Gm-Message-State: AOJu0Yx2586uD50Zezbln2vzLDQC17BIOdXO+I6IkNeeoAZdU7wXciJU
	u1H90FyWzOH9y1WO93emZV75MGXbAQNcNFeeOGZT9p70gSRgVAUdI/ihzSsRjQ==
X-Google-Smtp-Source: AGHT+IHNpiZ+xMSJ3Rkqw5ejOowm/wEOgv0UQzCSaolFXoB7zHo0uHkjj2NVkd1ca7IRJoiD/NJEiA==
X-Received: by 2002:a17:906:ba84:b0:a30:59d9:58e6 with SMTP id cu4-20020a170906ba8400b00a3059d958e6mr2852825ejd.38.1706008979370;
        Tue, 23 Jan 2024 03:22:59 -0800 (PST)
Message-ID: <88a7e5af-197b-41ef-b3c2-7d4f85a3cb85@suse.com>
Date: Tue, 23 Jan 2024 12:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 34/34] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  Changes in V3:
>   - new patch
> ---
>  README | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/README b/README
> index c8a108449e..1015a285c0 100644
> --- a/README
> +++ b/README
> @@ -48,6 +48,9 @@ provided by your OS distributor:
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> +      - For RISC-V 64-bit:
> +        - GCC 13.2.1 or later
> +        - GNU Binutils 2.40 or later

That's pretty new. For gcc that's even newer than the newest release.
If older versions really won't do, I don't think you can leave this
unjustified (by having an empty description). Till now gcc 13.2 has
served me well, and iirc 13.1, 12.3, and 12.2 were fine, too.

Jan

