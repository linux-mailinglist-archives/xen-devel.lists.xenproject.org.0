Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08438188AF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656819.1025269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaDw-0000Ay-9U; Tue, 19 Dec 2023 13:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656819.1025269; Tue, 19 Dec 2023 13:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaDw-00007w-6M; Tue, 19 Dec 2023 13:33:28 +0000
Received: by outflank-mailman (input) for mailman id 656819;
 Tue, 19 Dec 2023 13:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFaDu-00007q-3b
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:33:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ec1f271-9e73-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:33:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d2e5e8d1dso1996705e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 05:33:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0040c6b667ce3sm2920578wmq.1.2023.12.19.05.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 05:33:23 -0800 (PST)
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
X-Inumbo-ID: 2ec1f271-9e73-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702992803; x=1703597603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjEgUJtn2D73N6AcD4RWcQ+YXEdr7iUoPA3JnkfBb9Y=;
        b=dY1/YXYNyeNhP7jNa/zAyxLACKy7E4aEH5ic+8/HN374n9mPFoBP6bYrvMRBwC9+4q
         CNdOlWml83rAM2cnc5jjduGjQpHrK1gFIB41byJbcSAtrkhff9VVbWbzewDsI7fPPrFG
         ytQh+pkQCN42OgDucezMHJafdqe21EIXYTeDp4dzRn60sgquTzOQ1+SKdFTpQWgjIFZT
         HD+9QeC7b1cLL7rDlIs2VSvzYIRN79DUgA7VFOduPnke/RDMjzE9OtHOYHk+aHQLoVY2
         QZ1uIrNCkFtUTF3puQAOlBCwn5pq6w9yPkAbm1YDkni3BfuDtgRK2G/AUCR1kVCGRx8e
         awzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702992803; x=1703597603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjEgUJtn2D73N6AcD4RWcQ+YXEdr7iUoPA3JnkfBb9Y=;
        b=JHRmlD+jkc59Ax/5sttGm1+GJNbFihMmIJ3VT1ZOFGhbBAvEbMB7HtHh3MU0AeNLDF
         TalN/DU9j2SsRzRLiVezQqnJlNy5wPiBusOW9ijbuwwrN0sBN7zfDNPxpFzWeDX5ORSj
         Izi1rEMDAtKmSUHINN70eFnRK0J4iWz3LT0kt8WMJ4LakFviNDK4yqaxy7IccaM9GXxN
         uEFJg8iExH8dwXJKDA7FAjTmHrPXoqlWW/L/i+whi3qbetCKTrWILHdtSn2/okyMCfmL
         n0mtMkTUV6uff9J0wxUNA3ikaEypbU0dSOSZ2Kdt2e5NzhOX9Gt7Bvi2PPpBqVyQ38eV
         4adg==
X-Gm-Message-State: AOJu0YwC+Resiz1lpthCRmZDzHHHRYpog0rBf67bUgHJQW1jjZE8lgxt
	G2f6xF/sDrulQA3edEMMhqhC
X-Google-Smtp-Source: AGHT+IGehdA0dxdIdVE5fLEeeLZfiYZshsg+tEyd2jn9ro5mXdk9fK/aopr75sKTqpLRfOfbammTFw==
X-Received: by 2002:a05:600c:614b:b0:40c:6c8d:fb90 with SMTP id ed11-20020a05600c614b00b0040c6c8dfb90mr2759702wmb.51.1702992803484;
        Tue, 19 Dec 2023 05:33:23 -0800 (PST)
Message-ID: <629d9e79-e7be-4bf2-9052-42e653c5513c@suse.com>
Date: Tue, 19 Dec 2023 14:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
 <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
 <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com>
 <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
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
In-Reply-To: <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 21:31, Sébastien Chaumat wrote:
>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
> 
> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> ioapic-edge and IRQ9 to ioapic-level ?
> 
> IR-IO-APIC    7-fasteoi   pinctrl_amd
> IR-IO-APIC    9-fasteoi   acpi
> 
> to (xen 4.18.0)
> 
> xen-pirq     -ioapic-edge  pinctrl_amd
> xen-pirq     -ioapic-level  acpi
> 
> ?

So we need to come back to here: If the IRQ is indeed treated as level
triggered in the native kernel, it needs sorting where that information
is coming from there, and why different information is used under Xen.
Clearly xen_register_gsi() is passed ACPI_EDGE_SENSITIVE (and
ACPI_ACTIVE_LOW), supposedly coming from ACPI.

Jan

