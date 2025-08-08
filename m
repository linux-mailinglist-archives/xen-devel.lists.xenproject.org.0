Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E615B1E233
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 08:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074040.1436745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGTO-0001Kk-MO; Fri, 08 Aug 2025 06:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074040.1436745; Fri, 08 Aug 2025 06:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGTO-0001JJ-JY; Fri, 08 Aug 2025 06:21:02 +0000
Received: by outflank-mailman (input) for mailman id 1074040;
 Fri, 08 Aug 2025 06:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukGTM-0001Is-Ib
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 06:21:00 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c6268b-741f-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 08:20:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af9180a11bcso366526766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 23:20:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99148eab9sm484037666b.77.2025.08.07.23.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 23:20:58 -0700 (PDT)
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
X-Inumbo-ID: d9c6268b-741f-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754634059; x=1755238859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t/ZVNGssmV1swo3G4gqvI055lSSTPFlKR8S+iSThrzI=;
        b=AtDQO3PvLoN6Yg37IsOcZn5H6yDUZFGnxX1wq3W1HQ1HARq5Yk49ONRpCT3HSsnSYZ
         PNg6zBGKp+CM+Au42Bxv2JzJUiFy8WeNOy5O9YM1OTpu2R06+IZ9AQcYv73+whi9Ihpa
         iqtM5IdrJQW+oYgGc+QDD0XJEsSU1flvIrY6fVE/Sxd1QesoNZpsjeXXwkCiGwR8Apko
         D4pLK7OmiqlNufQxso6ZH5BLbXoix0Oin/B8Or1cmXP6POAvkiXgQDMrXXo7Sh2cQCdO
         fL6bjQM2d5I7t9OgByEFZ9xq3wrxT5yL+YzUArH4t48UD0cjoyJRN04XSM/+zVnGHa90
         iyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754634059; x=1755238859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/ZVNGssmV1swo3G4gqvI055lSSTPFlKR8S+iSThrzI=;
        b=azNo309yudFSsrjl9eba02sOCsQAO0hf/0Kg3xDOXdI4AQpvfHlJT7ZNuyBYzenWyk
         He+lFyEH/InBPXzPGwcpFKqqVQCXRnU9SaXmxz3gUgNo6Ylrs8zTmT99Rwv2jKKZCR+o
         sODC/fGE989PsLkX4tkMMSPOwG0JyPoHy6mUH8X+CXzimsIybWt5nzWZ16Jq0Vldp7vP
         ya3mNKYfvXNg15QZ8Bwwrk7nT9K2PnjRprYekRvPr7Bt9c5zle4VKzY8y7cxTCMBzgJC
         UYw64HLO57xlDtecLmlI2ftEZpol9Hgbp4ZnIJJJO8BBxKAKGXPzZkwtZEET/d7ubRko
         8shg==
X-Forwarded-Encrypted: i=1; AJvYcCUqNQUeTk6VcDW1hIeyVaZ+GRdQMPYT2PjS9cO6mwacn131DNS8VFPwAhZisBHe96HnRArnT5NKZp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLEo2TSSMEaHU+bYsEWWWr9z6Y9lVUuNWGbKy/zUiVFfnC/8/0
	OVz7oIdewR/YCDhzcbne6/zBsgvhCvh/JIgI6x50NTnYMhCBnGSJONKK4VcHFUcyzA==
X-Gm-Gg: ASbGnct9ZaGkoT5moaFkrumLA42u6Dp5c1OD3oM2WyxIbgdHu+phvnw9oaPK0PkQwhb
	tt6VcC0vmJq6cBuVXyjr5ttGp6qv21LQUEOqbdw6DoWlOJsn5F6RVCLrXTniezayGX6ssnKqDCd
	QtZWkBOFr30b7+IvfOJ1ZbYf/JHndzPlUnjfHcJZi677mcUrhf506OuuWTnLUAiAxGsLgzrJqgB
	ND25LFEzIHbA8fdVlE4H9hvGRzgol+4CsFTDK7fiilL0n9rsQIHduBhnTn0q/7abgcznzh0mWy0
	TEQbgk81gR7l8pSV4pEj6uZ8bxxHQsVTaScMRyqGyAqvPYH0fhwqVOpxVxbwi8bGADXxon+Yg9h
	g4ZlyCPKf7tBV6qwsSnA6GBqhfnWtoAlWx5WYtWRyoEy9+8uT1KUTtnLKe53it6ReYvK4+y3vQp
	NbNUgs3mAE8GyN3uqkqA==
X-Google-Smtp-Source: AGHT+IE1spSqbHh7qWI12yKBcu+/NGzUpi1v6bpwVVPckjgGn8qxWG6KBd7fsScJImf2jginJyJAXA==
X-Received: by 2002:a17:907:9707:b0:af8:fef0:9b23 with SMTP id a640c23a62f3a-af9c700a332mr134313966b.20.1754634058977;
        Thu, 07 Aug 2025 23:20:58 -0700 (PDT)
Message-ID: <dd006b8c-c198-4f38-bfaa-990122bb7174@suse.com>
Date: Fri, 8 Aug 2025 08:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <boolean>"
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <c539f673eef6f44a1191b0f8213ff5571baa411a.1754580688.git.milan_djokic@epam.com>
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
In-Reply-To: <c539f673eef6f44a1191b0f8213ff5571baa411a.1754580688.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 18:59, Milan Djokic wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2058,6 +2058,13 @@ This option can be specified more than once (up to 8 times at present).
>  
>  Flag to enable or disable support for PCI passthrough
>  
> +### viommu (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable support for Virtual IOMMU for guests.

Isn't this too coarse-grained? IOW don't you want to specify the kind of IOMMU
to use, even if right now only one is being implemented? Also - why on the
command line? Isn't this rather a per-guest setting?

>  ### pcid (x86)
>  > `= <boolean> | xpti=<bool>`

Also, seeing this adjacent entry, you're inserting in the wrong place. The
options are supposed to be alphabetically sorted.

Jan

