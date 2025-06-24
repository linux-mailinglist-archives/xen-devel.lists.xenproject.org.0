Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246EAE6C52
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023939.1400000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6Le-0004yb-Aj; Tue, 24 Jun 2025 16:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023939.1400000; Tue, 24 Jun 2025 16:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6Le-0004wG-84; Tue, 24 Jun 2025 16:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1023939;
 Tue, 24 Jun 2025 16:18:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU6Lc-0004vR-8F
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:18:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2c99d0c-5116-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:18:11 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4834700f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:18:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882cdc4sm2223168b3a.84.2025.06.24.09.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 09:18:10 -0700 (PDT)
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
X-Inumbo-ID: d2c99d0c-5116-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750781891; x=1751386691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NaGuyFlzsMP6wYIOsiuUKVKUHnMtmSU1vu0ErJe0fgs=;
        b=CilFBZwWnfPffNSYLJpUG7NCNpXysENUTGU5Nc1vUuZ+YuWVcVJAo+EAlD/qn/6zNB
         6HgUrN4KphTxZrAqBSsObtWeJJkodoEe0/8yreqVD7IzYJ0XKeqpXPq7+zol2cw94D1u
         cubVVaDYYpMUpl8Be7/G5WGIJ6pWX1TD4djzNlmG3GnJmPvsidJxDsPvirX9qguvyDZJ
         tWDt6zFY5OsJsPbg+1JOjI2QWo/ztrNa6ari45E3NUCytrvo+FQeOqSGOUxS1kNt58FJ
         VEgjFwZ2Y8FBc5GOk7FAMzvcu0SVNzsCAtLP4kxmddlVpDpHDnPAMPmhqqIyZf9G0fBN
         9JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781891; x=1751386691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaGuyFlzsMP6wYIOsiuUKVKUHnMtmSU1vu0ErJe0fgs=;
        b=kw8sRa1jCWEwU297y1d5PWWSfKT+MNascKHxvOIti8J2xQZdntQlvPgE7GgAOpfrXn
         7jW0COBVSRM7YK76d9Ew418UynxqRo+/RT5/riV4HFEUj1kuHVRXw4+DwHoPBlSIj5F6
         ZpTvRzfUFz0RzxcEp3F3ujKpxz/lX8QvpxISWwcpYtZH5KZy7oCnIBh3bgWvDp2a3FHi
         i6qmCTe7lveSHVopldJmLdethVbKMlxnFA/suRfAxAtTMsI6GIEfgRjNqopHOFRYqZNd
         d5ULzprz7aY71mVfRE7wtO/OQOrAZlNe5wCY4F/hjrRgtJjVIZhzIgqk9F7iNih12Wxw
         Gl1Q==
X-Gm-Message-State: AOJu0YzdSqJIPBO2owyOWcqMqXShH3TwA0T6FU0Que+nXHA4hVDBfNPg
	DdjK+bIIwbT6gQv8gt7KxRmfdQ+7m+0hPEWdGPDnyjmTKw+PrtNKufs5ecdzhN8Wu3RFRicOlec
	HNMY=
X-Gm-Gg: ASbGncvqIDo0zzFW9D60j0oEf+pz1+DSb1tS2OK4fR746NmyLVLqw404rp09VveTbUj
	vsVxY2hZYGoFpfEjGZGqyS3eEk3EaPlt55yX/KSyG9QuiIunu7WRXOmaaxlF45yLwX9DK4Q7jXV
	AFNhf64HEhReblupmZG7nh4oiYBKp03UlHPBvdJ4CJ91tDdAU+XQOs67oSmrVmnEX7hs0wAL8Zo
	tz3PJjro/yBdbWF9fm9ii80MCLwytKVZ9pj07JVo7ZbG3lZKm8v4w6gh6nRLTntTzf1j8fIY6sC
	59uw+yN/bp25IsWA8B9c0uElO3nrSX0D59GxJNs5jnUQLy8+ePe/ufdn5Hxvjf1WOX5IXHnM45l
	JhbYNzoZPCBQVjBF4yC1b3j6KAp0RgbdLoeQRDtepUCBZc2a+h8pYhR7b9A==
X-Google-Smtp-Source: AGHT+IGa7r8KeQMGTYbDY/qvyEPZjVgts1kvpzefi93LcqYl6tA+7NuR1x3s/w3XW4z/Ih+SSjS2LA==
X-Received: by 2002:a5d:584c:0:b0:3a4:fa6a:9174 with SMTP id ffacd0b85a97d-3a6d12de83emr13980352f8f.33.1750781891138;
        Tue, 24 Jun 2025 09:18:11 -0700 (PDT)
Message-ID: <6fe8a131-2997-4cde-b030-eb14f63ab065@suse.com>
Date: Tue, 24 Jun 2025 18:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com> <aFqcQe5quyjhu24P@mail-itl>
 <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com>
 <aFq3sYCAglRrMb8I@mail-itl>
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
In-Reply-To: <aFq3sYCAglRrMb8I@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2025 16:35, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 24, 2025 at 03:05:25PM +0100, Frediano Ziglio wrote:
>> OT: the flow of read_file (specifically "what" handling) looks
>> weird... can I change it?
> 
> It tries to avoid duplication of PrintErr calls, while including what
> failed in the error message. Looks like somebody really wanted to avoid
> using goto here...

Yes indeed.

Jan

