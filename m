Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A627AD6AA4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012518.1390989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdHI-0000Yn-LL; Thu, 12 Jun 2025 08:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012518.1390989; Thu, 12 Jun 2025 08:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdHI-0000Wm-Ig; Thu, 12 Jun 2025 08:27:16 +0000
Received: by outflank-mailman (input) for mailman id 1012518;
 Thu, 12 Jun 2025 08:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPdHH-0000Wg-Nr
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:27:15 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0a89a8-4767-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 10:27:14 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so415011f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 01:27:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fd6388307sm820027a12.65.2025.06.12.01.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 01:27:13 -0700 (PDT)
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
X-Inumbo-ID: 0b0a89a8-4767-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749716834; x=1750321634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh542Foqzy9CXMj7KWhI4Fot+RPodj2Dclo5YjnMjdM=;
        b=ZGWs9TattTDt28IT4yVDKYtiI6Hsl2BwYLHEQPKI+ZqYX4pT4eHOWBekqwmfJkRSQo
         sqLG4kS2im+fKPlfpHrh1aDeeNa/bx5MyW2CbtlYQvoi2ZrVakqMAbsIJ7jgCO2D3zAW
         tJHRWgUHyJt2Jd3UW7UAysxxYQADARHs+1a5xY+XzVs26xtqFFxbvEXDvG+ldG23QUhk
         DwqGW/vccJnIkKWRJlofw4Ok7y5M+ENFVwfFDwXCc3Qbcp+9mSV4YGHCZ9bvPDpRoaqA
         mFHPhKH/a7HNTYC7h+paYa86ecyqR0rHi++pQRpwDA+RISMKh1sihSqhrlHLduXCvU6L
         xcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716834; x=1750321634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh542Foqzy9CXMj7KWhI4Fot+RPodj2Dclo5YjnMjdM=;
        b=F/o6TQXeV2n5/clsK52bxn7QZ+Fzm3kEJG4HSa/pAr6UXPPIsZRg1c4bzm//4PzrBi
         FHDXg/1IhWQYD9T2FO6cKTLkXA7BBlEPvLOKnHr3vx4MC+65klVR5xxU3N/nBwyQYj9C
         2h0dz9c0NVlqSzQhAy/zKn65h3QIRUbJDCXp8s68O++O4QeH24zvxCnY+nuqKVBodLVC
         0BOxX2k+Vkpg2NC7MGY4o6xJknfa126bn7/agurl8Jti3XEGvgmktA8+5sP4sR8JZ9KL
         toNpSwzgh/EpBM81Ak6VC4CNTFbpJb7w4f058rYqZKXbfYNFdq8brQYTdgDkCE22otQg
         4PKg==
X-Forwarded-Encrypted: i=1; AJvYcCX/P7AJt4NBIRfb1s9X157m6iA52MJVoujOgSnkuwmaF2NYu/z/VP0ItGMRcYPKofLCWfesxxsLKH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHhFl5k+YfxqmapAy8utQQRjqnZdHehA7dlJ0gpxiDP1BaekwT
	mBFPFPeZda7glCIFc01+Ogycez5h0wmPM4XffWI0sNevJkxQmfKuIzcPkM1P9LtpMw==
X-Gm-Gg: ASbGncumhwZnjU2M66fNbfEgT4jpwCfpztNyVWl31eCqWp18Fd1XWTbNwr1YXAeFo1P
	ad+Nqj212zCY7xfiUjNk/PJpM6WIUKQAfMCyDPGe8Nk/nNEzEnNenXTQsU0DGkFwIEXvNmnMXGg
	TKhV3eo/2VOAv6xFmtlRPS8YNLyQD38/qUKtXumboA4MRhG/sugdCQI7o+ryuTAVymwEsYwOwfZ
	X/fcW+I7ZOXRtqkdHbfCCuotnqjMvHORZcZwual3qkQQugUHXJbbXnwanJunewP9rEMypKnwe4N
	q7G8BPX/ZJSzwF/W6nW1SI46fILeRMoYKVXR2jp+oGwUNbN205+RW/u7yxRAwHwd5dbY5bynjLp
	m+PuAIZQZ4hREqfjzYHqkQK8GkFsKoN3zYtm/CRC3uST7p3I=
X-Google-Smtp-Source: AGHT+IEXqjhujpgMlu2VeVGD8ZFYVxDMMrLLcL+5iz0zT/11Ws/WiROR6ZQqKhPx6U3Ikqi7M0chPA==
X-Received: by 2002:a05:6000:4283:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a560763290mr1894171f8f.3.1749716833649;
        Thu, 12 Jun 2025 01:27:13 -0700 (PDT)
Message-ID: <f7c9bb4a-4006-4be6-955a-cc3b2c4934a1@suse.com>
Date: Thu, 12 Jun 2025 10:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> With the appearance of Intel Sierra Forest and Granite Rapids it's not
> possible to get a production x86 host wit the following memory map:
> 
> SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
> 
> This is from a four socket system, with each node having 256GB of memory.
> The total amount of RAM on the system is 1TB, but without enabling
> CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
> boundary covered by the frame table.
> 
> Note that while the memory map is very sparse, it won't be compressible
> using the current algorithm that relies on all ranges having a shared
> zeroed region of bits that can be removed.
> 
> The memory map presented above has the property of all regions being
> similarly spaced between each other, and all having also a similar size.
> This allows to compress them using the following formula:
> 
>  pdx = (pfn % offset) + ((pfn / offset) * size)
> 
> Where offset and size are two static coefficients calculated at
> initialization.

What I would find useful here in addition would be offset and size values
resulting from the example memory map above. In particular, without looking
at the code in detail, it doesn't become quite clear how the two ranges on
node 0 are being dealt with. For what follows I'll assume they'd be folded
into a single range covering all of node 0.

Along the lines of Andrew's concern regarding the division (and modulo)
involved, I wonder whether there might be an alternative with a lookup
array, holding bias values (e.g.) for each node. Main question there would
be how to quickly determine the array index to use, both from an incoming
MFN and an incoming PDX. If such an array wouldn't have too many entries,
such a lookup may end up being faster (on average) than a division.

Taking the example above, such an array could be:

[0x00] = 0,
[0x06] = 0x061e80000 - 1 * 0x5000000,
[0x0c] = 0x0c3e80000 - 2 * 0x5000000,
[0x12] = 0x125e80000 - 3 * 0x5000000,

indexed by the top-so-many bits of the MFN. For the reverse array some
gap would need to be left between ranges (i.e. the 0x5000000 above would
perhaps need doubling; maybe a little less than that would suffice), such
that the array slot to use could be determined easily there as well.

Jan

