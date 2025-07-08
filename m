Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD5AFCBD9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036518.1408771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8JF-0004nL-9H; Tue, 08 Jul 2025 13:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036518.1408771; Tue, 08 Jul 2025 13:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8JF-0004le-68; Tue, 08 Jul 2025 13:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1036518;
 Tue, 08 Jul 2025 13:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8JD-0004lW-Cn
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:24:31 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0d98f09-5bfe-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:24:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so4095155f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:24:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee4805a5sm11390233a12.30.2025.07.08.06.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:24:28 -0700 (PDT)
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
X-Inumbo-ID: e0d98f09-5bfe-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751981069; x=1752585869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8a0xbl8zxgOmakuTlN9vJZbA+S4E0R3kOF05KlmvHmE=;
        b=fJfrgFFeoNW0nwzMvakcA/VDTPUXMkc5skqcCApW25CQ3B2QuFsYnCk38NEWEERgP4
         kD3ahSdmlbaHC79h0iuHX2F9i1Wp+CpSXFvezwF4OfFp+do+mT3PNvxA13WWEYvki5Bd
         FCzBa2sIhsmD8i1Q4fOp34OZ7sSdMrehthERYib6KeON3bSSBADumA6u6KmCUxZv8yoI
         cwXeD8RBugzgNLDz4v1ChNBp4bXArO98a4cYPtth52Tu+ewlBgoxZI64PpfkR70LHmfN
         U/4vMsacrvPNKAG4nzm7f31cLs3o71vC9h3gCR/OI9zFVkaZoSs0mpVUcELKNpJ7vSer
         8S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981069; x=1752585869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8a0xbl8zxgOmakuTlN9vJZbA+S4E0R3kOF05KlmvHmE=;
        b=J9dW10fEnErK+XK0iDfCV+zB53PegqcWLDyZxs6od3r0BFutPLpJCnMXXVvLnK3MMC
         NxmH7Yfq9joi9IVEXJ1amtjV42ppEOYJ2wjujSGxe55XM+9Ew1W2THZXC9OZU8teTNVG
         /CaKgWve+UI6aqAYEhhd7xhul9PuQushb5XDueYBhjLU3JosSvVxvgzqCw38xfaLVcfo
         kCI6r9ek/SOl4IwQUgQbAII4DqFGI0KVAWqLlSHmbS0X2pXSTTNcbNvxC0xvnbqkUA83
         c2Nv7Za4azw1yNDydxtsPvUXF+6mTXqN2DHkovFkIHqfRGziTYx/GzQHt1rmYBkTUimH
         HREQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yAsDcMYyKHzdFX5fYwZ3JOm9OpHrp3q6xDDQpPnpGX6F/za2z3cs7/QLrMpCCoI0IWfS1qaIvvI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKiGybevm79aIHpN0g78Ye2GWmyA83d9uK+NeotJml7mEL7bP8
	EmbqgGogczw728gapNkVAcZfn6JcBesgKbwagYml1d9ocUWpDemoI9VRYjiZhxwkLw==
X-Gm-Gg: ASbGncv+J7zqnhTGN962NqBbrk1SfOM/u/A1WDtjlKiuAvo8hBNHC/L5MReehc009oU
	DKZfKECymDVgA/bxOWlvNN+prZRkweNghzRjSVBTBftK8+bYt/O2NQLgCp+HYr+QAcHK5oOa/2y
	9WAjY4E6MuVDEgjZV+m1SYceqE2aE9lC0ASbFBes2VOPerNWmRCwcBDiQ9Whx0gtiQ/EB+eTMNy
	Ft/XOUdHcxVBRd+33xYxbA0/t9Oa6HWdv10vRcy82A0s93sbDiDhciFbhPd9uMZkHi0J3Bzexwz
	wv7Y+6ReY9En4cWAugDT4qGui58b/P3UcTWID3ASSwuFPh8mpi199Orb5jd5el18AgiJh1MbWhq
	y7oqxhksT9iFNxUJKuRShqRacnxx2Ja8uf/TCrzjsRpmkY7s=
X-Google-Smtp-Source: AGHT+IFV27vbss+7gJRJD0zljNSb56Ut+pTBzLrCrTSKmO+rt6GZUx6vO1DV3V6AiH7ZdHcwQ+9f2w==
X-Received: by 2002:a05:6000:41f8:b0:3b3:a0f6:e8d0 with SMTP id ffacd0b85a97d-3b5ddecceb2mr2735886f8f.54.1751981069513;
        Tue, 08 Jul 2025 06:24:29 -0700 (PDT)
Message-ID: <e677f691-f158-4c7f-97bf-13bd157fcb54@suse.com>
Date: Tue, 8 Jul 2025 15:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Xenia.Ragiadakou@amd.com, alejandro.garciavallejo@amd.com,
 Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <20250708000712.2731666-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20250708000712.2731666-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 02:07, Stefano Stabellini wrote:
> On real time configuration with the null scheduler, we shouldn't
> interrupt the guest execution unless strictly necessary: the guest could
> be a real time guest (e.g. FreeRTOS) and interrupting its execution
> could lead to a missed deadline.
> 
> The principal source of interruptions is IPIs. Remove the unnecessary
> IPI on all physical CPUs to sync the TSC when the TSC is known to be
> reliable.

If it had been truly unnecessary for all the time, I'm sure someone would
have suggested to get rid of the overhead. IOW I think there is more to be
said as to this being correct / safe, including in any corner cases.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/time.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 59129f419d..bfd022174a 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2303,6 +2303,10 @@ static void cf_check time_calibration(void *unused)
>          local_irq_enable();
>      }
>  
> +    if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> +         boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
> +        return;

This would render the (first of the two) invocation(s) of the function from
verify_tsc_reliability() (largely) dead; it would then be only r.master_stime
which gets updated (see also Alejandro's reply), which surely wouldn't have
required that call in the first place.

Jan

