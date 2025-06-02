Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3AACAB49
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003049.1382480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1L9-0000cl-26; Mon, 02 Jun 2025 09:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003049.1382480; Mon, 02 Jun 2025 09:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1L8-0000al-Vq; Mon, 02 Jun 2025 09:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1003049;
 Mon, 02 Jun 2025 09:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1L7-0000af-Eh
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:20:17 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbc813e2-3f92-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:20:16 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so927828f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:20:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd41c3sm7426903b3a.149.2025.06.02.02.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:20:15 -0700 (PDT)
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
X-Inumbo-ID: cbc813e2-3f92-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748856016; x=1749460816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0cD2HHhOIx0K6TxQbxJpirEOQrDsyEh1e27Yog7Hec=;
        b=BbX6+yDKXQhaj3XZ55Ax8ijFIRHQu8+IPSeXSdF5dEmEno+pP+6a1VmUxU+F7kLmDl
         xe0M6RSdOP+rRuyTP70yPEPA+69Yp4rdHUw+9J6geCdJcQlrAb+GunQFxjYBzRWQbo6k
         /MkcAfHEdOQO1r2fNvcd1Jl+SB5piMUYsKK19bDNfm5x9nxeYzxInNqsTNH1YPCbrPaB
         kNYhF2aA2SaZFVFsoCnIL1AwxppM2zqGY1ywABPqBU0g9BHDjBBxM7HFUbogwTbZE95H
         Q9BPlaWXf6bjHUMGeN7ii8krqfchpl+4eRotNV0cc0w+lJJeXhF8goiMKYOi+KgvnpSs
         TfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748856016; x=1749460816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0cD2HHhOIx0K6TxQbxJpirEOQrDsyEh1e27Yog7Hec=;
        b=UmOxkZE4zemzE2CABsglqQkR8LB1+fSX8AyCudKaVgxs0kFgi/KjW6SYls3A4kwGhw
         i/ktpu3omFQC4dZy+0B1GZ0KMUNJo45UfB9SMnOlGPET9+M8DmRuACz/0D6u1fu93FS+
         wPcqUXBO1nx03usbGZDYy+eb6xjcBRKeG4YGYBK1cVvNmS83MrAtSc4l+vOzyACNRDgA
         iePjtyeBiUAOjJfLvRFgn6teAlciaO/+dprI6VYtd+N/UW1PC11OTpPi2L5pZCNSc3qb
         mcfyg2dAMDiesIcVYNJYEzBtLpfsXzFSidm4llY3Ioz6m7vMFhVkRyrMARI0gLRPK5q4
         ScDA==
X-Forwarded-Encrypted: i=1; AJvYcCX5aRtsSRSaBgDiQeVB5S8Fn2xo5jhXTqqDg+pI0AdQsmvEG+4o2YMzqgTi8JoRR0V0i6MdIg94XQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiFd8jCQPtcYvSArclJ58ZkPrTz9Bjze1IOPYi4IJiD4GhV/YN
	JStUiiXNIyODMmsToLsaSS5yGDahzu27P2L81nIzWm//Wb/HB/FD9oDLYknjo5MAyg==
X-Gm-Gg: ASbGncsAZnj5O+f/bRlfgQZHTJh9XCPQh/iMBA+/GtuXHm1vcDKyBrXJLczzFRdolSW
	Y49Bhi9mfW3rpwHaNLiJLxvUHhH/gP8VX75+f+kacxq27uvti7AFtXu+1h+z/fKIc2ISaHETtZW
	5mPy0q5g5DdBOJhuE6GOFYDlvB+VIughqfwzBJgR+2PbxV/zA23ra/itUG0I//GXhVnwXKs7eUb
	duPXXV2oy/8EB2cAI6K8828d1rS7QGJOvJ29f5GbWD88bUm4jUDcUDn6peJsDpJP6AxtIbikojd
	+vzIh0XDHpYGkD5L1qQjqimIyVD0IBkvzjb1VD+sJY2u9c0L4IP54dCXAuFcmyYDtAxQqq8SI3/
	Xnc+nsk5pk+YtyWkdWjktTUora62maPLDTPzgKLi7thiCUGI=
X-Google-Smtp-Source: AGHT+IH7gf5s/Ru8n5gf9eYTT0PRUgu02WTxxIBjfJmq8CfUdj1Z2yxsRwUzeA5Zpfkm+xBPG1NLZw==
X-Received: by 2002:a05:6000:1889:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a4f7a0251dmr9015734f8f.8.1748856015989;
        Mon, 02 Jun 2025 02:20:15 -0700 (PDT)
Message-ID: <4bfe5a9a-6128-4760-9121-46b0d9bd6789@suse.com>
Date: Mon, 2 Jun 2025 11:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 2 01/10] xen/x86: Move freeze/thaw_domains to
 common code
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1748848482.git.mykola_kvach@epam.com>
 <a679ba83fcc0e8387158a218f3af1fa234ea3534.1748848482.git.mykola_kvach@epam.com>
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
In-Reply-To: <a679ba83fcc0e8387158a218f3af1fa234ea3534.1748848482.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 11:04, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> The freeze_domains and thaw_domains functions are currently defined
> in x86-specific suspend code. These functions are also useful on other
> architectures, such as ARM, for implementing system-wide suspend and
> resume functionality.
> 
> This patch moves these functions to common code so they can be reused
> across architectures.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

On the assumption that the transient Misra violation is okay:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

