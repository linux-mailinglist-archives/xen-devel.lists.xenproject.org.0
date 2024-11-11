Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146659C3A57
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 09:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833371.1248505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQGo-0001hK-Sx; Mon, 11 Nov 2024 08:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833371.1248505; Mon, 11 Nov 2024 08:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQGo-0001eu-P0; Mon, 11 Nov 2024 08:59:38 +0000
Received: by outflank-mailman (input) for mailman id 833371;
 Mon, 11 Nov 2024 08:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQGm-0001em-TY
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 08:59:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4552569b-a00b-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 09:59:34 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314c452180so29138265e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 00:59:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda137dbsm12138917f8f.110.2024.11.11.00.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 00:59:33 -0800 (PST)
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
X-Inumbo-ID: 4552569b-a00b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1NTI1NjliLWEwMGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE1NTc0LjE3OTE2Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731315573; x=1731920373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VSsfGbkjh0BWPNyMVh08pMBq76DNNVzESDwckLiJD9c=;
        b=Ox/WhGw8H2NeNE4zDbb3bNb+zbtyLiftJ9khjcR5nIKmzjs1ONZLstPrr6OKcCiGq4
         jjvBl+b9uIYW8ArtbpkelUQOcFoosO0K7yMRZsWgX3scBcKJKXw2+TZxpc1LoThzh1cN
         qxItEFwgGyh2SNG+UnL2jJ5UbHvLZ8IPQdP0G4rraF4VDrHeL36Qs1lVzY81ZmgPIGbh
         Pq/ijAePfC8cKmkk7eY1UNXj0WlD+vcqD0x1/uy4ZutdEsub7SfjKnWAEPjFCLYie9Rq
         4iXqdQfbOtz9O+n53FVv3wOjRxF+KQqPZ9IUSLwKNEPnxu8L6nWgmugVBun6fD4NguNb
         2fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731315573; x=1731920373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSsfGbkjh0BWPNyMVh08pMBq76DNNVzESDwckLiJD9c=;
        b=DEmFpXs0knBSIeTN/PR3msGkYndLEHhtWQi0ExYyFoLiXrpVjqZkqwUejDVhkwF7Cs
         3LNnVyGZeqCk2IpolQk8az0ULMvtPMPTyaQGJGO8vL5rrxuYrj7MBRvVflhedOLKIkFb
         6CyVlRUAOpiuCBRpWlZDgp/Koyy+OcE5IaSuQab5CZAlUOgrr/Npug5Xm1ACJRI7ExgF
         qCkRxrzpcluYsci5zPEFNuU8aIfYV+HApo0dMcfW2Bk8uUIGvOw2qWBDoZV0knerLOE6
         y8hv7ugflhNV4waTXb7/zs/PSZ8yS6ky9Maicgn6u28n191QNOxvjtbq8Dfwt3V6Pqkl
         IkFA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0xopEFvu3D2vSTmcwkUJNC/eJppGpzcTBAeSWhvTdllBAVRKkipjxXr+VMMHHqwebzYX1+AL7N4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydNu1h6SS32V9t3USlr18W58RJ3liywR5+Wx2B9Q0HVyI427hK
	m4hq9TAQcSkyjilq+Fqy1ETFucyENrSHE2K8+d/b7+L2gvGwMOmOPXjxZR4fnzyD/vMc6HKBI6I
	=
X-Google-Smtp-Source: AGHT+IGpmp7tVZm17IFbsnBTxU+53zQuTEPLshPL/ffg3JC0hdd2QwfgwU2JTHCt/dmyLe8O+/t94Q==
X-Received: by 2002:a05:6000:4007:b0:381:c7b7:9f2d with SMTP id ffacd0b85a97d-381f1c8c3f2mr11318384f8f.27.1731315573691;
        Mon, 11 Nov 2024 00:59:33 -0800 (PST)
Message-ID: <b01fc421-cdca-43e8-8c87-52d8dcb9378b@suse.com>
Date: Mon, 11 Nov 2024 09:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/mm: skip super-page alignment checks for
 non-present entries
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241108113144.83637-1-roger.pau@citrix.com>
 <20241108113144.83637-3-roger.pau@citrix.com>
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
In-Reply-To: <20241108113144.83637-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 12:31, Roger Pau Monne wrote:
> @@ -5544,7 +5553,8 @@ int map_pages_to_xen(
>   check_l3:
>          if ( cpu_has_page1gb &&
>               (flags == PAGE_HYPERVISOR) &&
> -             ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
> +             ((nr_mfns == 0) || !(flags & _PAGE_PRESENT) ||
> +              IS_L3E_ALIGNED(virt, mfn)) )
>          {
>              unsigned long base_mfn;
>              const l2_pgentry_t *l2t;

With the "flags == PAGE_HYPERVISOR" check I don't think any change is needed
here? With this dropped (again: uncertain whether to offer making the adjustment
while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

