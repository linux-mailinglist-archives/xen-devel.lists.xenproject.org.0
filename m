Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C7839186
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670510.1043341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHtU-0001ux-Lg; Tue, 23 Jan 2024 14:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670510.1043341; Tue, 23 Jan 2024 14:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHtU-0001sT-J2; Tue, 23 Jan 2024 14:36:52 +0000
Received: by outflank-mailman (input) for mailman id 670510;
 Tue, 23 Jan 2024 14:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSHtT-0001sN-Kn
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 14:36:51 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8220ca2-b9fc-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 15:36:50 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so57954671fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 06:36:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05663801ef00b0046d4105b7e8sm3604437jaq.49.2024.01.23.06.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 06:36:49 -0800 (PST)
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
X-Inumbo-ID: d8220ca2-b9fc-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706020610; x=1706625410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gw/q+zCha9+NhwmsgQc4y/QnuZt6k+sWrwVp12yjy68=;
        b=gPlnWMLUiF46egPqEFXDK4eGJbxkFGAQYyjVt7xXjZkyzjf3HEMx+Ek7JLj+r/8nQT
         aSjeek/Nf0hV0352ukoKywxJZUKvt7ZpvJdTnfdiELboh+qqi7SnwyjQnCq6HNe5csDt
         O7yf4+1DXICej6wfoTuCOnNPNXa/nYafauBsneG0qM9ew20PuWNLH8NlS4mBPjJv09bX
         HJMwpQQx5hek0Ik+8lK6W3WgVWZLJ73WK4M3nksWsf1bK1tIVi1pK/AdoLuIpGNdPqDM
         QmG4XSlUyfjrekqJm/egzAYHicOlfeNZFnJdqouEDxaCK1esI2bGkrYrIw/IfE+P2AIm
         WA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706020610; x=1706625410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gw/q+zCha9+NhwmsgQc4y/QnuZt6k+sWrwVp12yjy68=;
        b=ttt2Y0R9scOvmC2Ofd3D8y7JZ5PrPXiQQNvNWgFAtZ3gRaGyHVJw7bIOxnrn90ncvU
         R1gterUNjSvhZrOWpOz2BZrZR1AIcNwIya1TrqjTvhq59BuVujZHBr7o3xJkTFZ+lkUA
         PZnkUxAdjWYYj+jo9Wps7+IGc5uaqYmNzZYrcG1tOG7OT1KzpT7mkgqjBBlb1D1DDgsr
         0B1sJ4DeN1P5Vri5gpD+2NNaK6VNTCk/nHiqnSEfILkyuIxjZLKHvbSiAHwBecfhhxOW
         jS4n+VYV14RHlrDG3XLWf+AF5dz9GNb5/e5QnfEC1fbn+htvfw1SfGuZHSQwO19/SssY
         MuXQ==
X-Gm-Message-State: AOJu0YwxLGnBSqnc1b2y9LnkJOKAIoLBeoS7nvqzrJETKyP3XALt45CS
	W/e9sQDTARC6/Pp3kq81m2/EwOJdsuwdhQbAxNCnGThtH/doANd3UNQvXTOAEsPWB6Kiye6sjn0
	=
X-Google-Smtp-Source: AGHT+IGP4kZjPq8uxD34denwthb1n6yAXtuqwKhTKov2SnxLZGmZHk2dI9So4sRzyPk4GRZrAlooLw==
X-Received: by 2002:a2e:8906:0:b0:2cc:e708:adab with SMTP id d6-20020a2e8906000000b002cce708adabmr2857485lji.99.1706020610058;
        Tue, 23 Jan 2024 06:36:50 -0800 (PST)
Message-ID: <d1154d3a-769e-45c4-8f0e-265799756cb8@suse.com>
Date: Tue, 23 Jan 2024 15:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/15] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-4-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240109215145.430207-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2024 22:51, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned we need to
> initialize/de-initialize vPCI state for the device.
> 
> Also, rename vpci_add_handlers() to vpci_assign_device() and
> vpci_remove_device() to vpci_deassign_device() to better reflect role
> of the functions.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



