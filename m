Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CEA37EF7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889924.1298957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxnd-0001P5-92; Mon, 17 Feb 2025 09:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889924.1298957; Mon, 17 Feb 2025 09:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxnd-0001N3-6O; Mon, 17 Feb 2025 09:52:25 +0000
Received: by outflank-mailman (input) for mailman id 889924;
 Mon, 17 Feb 2025 09:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjxnb-0001Mx-Gv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:52:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1900144-ed14-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 10:52:21 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abb7a6ee2deso236831266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:52:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322f1sm863485766b.19.2025.02.17.01.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:52:20 -0800 (PST)
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
X-Inumbo-ID: e1900144-ed14-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739785941; x=1740390741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LZ+XS35lrocKtw6M0fc3h1T8JAkfEB0FBfUbdr0Z998=;
        b=TydmRfRbPIm92Wb5fOXUXzTBQ3yGCVPCTOqzbGnQfeA9fqGNQ7ScYM0f9U3Gzi8d2v
         1a5Uk9O2yEbXt5zaxCgBfEgpYSuKtjrvGCXzURX82GDCTtNBoHrXbodD5FTNOcbQUEef
         UlVJjkPRp1b/+PxPjhyLNAgD9ulN+jBgMD+9lKjTVGskTlVUw+iXI/iISuEk9OPB+B2r
         4Imu5XGAPA0YQ0d8zTVIKt5vCiq5UcFdu+emz2yK1yrX2iv82dL3XQz8XSBwXFfk3csZ
         5zJP9jlkuAZr6Iv4m0h3r1xN1JjN5dSeXMDQD9xQk7J1ZUDIIP+lFRNIOzyM5FGbKJpZ
         qdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785941; x=1740390741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ+XS35lrocKtw6M0fc3h1T8JAkfEB0FBfUbdr0Z998=;
        b=OuPQz4WKFGlMo6Ue9Y4hxZbrlo29ij60efW7P4pVwo6AcPzXdLfzv8gvkfBEcusvBq
         3ZzutgN5rVf/KVGgoATEpZ4bCueBGZ0R4UkxTntGsPhvH3rCkvf16FEC5gDGpqESj2TG
         m4eBKXJk0m9UOp+t/jqFDcqoKWt1maJTYndS8RA/KAlvE2q2CKJMhVc2IJg256cUAL4y
         K3SzYMGPQMMaC21EcRIIVOQFyu4ygV066vDDWpfaF8mvHdnwgaGF+V1/RGwe87nA9EHy
         Flk/HaeCCMCjR9L1A6hAOsXQwCw+lsSKQOwE9ctS7+CnQ6IPr38kEOBVoxWtBIzEvkOM
         wBnw==
X-Forwarded-Encrypted: i=1; AJvYcCW04/HaMo5CUx4tTnAJJa6CiqJKgOGGXPh9hzNW+qWk5bWwaAf0ptQDDxY9jq+vatcmtvz+slVV75o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0kMM3b/8UN2EO/HDxVQowjakUEtncLUCB4FFI7m5tCNb1zlos
	pbOQWXmDJ6Zf+VzwL01QW7VoInFAf88eIHUg2zQdAtbkK1Mxstl3krLbcgUJOA==
X-Gm-Gg: ASbGnctGv3MT7X3tzXR9WDDfiIpsX1WZUl/CKLF32O+kEQTh/lk+1SYO0BPSLp5F8dL
	kP6GSlWGf+d/0DFz2/TWl/sJc/JZNwycXnscPRlGQuiy1aRHXUJ/6IdPG4EkYdp5aMSeSXRlLKB
	PG3gdF3Ypu4tQQ10ohn2FpUtmkqd4lcJRisbOfGbDbmKrJrSPZwZx+QMeullXyKGTGaE8n0KvIs
	4/NCre0Vf6XFuaRQZCyhFgNc/xHBP9E4Jnn7POguhPeT9S2XQZ5inLIK9pmIVZC6dRcP7QRDrY4
	3uVFE31JjXbM16ckOZVRAPXQ+8BbWoTBHL76CBylcVH9e8unzUsezBz2e6OFqGJ4dwkYyi+Lgwf
	/
X-Google-Smtp-Source: AGHT+IFFDTcUBzMSBME97gM2CdFUb7awzyTsAhI8ChX3pyGoRzQ6Fca0e2jnzhI3CqMM8IGTD259OQ==
X-Received: by 2002:a17:907:1b12:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-abb70e323cdmr981955166b.53.1739785940882;
        Mon, 17 Feb 2025 01:52:20 -0800 (PST)
Message-ID: <d9375868-c3e9-4b07-820b-d46a7b0275e3@suse.com>
Date: Mon, 17 Feb 2025 10:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/list: some fixes in list.h
To: Juergen Gross <jgross@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
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
In-Reply-To: <20250216102356.18801-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 11:23, Juergen Gross wrote:
> Patch 1 is a fix for an undefined behavior reported by Andrew. I think
> this patch should be considered for 4.20.
> 
> Patch 2 is fixing wrong comments in list.h I stumbled over when doing
> patch 1. As it is absolutely no risk involved with this patch, I think
> it should be 4.20 material, too.
> 
> There are some additional cleanups possible in list.h, which I can do
> for 4.21 when wanted:
> 
> - Removal of list_prepare_entry(), which seems to be unused since
>   some time now (and it seems to be thought of as a list.h internal
>   macro only).
> 
> - More questionable: removal of unused iterators, like e.g.
>   list_for_each_entry_continue() or list_for_each_entry_from(). The main
>   idea to keep list.h in sync with the Linux version would be violated
>   by this removal, though.

That's true for the unused list_prepare_entry(), too, isn't it? Which in
turn is coupled with list_for_each_entry_continue().

> OTOH with patch 1 they are out of sync anyway
>   now, but I'm planning to submit a Linux kernel patch fixing the UB in
>   the Linux variant, too.

I'd go with whatever the Linux side is going accept.

Jan

