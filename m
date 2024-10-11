Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C16999F44
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816767.1230875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBJo-0000D9-Pb; Fri, 11 Oct 2024 08:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816767.1230875; Fri, 11 Oct 2024 08:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBJo-0000AI-MI; Fri, 11 Oct 2024 08:48:16 +0000
Received: by outflank-mailman (input) for mailman id 816767;
 Fri, 11 Oct 2024 08:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1szBJn-0000A5-LZ
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:48:15 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d8ecc89-87ad-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:48:14 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99543ab209so251819566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:48:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f25f67sm188572266b.55.2024.10.11.01.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 01:48:13 -0700 (PDT)
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
X-Inumbo-ID: 8d8ecc89-87ad-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728636494; x=1729241294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydvIiWOfO23nmG+MaFdPj/oB9aVXPJ4AYVH2d6zgCsQ=;
        b=gO5Db8cruCII3FhKlD6uSAiLeE2U8QwSQ1fCSqi1Vo82ibgc4e3m8RaIzJ90MuqCwp
         pdWqCSBRuIqKFHkpzI3nK7icXfZtVl1V/jJcIwCgqCiEUU7bwTDp3Gn2guLA3hz4ul0o
         Rm70G/9QQlbrW95Qc04RDU0fx4WshsaTDL2cDdEBHxYYWaHLEZFQQ+scslEIssM+mwoP
         ndsgaBgzd3YuqWlJwcY5LSG++NNLAwwjXlgzayFq+t2Se5OIAT2IT+diBZIkG+9LEcrm
         3s7iHoC4wTmULzpTAJSzY5YJ1S0FO1CRhe5s+r5MHdBjn15aCB3PbUF380X72o4ooyIi
         JvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636494; x=1729241294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydvIiWOfO23nmG+MaFdPj/oB9aVXPJ4AYVH2d6zgCsQ=;
        b=Wa4r6QkGCgcpKTaa5Owx9dr9Fi0QpwVmnJBBEIRKF6GZGErBni2/+grtjQtmo2tpzR
         ApXI/J52SjwyQrfXkzk4y+TZnJkzE2StQ05wpZjPe1laWYibEUoxdPDYbjxSugZL9OkJ
         IpSeePmRuYDehAEVJyVTsWv7NSWA+BCv9MXvFnbUi2oJfm0/IXjzwy1rDA8Amg1oruBT
         gMmOyxTxRbS9cq2MMavgcTxZAyp9Vl4X8OmX0C/UghZQWL6eGCaxlYKMgF05pNW8VP+a
         qBq5i//YMvB+/kF6tvbWxT4jhuaSV4RzPGkxaVss4/+FJoXZlduv2IX6Cr1uIMJ/tDon
         dP+g==
X-Gm-Message-State: AOJu0Yzdbm/xXmKYP8pNCblQV/WP0v/Jq/mGHq0XND8rU7y+UwWfeVLX
	zQcvLrQOHtM735i8Pf6mnZfhawUnF+w3p2Pk7xr8qBNsFOBMOvFVsere880nuQ==
X-Google-Smtp-Source: AGHT+IFYf3GsRyCWzpQEVfvSWbi+oaPoz2S2e5KCnky+zmYsWo2D2WRt/AE/ELL79Vr8h88JaCbVew==
X-Received: by 2002:a17:906:d554:b0:a99:43e5:ac37 with SMTP id a640c23a62f3a-a99b937a8a5mr129107766b.15.1728636494084;
        Fri, 11 Oct 2024 01:48:14 -0700 (PDT)
Message-ID: <5d3217c4-253c-41c1-bfb7-1e926f9f3753@suse.com>
Date: Fri, 11 Oct 2024 10:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/4] xen/pci: address a violation of MISRA C Rule
 16.3
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
 <ZwjlurKU7FrFvObG@macbook.local>
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
In-Reply-To: <ZwjlurKU7FrFvObG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.10.2024 10:45, Roger Pau Monné wrote:
> On Mon, Oct 07, 2024 at 04:16:19PM +0200, Federico Serafini wrote:
>> Refactor the code to avoid an implicit fallthrough and address
>> a violation of MISRA C:2012 Rule 16.3: "An unconditional `break'
>> statement shall terminate every switch-clause".
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>> - improved description.
>> ---
>>  xen/drivers/passthrough/pci.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 5a446d3dce..a5705def3f 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>>      {
>>      case 1: case 2: case 4:
>>          if ( *s )
>> -    default:
>>              return -EINVAL;
>> +        break;
> 
> Would you mind adding a newline here between the break and the default
> case?

I actually took the liberty to do so while committing (already a few days
ago).

Jan

