Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131FA75EDD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931864.1334051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8kO-0004mG-6M; Mon, 31 Mar 2025 06:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931864.1334051; Mon, 31 Mar 2025 06:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8kO-0004k1-3F; Mon, 31 Mar 2025 06:35:48 +0000
Received: by outflank-mailman (input) for mailman id 931864;
 Mon, 31 Mar 2025 06:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8kM-0004ju-Nl
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:35:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6051c464-0dfa-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 08:35:45 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso446726f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:35:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658b7bsm10269514f8f.20.2025.03.30.23.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:35:45 -0700 (PDT)
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
X-Inumbo-ID: 6051c464-0dfa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743402945; x=1744007745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vxMuJz//GjooRKOLGiaoFBoZlv+XOfShcLnbHGddhA0=;
        b=LtmSOATcwK1gRYN/kG9JFBLWUbApeYMf3HyWmEcNXcoKX6lb32NMV6NtoDnAqLW6qV
         /4GPcJnSGX6fQut9bGtHvqz8LslxTgZ/hYj5pIU2yF2rpkXPn+QRm0ZLc8trCsQQuX4L
         9XOgV1YBc5dIEHa1WMNTjqiDKABRpEHkCX+Yn4a2dBV/QdPMUuQf8W3hYAkSCV4/Gt5O
         Bn5uRNDikHkqasacn2uTadnM5Muc0Vt8rcWew7h0KpjX4l0kvUn4CGHpnVhMdy4ZTCxj
         JwcDhhgYoDgZEw/L1yogsogtf/lvFqJ27Nr/LxMoM3A4gHhb/mdVAcNaVxU3GPWTy5Xs
         VSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402945; x=1744007745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxMuJz//GjooRKOLGiaoFBoZlv+XOfShcLnbHGddhA0=;
        b=obJdOu8NqK1rumFnOrs5wPgjs7nkUAslmL3D9VcyHFuG3NO6zUWPNM3BcyPNKQYFBr
         dNmjO0wy3l1GhvarRdvKIwptr88Ml+R2Q1/5fWT5KAOtcozDrvVZjEkWDPfaFuSSVBDs
         OHq4XRi5kf+aU8kJwAYNCzjHFp2xFZ/Ojf7jcMUe9aAhz2KhhQniSzydY/tfwvP+IpBb
         z0OOzV6Rcrhu87nB1jaygQGdztLCHie+iEG+8wS8iLvUYyQphQCvvfNWgmd1R/ZI2h22
         GR82WLS6+w2rf4YaQyiU7AMmJLJ/qbt6dTikufX59ObpkuQb58lte8YT/l0JKB+c0+XF
         in2g==
X-Forwarded-Encrypted: i=1; AJvYcCV1OQ+PAklEjdZy+JHtD9lz/p1aDCE5r1Q7BHa5hsfwPUcjOQTcJAy63CEaqyEXxMuMevLEMaDv9RM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2vCIhYpgeJzWxyoBoGclitBOyfsWtKJ4udQ8I8xHmULFg1kWQ
	KX2MXmJlRsOnZTKGoAQ/jdJEI5hWsI9ZDs/FoHbNFWRL8B7Ib4Drcb/4ji6RpA==
X-Gm-Gg: ASbGnctDXRHwHPnJbznXE4N+XskXmiXe0rEKO5C+EQBUlYm2wIeyaEIXweiJvds7Oyx
	LxG0Ogda4gTKNBRLDq2HEfsH4Lza+MSo53cwBInJXN2cYOwaigMnxWydClQHwznS32HTF7fCd9a
	qqrwQ/qLZpRINPR5iRaRsWsbJ+wHwoDIHFyWUR9UWQ4eVza6zUkR3hxt14A8JmhGmL7gJJ0cW1K
	BrNqOA2AgwGwATnR/HQ5l2Sken4m7TJ/iPooxe9I/kCaACdyNwp844LUMtKPfg6+xiqdi4PpQLW
	UclUV3XlWQaO/ysuldd6ACj9Q5mSpTI2S/rlckZG9IOcGZiXpnTfPjo8u+WAMrfrKFV5qs2ClDz
	cQYWSCGOae/SyNPE1YA747fOjj2ZB4A==
X-Google-Smtp-Source: AGHT+IFvXISRoFHHiQWtafb8x+XkyRKPKXbAniBiTb0mLBH6190RLi0a/ttnpjZLdxEp0QOTzwgE4g==
X-Received: by 2002:a05:6000:2ae:b0:390:f6cd:c89f with SMTP id ffacd0b85a97d-39c1211d698mr6498469f8f.53.1743402945384;
        Sun, 30 Mar 2025 23:35:45 -0700 (PDT)
Message-ID: <8bde75f3-6823-4df4-8ef1-bb9b9780857f@suse.com>
Date: Mon, 31 Mar 2025 08:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/types: Drop compatibility for GCC < 4.4
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328173623.892770-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328173623.892770-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 18:36, Andrew Cooper wrote:
> We now have compiler types for every standard type we use.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



