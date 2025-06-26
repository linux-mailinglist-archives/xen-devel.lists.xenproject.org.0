Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2597AEA0A5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026546.1401704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnf3-0008E6-OJ; Thu, 26 Jun 2025 14:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026546.1401704; Thu, 26 Jun 2025 14:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnf3-0008BN-Li; Thu, 26 Jun 2025 14:33:09 +0000
Received: by outflank-mailman (input) for mailman id 1026546;
 Thu, 26 Jun 2025 14:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUnf2-0008BH-AO
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:33:08 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a1bfe4-529a-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:33:06 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a522224582so511420f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:33:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86d1b2asm158553875ad.204.2025.06.26.07.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:33:05 -0700 (PDT)
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
X-Inumbo-ID: 79a1bfe4-529a-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750948386; x=1751553186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFYV4k6nw6c52VgE2QZRx0IjCdqJ9JCqbzasiOOzfbI=;
        b=VR3Z/3pR0tcFHIpcxJEWkZyV4STEURhNQxCxtrXb4+e7E7H14zovR1PH86vvJ6R85z
         zuo+ttjColxBKkLzTEIVRjtdrytck/8U1croB+SL3V0pHFUqFZsRz97xMHotmzqisBf5
         M7y+UuexwcHWRsrE01hnkXKziP69VLybLR7NIEi1Fy+71vckaotf6qoq2abC8o62xWc3
         yQlmV+MYm6xE2P8NhhUWHJlOTtp28N1wGBIJ/0EGsf6Vdr1y/6zsK7hAcl+FjCLiKVD4
         KSoX2mDkedzljZPKiXMzCPLYB1yPhjI9tVbdFda9JuHZyPmP08uRwbVi7EMBmVb39Zcn
         sUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948386; x=1751553186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFYV4k6nw6c52VgE2QZRx0IjCdqJ9JCqbzasiOOzfbI=;
        b=ExjVQogx1/7Q0IvW5GNniVXqsF54EdQ1Jsf8TfDTlpInIaDfFCrNrlgcLmeVZ2CO7g
         jsFor+Yg5OtNWYCiwJxOYyPhCga09iaqIkS1WtY3y86uiJIqBaCrAy0aXPZyMMZjHIgG
         eae91GT0P7Jwgo/kOqmuAyUY6IfwFS3uj1pS5nN9oFoyyq+1p6vK8N7u8gaO4/rKvEhi
         mmusvhOn1e3u96R6Efp7iyQxnKWMlBoPNBHezfwn9eJpVEqYMDynqw2uF8zg/tQX3Ksr
         a2H0g1yJNkjct0g/8ISYOwRMldXPNtzUKcrVJX4iK7TomzKwGnTYC9IHI/EfWzItjcYm
         GEbw==
X-Forwarded-Encrypted: i=1; AJvYcCUYcBtT/kEFmB5CMQUaEDTj0sE+AXFhBD8hK3/unvnylBKvnLgGNFcEnsJW1KnNjOdw7fIn8wzjdh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+XKn7+Rd4z8ykv5VOdWXWpT2x/vOwuho6E5bd5M9gKYV0Kn+0
	NjFphHef8+bEOxPZm7Tgtac0OLvy1G/5DF1sCGIp4MpDq3hRcWwabFK//bGPYNe2Qg==
X-Gm-Gg: ASbGnctcdTV6RPZue5Wvi6QeWHWiZ0zEjpcm2pbtnGbY5vyrqYbYfboW+6ciPpSqGZq
	hHh/q5cHZb1Obx8prF5g1fUpBHmilE534vCMJlfvENnqmgaGv9vEoBRG9xp2kfblBUXCGBGwmFi
	YlRKKDcq0mGpR6k2tBKQX48emMJ5htQblzVs/CR4DC6t3c6/mIFjtffVo3M9yQur9Si9uHqBScB
	zr4NeuOpii6ILZUSfU0ScGXj6ygMd4wPeE7CMcIQUnm/KBJmVJPE6/5foxx1AfM2VXcElzyQ+h5
	95McLI2TfmcYTwcl2XlOU5CjKpaG3npJH1TiYZWu/UDRRK3D/ldJKEjtOrtQUtoyGHCFmQ3puuC
	R1IOH6Essmsnsp6tzlI7XB9yL75uQ8KLWm+3I12zp4Q3YTYs=
X-Google-Smtp-Source: AGHT+IFiG6Nyna/CFxeprhlHAapGVLUybMEDot+r2T3nA54J/AudALV7qYdfHKVM/C5Nhl6k0RZUjg==
X-Received: by 2002:a05:6000:270b:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a6f30adb13mr2558294f8f.54.1750948386242;
        Thu, 26 Jun 2025 07:33:06 -0700 (PDT)
Message-ID: <ca29e68b-3619-49ef-bc81-d036133f1a3c@suse.com>
Date: Thu, 26 Jun 2025 16:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.20.1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <24bc698d-4e60-4f34-9b8b-8b1f315655f1@suse.com>
 <c65aa0e1-aeb3-4af4-accb-037880f23166@citrix.com>
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
In-Reply-To: <c65aa0e1-aeb3-4af4-accb-037880f23166@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 16:09, Andrew Cooper wrote:
> On 26/06/2025 7:41 am, Jan Beulich wrote:
>> the release is due in about a week or two. Please point out backports you find
>> missing from the respective staging branch, but which you consider relevant.
> 
> de6a05a8a0d5 and 1ff7f87e8f4f?  They're the tools side of the px/cx changes.

Hmm, I can pull them in, but not the least the lack of Fixes: tags made me
not consider them for backport. (Plus I would really like to hand off tools
side backports again.)

> 4c3ce492ede1 is another one although I guess you've excluded that one on
> the grounds of being an ABI change (albeit minor)?

The interface version bump in particular is something I consider non-
backportable in principle. If we really wanted to, we could apparently
bump it again in staging, and backport the bump that's in the patch you
point at. Since there was no bump between 4.17 and 4.21, that might
even work for the 4.19 branch, but we'd be in uncertain territory then.

IOW - I'd prefer to leave that one out.

Jan

