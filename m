Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92517814384
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 09:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654907.1022395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3Uj-0000Rv-Ki; Fri, 15 Dec 2023 08:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654907.1022395; Fri, 15 Dec 2023 08:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3Uj-0000Pi-I0; Fri, 15 Dec 2023 08:24:29 +0000
Received: by outflank-mailman (input) for mailman id 654907;
 Fri, 15 Dec 2023 08:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rE3Ui-0000PY-5m
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 08:24:28 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c606cca-9b23-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 09:24:27 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cc3647bf06so3692671fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 00:24:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l27-20020a02cd9b000000b0046938c12608sm3966060jap.122.2023.12.15.00.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 00:24:26 -0800 (PST)
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
X-Inumbo-ID: 5c606cca-9b23-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702628667; x=1703233467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaJip8GmLT+eoudw6ELZE8CHy+R0HyuDI+ZhYJsgRAI=;
        b=TqPMrhI3nEXUoxXsnYK4Lr2ouCJENY3wLA5yz92lJKC6PK3Pc4/mq1ZWRy0wJu6IFf
         kVeVffAZV44TcwdD+A9TUmXMLs47VpmqAoBY5Jw4I34DBa114MOfyuTlipk6EWrk8HV9
         OtCCeXNrD0UsXEUHyfqfNTmiBTZoPHJKaSGW5/mcupQ5K2d+seQAPTVv7DpTYB16K4lW
         UglE/U8o/BBHPW2t/pCJDcNKjrY0HGmqi0UWqRAOB1zcReNunn4n1GE9jrcoKYqbJ+K8
         k2qS9Ix5/SDrM1vs2roO+Lu39x6dh8qSVxH7iLpdzMdViM5th+i44FnlojgQsO2hWBIi
         vR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628667; x=1703233467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaJip8GmLT+eoudw6ELZE8CHy+R0HyuDI+ZhYJsgRAI=;
        b=ZIqpjqpNPU+ZhiifI1Ukdynd0sGQg/Zh2gobDBnhqH6sCjrm6O1GWH7TB6OjK+nwSb
         O8BNYHU1PshE9+JI8V/Bt4oycrL+jvxEdKQHdw86wLPyPgJIKTMgM4NMmEEMkUPDFcTl
         EIv72lZBFJGn3og3/E9ua71reFpQ5PQsEcWl7CcGkCXNo8jOJMA8D42gCcwfC7xlKYaC
         1HJnwHl92i5c0w1E2WvNVcoNibxl78VyrzRORvslww+WY8TWBozcrqdKrCJ4KGuBXoT0
         cT0g6plZHQEXS9DG7e5OW0Q+kXwsDi3Gjo5ZXVcpjLTGAFyFikxalyZoa4GjGN/hyZgL
         UMMg==
X-Gm-Message-State: AOJu0YyVk6arPXGPPzCCFAas0pe3S8EW4hxFsvOX88o39RD+8SUAHpMX
	EM/LA9iwNIohFl3Vo+YA/Rwa
X-Google-Smtp-Source: AGHT+IELc/vx8/KItuHJw7/P8JvoXsZy5zRLYr1PvIRMkoptNOs0lJj/lPxrd+a9pWpoUg1XpUntDw==
X-Received: by 2002:ac2:47fa:0:b0:50e:208f:e553 with SMTP id b26-20020ac247fa000000b0050e208fe553mr25487lfp.70.1702628666713;
        Fri, 15 Dec 2023 00:24:26 -0800 (PST)
Message-ID: <6ba1feda-275a-43f1-911e-8a8596e100ff@suse.com>
Date: Fri, 15 Dec 2023 09:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook> <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 23:49, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Roger Pau Monné wrote:
>> On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
>>> On 14.12.2023 10:55, Roger Pau Monné wrote:
>>>> One way to bodge this would be to detect whether the caller of
>>>> XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
>>>> assume the pirq field is a GSI.  I'm unsure however how that will work
>>>> with non-x86 architectures.
> 
> PIRQ is an x86-only concept. We have event channels but no PIRQs on ARM.
> I expect RISC-V will be the same.
> 
> 
>>>> It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> 
> "GSI" is another x86-only concept.

Just to mention it - going through the ACPI spec, this looks to be an
arch-neutral ACPI term. It is also used in places which to me look
pretty Arm-centric.

Jan

> So actually the best name was indeed XEN_DOMCTL_irq_permission, given
> that it is using the more arch-neutral "irq" terminology.
> 
> Perhaps it was always a mistake to pass PIRQs to
> XEN_DOMCTL_irq_permission and we should always have passed the real
> interrupt number (GSI on x86, SPI on ARM).
> 
> So your "bodge" is actually kind of OK in my opinion. Basically everyone
> else (x86 HVM/PVH, ARM, RISC-V, probably PPC too) will use
> XEN_DOMCTL_irq_permission with hardware interrupt numbers (GSIs, SPIs,
> etc.), the only special case is x86 PV. It is x86 PV the odd one.
> 
> Given that DOMCTL is an unstable interface anyway, I feel OK making
> changes to it, even better if backward compatible.


