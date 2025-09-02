Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F140B40853
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106885.1457520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSVG-00066H-3F; Tue, 02 Sep 2025 15:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106885.1457520; Tue, 02 Sep 2025 15:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSVG-000638-01; Tue, 02 Sep 2025 15:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1106885;
 Tue, 02 Sep 2025 15:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utSVE-000632-Ka
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:00:56 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff039c4-880d-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 17:00:55 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so321156966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 08:00:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04110b94cbsm723126466b.93.2025.09.02.08.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:00:53 -0700 (PDT)
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
X-Inumbo-ID: 9ff039c4-880d-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756825254; x=1757430054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wpUrdotCJ0Y0liN61EhVHhifJB6ZIfv8XU4reL1iPd8=;
        b=c6r15nWxr9hOgrL20A6NQLWT9eq8xkvBVJECH6GQm2N0mU8kFTAS0ukeUmkD7qfE7s
         41BtFXjTcGO2iL15SpXB7rVqyJOCk9Zp0UV1tqvUxqqMSlKuk/FP69vKeI0iEEwdNw/H
         J9Ll+UsRZfxkka3PCJPTibB/ez3RBGa/Oqfep8QMA7V1QCIMciSpAPIqz/1rq65ILTTJ
         C0EWc8xq9wKuXjXCeY3N2iEsb1ohSUMYa5QPfKT3kKSl+y1grLgMpKHFX2eKAiFNK61X
         6zW7tKW2S/o3yBd3dO/2Bdyo/qtHWt8PQw+YWrxJLWOZZUSVnNX9mdzWPp2o9hlLcljY
         kbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825254; x=1757430054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpUrdotCJ0Y0liN61EhVHhifJB6ZIfv8XU4reL1iPd8=;
        b=Epgo38m1yV/tbkRlHj9phdMIdOnPxC50gI+0MIOSbSYsg+o5+0w9M01uQ4Y67rOpQQ
         8PfD0Y9mT9+8xhHtx8XWwRlRn3O8rlR9qNvS/Mhw62ngF/3eWo+uRDF6ZumFs1CsNVz8
         9NVlvbX878Bvku9nHgkz+L8GNIU9O6ul5C379zEpMwSAEZ8UcjB7OywPpV2D9j1OTyyR
         GnhtixaUEPNb/TCJ/1/bTTb+9Z14rDXYNc87dPhPeyKqtOra5ahU1AxxS9ipoOUXPcCJ
         EvPoPPX14WAPDFNnCXAO6vUgXOk/mLr6uUEE2cegybC44dMEg8jBYNkLnaHZDs7EajZH
         ekhw==
X-Forwarded-Encrypted: i=1; AJvYcCXHn0PvA7cWZcwC80abgIk46vESiMxR2QKC2IZvZKY8eQrauaNKpyKDglTueYw2RpyFgYVnVLfFnRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYOzeSa3PdDbSaqJkUq3EV1Dj7YGv0RMkuWyVDAx4XdhnUHYXg
	s5SUz1+oSKXFxF2Twym94toxZ/HaTE+58ixFQ+lhCZ33K9b/5HrUfrPf5MU0NZ23yA==
X-Gm-Gg: ASbGncsmIiqkXi6ivebOUIC3bdAnyjTwGwKLdssr1jq7aJ6eK89GcgH/5KTfljixs/r
	dQvZh72adpi5ohPhjzAPZ74HodMrhNUds90jT7DYuJyf3kPUQFsNRe+N/mHxBGbfEqxSGx6mK21
	71Uj/E/kv7D2evptvxqdZFncGMJyIlh5VP4eKOfAkq4l+vtXIPG2ODXyWz1f0QPkweRKbFWZmdS
	dq8Oqz/FfQxrPDC9Z9aI18t6HxUSvfkw52hn171NmzcuyDTM0Nw6Bgn5QTIacjEE5Lw9+KCDpXH
	YS9cLlmmnbHFMoUIpKrPauShISxB0ChqMDymlCS1UWAJYOLgrpEWCVDnvcBkC2KakD1ndEZuMm6
	BxPe8vcOQ+mPbfKaggZ/PU7N/VSXdYh3O8GAU81ktNrPtQmotDum887kqPZePUabaN+zAgiFNdT
	Ue4On0y5QkgpfFnkQn3OfUhd6mWgBC
X-Google-Smtp-Source: AGHT+IFCa4pndicxeIepm1ezRw8SU3+Jf8/iwRlB4ZlLIvrJqCrxs+/5UV2vH1LvgumHlM1Tkcwa5w==
X-Received: by 2002:a17:907:9406:b0:b04:4aa9:eec8 with SMTP id a640c23a62f3a-b044aaa4b0cmr373841766b.17.1756825253991;
        Tue, 02 Sep 2025 08:00:53 -0700 (PDT)
