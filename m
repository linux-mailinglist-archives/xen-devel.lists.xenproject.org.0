Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574DA686CD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 09:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920063.1324340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuooR-0007hN-Ph; Wed, 19 Mar 2025 08:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920063.1324340; Wed, 19 Mar 2025 08:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuooR-0007eH-Lx; Wed, 19 Mar 2025 08:30:07 +0000
Received: by outflank-mailman (input) for mailman id 920063;
 Wed, 19 Mar 2025 08:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuooP-0007TT-Tc
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 08:30:05 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af79a4c-049c-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 09:30:03 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so3466903f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 01:30:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f74b23sm11639655e9.29.2025.03.19.01.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 01:30:02 -0700 (PDT)
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
X-Inumbo-ID: 5af79a4c-049c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742373003; x=1742977803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dWFrqHUcIoxmlMiKAcytq/4JxjXXhViNS7lbxUfh5YE=;
        b=SQjgtSSgwCNGDV2V8bWqKxlXdg1arGAfsiG7qKwD+ymbKkrYSPN1rwHgnZXKaZk41P
         Q3S5VVZKMqprN0x7q+9R7GpdoQoM4JeooXoMQ9U+3KG43OQf2NNq6tyH+6wSV1TUULzV
         UyKDlIc1nYmyakDieqfgLaP+2GB6ZihbN5IcHsYZD+LMY5+QhNa2mm0LBZMto9A2Bi+p
         b3B5wzffebVHHog1/8vsHyiBuV8Dv+1zY3uWKPwjaM5Dhu6oCnHoWPaAZ11TQCyIu79x
         QEv7R74Yts4rs0/KFPhzRqNzY2TIpt+yCYQbQlb6L+I/FERUN15fIvx078XwXmSDEuF8
         poVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742373003; x=1742977803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWFrqHUcIoxmlMiKAcytq/4JxjXXhViNS7lbxUfh5YE=;
        b=EoEZaPaoO1BylNuxwpAIELsG6zgseBT+IAWUnEinK2c1xr6LWBhSAegzX+hR2F7GV6
         I0oG5/SRYB5q5DIlvUlAZjSDki3pCMcE2YNRdqAXDwF2SAM95xvjD2FXnhqXuVEfiXQH
         7NFcs45H06FjcPvSUzAnpRQLmSR8Rllztnocnh9YR5z/OGFd7vpGnH8WHwmbwZHPB3Ar
         /I2itLT1JvAYE78V4/sIhLi2Y2yIlLQjMudeThvQik/2D0+kGuvmci6UXOGfpr9CazwR
         TKjDUmfNEZchqMBQw0qnpjWE0psoZl+a3ZeIHLAxnHO7byURoqFuLK27DxaKFJ5ta30V
         29kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnSj1ZLcNUMVMgFWiz8gdLgAfox+I+v2VIpVcrG0FsdFmJxpJexmCEzpSgD3aDor21ItpD4UBqMxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHgML7Nxc5OTRSFVgvOjrny4gDrlHI7QL4gSaS3CvfKQpDDiFX
	FM4flEiEB2Zw32mq27JIMgefjb/HqejjIMuiGJUrkm8V1y+rugRpuZWYR9DGrQ==
X-Gm-Gg: ASbGnctLRN/hSf+Sndz34BMJPf5BOMb9TqiJ/F/limwe5kClW49ozZpymg7cnb6qWv7
	1C2yd7LUOp0rSvNPbjgTr0KvcuXDuUxICMp0O3PAElU3sQkkBUdW956hKQ1SapXaRm13Hy0TK7w
	yWinwUbQdjHnJy/1Etpn6uDQRliuXgppy62UK+IUGGcnOVzU1Hr//MQHggAFRokDw9tTg9NyaS9
	+rJzREB8NSPPKDo71RFFYK2zcfSIMaqbsZOT4++fqQQIYWSttnL/HjNceEC9rPLt173O5zg8O90
	J5K9/Yhwo2G4PJYXjUMebBA6C/lsNoHqM8xjMLrm2R6EAABoFL5ZO6+4UQN1n2dxL6+J+sshutr
	+aYKXnIgKOKJzvNF37V/qxeYUSSgOvw==
X-Google-Smtp-Source: AGHT+IEvFOAN/5ECGZ5JVK1bSpmeyHdnXQgPW+S7iO5LgTG6FbCcd/+3vNeHxvGDecQeg6Jbtdg4sQ==
X-Received: by 2002:a05:6000:1788:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-39973b725a0mr1534277f8f.51.1742373003162;
        Wed, 19 Mar 2025 01:30:03 -0700 (PDT)
Message-ID: <f25a67d5-e93b-4d1e-8ae0-7f608e2f3fcf@suse.com>
Date: Wed, 19 Mar 2025 09:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/irq: introduce APIC_VECTOR_VALID
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250315010033.2917197-1-dmukhin@ford.com>
 <20250315010033.2917197-4-dmukhin@ford.com>
 <c14f9eef-1bb8-4259-a3f4-44c739ed3258@suse.com>
 <P0RTWUo-6LQ6iOwO0spC7MdM4uH2YFasy5sN79HSXCtMXeYJaWQpVBzQL-6OWiOj8fDpmG35rwYcYBH-f48qraysWnADsmJL9sAWAoKISic=@proton.me>
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
In-Reply-To: <P0RTWUo-6LQ6iOwO0spC7MdM4uH2YFasy5sN79HSXCtMXeYJaWQpVBzQL-6OWiOj8fDpmG35rwYcYBH-f48qraysWnADsmJL9sAWAoKISic=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:42, Denis Mukhin wrote:
> On Monday, March 17th, 2025 at 1:30 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2025 02:00, dmkhn@proton.me wrote:
>>
>>> Add new symbol APIC_VECTOR_VALID to replace open-coded value 16 in
>>> LAPIC and virtual LAPIC code.
>>
>>
>> First a good name is needed to make such a change. APIC_VECTOR_VALID
>> could imo be the name of a predicate macro, but it can't be a mere
>> number.
> 
> Do you think something like
> 
>   #define APIC_VECTOR_VALID_START 16
>   #define APIC_VECTOR_VALID_END   255
> 
> will be satisfactory names to use?

Maybe. In some of the places the _END one may be awkward to use, though.
If you absolutely want to replace those numbers, imo the previously
alluded to APIC_VECTOR_VALID() predicate macro may be a better thing to
use. Personally, despite generally disliking plain literal numbers, I'm
not overly concerned of the ones here.

Jan

