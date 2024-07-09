Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A154A92B0DD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755892.1164405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4z7-0005z4-3b; Tue, 09 Jul 2024 07:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755892.1164405; Tue, 09 Jul 2024 07:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4z6-0005xZ-Vu; Tue, 09 Jul 2024 07:09:56 +0000
Received: by outflank-mailman (input) for mailman id 755892;
 Tue, 09 Jul 2024 07:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4z6-0005xT-5T
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:09:56 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6ac928-3dc2-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 09:09:55 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so65398481fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:09:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a290e2sm9354225ad.70.2024.07.09.00.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:09:54 -0700 (PDT)
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
X-Inumbo-ID: 3e6ac928-3dc2-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720508995; x=1721113795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=giYwKDv/WfaiYnUIAUjKfCoVbCKtcnHfSfWgaBsb9Yw=;
        b=f8HsNyubWkIBfYACofZrCy+SLvug7QWt/YJUBZaek48czq/vwfp+el1ejdqgeS5kK/
         xl17gB7IvFwhslutodFwPo/XM2aZ5DsDn+yc4tPDOP/3/dq9/z1AVtk/H5ryTt7eI+WG
         P8ulewG7IRlYiEt/ZFPo07/K1DEWlaazoy51fAuVLm+x4n2Cy8n8xSScCKN39OizOl19
         jhkPBIYV/rMelYh/QM3D+bHexOEywtpWPOLR4RjrMtBvcbwf6aNl71QDWPi1TQ3m5hzI
         nR/Ykh+m63JX10phCuRnMvKPG4CYrwnl/v3G12qcZX+WJrIlSZMnTvMgVjb7LI6FpxdD
         7b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508995; x=1721113795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giYwKDv/WfaiYnUIAUjKfCoVbCKtcnHfSfWgaBsb9Yw=;
        b=MFFWE1NcgeRxXk1Rtxlk5GWYUmfOr/AnNtyNM7wBCq87bgW7MOLTaNPQHIvWT9e681
         gSfwNTkdTAvbLvHS94tYKVZA1imkFZKZnO/QOYScyQhCwdStywFwvskYDFJmtZ8QPHKF
         Id77icjvQF2+WoFhwvkCqMbOns3Y8WO2w0UKv/cV2hBiWYpKhVXXsX0zuPvwYHD6ZMaN
         JTpAG3Gi0XCBmMEn+v5w+wLNLaMJBKTvWY5ypWbTIu2iaCeASOiBU5vJgX9gwv8trunj
         +Y38ay4zZeE28mIVBqh7Xqc8cOHrPDOecyDGMp2GAI27hLDnepO1RxwJKVn3ghFvpSWY
         JBLw==
X-Forwarded-Encrypted: i=1; AJvYcCWJVSBwVfpj6pYEPxae3w6HO47D1IGINm545a8TcYjuMIp274hJqjIaMOSg3XfShi9Ju2AM0TLKhC9bSD+jCm0s2kOzYAUzTpfz0CtDwoc=
X-Gm-Message-State: AOJu0Yzy4FGTrzdSoaeEuZpHTO6g38ewTybF1ySO0wJ+hdSX5DEVA1G3
	8+cFq1aHZSlWuD/pF8QM3OlIRk2q+vOCXudtb3C58f/vBJdUl4A85+Zh0ucm9w==
X-Google-Smtp-Source: AGHT+IEW/WwVDKOSbnOUwMSKNLBqYcGoMbV7P6NYZMuwx91mwjejBA9yHtF5KYn3Fw7lPfvOrwvYYQ==
X-Received: by 2002:a2e:b618:0:b0:2ec:5f85:61c0 with SMTP id 38308e7fff4ca-2eeb318923bmr13028091fa.48.1720508994732;
        Tue, 09 Jul 2024 00:09:54 -0700 (PDT)
Message-ID: <f917837a-e9ee-4d55-b158-208de57ee034@suse.com>
Date: Tue, 9 Jul 2024 09:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 02/14] x86/altp2m: add static inline stub for
 altp2m_vcpu_idx()
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <952cb307528f16fc36a3fadbe26d83bc6805f81e.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <952cb307528f16fc36a3fadbe26d83bc6805f81e.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:48, Sergiy Kibrik wrote:
> The stub just returns 0 due to implementation of  p2m_get_mem_access() for
> x86 & ARM expects it to be 0 when altp2m not active or not implemented.
> 
> The separate stub is favoured over dynamic check for alt2pm availability
> inside regular altp2m_vcpu_idx() because this way we retain the possibility
> to later put the whole struct altp2mvcpu under CONFIG_ALTP2M.
> 
> The purpose of the change is later to be able to disable altp2m support and
> exclude its code from the build completely, when not supported by target
> platform (as of now it's implemented for Intel EPT only).
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Yet what doesn't become clear is why 0 is a valid value to return. On the
surface 0 is a valid index when altp2m is enabled. In which case it
couldn't be used (without clarification) when altp2m is disabled.

Jan

