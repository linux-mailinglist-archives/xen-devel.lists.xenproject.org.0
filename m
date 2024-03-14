Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682187C0E8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693357.1081327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknZc-0003Hl-IS; Thu, 14 Mar 2024 16:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693357.1081327; Thu, 14 Mar 2024 16:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknZc-0003Ek-Er; Thu, 14 Mar 2024 16:04:52 +0000
Received: by outflank-mailman (input) for mailman id 693357;
 Thu, 14 Mar 2024 16:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rknZa-0003Ed-PS
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:04:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9544480b-e21c-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 17:04:48 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so152741166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:04:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h21-20020a17090619d500b00a46447348e8sm827048ejd.191.2024.03.14.09.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:04:48 -0700 (PDT)
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
X-Inumbo-ID: 9544480b-e21c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710432288; x=1711037088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhbS3U795qG1siKvxeuRBWc5m9VW37NK7XrVFdwFPCQ=;
        b=AC4L9lmG1DS2fudNPXuNtFrO8EnR+mgc7KpYTmpEN8gbsztvh/TNtFN7W4vkr6bBoQ
         iOCjurwiOrOPeRUjZQUY2INPvN/NXmcDjxS8TFVbxyvWkTU2ZUNgtHTVCDYISUA7xR5E
         wCg6RFOQFEEwmA6i0KIxgEkOcGSZZcy5SHg2m6gVMniuluIiio8+fWc57Kv4N6JF4hI8
         b+0qZBMjGwHI872HyL+52MBxb7yEaAuU4KSmuXpcccIoMT9B3FaggE4A7dMgOVRO4R5A
         iQzjgQu8RsuwJfEnExTSNVvtZ4gGPFYFl2c6b0nyNh9xnamwywx+gkNd0GgKp9qwIfG/
         s3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432288; x=1711037088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhbS3U795qG1siKvxeuRBWc5m9VW37NK7XrVFdwFPCQ=;
        b=pDvUjO7EOU19UkDH413fPv9R4E/QLLFkB8Az0d5ILg9neGCpDw0KFPpxyYxkAAlLpV
         wbQaNBh6lCXzvM26Sp0gjvw4cdWbzNF2COQ3yJkY6m/3vyJ8eq91+UoreHTd4ZYCMk4E
         eoP1EW+qxlREMFzigG9mnUWPe5IWxll0Qskuw/ENx/e2zuT5LpN96FDLWJ1gmxWk1F7e
         egLn3DO32hLPxUMA3rIkXFV+J3vARUE+ELTBFYDZtM37sJLmAFD5f32ms428k67EdhPe
         v3wuWfH2E9VnvlJOVnUAZ6q0aTWwCitEpP1BgwIS7ctprUGnwvxlJjUNjD1cBs9zQdta
         vzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXq1Vy2d9Svi1EZENXEqvjLAC3lKz0GyDSLvEIyFR/y1/6kZeAV32AGYmsqyeldcr5695u/O2c3njKkpTs0XfqXDGWkl7SQxZWT6AFuya0=
X-Gm-Message-State: AOJu0Yw5ZY8ZjMsfZTCOI0RKYEyPBt4PGroeNwCU/eIcfrg5ERE+8kuh
	z5521AE8ttW88HaDz8CBXxzvR8w7wLtny8RvHhaYM5DCvl5pglmIHIV/pnOKPg==
X-Google-Smtp-Source: AGHT+IGxkQH+DOGbBNbcZAAZv+5+a9Tp9q5e+bC+JAh8tahWu9b3UYpWDlGepDupM7GQfYgaFwDx3A==
X-Received: by 2002:a17:906:ca56:b0:a43:e550:4067 with SMTP id jx22-20020a170906ca5600b00a43e5504067mr885215ejb.12.1710432288274;
        Thu, 14 Mar 2024 09:04:48 -0700 (PDT)
Message-ID: <3f8af14a-391b-46db-99cb-d7cafe126cfd@suse.com>
Date: Thu, 14 Mar 2024 17:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] x86/svm: Drop the suffix _guest from vmcb bit
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710347950.git.vaishali.thakkar@vates.tech>
 <88d5a0ce6745428120ebc37369d3d75358d5c582.1710347950.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <88d5a0ce6745428120ebc37369d3d75358d5c582.1710347950.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 17:41, Vaishali Thakkar wrote:
> The suffix _guest is redundant for asid bit. Drop it
> to avoid adding extra code volume.
> 
> While we're here, replace 0/1 with false/true and use
> VMCB accessors instead of open coding.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -37,14 +37,14 @@ void svm_asid_handle_vmrun(void)
>      /* ASID 0 indicates that ASIDs are disabled. */
>      if ( p_asid->asid == 0 )
>      {
> -        vmcb_set_guest_asid(vmcb, 1);
> +        vmcb_set_asid(vmcb,true);

... the blank put back that was lost here (can be done while committing).

Jan

