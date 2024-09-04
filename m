Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2B96BC93
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790248.1199982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpI8-0004EA-3z; Wed, 04 Sep 2024 12:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790248.1199982; Wed, 04 Sep 2024 12:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpI8-0004Bm-1N; Wed, 04 Sep 2024 12:39:20 +0000
Received: by outflank-mailman (input) for mailman id 790248;
 Wed, 04 Sep 2024 12:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slpI7-0004Bf-4t
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:39:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b36317af-6aba-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:39:17 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86984e035aso805243966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:39:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988bdcf57sm803713366b.0.2024.09.04.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:39:16 -0700 (PDT)
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
X-Inumbo-ID: b36317af-6aba-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725453557; x=1726058357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ2lITchOk8fs6c+aB4zZc6dwBhwlnvilceNxlgnK1o=;
        b=SORRyyyHEL9B0AIA3BCBrVfO8/GYMcYvTm5GiG2v3IGvt9EZfhDgl5eM3nDCZDkoG3
         LfVU+9Htus02nrJAOJdK3nbGnUOgP+Edkn5NKRVJWV6Thipq662vS7y7z2eFCfLoVsB8
         ZSltraAzmtW7YpNtUyS79vcS4HRuyYgVlkKGTSf8MO4D7DceESKaoPjMsMJgHZDNZUvB
         uGkNcmdNRCZQJnHPacp4I6Q+T3k15k/tMKB1CaP6bKsyUh26AsNEJmfgVCiduV40N71f
         3Vrc3mB1lMKWwCS2NoiUXXpRyZBMchxBN/CrxtAaOlmlCAkWN8BGoVMAjIXe3AIoOKJf
         Vb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453557; x=1726058357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ2lITchOk8fs6c+aB4zZc6dwBhwlnvilceNxlgnK1o=;
        b=DLBM3AWBm5wDKqyq6zhkJQeFIDVezZgscn+MyX2oCoeg8LdXWGVm6LET5DRIejsesA
         7UfbgJpDm/AeAMvwNwsJjfCpf80Kmo4yXMbxY+HuJNWZN9skTuQlTNNwuCYqE2XNCOrb
         gsW5dLwc4fiyTGRXqYoK0YtsyqUe7Wco95KdEBtU0AL8L/PLWulE6iBKw1BKm9V3+PEY
         aLglyH6m7yjfJC6eVK8pE/A/dfjM+JegTVGtX11ovjbTOwlia/ypeEYSFoepguAmJvgC
         IGxJEORkqBbG4VPEmvmA7TorgQqgTqMli3pNcRhIJJCAxCvca5EvNrdItd5rd4sQYYtY
         2nGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIcEnKlDnoDm7WiQA3T83PSn0Lh64W6Jx8jZwVgTqzXmrsQPvr4/T7K1ApPytSzDewi6GFdTtp2sI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzL50tnO7OyNhkY/4zWf1x81eRIqFcyZAuiPgG1XdAi82jWcHum
	Gbckr4SjyckFZsTulUTiTB7f61ITBL25TZGI20I0tr4qJjTi+l9yoJsBIszb0w==
X-Google-Smtp-Source: AGHT+IG8A49vMF3fxURnE2FlBOQMgSLODmkCNZezII0TmpIwSmiNq9yr+QkpvcXukptH3HozLx/RzQ==
X-Received: by 2002:a17:907:2d1f:b0:a87:a2b:90f8 with SMTP id a640c23a62f3a-a89a358a164mr1140818866b.16.1725453557222;
        Wed, 04 Sep 2024 05:39:17 -0700 (PDT)
Message-ID: <e3f2d809-0617-47ab-add4-b6903857e923@suse.com>
Date: Wed, 4 Sep 2024 14:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxg: Don't gunzip the guests initrd
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2024 14:31, Andrew Cooper wrote:
> When booting guests, compressed first executables (the kernel itself for
> direct-boot, or firmware binaries) need decompressing in order to inspect the
> ELF notes or other relevant headers.
> 
> However for unclear reasons, libxenguest will also gunzip() all modules which
> happen to be compressed (typically a direct-boot kernel's initrd), before
> loading the contents into guest memory.

I suppose the simple reason was that grub also decompresse{s,d} everything.

> This was an unexpected discovery while trying to test Xen's gunzip()
> logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).
> 
> More generally, it is work that we should not be doing in the domain builder;
> it can and should be done in guest context.
> 
> This is unlikely to cause any issues; a kernel incapable of decompression
> wouldn't have a compressed initrd to start with,

Unless relying on the bootloader, which an OS may certainly do.

> and these days there are
> other algorithms typically preferred over gzip.
> 
> Furthermore, this change also fixes a bug with Linux guests.  Linux is happy
> consuming a initrd constructed of multiple CPIO fragments, including with
> differing compression, and Xen gunzip()'ing from the start would result in all
> subsequent fragments being silently dropped during load.

Now this and perhaps also ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Furthermore, Linux's habit of prepending an uncompressed CPIO containing
> microcode will also stop it being recognised as a compressed blob.

... this are fair reasons on their own to get rid of that logic. So
let's hope there's not going to be any fallout.

Jan

