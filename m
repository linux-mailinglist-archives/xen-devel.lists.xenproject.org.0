Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265F192B0EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755907.1164434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR540-0000Hf-4V; Tue, 09 Jul 2024 07:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755907.1164434; Tue, 09 Jul 2024 07:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR540-0000F8-1y; Tue, 09 Jul 2024 07:15:00 +0000
Received: by outflank-mailman (input) for mailman id 755907;
 Tue, 09 Jul 2024 07:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR53y-0000F0-79
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:14:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18cb08a-3dc2-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:14:55 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52ea0f18500so4558668e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:14:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a2c0dasm9427605ad.108.2024.07.09.00.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:14:54 -0700 (PDT)
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
X-Inumbo-ID: f18cb08a-3dc2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720509295; x=1721114095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/SQKJYss2l964rLciIHt3srkRZoXhpQW3glmoxY3qc=;
        b=ToxTCbGdp1p2ggjwTDFyksLD9Exb80/CYg+nsxvFViQ5xFNjRE0N4n68wXaNpCyx1Y
         07b81Iy3DxjzMikA1WuHX8fN/E3GBFrTMRgfAgLlM7csML36hOwHrYMfXEj8/6zXYiq0
         okQdioTPJ1alkN12oJw15I2Nir6MYgRNIwn0R+SJPaVdugKLdZwKiqufCIzrE53vFChF
         224GfR3c9op2AMiiFIIsT9iK9A/U2OfJ46A2CNWJmC4bHl5rhr0axO5V9yFqMKZmWENY
         A1AAzKRgQDFxjU146P6n/NbKE0plL/pV7qxs9h9infzhw+wa5eexwNa01e2X2pfPVzfV
         BXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509295; x=1721114095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/SQKJYss2l964rLciIHt3srkRZoXhpQW3glmoxY3qc=;
        b=BRiVfBbxmqHvpum1fv7WMwDexNK6N7TrQ2FuJIDp/p07s1B5e2jR8xLNmbm7WyMpLE
         M2dS7HIE9BNjipK2+Zi+rAKUpPkR13+MxWe1gTtYnFjdxiqNX+TWb8EgsmphT+Y/Tuys
         o8r9ssOhwB9aPjvaELjMf6jdj8+KvIAAOzZWsiN3eFjGyf/8yccyjb7q2bKWkCkanIYd
         QqxYQonFlh3kXVOtz3LwLkXhYRVqSB66h/EOkJhpjg49PiDHyPApbM3zQld2IRnS13Q7
         AS6KuKjHb8QsUFNukdC3pkLV7DhoeWVNvWT6954N1HN9XhIqLCAMXtkcg4hV2x0+u/jF
         ldjg==
X-Forwarded-Encrypted: i=1; AJvYcCUKE8G5i8ugoM9XjzlFTezY7NMWou9V3yOewLVguos165XiZgkkNBAvNbcsOc9biNXwWw0Hec9OphWYGTuumTKN3SLEkn8krYqoHDMVFIk=
X-Gm-Message-State: AOJu0Yxti4/btHzcqLerPo+U4sQNMAzoj0UbCk0gqR9VQPxNzZ4MyIdL
	+o6SmTBYL78UblU3fHRihJMz3+qluYfVl8xPd0QL/CzWnG8nhPx+lH3OWC4Gzw==
X-Google-Smtp-Source: AGHT+IGOgcF/ZdRoyFS3w7OYYous1V1K8HletW2d9CjC1R31WhHdwSE2HQhntpQGNNrDy94fDj9aUw==
X-Received: by 2002:a05:6512:ea2:b0:52d:b1c9:34e with SMTP id 2adb3069b0e04-52eb99942c8mr968909e87.21.1720509295267;
        Tue, 09 Jul 2024 00:14:55 -0700 (PDT)
Message-ID: <f5e4e95b-ad3b-4686-b42e-a4986ba896ec@suse.com>
Date: Tue, 9 Jul 2024 09:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 04/14] x86: introduce CONFIG_ALTP2M Kconfig option
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <914561d1ae92aa84d22785f959a73434a491bdd6.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <914561d1ae92aa84d22785f959a73434a491bdd6.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 07:52, Sergiy Kibrik wrote:
> Add new option to make altp2m code inclusion optional.
> Currently altp2m implemented for Intel EPT only, so option is dependant on VMX.
> Also the prompt itself depends on EXPERT=y, so that option is available
> for fine-tuning, if one want to play around with it.
> 
> Use this option instead of more generic CONFIG_HVM option.
> That implies the possibility to build hvm code without altp2m support,
> hence we need to declare altp2m routines for hvm code to compile successfully
> (altp2m_vcpu_initialise(), altp2m_vcpu_destroy(), altp2m_vcpu_enable_ve())
> 
> Also guard altp2m routines, so that they can be disabled completely in the
> build -- when target platform does not actually support altp2m
> (AMD-V & ARM as of now).
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



