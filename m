Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2FCD9B90
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 15:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192614.1511749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY3nq-0005tm-1t; Tue, 23 Dec 2025 14:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192614.1511749; Tue, 23 Dec 2025 14:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY3np-0005ri-Un; Tue, 23 Dec 2025 14:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1192614;
 Tue, 23 Dec 2025 14:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY3no-0005rc-Sx
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 14:55:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4aa1ac-e00f-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 15:55:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so40429875e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 06:55:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723d19sm324690945e9.2.2025.12.23.06.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 06:55:53 -0800 (PST)
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
X-Inumbo-ID: 7b4aa1ac-e00f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766501754; x=1767106554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A14uPmjMTpST4CcKM5xmrBqweLvku579izOyb0SIpm4=;
        b=Asn+QA8zy0EM7a1hkO4R/O7YAlr3WqvHC3PkHxhhjqbCXcWudqzu4kc40O1WM1k/AK
         btmWbqAPbykatqYTNUIuKJVw8AYAWVbizgll+Op3T5Hbhx8bLfKFS1YtphUCLZDGCaOU
         M5JFS6xv5dv3QdhL6vb52dEWZ8lEUph3SFDaE2EqA3URv2R4EsGOeFzIh0tvAJ6bNFaH
         TqX02vnOSU665VRLgDMvNsV29Dsikzd37pk8nw+omVuf3cxsJIRoJQExzNa+kDRB+ssX
         w6y8Qjf1BGy/SkgKs20IA9J5yhD6mBzaOc8AX2nvcBBMsTUzaLbfOMuPEvKTwe8o7/+u
         ACGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766501754; x=1767106554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A14uPmjMTpST4CcKM5xmrBqweLvku579izOyb0SIpm4=;
        b=WfOm1e/MZAUqCN3CtTLm5uUfME1DCbNYCLIEQtD9GCWaC3Je8VcIKdHTvoeKTOYz3Q
         pIpyI8et7RimPI+D9ftenguCAUbQSxw7PT3IMZCXZU8YEJ647xbJLDTq+OnIPVVy9hnI
         e37EZW1iKP4wMX6fnYXgGn6gqp5dMJxsJ4BpXsLn8ru6bdRYyl5xAiEXbq5+l+tf88Ew
         Os5PDqpy3YUlDvUIpQefZqAc9bU5FoxoncowipoF+ZJhcyXYfxV9bxstceTI4kCRlfuh
         P82lVBiA0wcSLTLJbxHNxdGmOxJwA3Y5xYCloiX47klZL70h38WuMYnBgQCW9WnNzd31
         pRhA==
X-Forwarded-Encrypted: i=1; AJvYcCWC84L62npqY4g2OpFgsQh2LZ2/Ws5ZeVrD1GwaHT48/fUI+/iU8k6kHbcrcyMp2Uo8AYUHeExfts8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGsdCvbI1Vdj2HdUb/0gI5Crfrje3lx/pDqwdGneNq2zlosCK6
	hzpBv5plgvJHN8Zxomr8U3gMwqi5E0qAjIg6ttLpMbVGXaXb0hQjqXdlN+1cDC7Xmg==
X-Gm-Gg: AY/fxX7gCgBbcPtGRfDTOZCnbX0OH3ceItEG5BQpsmatIWvNfVgzY8rhxRaw1MQzs9G
	Bl3z0oX9VaMzS7NH7tfE/lNafJcH+mwDfNcn802D7SoW85V14vVYmztpcnKeUUSOJkiVLdp2h4K
	DFfmPKZIRBsMZNFY6cM+wCkbSTT2BE06Sgc+ZUgeGy72IFnuKHNwF6N3XquZ/LStNAvcea8zokf
	rGOl03yJmQEAcnlZG6dqkahlCqOUKMO495s6vuLgHFRbt2Siocs/r6Ss5I2o8yM88oU86kE2+Lu
	mfqdoTzSvKcsFc3PXNsXwL3NR4Z4yf0gCE67xGXWw1KqoEpyxkoPebMKNcoWbf/WHx5MXghSBF6
	/T1f3ce+WAurE7uVRLBUJuLUTyZawFqFJQ6wRml0cSPfgQAOg0J6/CDkgI4c2o+YlQ/k+/9pSCO
	KQ9s0jhd4cMU1vMhnW7oAfE0gCzWsSxKbYyy0W5Q3J+88HurODvEgn12A67pGgGKzf1j70pZK03
	EY=
X-Google-Smtp-Source: AGHT+IFetgCtP3xjuJEpKEQM/yp4q8KlPU+Y54QXITsB8vcSz8TflxvvM9V58DtjoJv153LwaxgZFA==
X-Received: by 2002:a05:600c:6388:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d19557cd2mr139265665e9.16.1766501754158;
        Tue, 23 Dec 2025 06:55:54 -0800 (PST)
Message-ID: <cc81f15f-a80a-4d3c-ae36-f9d86ad64ca6@suse.com>
Date: Tue, 23 Dec 2025 15:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Correct comment about struct vcpu memflags
 restriction
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <d350d06b-6e38-4797-9c28-6b7960f854b2@citrix.com>
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
In-Reply-To: <d350d06b-6e38-4797-9c28-6b7960f854b2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.12.2025 13:49, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


