Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C58B25EA2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081045.1441177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTEq-00063c-Qj; Thu, 14 Aug 2025 08:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081045.1441177; Thu, 14 Aug 2025 08:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTEq-00061f-OC; Thu, 14 Aug 2025 08:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1081045;
 Thu, 14 Aug 2025 08:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTEo-00061R-Hi
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:23:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e628d5d3-78e7-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 10:23:04 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b690517so959569a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:23:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076724sm2539884266b.23.2025.08.14.01.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:23:03 -0700 (PDT)
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
X-Inumbo-ID: e628d5d3-78e7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755159784; x=1755764584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=It75J2AnABio+dzN0d/u421JC9wsX5uNOX0PwBSQ/Vw=;
        b=S8hsFrZN/O2wVhPR4oMfrNedUOQPAB+TXZSXmZJkiX1nlQ7qSuwcTowBieJnVKq4C5
         Ig838hKMiKZnQhKTXITqJrFADklCpJQ4rowQavV0UyNp25iMagVr5lvmlnIblQzMpans
         CQ2cK6Tdq3FUiMKdul8RMaoqCbSVishvMS2Q/zJQM+ub4sK8/3yMlo9uhSFyJFFEyiGw
         8fzMVDrcaORisXBlYhBRnP14c6ZHrGcdtp+i4yUn5Y5O7/MpbiqWZM4biVKQpmOwjwKx
         vMd44Sm1AHuckp4/1A90JNahZpZedCSFACDWftcOVnnsIz4hqVXLSOgWRPNQwuSeOoPx
         mZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755159784; x=1755764584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It75J2AnABio+dzN0d/u421JC9wsX5uNOX0PwBSQ/Vw=;
        b=PDOSFV6AoKruAIAKMtKeaRVEKn2blHfa+R8LfYb3wQll8H8xYUQXsUeoUqP1cQuRRY
         c0VYOZd46lLtsYn2CFLMGqPqIulSpLJhd/Xw7RjjNSLCrOHknUexOTm+57ZTmwmu9F1H
         H+sNUeD+Ga+UL3URS4InD1mWGQQOmAHb5rQVNoaqFARHJPFN2DsFi1FJAZTf+W8kKUe0
         Ae0MMRbck1eOppezYhOECf0/TReoKaod2ZcF3xvH+h0gKwhVJmtdMCV9XbzsUic993VV
         rxi4ISSTbvRWeNwVhn8hotuh76UEVNjKyKNtiCYL3WBfXFpSsnAh/DYJP/z2J9XtrgtP
         LMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGytXgbDsvDXxNxCAjvGOIf6anVzwetoFl42uaCtWlGZYjYrKcZ0kE7Ewr3R4/cLwjlPwo+YefMg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOEEsIxB2J/V2WpUmPs28+y0PY8DwKnI5FlgXF2IV9UAAaQAXV
	evH16Z1FvHZqYWb49Brt5lMGs9EiVeDAxOSa6TN+Gqf/PZyCP/NvsTjgdFrSx5Sg9Q==
X-Gm-Gg: ASbGncsRC61GOMP6+yWp2xW3pt70D1/Rl08LE0Ttix24AXEyk3634N6rQlsQnzdRNiX
	psQSiXlOqXv0LhWTcC4GpXHXJVbwMOcoBdOtzqgsaBW2aepYfDengabxeXSghGi8ztw+9/AUCMl
	dvvg+yPo2eh100jzgMrKy4ruwJQNbDyZ2777fgGPH0zknZUq/aY6NFoHhd3xYPfo+FWm93oFgi/
	/1uZvvh8vfDHKVTBh+ozB7JtG02iNd9xQk9945yfs6fn5HOeDHBZtFNGkfcAZrgWJLEykUjMra0
	Ua6Vwvq70j0ktMYcA6BiY/44UleSxPdnPzKEb/HYl6khFteBHoG7xnedyCySOX+j6DcqtKoBYEh
	UDAkgzFE0BaruLqj2JSeCZSPY33zANvARuzW4Ixhe87Ed9rhBt05xClczCzIu7cObpev4dSqyDp
	xyIsU3Rck=
