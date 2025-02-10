Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE1A2E9CF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884643.1294385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRFS-0003ZV-03; Mon, 10 Feb 2025 10:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884643.1294385; Mon, 10 Feb 2025 10:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRFR-0003Y3-TP; Mon, 10 Feb 2025 10:42:41 +0000
Received: by outflank-mailman (input) for mailman id 884643;
 Mon, 10 Feb 2025 10:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRFQ-0003R3-UN
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:42:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf656604-e79b-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:42:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29e9b3so5827426a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:42:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7878b18a9sm713856466b.167.2025.02.10.02.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:42:38 -0800 (PST)
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
X-Inumbo-ID: bf656604-e79b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739184158; x=1739788958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CZErMNmtYj8IQqMLe46Cnq1QJhrgX3cadF7JkK4M2d4=;
        b=eLjY80WAc8wGMj/2D8398oas3Z2YRh6T28UseEoiWffc5MMwbpFq2pCGjOzJG84OIt
         qq5XAT2y1bSXOcCyC8CBvIt06MLVl4c7Y+85KKSR4Cc66bVJBu/yGBdERoqh16+KxlR3
         esGjpv/j4+m9vF5n/g9l0SznCY2jGNl4vwzDX86BC2j6hVTIHnZKv/fJwwQZrDsVBQdz
         7PmkgLKUj8u4tHDCoazB1iPj1+6Ccyl7Yki6jMY/KmqeLIFgvRUulPqejt0kJX7iHBW/
         TuPYxU+xocQOZUotwGb+LktqeHE9IjWtVTxcTOV45WmIt8MOquDd/ZSAhfwJyJ+Q7ij7
         Zx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184158; x=1739788958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZErMNmtYj8IQqMLe46Cnq1QJhrgX3cadF7JkK4M2d4=;
        b=Jlox1LVbHIzfQ4CMoXMgatCppShm5OzxpcxxaaMQUyYJFT/Ps+ThQdmKn/5N6s3a6g
         8muc96GhRRYa6pwUPyyZr/7ZGYd2oV8E8yvzsGecToy2Os8kemxaH0fH/ir03H/+/b8G
         +rz790/Hjq17cS8LhoNYzN7I0H9aCcoNAt2dh2IgwbSDA9IyPykTsHNPSmp3/DKJkzfM
         3ihcNUub4Dvya/N1IrHnLnLLcDeN7MPf2MKdiOjk98TD1ohGaPiyQgtcdMKTTlSgpHzN
         xN40IqlyuzUaLuR0vUWcwzjj5VgpIqe/DoFEXchWQ9oHkypkiJhdwpfdtVuPNJ/RNHEp
         guLw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Zu+DfuKB9Oe09d+8w1sjPhhweU/EwZ9sMXYXGwxCyqnyV1obD7CB670DhDIFek6RE+TxPEBcHKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgQTROxGbyH0ASbIJH4or94uJ6NntVlP5pgJterdvxFcMPkpOb
	0VvyyE/435TLTdP/Qt9kEnyqJq2tArecY68ANryXTetFa35loLuNcmlLfy6/kg==
X-Gm-Gg: ASbGncs0ZLBRAwi+rjJUh6JdGjKvqDQUavS8AYqsF3poPsRhKTo3pjpBUgelrCPPIr3
	Ov/IIriIh3BkVr1nBU1sng1E2Dkz6PztCkWjapQWIhXHdRV+kk4Z5QZDE3VKE/k+Asjtmo3pjK/
	HaPjoyixrfOtLtWQ86PtdJ/F2QiMyN+N6/7VdMlHM7S9i4J5ootQCKtNeYNyRD9tUhPIsLWfFZ+
	wX45c4l4xLjMIpvnBbXfw2ge2DPimSwGb7WIUNOuqNj7Zan0XLDUh1HhXOD0YJT4U7IglCiZ2k1
	KsD4WKMWfCjnkqgva6fwiuwmwKLag+WYeupkAmkhmqcwwGNmx5/kEazLf9i5YoHOsr3NZLRcOgj
	Z
X-Google-Smtp-Source: AGHT+IExN/tRT4sobzH4kWlIVYW7dReTvGU0s3SzIaOjDSJplsfGWXQ5NMKjPPlLt7wAngjl2Zy8mw==
X-Received: by 2002:a17:907:3fa9:b0:ab7:a237:2791 with SMTP id a640c23a62f3a-ab7a237293cmr839545066b.30.1739184158606;
        Mon, 10 Feb 2025 02:42:38 -0800 (PST)
Message-ID: <9589dd67-1c97-4e6f-abee-b727150081b3@suse.com>
Date: Mon, 10 Feb 2025 11:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] SMMU handling for PCIe Passthrough on ARM
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
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
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 11:30, Mykyta Poturai wrote:
> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
> should be able to be upstreamed independently from the vPCI series [1]. See [2]
> for notes about test cases.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
> [2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.html
> 
> v7-v8:
> * no changes

And why exactly was this posted then as a new version?

Jan

