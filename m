Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B217AAFFB8E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 10:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039152.1411106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmCv-0007Y1-Po; Thu, 10 Jul 2025 08:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039152.1411106; Thu, 10 Jul 2025 08:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmCv-0007Uu-Mm; Thu, 10 Jul 2025 08:00:41 +0000
Received: by outflank-mailman (input) for mailman id 1039152;
 Thu, 10 Jul 2025 08:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZmAc-0005jj-5q
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 07:58:18 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c99ab1-5d63-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 09:58:16 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso461658f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 00:58:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42853b5sm12621835ad.4.2025.07.10.00.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 00:58:15 -0700 (PDT)
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
X-Inumbo-ID: a2c99ab1-5d63-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752134296; x=1752739096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XECzMEBad/iXrcKNv850zgvEXOY22VvDlWJCr127tQA=;
        b=QWymoLoD5PlhRQ3pZaIngt2i/Waf6/TxKAH4UjBi1cLEav2D24DQaCHuK4BOoT+gwP
         NCQuXUOw76lgn4G1DfV8rx28JCHaJC9xB534Wz5iIF5xjjzw6j1DqYig2+K8WSX2tGBT
         2coNz74LglyhdRYsj5g+sB4ho/cyPPfGdSSEFmUwy9lzfzfx5RA4syfGowiOzSuj/9Nc
         LKonVI/yA/r5QZnyksCY5PthU5mkjFoHTISbOrcvD7UO9VzAq4e5fHCRqS9wgi0AIizp
         WtaCJtyIMRTIshiJxN0HySunDxdH2VKreLgNiiLNWfuUNS8hsdgrxgp/yVjEhQhFTiD6
         U1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134296; x=1752739096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XECzMEBad/iXrcKNv850zgvEXOY22VvDlWJCr127tQA=;
        b=hOugfeFH3hIUSOdCxLE7VLEV23DGtA5qUV2h5DN6oVGgnV8DJQVcsQqhG8BFPvW21M
         mwLWmHZIsMhsGEdx7Bp1VUA9IhVvWcnUiSJdVT+1D7Wi152kbMpe3s9YYOHOcHAJ9/g0
         Ytaqs4WmhDElkm8NI4Gbz5XXFa4JdSxqLxsNjkMG5/5kTBfZFl18j0ESl4Vflu0XykA6
         02dCowrDWgrbwi80TY8gDZzNcerDIAZrP4tyeHntYqrbbFOc5xzyOd1qJJYZ6ifGr9A+
         tLcXCv44RJo5WzYfkMZ3aFhOLkf7fh1S2Ovej1XQ4GGBkJ+RefXev/n8y5yOb6G6izdS
         M5QA==
X-Forwarded-Encrypted: i=1; AJvYcCVsE3lsPKordDorcVLUVZcqutd/CoLBM9lIrjZLnCT/b66PWtou9+h9DfHYLnfOvcEeE5AzBezsIOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypAoGkdGmn1jI83W8I9pHePwEcA9Y05/VU4gIn0sNMFdvnmwWf
	qXZGOrsrT5SWxkQ5eetwqERzL/NhUZn4v2yCx8m1SdRX0XqgFB8QvyelKU1e5JedvQ==
X-Gm-Gg: ASbGncvby8C1msk4zE+fACCGcpBqUBLJwpL2H8HfQfKtIVUyFQHF/m3PEYQhdtVEtin
	83lV4y2aurZSYEeFuRk6Xsuk1xta8iaw6hk+iIlVzpD7SVtfmmpzV3C/vH6Eh1hln/rMluPWRFr
	CZhjzWp1wCqe8jHXXi/tDO9WEMdUlNroRRqbkssgs9xmXigQMtv1bSBUiA/2UfqDpaonjBzKJvf
	EAD5n3qWD7Z+V/vhHVV27/cFZGSkzyO9Avx4x0aTI8gqLGRZl+l6Jxq0B+i6bT7B3YBSLPDl4hy
	G9kLM9Suw58leMH5FPftgE3WJHCinEEgLcCTVsSteTbbuqB28TH473DRjP9AJI+HM/TxdI6Nqn3
	J1vtXFU52J02kWCWKPN32dGC5GZHo6iie1ePJEgQtQ5rOblytCrFHSxyeWQ==
X-Google-Smtp-Source: AGHT+IE+14RDsKbpFIC3VuqC7xZtzrt7Bhyf1FVEp3v62fq4gA6l0/DBw0vTFDsr+PWxs20VuCiKKA==
X-Received: by 2002:a05:6000:230c:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3b5e866ae24mr1159349f8f.12.1752134295685;
        Thu, 10 Jul 2025 00:58:15 -0700 (PDT)
Message-ID: <38e8c1ac-a61f-4890-a7fd-9c5b2d6e610b@suse.com>
Date: Thu, 10 Jul 2025 09:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250624002018.4121819-1-victorm.lira@amd.com>
 <20250624002018.4121819-2-victorm.lira@amd.com>
 <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
 <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
 <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
 <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop>
 <27ca400b-ceac-40c4-a6ed-f26c1129ae2a@suse.com>
 <alpine.DEB.2.22.394.2507091723470.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507091723470.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2025 02:35, Stefano Stabellini wrote:
> On Wed, 9 Jul 2025, Jan Beulich wrote:
>>> What fine grained deviation do you have in mind?
>>
>> Ones for almost(?) everything that is having actual code changes right now
>> in this series.
> 
> We could easily deviate alternative.c based on the file name alone. But
> for the rest:
> 
> emulate.c: casts from unsigned char* (byte aligned) to uint64_t* (8 bytes
> aligned)

This one may indeed be fine to patch.

> vlapic.h: casts from uint8_t* (byte aligned) to uint32_t* (4 bytes aligned)

These only give the impression of increasing alignment. struct hvm_hw_lapic_regs
is containing solely an uint8_t[1024] array, and all instances (created from
vlapic_init()) actually end up at page boundaries. What I don't know is whether
adding __aligned(PAGE_SIZE) to the struct vlapic field declaration would
convince Eclair of there being no issue here. Probably not, as the array index
used in both of the accesses isn't known (to it) to be 16-byte aligned.

> setup.c: games with symbols

The change here may again be acceptable; better may be to use memchr_inv()
there, as being less obfuscating _and_ eliminating the cast there altogether.

> iommu_init.c: cast from uint32_t* (4 bytes aligned) to uint64_t* (8 bytes
> aligned)

This imo would better be done by reconstructing the 64-bit value from the
two involved 32-bit array elements.

> How would you deviate these in general terms? Or are you suggesting to
> use SAF tags for each of them?

If no other solution can be found for the vlapic.h issue, "yes" there. For
all others I suggested alternative approaches. Subject to other x86 folks
possibly objecting, though.

Jan

