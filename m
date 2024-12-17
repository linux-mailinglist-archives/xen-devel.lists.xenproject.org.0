Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920319F4676
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858617.1270867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTGs-0000pm-SS; Tue, 17 Dec 2024 08:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858617.1270867; Tue, 17 Dec 2024 08:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTGs-0000md-Pk; Tue, 17 Dec 2024 08:49:38 +0000
Received: by outflank-mailman (input) for mailman id 858617;
 Tue, 17 Dec 2024 08:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTGr-0000mX-9v
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:49:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7dff08b-bc53-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 09:49:36 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43618283d48so35997405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 00:49:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362571765dsm165698345e9.39.2024.12.17.00.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:49:35 -0800 (PST)
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
X-Inumbo-ID: d7dff08b-bc53-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734425376; x=1735030176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2QLLRvdvTDu2HlRouo/qbzquQEfVc4q7ZBXW19BzHs=;
        b=YPCNFjb2EhIAre281hi2VWEOOoNaACfyjTyH8xYDKmgyrdtVVolmpD2QbeQMSAznv7
         rQ03PG3J8UClfVqp7vEKS7PLrSK8fG8OYUiLTaxKGeSy/sJJWZKJmGA1nGVWoPhHFkJO
         R7M9GAkxIMEo62cWV3g1WXsZXYKaWBu3I5e4MTDlhGYKorv/7NCdpq5q7jxKAkY1KJMV
         7SCXyd9yBTbjTAGLfEtsUpW/zrQm4oKvlhjp+Y0opEI1O6vw9UJnJAFTCxLO309mCcn3
         p22mEblEHg+On3WwAJ1uv+NsALg7qiUuqLnOdcugrrl2GcWY38U0yXMHZ0+gWxil7c02
         Ux/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425376; x=1735030176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2QLLRvdvTDu2HlRouo/qbzquQEfVc4q7ZBXW19BzHs=;
        b=bBFGvOSF2JV7ck8HS7aVMkgJjCsOqe43p4ImMWlzHyYNg1+5lD6XXyZfntnVGdm1jA
         k5fEDGI81L6C7bqpQW0qsjM3OM6MtC+SFqMHeAOInmYnt9nqS6eEOJCLkhMc+HGUgClS
         MSylEPBEFYw9FzDj9TiMxtymVQW3X1Gri70SxXsOAzOBp3sWohdG6G3lfGmAP0DZn3Gk
         Y3LJ2OpHTQ8dlYkGRd22mZYTG9/CMlVaNEEBzDhR1IZUMbUw/R9RzyKR8xdrq2I6zVRP
         1PVCQ/Lb5PVcezvyUIjeqmCRnawGwXBODrQ9ctYjhvAaIEIBRmh1TgtdBS5J01hs8URI
         uC7g==
X-Gm-Message-State: AOJu0YyowMxtaVnbeLJNMKtOabaZfSCf3LV+xUYym+WA4q5THx8oPhPZ
	NEi3CGwZQLp1Z5oEA0D5XH0SeW/e5OIBspFqwMKyhXf9VYlw5VZJbJ4XOz9nzA==
X-Gm-Gg: ASbGnctJ+oU1RPl7wJdS9B6VNTHrnSvt+K+VxR02AAU0EU1rtDvbJKTUAwC+GKOI3YZ
	G3XnfFwuPUC3/QIoCWLmsPh4xoZsQ2l9NBfv6ONJJiSWCp9nhOOb24jRu8HzK935eGAM6NivBOw
	cu4Y4yFHLBwGrSehDtHevkuSWXY4ZSu60BcDqenrOxu2imWzuFIrkRiay2mZKRy4DnnnHuVI2lj
	qB0xbV5ijte+0nzPUgTHVEkMERScVhSDnHR1wRZadcvW75W8ob4jgl/KHUFdNa0vi2E1mlBut9M
	xDCPwB2H6CNdEnfLSRO2qkFAVtmKtUCBweArCOGHkw==
X-Google-Smtp-Source: AGHT+IELd0nPHGd6ezO6i7ju9yCMVnsSyQMbZdjEhiGYPMt532z+AiR4zjt1iBPtwa1vTm7ZYMEn5Q==
X-Received: by 2002:a05:600c:358c:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-4364769b2c6mr21910705e9.19.1734425375738;
        Tue, 17 Dec 2024 00:49:35 -0800 (PST)
Message-ID: <562c808f-106e-4505-87c2-71456d564916@suse.com>
Date: Tue, 17 Dec 2024 09:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <Z1__--RWN68hsOCX@macbook.local>
 <BL1PR12MB5849E24F4C352A0776AEF973E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849E24F4C352A0776AEF973E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2024 09:20, Chen, Jiqian wrote:
> On 2024/12/16 18:24, Roger Pau Monné wrote:
>> On Fri, Dec 13, 2024 at 01:42:32PM +0800, Jiqian Chen wrote:
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        printk("ReBar is not supported for domUs\n");
>>
>> This needs a bit more information IMO:
>>
>> printk(XENLOG_ERR
>>        "%pd %pp: resizable BAR capability not supported for unprivileged domains\n",
>>        pdev->domain, &pdev->sbdf);
> OK, will change.
> If the length of code of printing more than 80 characters in one line, is it fine?

Technically: Yes. Imo in such cases one ought to strive though to shorten
wording as much as possible, without losing information. E.g. in this case
possibly:

    printk(XENLOG_ERR
           "%pp: resizable BARs unsupported for unpriv %pd\n",
           &pdev->sbdf, pdev->domain);

Jan