Message-ID: <12dada9a-96eb-45db-bd1a-5a88e323a100@suse.com>
Date: Tue, 2 Sep 2025 17:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] efi: Use Shim's LoadImage to verify the Dom0
 kernel
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f2f88f0d857ed3f8d7e3fabe349a3b5d5815981.1756822290.git.gerald.elder-vass@cloud.com>
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
In-Reply-To: <7f2f88f0d857ed3f8d7e3fabe349a3b5d5815981.1756822290.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 16:44, Gerald Elder-Vass wrote:
> The existing Verify functionality of the Shim lock protocol is
> deprecated and will be removed, instead we must use the LoadImage
> interface to perform the verification.
> 
> When the loading is successful we won't be using the newly loaded image
> (as of yet) so we must then immediately unload the image to clean up.
> 
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
> Changes since v1:
> - Re-instated SHIM_LOCK_PROTOCOL as a fallback option if IMAGE_LOADER is
>   not found
> - Fixed indentation and error messages
> ---
>  xen/common/efi/boot.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 453b1ba099cd..273da3d9e3e3 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -38,6 +38,8 @@
>    { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
>  #define SHIM_LOCK_PROTOCOL_GUID \
>    { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
> +#define SHIM_IMAGE_LOADER_GUID \
> +  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x55, 0xab} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
>    { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> @@ -70,6 +72,13 @@ typedef struct {
>      EFI_SHIM_LOCK_VERIFY Verify;
>  } EFI_SHIM_LOCK_PROTOCOL;
>  
> +typedef struct _SHIM_IMAGE_LOADER {
> +    EFI_IMAGE_LOAD LoadImage;
> +    EFI_IMAGE_START StartImage;
> +    EFI_EXIT Exit;
> +    EFI_IMAGE_UNLOAD UnloadImage;
> +} SHIM_IMAGE_LOADER;
> +
>  struct _EFI_APPLE_PROPERTIES;
>  
>  typedef EFI_STATUS
> @@ -1336,10 +1345,12 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;

Please put the new GUID here, rather than using a compound literal below.

>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> +    EFI_HANDLE loaded_kernel;

This variable wants to move into the more narrow scope you introduce.

>      unsigned int i;
>      CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
>      UINTN gop_mode = ~0;
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    SHIM_IMAGE_LOADER *shim_loader;

Same for this new one as well as shim_lock, as it looks.

> @@ -1590,12 +1601,32 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>       * device tree through the efi_check_dt_boot function, in this stage
>       * verify it.
>       */
> -    if ( kernel.ptr &&
> -         !kernel_verified &&
> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                                           (void **)&shim_lock)) &&
> -         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> -        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> +    if ( kernel.ptr && !kernel_verified )
> +    {
> +

Nit: Stray blank line.

> +        if ( !EFI_ERROR(efi_bs->LocateProtocol(&((EFI_GUID) SHIM_IMAGE_LOADER_GUID),
> +                                               NULL, (void **)&shim_loader)) )
> +        {
> +            status = shim_loader->LoadImage(false, ImageHandle, NULL, (void *)kernel.ptr, kernel.size, &loaded_kernel);

Please pay attention to line length (see ./CODING_STYLE, also for other style
aspects, like ...

> +            if ( EFI_ERROR(status) )
> +                PrintErrMesg(L"LoadImage failed", status);
> +
> +            // LoadImage performs verification, now unload it to clean up

... comment format).

> +            status = shim_loader->UnloadImage(loaded_kernel);
> +            if ( EFI_ERROR(status) )
> +                PrintErrMesg(L"UnloadImage failed", status);

Does this really need to be fatal?

> +        }
> +        else
> +        {
> +            status = efi_bs->LocateProtocol(&shim_lock_guid, NULL, (void **)&shim_lock);
> +            if ( EFI_ERROR(status) )
> +                PrintErrMesg(L"Failed to locate SHIM_LOCK protocol", status);

This is a behavioral change not justified in the description. Imo, if
the original code was wrong, that would want to be a separate change
anyway, so right here you want to retain original behavior. Simply
consider the case of a shim-free boot, where neither of the two
protocols would be available.

Jan

> +            status = shim_lock->Verify(kernel.ptr, kernel.size);
> +            if ( EFI_ERROR(status) )
> +                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> +        }
> +    }
>  
>      efi_arch_edd();
>  