X-Google-Smtp-Source: AGHT+IFBVDIcvJYoiYblduBtPKP+jhJpJdcoLJYfr0YPbA4LTD0kJ2zUWsbjgZ1dF1z4VXkYzq2Ehg==
X-Received: by 2002:a17:907:1c85:b0:afc:a18d:f14d with SMTP id a640c23a62f3a-afcb93a22b3mr165000766b.7.1755159783604;
        Thu, 14 Aug 2025 01:23:03 -0700 (PDT)
Message-ID: <bda0c44d-d862-4045-8653-0d36d3ad479e@suse.com>
Date: Thu, 14 Aug 2025 10:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: remove unreachable code in read_file()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <52dbb5c5c1385b3b9d8522ef308ef15248973368.1755023074.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <52dbb5c5c1385b3b9d8522ef308ef15248973368.1755023074.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 21:17, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
> 
> Function `PrintErrMesg(const CHAR16*, EFI_STATUS)` isn't intended to return
> control to its caller. At the end, it calls `blexit()`, which, in turn,
> invokes the `__builtin_unreachable()` function, making subsequent return
> statements in `read_file()` unreachable:
> 
>     PrintErrMesg(name, ret);
>     /* not reached */
>     return false;
> 
> This also causes unreachability of the code meant to handle `read_file()`
> errors, as seen in these examples:
> 
> In this block:
>     if ( read_file(dir_handle, file_name, &cfg, NULL) )
>         break;
>     *tail = 0;
>     }
>     if ( !tail )
>         blexit(L"No configuration file found.");
> 
> And here:
>     else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
>         blexit(L"Configuration file not found.");
> 
> And here:
>     if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
>     {
>         PrintStr(L"Chained configuration file '");
>         PrintStr(name.w);
>         efi_bs->FreePool(name.w);
>         blexit(L"'not found.");
>     }
> 
> The issue arises because when an error occurs inside `read_file()`, it calls
> `PrintErrMesg()` and does not return to the caller.
> 
> To address this the following changes are applied:
> 1. Remove `PrintErrMesg(name, ret);` from the `read_file()` function.
> 2. Replaced it with `PrintErr(name);`, which prints the file name and returns
>    control to the caller.
> 3. Change the `read_file()` return type from `bool` to `EFI_STATUS`, allowing
>    file operation result codes to be returned to the caller.
> 4. Properly handle error codes returned from the `read_file()` function in the
>    relevant areas of the code.
> 5. Replace `blexit()` calls with informative error codes using `PrintErrMesg()`
>    where appropriate.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1980590118
> ---
>  xen/common/efi/boot.c | 57 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 50ff1d1bd2..ddbafb2f9c 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -132,7 +132,7 @@ struct file {
>      };
>  };
>  
> -static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> +static EFI_STATUS read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                        struct file *file, const char *options);
>  static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name,
>                           struct file *file, const char *options);
> @@ -782,7 +782,7 @@ static void __init handle_file_info(const CHAR16 *name,
>      efi_arch_handle_module(file, name, options);
>  }
>  
> -static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> +static EFI_STATUS __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                               struct file *file, const char *options)
>  {
>      EFI_FILE_HANDLE FileHandle = NULL;
> @@ -791,7 +791,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      const CHAR16 *what = NULL;
>  
>      if ( !name )
> -        PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> +        return EFI_INVALID_PARAMETER;

Why the change in error code? EFI_OUT_OF_RESOURCES() was used deliberately for
cases where the result of s2w() is passed directly into here.

Between this hunk and ...

> @@ -842,7 +842,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>  
>      efi_arch_flush_dcache_area(file->ptr, file->size);
>  
> -    return true;
> +    return ret;
>  
>   fail:
>      if ( FileHandle )

... this one there's at least one "return false" which you leave untouched, thus
wrongly reporting EFI_SUCCESS now to the caller.

> @@ -850,10 +850,9 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>  
>      PrintErr(what);
>      PrintErr(L" failed for ");
> -    PrintErrMesg(name, ret);
> +    PrintErr(name);
>  
> -    /* not reached */
> -    return false;
> +    return ret;
>  }

With the comment here - possibly adjusted to become a SAF one - all should be
fine with no other changes? Because of the other "return false" callers simply
can't assume the function would never indicate failure back to them. (New
"return false" could in principle also appear, which is why I think the base
structure wants keeping as is, including in the callers.)

Jan

