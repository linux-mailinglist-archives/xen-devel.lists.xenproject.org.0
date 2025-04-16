Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4578A9077D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 17:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956403.1349833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u54VR-0000zK-9X; Wed, 16 Apr 2025 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956403.1349833; Wed, 16 Apr 2025 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u54VR-0000xs-6l; Wed, 16 Apr 2025 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 956403;
 Wed, 16 Apr 2025 15:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u54VP-0000xm-V6
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 15:16:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2226e2f-1ad5-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 17:16:50 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso635854f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 08:16:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9640a9sm17523285f8f.10.2025.04.16.08.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 08:16:49 -0700 (PDT)
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
X-Inumbo-ID: d2226e2f-1ad5-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744816610; x=1745421410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vfGREaRRFIs6sLlXNQLeapxmxkk1kNFlTdVUF2mbQvw=;
        b=Y68U15mn8wr2tlSdwoC/r+d/WsKso7Mr1LStn1Mn10PFliVEe0NUlMyZz9lv9VkzqW
         HqhJ/5sVOVumRhVPjRCx8X/28abT7IBv2enWqI6k063blh9bTs+roZZevU50itUZ0mEB
         YPL1G+LAfml45KZXrMQRhRfep5MuNB6dfJ7FJ5qDVTozfs5rYTk53mdynjrqRXKVKof0
         DtjjkZGbdbk319y1P43hAX1EnN/t9JfzAYY5uryv47LL+SrEFNNrOxhaMALRVgPDZ4Bp
         Lhe7AelGW1Sg111+9lIp7O90TigdiLHxmwd6oMjFvyaYt7V+U/Myk8w8tYIW3jdCS0cQ
         AgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816610; x=1745421410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfGREaRRFIs6sLlXNQLeapxmxkk1kNFlTdVUF2mbQvw=;
        b=WlThA/5rBtBfADh2VOQA7bDq2z1sYgudPTJInc4mumTI3Bfk9lyUohW/26Ji38RkGT
         sBzrP8sA0xsTXtpW4zvWNxBtDSEivbylq0HkMB91Fq9KbdLeS1dSzOFqg8asYncvAT5t
         y1WjF71Gc5XT6Jy/D05QlEOElkWiMIpK3rlMG5HTHMnR/sX9ATQ0x7CnYUg+FBKr2KGK
         6l4its9OAyWjCD0CpX6GqNuMa72fljuDpzBq2xBboVaIuFUajMXg9Q3lpUjGZq5mgqsh
         DMlqGzwzuTm/0AIPzoizsBAwiYpHaCI2DI/mSBQ6t+Q+QeP7Z2rAGghw4254EdkgCUXq
         UyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdHyAmBHVCU9x+7H/3G5bKEJIM+6a39sCnl0TZkw51KdrT1gGMTFanISR1JN4DcCLlzRTDw5IWrwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymA6YKvwqbmgU5SfR6fTz2pkT9bAIe4ubxHGkUdM91z3FDmKwU
	M3U5r+lrd8qjV3QCzJkdLj82jrA3EOtbJvZZf5MfM8nSwJJZBQnIUAiTifFgog==
X-Gm-Gg: ASbGncsLYv/GvMrOLlMn0+pJFaa790Ix5/6JToNZdlDpDSYlQNjv/6ewlrfvUlgO1hx
	KrudfvpT+VgfIoxIGRTfPFQYm4BEY5ekJYgfiHLnn0Gws/1970t0nz/a1rY3OHbfQTwaBo3mr4U
	wd+Qr9MmV2ZXUVpvx7c1eh1fbsSEAeqV+I4I8INfIuac4SCTuzm6pDFeNtP76R9FcKpW1vErTOo
	VQQD87YjAy3rkCXuyeNlShromWDrdEx1YhMFqGW870H7cK/TgKHD6H9trWc6E3G28d0ot/NJ32W
	sYFwVVTBkeESHTlgGx0Oa3NGck5Xz24okooCnZRFvpcFV/2xoxPoJN1TArG24FcBKXlb5i3zykO
	e3ffkKLaVF/RIlhDJ4ioyCxQnWgB91qtKLvCh
X-Google-Smtp-Source: AGHT+IF8W1Uj6RU5OAZcewirpRyLkqcFNw/jxQgt6PeYdJvGHL0enBMUjUNiVWbU22et4iu3N0zR/A==
X-Received: by 2002:a05:6000:178d:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-39ee5e96ea2mr2343330f8f.1.1744816609884;
        Wed, 16 Apr 2025 08:16:49 -0700 (PDT)
Message-ID: <bc1ed3bf-4512-4d96-ab58-f8251896504d@suse.com>
Date: Wed, 16 Apr 2025 17:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/dm: arm: Introduce inject_msi2 DM op
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
 <e9e7d722eeac100048ddd5a4032e3d7af39f8c3f.1744621166.git.mykyta_poturai@epam.com>
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
In-Reply-To: <e9e7d722eeac100048ddd5a4032e3d7af39f8c3f.1744621166.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 11:51, Mykyta Poturai wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> Add the second version of inject_msi DM op, which allows to specify
> the source_id of an MSI interrupt. This is needed for correct MSI
> injection on ARM.

If this is about Arm, why does x86 also gain (incomplete) handling?

> @@ -539,6 +540,23 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data = &op.u.inject_msi2;
> +
> +        if ( data->pad || data->flags & ~XEN_DMOP_MSI_SOURCE_ID_VALID )

Nit: If the x86 code is to stay in the first place, parentheses please
around the & expression. Even if not, similar issues appear to exist
in the Arm code.

> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        if ( data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID )
> +            gprintk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is ignored\n");

Does this compile? It looks to me as if there was a missing comma.

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,23 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_inject_msi2 21
> +
> +struct xen_dm_op_inject_msi2 {
> +      /* IN - MSI data */
> +      uint32_t data;
> +      /* IN - next two fields form an ID of the device triggering the MSI */
> +      uint16_t segment; /* The segment number */
> +      uint16_t source_id; /* The source ID that is local to segment (PCI BDF) */
> +      /* IN - types of source ID */
> +      uint32_t flags;
> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)

What purpose does this flag serve? IOW what's the value of using this
sub-op when one doesn't want to specify a source ID?

Jan

