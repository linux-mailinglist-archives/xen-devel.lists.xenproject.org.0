Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94756BD2C0D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142252.1476437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GZM-0004Y9-Li; Mon, 13 Oct 2025 11:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142252.1476437; Mon, 13 Oct 2025 11:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GZM-0004VV-IU; Mon, 13 Oct 2025 11:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1142252;
 Mon, 13 Oct 2025 11:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8GZK-0004VM-Uv
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:18:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5341ccb3-a826-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 13:18:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so29247105e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm18036528f8f.2.2025.10.13.04.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:18:20 -0700 (PDT)
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
X-Inumbo-ID: 5341ccb3-a826-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760354300; x=1760959100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0AAbDVWnF9Q2J4tjw4+4K607E9Io12wwzb98sCA2cGc=;
        b=Lg+/unttXoYsgFrY8YK7kO+I7W/FUPc/sVA93MinwuKe0jIUQEopLtNQUSYisTW+a5
         Eu9LjrPoGZhbysMW9B0b0dK7WP8Vy+GSWDjdegRy/y50BxGQkDHgIHKqK3h5GpinTwEe
         QoBYei67zk4yPW8H8bCjHjS7FozRYrmOyZTke3zDlpJYNBLEqPOm0Og0JE/OLtN7Dut4
         sSq0490PYgwHg6eyUu1UTWavNmx/HHHM6JSl0+cpSLGnXhFLBRZnTFqN5naqYNdwocpF
         2FBfIp2lZ4/fBZpV41ZFSa+coDM2MkUS9IFKqwvS4HnJv7/RgDRqPF3np9u9nWTiSq3M
         H8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354300; x=1760959100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AAbDVWnF9Q2J4tjw4+4K607E9Io12wwzb98sCA2cGc=;
        b=lHUaPUmNr6EXCw5x75AHN+TfE2SJb9ditCcz1ULuE4iR5jF1f4b1JJZkSmZDe2sjWT
         T1ekGCrhDe4p/nPQ2gEaLBXg4JQgB0DBkDPX6oKCEZIOUPF+2Ag3vfTL8E8uotjPMzUf
         eIpWBUcFgL+MRji7xqD66X8G/2NjObN3f+PBAgdJ4nkr1Pblu/Y+OxASykkL5Zk4Dn9l
         nWFaBtCc1M8dvCDum1But2d0qHx0ED9GIQ9yNjorDu2d4G0l1cTu8sfMp8kuB1Y2jIQ5
         lKjf5Llyum18ammDs5i9wWCXmg5jach9kFeHPCp4NntoSH0b5MZvhGK0RqAw8duHC3CW
         MbZg==
X-Forwarded-Encrypted: i=1; AJvYcCWQix2KF4Ra3/qYb+v6bjZIbABI3S7bwSzW/fYPfSEOw5NWzdzRG+E+XWBbzSKPcNQG58nRFNUGNm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoIAcDGwnsBQTLxzxAL54KlUrj38wVxpAd+lsK9f3RpMz41Bkj
	JV/H4LriDweSRgiGMedK4nwPB3MU693Ebgxh2IvZUwwNHKRtYEsk3XPsx2oc8m64gw==
X-Gm-Gg: ASbGncsiQLcWubUGrk5pwkRFa4UIbYpEqUE+Osm4ifUbnDf9k6jAE+itbDA6evACd74
	UkIeBi71JIATU9n+/bujCfp9fEQBYMq2qzVnDGUSeuChXvTJLKCQpNS2f3CdeSuFysvy7nqKhLu
	9sitn4Qi1fYw57+JBBTJ6UdH+FUs2/u3a69A/7m06m2keqN3SMJltGqR0xV9JDnGyhu0GsM/FWJ
	gyKGiUBGYA/86tm8bZw1DuHlpjvXmGZa/Yqph0Cixvn5SJi87UxcrArjPJ02qahUg+ytfEKJ1VO
	9NcPIq0DZIU7dh+mL/XqvySN8uY738Hl/gfy4YYPaz9dqAFk9VHqSEKZTp9ZUEOTUjoD3f4rVOG
	J9kHlYlDRczaejVLYDU7S5esH5ysdXLhT3bM+Sn0VOiSwkWpIXFoH/ukl7pLjULLmT6xy8rq4WA
	ixot/F8/zL6cjDVqk48JNeDKAtItKYRd0t/Ekz
X-Google-Smtp-Source: AGHT+IH0N3BUDo6WKLNu1L5lUfyvPBz6+6CHAfxfDKsp48Pwp01yKmQqpkRi5jwe8tcb1eAfqW5FIg==
X-Received: by 2002:a05:600c:3acb:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-46fa9a21caamr123272625e9.0.1760354300297;
        Mon, 13 Oct 2025 04:18:20 -0700 (PDT)
Message-ID: <4ad6e833-02b8-4227-ab63-d9b2ae74ceb3@suse.com>
Date: Mon, 13 Oct 2025 13:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/28] xen/xsm: remove redundant xsm_iomem_mapping()
To: Penny Zheng <Penny.Zheng@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Function xsm_iomem_mapping() seems redundant, and in flask policy, it just
> directly calls xsm_iomem_permission().
> Remove it and use xsm_iomem_permission() instead, with the benefit of a
> cf_check disappearing too.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

No, this is definitely not what I had suggested. What I did suggest was
to get rid of just ...

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1167,11 +1167,6 @@ static int cf_check flask_iomem_permission(
>      return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
>  }
>  
> -static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
> -{
> -    return flask_iomem_permission(d, start, end, access);
> -}

... the extra call layer here, by using ...

> @@ -1945,7 +1940,6 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>      .unbind_pt_irq = flask_unbind_pt_irq,
>      .irq_permission = flask_irq_permission,
>      .iomem_permission = flask_iomem_permission,
> -    .iomem_mapping = flask_iomem_mapping,

... flask_iomem_permission() a 2nd time here (and perhaps with a suitable
comment).

That said, if Daniel was okay with the wider folding, so be it.

Jan

