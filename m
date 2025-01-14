Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C94A10B3D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 16:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871503.1282493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXj3k-0002je-LG; Tue, 14 Jan 2025 15:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871503.1282493; Tue, 14 Jan 2025 15:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXj3k-0002h4-IJ; Tue, 14 Jan 2025 15:42:28 +0000
Received: by outflank-mailman (input) for mailman id 871503;
 Tue, 14 Jan 2025 15:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXj3j-0002gy-WC
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 15:42:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 277ccca6-d28e-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 16:42:26 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso64365295e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 07:42:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436ed48f4b2sm167221445e9.24.2025.01.14.07.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 07:42:25 -0800 (PST)
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
X-Inumbo-ID: 277ccca6-d28e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736869346; x=1737474146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eLiDO3ismwtrppCqpxX2FCvdXubF0r5RXeiDtVs58x0=;
        b=ahoK8SlF+fiF58fm2GBGFmvmT2T/5v8ceolWrWQ/MQK12f03xA+PPStw5XLqpCfLuu
         9woUKFpI6Dhsf9rPhTijE1PaPTyPGx4xvJkaru/cxwkVt+ieiYGf/lFiFCTlo9WLJmUe
         L/BAi+ByNCB2jtRV08OZ4Te02OpJZ9DSTWNFQK6+5d4UDjNRDx9EyCEwyaQpBcKNaOJJ
         oLot0LFIhO1kNYRsm5GBtVbcJbGzznqjiNnYjG77CZy8ofxVHIwvwkayfVIvdCNc+TYs
         zs1eixNVseoyEAuNeVoeq3NeMnpct4L0BpuiRcTLcTRbqNgsuiNlfy3+bJ+d1kXI8cLC
         IqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736869346; x=1737474146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLiDO3ismwtrppCqpxX2FCvdXubF0r5RXeiDtVs58x0=;
        b=MZ7DKgjju6eSBY9cpLERYr/kpeDmifd0ZVm79Uj7uMSt69h+IMMfnbrY4s6WKwNR8y
         Lfgzrtz+Y2VC09nSJVc+M3ZHMsXnfi43/lgGUmZeOF7UWrocQ3uveNGrTrY5PXFE5o2g
         HcHZawO0e2OTEHWG+ok55BdjSxYuuLLqsPIES266eO5gsiGassnGB16OgoUTWKcmT2nO
         YFuQOh1l1D+kJpd+TxPe5rG1lQxr7OuAx/BmzRC5MP/kUAkHIuRIe9koIcqR3MOd9EWS
         xqj8bFgfEsbkeVId6Q+2SXG9YuPgZmHHFlb1dJ8/MQKCIg3tqpe43rytkzSUZui+pHPp
         U0ow==
X-Forwarded-Encrypted: i=1; AJvYcCV1acydnGGEtfDxHNwXVACUDwlMRtYva0ibtCXLqbj4/g1nSM5ucnQWRkjV/AbkgRQ9vKmmIVeHh3M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG+QyhGPoS3LwSrbrv3jONugadjrMQyLTsU9IdQJ5XCiIIztSf
	goWc/mGC2C2+efmQe/xgtad1BXtvScMWmSrFenxCqJkyVQeMcdHQbzybYPGDhQ==
X-Gm-Gg: ASbGncvWDjERfhq+8ubusGi6g78iqjrl8UIkgFAXai+a9duVkd+ojeTz9oPZuc7j6dl
	qcEjF7+aO1oSB6ripXj/RVPyNfJzcsqOmU8WOEtQYpnblkjomnbLucscT5EltDd/L2mFVsMj1ls
	98dLee1Akm5gPYe7fc2DlQuH2KQGaIzbUMVhCiwfYTjcXDaa1duWqNQ8bbPaXrzpucgL6FkyvJ6
	CR7Umbren5zQC/8eG82BJawgSyUm/WVqEA+01g3CswT/4ImtzTU7joisj86eqnCuSdOm0XT/XBE
	fQDB3buxGQ9zi3kfAlyKZuI96dIcG5R9RPJn+3Pv/A==
X-Google-Smtp-Source: AGHT+IEFCfbL0d689LAqqHYE0ZD7Sl8QnhEDe8VelXv9il10+7V3TAx3LXCL8BfLlEtcEVWtn/bSPA==
X-Received: by 2002:a05:600c:3b08:b0:436:18e5:6917 with SMTP id 5b1f17b1804b1-436e255ffd6mr250907395e9.0.1736869345636;
        Tue, 14 Jan 2025 07:42:25 -0800 (PST)
Message-ID: <3e6046e1-f224-49e2-aee3-b39170a4f89e@suse.com>
Date: Tue, 14 Jan 2025 16:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] x86/pv: update guest LDT mappings using the
 linear entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-8-roger.pau@citrix.com>
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
In-Reply-To: <20250108142659.99490-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 15:26, Roger Pau Monne wrote:
> The pv_map_ldt_shadow_page() and pv_destroy_ldt() functions rely on the L1
> table(s) that contain such mappings being stashed in the domain structure, and
> thus such mappings being modified by merely updating the require L1 entries.
> 
> Switch pv_map_ldt_shadow_page() to unconditionally use the linear recursive, as
> that logic is always called while the vCPU is running on the current pCPU.
> 
> For pv_destroy_ldt() use the linear mappings if the vCPU is the one currently
> running on the pCPU, otherwise use destroy_mappings().
> 
> Note this requires keeping an array with the pages currently mapped at the LDT
> area, as that allows dropping the extra taken page reference when removing the
> mappings.

I'm confused by the wording of this paragraph: It reads as if you were
changing reference obtaining / dropping, yet it all looks to stay the
same. If I'm not mistaken you use the array to replace the acquiring of
the MFNs in question from the L1 page table entries. If so, I think it
would be nice if this could be described in a more direct way. Perhaps
first and foremost by replacing "allows" and getting rid of "extra".

Jan

