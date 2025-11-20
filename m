Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1EDC740B7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167329.1493670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4As-0004i4-FK; Thu, 20 Nov 2025 12:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167329.1493670; Thu, 20 Nov 2025 12:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4As-0004f8-Bv; Thu, 20 Nov 2025 12:54:10 +0000
Received: by outflank-mailman (input) for mailman id 1167329;
 Thu, 20 Nov 2025 12:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM4Ar-0004f2-NY
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:54:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00a1312e-c610-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:54:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so144047766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:54:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdd659sm202770566b.7.2025.11.20.04.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:53:53 -0800 (PST)
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
X-Inumbo-ID: 00a1312e-c610-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763643247; x=1764248047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u4EBvQIsM4ePlu++RJfaIu+MMD8kiVfOD4X7k7WYkZg=;
        b=L9tGpBfdnvUydGVfv7WHHY69+5d+Edcfzx4zjnOjhrjOcjGTFscamc79xqlkZJplHy
         GspnTHtjKf3llkq5nWWwvuqxPkRbX4pVwU9H4mCL4VryPb02N7cKnc420SURO0WD4lDw
         qtYnEAtv6bODk2nqbsGg/FGblhaEaMgR6kg8T9vBTqbi13cFI3V0T/lVdfBRnbH8Tnlj
         6ExVslOulGW/5NPxNaOHjF25k7V+CKmRveXqW4C8pIt+OpD/FJcx9TD2JghPjvea6a9v
         zDZlYX7eex93aQsazCmLFzSmc5jkdJE04f4Iv3Q+K05mdGW/3fCX38CJS+A/on0w6prm
         Ek7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763643247; x=1764248047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4EBvQIsM4ePlu++RJfaIu+MMD8kiVfOD4X7k7WYkZg=;
        b=veSdvJOv+0Y9P3tROvQtusdOlsQdl4fmfyBdObhO+8LsekXL4fncLJ6BOXLCMiHMeF
         nRSmk9CPS48F2Cs1GRbl6kxz+mp6kw/kInCPsVf92go5pJy76YlYv6HZQpqakhizqkS0
         s+yWN5gbiceR9eJCeNqQ0jvSbyjjxzHy0vWFdD6j9IRykfzfdJShzylnn0p1ZXqzNoII
         SX31Nf0XtpK6GBKF7YFD3jfzlFzuGZwPQokGIk6Fo+fc+Y+4ippaIq4UbosUg9IObYCv
         aHaXjkppf+BsZVCgFcAOBrnZetpVi1YChuyBlWELY/Hjr4+UmvcborZ/kCyC2mcw2h0J
         K/AA==
X-Forwarded-Encrypted: i=1; AJvYcCVZW975+xGizjR7sAO9wF3wGy7OgYK/ivakurTSTiDuK2vB518sqSFyAuZtUY/0yeP+PrD+fX3B1kg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYcTijG09qgDk6DMyuqVUKycSE/w11K3zeoIV1xFfM3SWaUiFE
	Xe5WrerLb+yVw828hUf43FQ0fDjnr0DklwmWTzWB+AOBY01o9OhpwXwDZ82n06G4Ug==
X-Gm-Gg: ASbGncuvHsyDh6gGIOIQHZWLKLm+CQYDjCF5s7TILeCc7Hl73RMveB0+0bqrwdb4nWc
	rF4N/9e7oeb//PjydcUOLW6lD4fDVKmW5Y12Ic0FfjbkeypoM0033efYk33UXFyXxT3GYamBIr7
	kjCfUP++HY05VFmVpv3Bw1K5UShZAPhvJ5mpxifbkygTg5b8xDQ3bWv8Ao8NacL0pN0ODaXejGi
	1bA4yUaOfpiAXQdLxWf8jv1eHT5hL03v6K2sXq3Cqt0fMJgPNMX20MZ8uwVBDxVH4Pg3UZitiRZ
	aTkg2KcbGwBXwN7qrR9HaMt4rCfnIKc+ah51gkknVA1RaHQySKMKoDDplSW3XaUBuxbBCSF83fo
	J+JfY7jUyCktZjfB9fsqV6FFEkKpedjvyCk+Ao9JnepX4cQf5wZoyAAnGzM7YlmwYY4+UMX2mry
	ER4rV0WMUT6fLvH4QwS0OUbZVuVa/gQmsebixh2andTeqsZ4URxZH5ZpfQXXRpwSoShx0oqpsgA
	3Q=
X-Google-Smtp-Source: AGHT+IGfogYio77b4c94stLuyGY/3yq5h2hr8Hqhc0OtnzrRUAT8O1rIUyyMtHraw8kfBmuCiKqfTQ==
X-Received: by 2002:a17:907:d26:b0:b73:758c:c96f with SMTP id a640c23a62f3a-b7654f716fbmr344983766b.52.1763643234029;
        Thu, 20 Nov 2025 04:53:54 -0800 (PST)
Message-ID: <90a1978b-460f-4d89-b9ec-ab4238780f12@suse.com>
Date: Thu, 20 Nov 2025 13:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86/irq: set accurate cpu_mask for high priority
 vectors used by external interrupts
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-5-roger.pau@citrix.com>
 <7ba08f24-1803-4fd8-95b5-1587045d50f4@citrix.com>
Content-Language: en-US
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
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
In-Reply-To: <7ba08f24-1803-4fd8-95b5-1587045d50f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 13:45, Andrew Cooper wrote:
> On 20/11/2025 9:06 am, Roger Pau Monne wrote:
>> Setting the irq descriptor target CPU mask of high priority interrupts to
>> contain all online CPUs is not accurate.  External interrupts are
>> exclusively delivered using physical destination mode, and hence can only
>> target a single CPU.  Setting the descriptor CPU mask to contain all online
>> CPUs makes it impossible for Xen to figure out which CPU the interrupt is
>> really targeting.
>>
>> Instead handle high priority vectors used by external interrupts similarly
>> to normal vectors, keeping the target CPU mask accurate.  Introduce
>> specific code in _assign_irq_vector() to deal with moving high priority
>> vectors across CPUs, this is needed at least for fixup_irqs() to be able to
>> evacuate those if the target CPU goes offline.
>>
>> Fixes: fc0c3fa2ad5c ("x86/IO-APIC: fix setup of Xen internally used IRQs (take 2)")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Which external interrupts do we have like this?
> 
> Looking at Jan's series, the VMX Posted Interrupt vector is like this,
> but I can't see a case of getting a high priority vector, and
> fixup_irqs() being a legitimate thing to do.

The serial IRQ is hiprio and wants to be subject to moving around.

Jan

