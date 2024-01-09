Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C6828437
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664397.1034597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9d1-0007Yv-8p; Tue, 09 Jan 2024 10:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664397.1034597; Tue, 09 Jan 2024 10:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9d1-0007XF-68; Tue, 09 Jan 2024 10:46:39 +0000
Received: by outflank-mailman (input) for mailman id 664397;
 Tue, 09 Jan 2024 10:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN9cz-0007Wy-95
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:46:37 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bc0502e-aedc-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 11:46:35 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd5b467209so18964141fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:46:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a1-20020a0566380b0100b0046e3e617619sm89329jab.129.2024.01.09.02.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 02:46:34 -0800 (PST)
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
X-Inumbo-ID: 5bc0502e-aedc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704797194; x=1705401994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7d4cIB5bsW9KfOflQAbYSMNcJblVOTlRM+NdoN79qc=;
        b=OyL6aLaB05gIUG3w3S0i0/A0BfwSlgdfyRa7wR8K0UIysoE3TyvDE4ONSHS0lP81P9
         K0u8Y8wN85m5vjd+jVTz87KrW2xBzRVWT4wd94XIVSlgirNqT9ye4NYRGcgPf6RtM2kZ
         WCsrEjqAP3k0wZM2/vdMFm6OHJ/txuyI7p8jjei1eaPknbyNqkHnrVDYfqisCifdmS+w
         8XYxbPTkU34XRRug4YOa6IlKOqtwEPxOE1qi3zs5AUUN3F6hum5H2/RAOHtLleqigXup
         nnWHi0A4DXv0jNTTQQtlraKWEtCyNljpR17FyGoUC08pvLtwClARggX0zHz6MN+nUM0g
         V6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704797194; x=1705401994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7d4cIB5bsW9KfOflQAbYSMNcJblVOTlRM+NdoN79qc=;
        b=xC89iilCismIEwsxyyUH+7hYekrX5/ElGzKTC/EnMHSRHK8KU1xENi3PW4cBG6B/wk
         RyFmtElRK0sr3ml8lE0hVuhuXVHo0n15XFxH+o5N5UTuqaRg8xnU9zmVnAvcGKxRLsCX
         wEZTM/7dJENfO4mJLWWkNKXxkLHa9Yjkcv+wikhEtxIasVX7ZGbK/B7ImMU2Lcihf9PJ
         hBx2DzDH8Kh+5UXDexzo5CrA1bhXtMvOuED8DNdK38TZwc70z63LY+TG7srQHOUqWZ+H
         dSQeocbcruN0kdQjeck9gTD1WjpyZqchpskjdJxOLnXS6egdeipztlPUzoKfOCDiECFk
         9lQg==
X-Gm-Message-State: AOJu0Yx2WGlxEYzz0vAdP/06XWBOBKZgY0fIQ2PhT9zmcPQNK70tGcux
	XY2X3R/Kvqj+HqdICcBFFbugyXWnPLiF
X-Google-Smtp-Source: AGHT+IFkgza7CCKM6tWVM7sGOMl7Bqr+8PZLAbyB31/dvhOndx1U8t4sE61hzO2toosgsNPPNGIHPA==
X-Received: by 2002:a05:651c:4c6:b0:2cd:241c:849a with SMTP id e6-20020a05651c04c600b002cd241c849amr2701743lji.79.1704797194642;
        Tue, 09 Jan 2024 02:46:34 -0800 (PST)
Message-ID: <d9a363e2-db8d-4c14-af17-9ce02c53f7bf@suse.com>
Date: Tue, 9 Jan 2024 11:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com> <ZZwPSZoqyY6g9yhi@macbook>
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
 <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 11:16, Chen, Jiqian wrote:
> On 2024/1/9 17:38, Jan Beulich wrote:
>> On 09.01.2024 09:18, Chen, Jiqian wrote:
>>> A new hypercall using for granting gsi? If so, how does the caller know to call which hypercall to grant permission, XEN_DOMCTL_irq_permission or that new hypercall?
>>
>> Either we add a feature indicator, or the caller simply tries the
>> new GSI interface first.
> I am still not sure how to use and implement it.
> Taking pci_add_dm_done as an example, for now its implementation is:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	xc_domain_irq_permission(,,pirq,)
> 		XEN_DOMCTL_irq_permission
> 
> And assume the new hypercall is XEN_DOMCTL_gsi_permission, do you mean:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	ret = xc_domain_gsi_permission(,,gsi,)
> 		XEN_DOMCTL_gsi_permission
> 	if ( ret != 0 )
> 		xc_domain_irq_permission(,,pirq,)
> 			XEN_DOMCTL_irq_permission

No, falling back shouldn't be "blind". Fallback should only happen
when the new sub-op isn't implemented (hence why a feature indicator
may be necessary), and only if calling the existing sub-op promises
to be useful (which iirc would limit that to the PV Dom0 case).

> But if so, I have a question that in XEN_DOMCTL_gsi_permission, when to fail and when to success?

I'm afraid I don't understand the question. Behavior there isn't to
be fundamentally different from that for XEN_DOMCTL_irq_permission.
It's just that the incoming value is in another value space.

> Or do you mean:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	ret = xc_domain_irq_permission(,,pirq,)
> 		XEN_DOMCTL_irq_permission
> 	if ( ret != 0 )
> 		xc_domain_gsi_permission(,,gsi,)
> 			XEN_DOMCTL_gsi_permission

No, this looks the wrong way round.

> And in XEN_DOMCTL_gsi_permission, as long as the current domain has the access of gsi, then granting gsi to caller should be successful. Right?

I think so; see above.

Jan

