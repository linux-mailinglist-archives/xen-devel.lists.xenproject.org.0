Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EA8269E6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 09:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663254.1033116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlPu-0002BC-Mg; Mon, 08 Jan 2024 08:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663254.1033116; Mon, 08 Jan 2024 08:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlPu-00028u-JO; Mon, 08 Jan 2024 08:55:30 +0000
Received: by outflank-mailman (input) for mailman id 663254;
 Mon, 08 Jan 2024 08:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMlPt-00028U-Ac
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 08:55:29 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb48026-ae03-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 09:55:28 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so1532000e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 00:55:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dm25-20020a0566023b9900b007baf1948186sm2075449iob.42.2024.01.08.00.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 00:55:27 -0800 (PST)
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
X-Inumbo-ID: abb48026-ae03-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704704128; x=1705308928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kKkNglLrXCPyfxncnasRyBRnEOFCO9bUyiX7HOUeYA=;
        b=PEXzic0wDg806uzEYw3L7YceVXchfir96drU95xTdY49UAWOZDkhFn322vEIUGQ/nk
         OhzAGUzRLQG26FoEF0UE4Z4K1MuhOD1EUJ/WUmxrTO3mJX/4V2iEf0+XOyJW7bKK2676
         rt1PpgwaKV4pqZCb+le/BPftRPKC0O2btYMRHCqzUl5Q+d7LcEpp3OvaE902Kv+y46x1
         FGjC/daHSdTdWm/5d4JG0ydjTSbEPfSKxLzmxTIW/RjRHQqrFYOgcV8X8idY+UcRWLss
         mACUyk07WMEFcVx8bRZs96rX7ql+ovC9aB2GN5Jqqc6/w/JT+wRvz46j89L69JOHpbtJ
         KIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704704128; x=1705308928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kKkNglLrXCPyfxncnasRyBRnEOFCO9bUyiX7HOUeYA=;
        b=Fjx1dy+gT1m1nlczTBpYyhOPvnH0xVfrH9DLlFgpgFq+MvqtcqEy5dQ02fMDoDVogl
         16a13SeQnOD/Q/IXAFy4unBLmAuKn9FaeOIGhk8H07QZqTXhsJc+/dfcaNUu6Rma7eRl
         52jFWFQHs9rQhR2vI9BCUFe/fOBwCaOYtFaKfIdgXO4JDZmqcdGhesKPwyFv7mRmosfP
         57Hg5fDqz24wsFYbUid9sBh5L2XDPE1tZnQ0ZzX+UdMer+yxm2OMOhAY7gf3JgGfSJkz
         aS4lXIPR36/dFBEdWF6scm1X6pky46HzLwG+acWyAt/CpBq5Lqm+qBWJPaH1fyRXPuIv
         DX6Q==
X-Gm-Message-State: AOJu0YxP4DOKnyM9HYw5it2z93B6hEQPv0TSxx5fSSbR+L1GxTxSGFxz
	WMvdMw5u1B0xVnr4/uuSPgNUec6Ptjmq
X-Google-Smtp-Source: AGHT+IHMNQcIvGDLWu2mOVLNflnXjHcNd0gjgKl/jE3YbB+qR7gatCQJ9KJSalaI2hAXj/LAVDMjEQ==
X-Received: by 2002:a19:6d15:0:b0:50e:7555:1ea6 with SMTP id i21-20020a196d15000000b0050e75551ea6mr954278lfc.11.1704704128002;
        Mon, 08 Jan 2024 00:55:28 -0800 (PST)
Message-ID: <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com>
Date: Mon, 8 Jan 2024 09:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2024 02:08, Stefano Stabellini wrote:
> On Fri, 5 Jan 2024, Jiqian Chen wrote:
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>      unsigned long long start, end, flags, size;
>>      int irq, i;
>>      int r;
>> +    int gsi;
>>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>>      uint32_t domainid = domid;
>>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
>> @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>          goto out_no_irq;
>>      }
>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>> +        gsi = irq;
> 
> A question for Roger and Jan: are we always guaranteed that gsi == irq
> (also in the PV case)?

Iirc for IO-APIC based IRQs that's always the case; for MSI ones there
simply is no GSI, and Xen's IRQ number then normally isn't the same as
the pIRQ a domain would see.

Jan

