Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048098A38F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807375.1218795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFuV-00014v-Ja; Mon, 30 Sep 2024 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807375.1218795; Mon, 30 Sep 2024 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFuV-000121-Gq; Mon, 30 Sep 2024 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 807375;
 Mon, 30 Sep 2024 12:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svFuU-00011v-CQ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:53:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c1625ef-7f2b-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 14:53:53 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so990708966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 05:53:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5af5sm526224166b.70.2024.09.30.05.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 05:53:52 -0700 (PDT)
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
X-Inumbo-ID: 0c1625ef-7f2b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727700833; x=1728305633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oFVvknqmr3m+26AIGgVirTMYLEQl9gXjk2nIZux4ju4=;
        b=YYRwQ1ymO4F85+S1moRAqVxSs6pUDyNWSeko79l+uG206llgl3Qjp6EQ5AgqRZLwst
         i0IHXW2bBIvjH3/j8mx0HGtkXXCru5jEnPQjkcBvp4UGS0WuwarxD5pou2cGsdEhFR/8
         8JdKWZnFRQxRWWmioaKhfOgSeL3PlE/grV3dnl3oumxxuChqLIPIMXVoRKJ7TFEkVifb
         m9Qjq8b8Q/x07Ed9Pj0kaKXVIjie4DF1ooYhddW2XZJhQf3wq1hdlMDNOAXb3/18GoT5
         k1FN6NmMwreKnvQiPSDeFrx6ogrCX3rQ/u13QWY+PTvTbakFRtkwQx1iS9PprDbmfyHw
         kgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727700833; x=1728305633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFVvknqmr3m+26AIGgVirTMYLEQl9gXjk2nIZux4ju4=;
        b=WJTxIApHUzCZxYOoO1Q40Q1SozVW3P6KviC/ohjxmBI9UXhp7fdZi3bSuVYtSDNIZO
         HpyssyXm42cZQViKe4DBTaX47k0Hmgo0ejaVlfmOSGBSzNIv9WBl1MVOx4GN+4kTheJC
         3sWH14V7qxvpD4FD7lPzcybS5r4NKJfU6uWLHHciHGRu9R0FWZiPsESHh0rnTm1lJsJE
         QonuZFZRFA6Sei7EhsAzplPWjF1d10FmTRANM6Rr5YVX1n/SX+hW8cMV1YYb0A7aoiP+
         7ORBcfRpe8+BRweMYfv74BsSKr4+grmo/BjpPY5yiRHwZT7/ZGa9chCQVKg66dlr5QGW
         AH/A==
X-Forwarded-Encrypted: i=1; AJvYcCWcIqZjPZ9uZ9+amDOLD8U4HhPs4xGCVLtUi/hPK0B0qcPSViAAwUsI5K2nL82I9OA5rzH2SSyQCPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVP98LZqOHhFpjqE1OwhYdVD1yqJLeYbJXm5jX1lNC8sXsrNSu
	heWiGd9oqQw3ilBMgymftRWRvqG2MDAkq3lrVLGq5dOMSK/P3iyKCuz00yvlKA==
X-Google-Smtp-Source: AGHT+IHMNmXe06/a2KLXpb43HxcW/q84BijcX4EsnFEVOmkF6LJJFcGfM+/CsEG12g3eWnbvpZiBkw==
X-Received: by 2002:a17:907:d2e5:b0:a8d:5f69:c839 with SMTP id a640c23a62f3a-a93b15f92aamr1450076766b.15.1727700832966;
        Mon, 30 Sep 2024 05:53:52 -0700 (PDT)
Message-ID: <f106bcfb-c868-4e85-99fa-8c6ae804cd5b@suse.com>
Date: Mon, 30 Sep 2024 14:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] CHANGELOG.md: Add NXP S32CC and SCMI-SMC layer
 support mentions
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
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
In-Reply-To: <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 13:47, Andrei Cherechesu (OSS) wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>  
>  ### Added
> +  - On Arm:

Nits (style): One less indenting blanks here, but ...

> +   - Add support for NXP S32CC platforms and NXP LINFlexD UART driver.
> +   - Add basic handling for SCMI requests over SMC using Shared Memory,
> +   by allowing forwarding the calls to EL3 FW if coming from Dom0.

... two more of them on this last line.

Jan

