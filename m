Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CE9951D1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813188.1226020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBJ7-000345-1t; Tue, 08 Oct 2024 14:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813188.1226020; Tue, 08 Oct 2024 14:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBJ6-00031U-Uu; Tue, 08 Oct 2024 14:35:24 +0000
Received: by outflank-mailman (input) for mailman id 813188;
 Tue, 08 Oct 2024 14:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syBJ5-0002oW-Ij
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:35:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d0c0a24-8582-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:35:23 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c91756c9easo542729a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:35:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9958647caasm253928466b.213.2024.10.08.07.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:35:22 -0700 (PDT)
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
X-Inumbo-ID: 8d0c0a24-8582-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728398122; x=1729002922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ55pjdPeb3ZVFEJGCWyrPSNwYuVHUdUxj2TK1Mv+6w=;
        b=P/sk638CPpHpb+W6VhNzj0FU7TwEP7aC0pg603PVDeHl9L5lEjtg47dKgp8JpC2yZT
         +YuJPamaMw6Tw+zSfL8/D2/kAnOIsmkjqUyZDYwB3CzqoGihjV03nnZhuMcODNFv8Yt5
         DkWogeBItnrjz/32NRDniqghX9ZeAWDLkgvIW+30XxIs52QvVQ4yPZ/ztKtSb7/y1Yey
         QCrgTZo4WOMtec3MEGlSIBB66F1qx+HT/JipG8dT5Z3yGeBRC9EZkXnkVLEwObGEhz+o
         vPxtZ2M1UDs6mMIboZXVFdbZ27uqXOUQ69y0Pv9anq1EXgIceVdxlY5/JD4z+ntATYc8
         0z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398122; x=1729002922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ55pjdPeb3ZVFEJGCWyrPSNwYuVHUdUxj2TK1Mv+6w=;
        b=mVodv9Vsi0WmPC6XMBkiv4zABZJyj+YrGyWBUKpoTvVcuZP2oN1SpNJAm/r6R1Mj9P
         yst0qiZAM7v2t+aNRInnB+cY5u/gAYHYiSvpEKVgIwLKzPH8jYJv4FDUc1Ut2x53gf/c
         91q9xFfont22nG0/VJtcO5035zpWYTGrZrKpfxYAUl1Du8eQgI8RN8swqF96vOAhETHf
         8b2pmQ+K0vWceAHohvmiGe2y8JgZ9gM1VAIKRaxL++6Td0dP6yY0YdCQQEwBv4bGZbeg
         g2FKexeHtztnP0bV0T/7F3o8g+WJXomiSQoFJs9KMOYQxSsfYzraf252OYRMWObBLUEC
         EvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl0IQqA2ImrHoVw9MqVdiH1xdDoMuWN22L7FWd2uqh0X5N80iGNXDelcrlfiPDC2/YgiZ/82wOrko=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT+27scGLd80VOeXHvOflf46xQz149l9N1WXhQLpenOLOxxe0N
	EGgtQSSFlNJWaFTD0V+ZgJKwR4K8cY0C5925NtNG3N7COk0iyA0vZ2FWtbFLJw==
X-Google-Smtp-Source: AGHT+IHgV9NkERj755xLtJ4Zbd0uyi8yhJuZ3l95kK5DQG7WSBEjIcuu2huGI2bwsV87S0Qhwt4B1Q==
X-Received: by 2002:a17:907:6d25:b0:a99:5c07:9f5b with SMTP id a640c23a62f3a-a996785140cmr386718866b.6.1728398122596;
        Tue, 08 Oct 2024 07:35:22 -0700 (PDT)
Message-ID: <54f11b9c-95cd-4694-a917-70e5904c6122@suse.com>
Date: Tue, 8 Oct 2024 16:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] xen: Update header guards - Intel TXT
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
 <20241004081713.749031-10-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004081713.749031-10-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 10:17, Frediano Ziglio wrote:
> Updated headers related to Intel trusted execution technology.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



