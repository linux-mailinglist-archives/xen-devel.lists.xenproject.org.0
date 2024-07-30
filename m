Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E1940887
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 08:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767278.1177878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgYm-0002NI-0o; Tue, 30 Jul 2024 06:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767278.1177878; Tue, 30 Jul 2024 06:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgYl-0002Lc-Ua; Tue, 30 Jul 2024 06:42:11 +0000
Received: by outflank-mailman (input) for mailman id 767278;
 Tue, 30 Jul 2024 06:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYgYk-0002LW-HO
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 06:42:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d766591a-4e3e-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 08:42:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so440854766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 23:42:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f62sm606207066b.16.2024.07.29.23.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 23:42:07 -0700 (PDT)
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
X-Inumbo-ID: d766591a-4e3e-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722321728; x=1722926528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XHB4eU3RZ35UpD8A5nbV2DYKKPlBqIpFdqY8Irf/JA4=;
        b=DmhhWB5zP7srK1XaTHDtjAPUVWbyQVRQnF/NgjESi3Tx2MfCWyikIsGiik1cpkvZ9G
         OnR/vIj3p0FFHZgtUF7kvL/0yGs+CaBPvpk54ibwVCunvAjjbRsynFsfDhIbuFnOmvo4
         HY7CxBZT4Woq5f+zOrQfayxtSmJECVzMLDrQwFwh9I+GMt7A9hFOOQp+PcsBojsPrFof
         HsiS7sdj5xvZTKAFlonQmKhT0a6ItWd1ECBnN1BX7ZK5/qkopGoHFpymzoQc1eNIc3J0
         dY5diC2HIqjFhuluUwATts5KRPA1lf2OnHAfVnw6C/fqvklqlgzjqvJTRr4it6FE/X9F
         +mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722321728; x=1722926528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHB4eU3RZ35UpD8A5nbV2DYKKPlBqIpFdqY8Irf/JA4=;
        b=hG3+DUdk0U2mqgysrgKpAkPRheKBFVXwdbD3wBaNt410Xdq7I4lpfyBRG3A9mVXlhX
         h1kUQU6lpoC8DKCpaEjiOf0gZ6026M0MX+BHT7+14E/aaKG9/VL46knGIxfANit/i+YP
         bDvue0IrKjrK7trn/5Fjno2789Wf7JFraP8iug6dGlNisfes3VjCgaxcMVG61JDYF5WA
         d/OdlXOHHGeyBNoypqNB/3Y//FS/QG+9RwHDXOf9n+q1s6/Pzw9ApseHQI/kVUg6L30w
         n54EE6WZXLqryPYDs99rSTOXjoLogpcLewXsxqKDkDDocubE7VIKop2WZGIXnUlORxuy
         7aMw==
X-Forwarded-Encrypted: i=1; AJvYcCUruEC3luiIs4X1SZDYcueRPDIvYi1TB8MGI/7ZGetwvkQEvNGzeddlkEHN8tcwyP6LfCkhNHfwgFHA73473PQa3UP+jsht9m360rPTBvM=
X-Gm-Message-State: AOJu0YweEIPQIGWkYDd1A1CTcNU50qct1Ta6eHzZc9SDOHYhvryOZNwX
	K+71GXLFdY5QrF+4JuZ6yYQTiFZG0aOU3U3YuNsNTPUNe0zREpYueYYCoe0A3DN98bZ2yhURpUM
	=
X-Google-Smtp-Source: AGHT+IH0Qf7OO2E3uecdSANP+YFzzO3JCAMFaOb2gSmgWsy6U8ZWb1JWUkU/UMqfY1jEsW+Mboq6Tw==
X-Received: by 2002:a17:907:2da8:b0:a77:c824:b4c5 with SMTP id a640c23a62f3a-a7d4004414bmr693291266b.18.1722321727715;
        Mon, 29 Jul 2024 23:42:07 -0700 (PDT)
Message-ID: <59e3fdd5-f13b-414c-95e1-46e86a4779ac@suse.com>
Date: Tue, 30 Jul 2024 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
To: zithro <slack@rabbit.lu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
 <500adb55-4927-4876-aa22-3269538bb4c7@rabbit.lu>
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
In-Reply-To: <500adb55-4927-4876-aa22-3269538bb4c7@rabbit.lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 00:31, zithro wrote:
> Added my S-o-B (no other change).
> 
> PS: re-sent to account for Anthony mail address change
> 
> On 29 Feb 2024 08:00, zithro / Cyril Rébert wrote:
>> The xl command doesn't provide suspend/resume, so add them :
>>    xl suspend-to-ram <Domain>
>>    xl resume <Domain>
>>
>> This patch follows a discussion on XenDevel: when you want the
>> virtualized equivalent of "sleep"-ing a host, it's better to
>> suspend/resume than to pause/unpause a domain.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>

Imo you want to properly re-submit, ...

>> ---
>> - Tested on v4.17, x86

... with this testing also advanced to 4.19.

Jan

