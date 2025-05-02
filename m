Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E9AA6B75
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 09:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974437.1362298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAkiK-0007RP-91; Fri, 02 May 2025 07:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974437.1362298; Fri, 02 May 2025 07:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAkiK-0007OJ-5s; Fri, 02 May 2025 07:21:40 +0000
Received: by outflank-mailman (input) for mailman id 974437;
 Fri, 02 May 2025 07:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAkiI-0007OC-Lm
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 07:21:38 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10612ce7-2726-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 09:21:28 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb415dd8faso249884466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 00:21:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1895400fesm3833366b.167.2025.05.02.00.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 00:21:27 -0700 (PDT)
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
X-Inumbo-ID: 10612ce7-2726-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746170488; x=1746775288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ddhgbdH7PhByfv0jkjtKTYrv55l3Yg3DVqXpazV2ss=;
        b=A+lguSy8rU5YIs2DxNFyftxuzEEaA5ip3jfOC5+ULZC0RR7MSd37W2uL5WktW/mNwT
         qIH6YALGJpvdMOUUWtvMrj8SarUYiqh0dZZSDJr58cqYcH23fOaBiRV2I21Yt0KdE0pK
         ToTZYbKEEPephs0sPsUjjPeKMl85pTl5wQhPeFUdu0Gde+AiByp13hw/oNNNw0th/AH5
         nHD4g+qGNsNR5sHCUcWb/I2OL8GTHKfyQlKvbkvIr6+JICrChUuZYvnCqSTbE1HsEdrI
         XvhnUaFMLy6LuzWp3F6ltBueZQgDYCoRkoJgXgyCXGmh4nC0OyQgSZtwpBztg86+Gdod
         A53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170488; x=1746775288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ddhgbdH7PhByfv0jkjtKTYrv55l3Yg3DVqXpazV2ss=;
        b=izDkyboAKfKn2V065WfJIdpwR1rSwYQ3OD7rtrGRcLQZ1+psoNIpkTg76dkbeUjupA
         D2dZhThT27p0/rCtHsJx4FzPt7+KXFMYrLvionAcJJlaocxyNhVjU07u4RzDHsZFRJaz
         jfMJxqSCN5zHCXV5mn9as1FHZIHQS7xPG2EDXNLLWQXPxbnUSd4zmawQl9ffboWIBih1
         gP8Q9i6fhslY36TyNnHo5hCrprJl0LF1on0SwgW1A/et/7Rlj+HLL8TlOr6gqucK6oFa
         Ym5omqLfy0R5ncJrSsE5TytWkBTn4GRnk8Vcw6WZiHKTeZ1HCQw1lTvSac2LtXU42sNm
         Oihg==
X-Forwarded-Encrypted: i=1; AJvYcCVfkKWr1URIW7fj16jcPsS7qmnGCz3GjaaQG4ojC+JuKEZogGYkyqhg1pSyNtTh+CvO9pTrhyjRhoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyidkbnUrFKCLrM40mGl56VHQH2iO2imetyRl0CFJcH7wUpmht
	yAOEzpeIMX6psPyCTwIitb/HxsrcrceZTjVL3+aYZFORsz6sZZLkVjwFHiDtlA==
X-Gm-Gg: ASbGncsd3e4rFkbtDecuTy7qdN6CrQ0x5r2lcyhmM8RbNxqgC/3pC7JQ7JBla3gSkCX
	4XrTj6M3prGXqL9DzNYWg0icm4Er2y4nOTiPyKFnM4NCiIGFBUu9vWPW9ClAGHAFHvK2PRpEt/G
	K+iGrtqr3ZfZU8ozOlJvsQ1CkZBOBjfCjGvZC+82F0J9BF+usFpiKr6x8QU0bzTBcywroJBUj3Y
	pxbD8NngBoSXvTnxN7qWrheD6k1XdiL0TQJplW68r337ZXxv0cbtEOSfDeJcGw0p9IZIRfSI5PL
	EQmbsWST16yZP8jYn9F+ZqCxQKfmkKNtRqmKPsL61HxUa/7cO8XsxcGZws8Hdv5Ik49KGNUZa9+
	3D+6h1YncDT+7wQql1o/bkWsJhg==
X-Google-Smtp-Source: AGHT+IEdzG2gsLM6DuRotLnZp1m52/kvUyL/XIBdplW3NbLCs35Eo/93R1VDAmQa3sYkIYfeVDoUXA==
X-Received: by 2002:a17:906:d551:b0:aca:e2d9:41f with SMTP id a640c23a62f3a-ad17af8326cmr146243466b.60.1746170488130;
        Fri, 02 May 2025 00:21:28 -0700 (PDT)
Message-ID: <29a55d44-c26e-4834-b93b-47cbd98f885e@suse.com>
Date: Fri, 2 May 2025 09:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
 <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
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
In-Reply-To: <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 20:56, Daniel P. Smith wrote:
> On 4/29/25 08:36, Alejandro Vallejo wrote:
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>   obj-y += domain.o
>> +obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/
> 
> Please don't do this, use IF_ENABLED in core.c and then hide the 
> unnecessary units in domain-builder/Makefile as I originally had it. 
> This allows for a much easier time incrementally converting the dom0 
> construction path into a generalized domain construction path.

That is, are you viewing this as a transitional thing only? If the end
goal is to have it as Alejandro has it above, that may be acceptable
(even if not nice).

Jan

