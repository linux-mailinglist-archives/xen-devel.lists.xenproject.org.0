Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3384B647
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676931.1053291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLSG-0000QA-AD; Tue, 06 Feb 2024 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676931.1053291; Tue, 06 Feb 2024 13:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLSG-0000Na-7Y; Tue, 06 Feb 2024 13:25:40 +0000
Received: by outflank-mailman (input) for mailman id 676931;
 Tue, 06 Feb 2024 13:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXLSE-0000NU-9t
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:25:38 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b6e8dc-c4f3-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 14:25:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b409fc4aeso1261184f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 05:25:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4c48000000b0033afe816977sm2086647wrt.66.2024.02.06.05.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:25:35 -0800 (PST)
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
X-Inumbo-ID: 35b6e8dc-c4f3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707225935; x=1707830735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwxfR3P3szSE5y1QYgAVF9WnC4T0JlErkuO1LusfE44=;
        b=QZnCONj+AXpAwWa+T9Fl/QwoMeKp/EPNsSbjKkjhq6A9dwUreiDY568CEvPnJQm4qe
         sdeMyDGGYP7w9i/tjO8fQFzbp58vA2X39q9YgpCjgW3KcqP+GTfY8AiKmCC2Zjq+oimh
         HexHBJ5kIY5o3WGlPte8rjk5FQ/Sf8hJVWw41kkodpN1rzmA+7+h2v7MTO5twlLIHiqF
         Zgr0c4hITx8rpyK8FXe+jldTDpdCo/V8Q8H7yH3dyCwjJ7InQmY7Wj2QZvrcaCX9OY0G
         TZfLfDuU7C9+4nRX8WyVzLllLlLzZsp1FSCWY14/MfUJH+/1iU15HFJdvMe8L3Zo89Aw
         aJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225935; x=1707830735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwxfR3P3szSE5y1QYgAVF9WnC4T0JlErkuO1LusfE44=;
        b=guUO/yclSI0+li0cf1s/Mmr0VAGfbsEtzJoiRi6fpUC0SSv79mqPnstFniskPztkS7
         rDcf2/85arbYpkMp2FU3Jdf1e4s8HjnU6u6gi07F9NOQebmxexu6PiwWnN+Wf/RRthiD
         gHoS5w6BrcWZ6XqW/uqsYWYF4jbTyTNvpAxc8E3gmeO0cdG8nzuIhiG7qiCZK8RvxxMx
         OIi3rX/y6nZvYZmNEeUKpsmfQ5BouX2gIhPfoOKgEp98rpciQ56AYbQYwifVpKLpAHCG
         qvVQroP3eOW5gjPtotbeBxRVul8fY+bKr2EnNqWbpXPyhSwQnKePcjPv8uW0E3Xi80od
         Hcrw==
X-Gm-Message-State: AOJu0Yy8EyWVtPLV8vy1gGYGxRT4VhZw1JXN7JCWhi1knAr5SJomhJsl
	BE0CmHplf9C0s7H9DAU4CQxI2L/+ybSs/RHCRsovTi/hUDVV9vKX2uZCtGvoxQ==
X-Google-Smtp-Source: AGHT+IFvkXG3gKt0NtUfEQjtYZl+LTSpno0oEWlTA9mv/VuH5fDr9sqg2jL6QMt5nVrwVpNnMtGuew==
X-Received: by 2002:a5d:56d2:0:b0:33a:ff67:74a with SMTP id m18-20020a5d56d2000000b0033aff67074amr1166247wrw.63.1707225935672;
        Tue, 06 Feb 2024 05:25:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUdV8hCV5AQH6Xz8TCSjYEJcOMQoXagGCepqQ2r1Tc50478FOOD58reSB5CUFDOpIeZAmWDrHXJFX/X3VyUCtQI0+gX0zJeV0rmtLSvy4S8Z/yftoFo+awBqdQvROKkJDVncWvWP8NYoldKNMRhFqf+MnyLse7cEMUqr4ROeBt6upNMsLwbL1PEHVVU
Message-ID: <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
Date: Tue, 6 Feb 2024 14:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
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
In-Reply-To: <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 11:05, Federico Serafini wrote:
> @@ -208,7 +205,7 @@ do {                                                                       \
>      case 8:                                                                \
>          put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>          break;                                                             \
> -    default: __put_user_bad();                                             \
> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>      }                                                                      \
>      clac();                                                                \
>  } while ( false )
> @@ -227,7 +224,7 @@ do {                                                                       \
>      case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>      case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>      case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
> -    default: __get_user_bad();                                             \
> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>      }                                                                      \
>      clac();                                                                \
>  } while ( false )

Related to my remark on patch 1 - how is one to know the macro this was
invoked from, when seeing the resulting diagnostic?

Jan

