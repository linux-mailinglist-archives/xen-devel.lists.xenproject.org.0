Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDB9EC714
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854074.1267365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI2D-0008Ui-AM; Wed, 11 Dec 2024 08:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854074.1267365; Wed, 11 Dec 2024 08:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI2D-0008SO-7k; Wed, 11 Dec 2024 08:25:29 +0000
Received: by outflank-mailman (input) for mailman id 854074;
 Wed, 11 Dec 2024 08:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLI2C-0008SI-3K
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:25:28 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7830c9ad-b799-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 09:25:24 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso2132199f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:25:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725eed5233esm4814734b3a.4.2024.12.11.00.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:25:23 -0800 (PST)
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
X-Inumbo-ID: 7830c9ad-b799-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733905524; x=1734510324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=armvY1GmuT03/EcYCs/Jw28Tj6XbxfWCtucb8n9l/rU=;
        b=RVvPZ/R0BbRulXjt9CV5a3xtCd1IgpB67srM0kAnPlMaTi7j7TE/EylKLHu3vDkscn
         NUcmTbjF5laWxmGIghPaNOcJpjGziT5/1c2jr93+qPtnh63uDALzzeguYa3RcwntYYge
         oDR5VmaKAkVtRJEOGvjSg87xyyg9P/a9iawcmYLMFRfWcipKWWb3qpqeGrXo/TQmwyfi
         7V0FkskNaq4TwLaIUt/N024LJY2bqOebS7KAd/zSxighgu6zoN03zG9MibDdeHHPjUSX
         0dd+tNbwfG9E/YUA6QX9ZV7l/jt2JtApUbXY5d7SNrzn5eXlEzld/GGC8yDEKG+638BZ
         X8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905524; x=1734510324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=armvY1GmuT03/EcYCs/Jw28Tj6XbxfWCtucb8n9l/rU=;
        b=musp0q66w1scwkndkDAljkJpR5VZRdkJVyd5rffY853yVZ2YNrdrVAIg91HYtf1J6Y
         +zbowtVQBb/VT6hCcvKWpf1qVOKqUBRaW9HGPpJsIxeEcR45DJdcuWrLQ2ne9yPKWCYG
         gbkIHXdad5+H5M/CmPrQItYcPW2xHeJx+HX9lirz2sTfLGRXW8qkE82Lv7UahjwG0NXr
         qEXZEeVwMNi1VM3/3+Lq66gVbgM9+4PFFARrJEEs3ZQ9lZ2Lid/Tm4Me86lAPVLxwBh0
         sTdDMaACcRcvu2s9YONFUvAOmMkoPzAfw7CyJ0Wsv+YjkiSyrBsiummAlg0v55j8L8iI
         S3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/5TUC3Oh1H1y/zGvycxZMOLfUe7dcxL+ApPA7le/+IJvybMwhVjT/eYsz4o6AFIg6J5Cb1sTAPmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjqtZluhVUV6J0yNQCGQcfpBz7abdWYGS7kjna80wJsQio78rs
	LzhPS//swwHxV8/gcaD3t/mHgLDInZqT77Z7FHq87aM2mrCqdhftK923ezqd3w==
X-Gm-Gg: ASbGncsy6PeMj4Hi/IIZA3GvavzRcZDlSZ/hMYn0eogEtVKCCC2xIeYFtLr3/ZuNNUo
	eMNmp90jOXdmJvToyHy/CBdQ4E/jDgDxJSf1s66cb1AnqyieE01skYpy2ymGxlMpZpzTMrVGuBR
	toYcd/4YJULdp1FRn8NBpl0MMRfRhgqRDMt9X8Sd1M4vhStYqpI1dd5GX+4dqrN0ziWOhE4rqjc
	gJs3IQZaxwMjlZQjPyqxPn5HB8c0nvQNLFy3BrwgjYWp4StTenPD0ciPup4fkoYM86Z46mRYwgZ
	+FoT+WO5+VFopSy8Ac9We3MRghB6nR7xvzBmEAc=
X-Google-Smtp-Source: AGHT+IG3rmi4UCsJMboa/LGF1Mgeehvedn9Jp0g4R8lWp9f5oc1VslPX0YrzC9W6/ODC3uisJzoJHA==
X-Received: by 2002:a05:6000:154a:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-3864ce86a7fmr1585356f8f.10.1733905524188;
        Wed, 11 Dec 2024 00:25:24 -0800 (PST)
Message-ID: <328c3bb6-1adf-4c64-81d4-40704ea1f19e@suse.com>
Date: Wed, 11 Dec 2024 09:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 08:57, Chen, Jiqian wrote:
> On 2024/12/10 19:25, Roger Pau Monné wrote:
>> So you suggest that the capability should be hidden in that case?  We
>> have logic to hide capabilities, just not used for the hardware
>> domain.  It would need some extra wiring to be capable of hiding
>> failed capabilities.
> Can you give me a guidance on how to hide a failed capability?
> What codes are current logic to hide capabilities?
> Then maybe I can add a patch to implement it.

It's really the other way around right now for "normal" capabilities:
We whitelist what we expose. See init_header()'s logic after checking
the PCI_STATUS_CAP_LIST bit. Actually past that block there's

        /* Extended capabilities read as zero, write ignore */
        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
                               (void *)0);

I.e. no extended capabilities are exposed at all right now to DomU-s.
For Dom0 I guess we shouldn't use whitelisting, but the (extended)
capability list(s) would need similarly virtualizing to be able to
hide some.

Jan

