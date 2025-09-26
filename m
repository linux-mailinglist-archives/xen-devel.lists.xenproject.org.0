Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B0BA38F6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131521.1470580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v277R-0003FI-HV; Fri, 26 Sep 2025 12:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131521.1470580; Fri, 26 Sep 2025 12:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v277R-0003DS-Ex; Fri, 26 Sep 2025 12:00:09 +0000
Received: by outflank-mailman (input) for mailman id 1131521;
 Fri, 26 Sep 2025 12:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v277Q-0003D8-9f
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 12:00:08 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a6c605-9ad0-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 14:00:06 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso4121789a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 05:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d0c70sm352341966b.15.2025.09.26.05.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 05:00:05 -0700 (PDT)
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
X-Inumbo-ID: 57a6c605-9ad0-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758888006; x=1759492806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O2imnWOo1AJwHjjUKzWb7gwy3ZnqP7tifsml8SS3l9w=;
        b=BxVm1xqupUeVOZfKhCCL2GGPYshRMRTKWW6QUE8rI1zecA+DOUES67XWvjRWHHEAh4
         N0kDaNQQFQ8D2jOtg43yNVczCCMmq5S7cPyxfqwlNZOxVB8Y9ElXAiFS31luPzXRqGYQ
         Nrz/CH+0Sbip87LrDlLNf7BBYbigUOXVFa033dSDytBujErHZCg+d+uuFvJvsv5RYANJ
         pNJeIkhtJ2LoTTKP4BDdFHpbiabfpJD2KivE00MDKe6z8s8i6uM4jKMsWAKNwDFIzapk
         zOVTbIu02/nKG/Zfk4OaBu0ie2u2vi4aj6qT5PJTQ7+4unfS7pFU8WgzGIRn9NPiQo+M
         POfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758888006; x=1759492806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2imnWOo1AJwHjjUKzWb7gwy3ZnqP7tifsml8SS3l9w=;
        b=dAunuGDfOnm9aPZ5XIg3EylTXZVJ0yhZ3IXG+KzzeEZuR5+LgqZOZJc3rttzoTepxB
         QcrYOJGNzUtV9JLInlecFRSJdFcTbepoaALumdOBcRIc5GcK11k+pdz3Of6P3O4iyTEm
         MjkwKMtOwUUDin+cfw8fk6ioRP6WSuiOL1Q/2L2HWIGtS9gGA5CKcvYjjSP1BgdeirEC
         GXJVJMxOvZFqpkpkD5kALlw4EIi5NqXZOWVcFVD+6d3mgit96NltC0Uq+n9q/xSlZsdm
         gPa62dGVTgQ2X9mXypIzL3/NJAn8TNPBVj5H3w3JXAGyNLUxWWnVKBQBkelRsTkyDs15
         f3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUEmPArUBI9Ub7P4jFTycfAqHCJ5YH9Q17x4/8AkKwo3lW33MVzTbh4yOXfxK+BQHzeVRxYZNrwg2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykVZ0tH0R7Bo0N+wCv35bMNe43T+KjvFFxj7NH9hfd+7ZdxJwg
	XKF2hqzEiL7M3za/GDTOXFWQRdiF8T6IBraznjl3ZACQumkoq0nAqj1ItAfT6OxIGA==
X-Gm-Gg: ASbGncvpem2QNchjcx2+9VNoXnrsX6lKZBL4Bkl/6rfF3RAjvH/D58E+tgcRI15EKul
	I5q4kKVwqpSdjY74/qrbVDSR7WnNImqgJ/oGPXuIQrMb7Yfm4hdVDtV7XCH++UGm+f3msFbMvN9
	egC+xua/kO4JiW0FIngtAHUjwbwXwU1hus+t2ngJ0O/2sCf9CMN63bJhV3T8+VokAmr/nQqfl/q
	FEjuqBHW63YnEzjwKYOSMG5Nrmel0PyEq93M3bOypOx4WOQ5PskUYpk8sEfG6Cpv/9962ormHI5
	MxFQzYX9PxFBRcAVQWfsT4Hj+YKj7ZTurnWO2frwEoeDQMrVg6hajBWnXOTjHuZheKnuAEdJ1Nj
	RY4c0CbgIlltVaRpHx/+z3AlLGS2h/sqVOiGRozjdwUKq79I9bYx1w21wuvvGl6k4pS5dkoGRPG
	JY/4B3bX4=
X-Google-Smtp-Source: AGHT+IHulLe6R0tsWctH1JlmKW0RcYr/838iYlb6y1vj9CBILACBdnzKJ9GkuMu+wMEJoiYTfyGFmw==
X-Received: by 2002:a17:906:c108:b0:b17:ec4a:4f2f with SMTP id a640c23a62f3a-b34bb700989mr842559366b.27.1758888005655;
        Fri, 26 Sep 2025 05:00:05 -0700 (PDT)
Message-ID: <5472d09f-4bce-4aeb-b517-79348923281d@suse.com>
Date: Fri, 26 Sep 2025 14:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
 <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
 <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
 <c3635e2e-3d37-4b29-8ed4-304f9a17cdcf@epam.com>
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
In-Reply-To: <c3635e2e-3d37-4b29-8ed4-304f9a17cdcf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 13:34, Grygorii Strashko wrote:
> On 26.09.25 13:52, Jan Beulich wrote:
>> On 26.09.2025 12:38, Grygorii Strashko wrote:
>>> On 26.09.25 11:17, Jan Beulich wrote:
>>>> On 25.09.2025 21:55, Grygorii Strashko wrote:
>>>> While looking at this, don't we have an issue with CMCI as well?
>>>
>>> I see no APIC_CMCI write emulation. only read.
>>
>> guest_wrmsr_x2apic() has
>>
>>      case APIC_CMCI:
> 
> it will end up calling vlapic_reg_write() which doesn't have case statement for
> APIC_CMCI - write ignored.

Which again is what I had described.

>>>> guest_{rd,wr}msr_x2apic() handle it, but vlapic_reg_write() doesn't. I.e. on
>>>> AMD we would fail to deliver #GP when the guest accesses it, while on Intel
>>>> we would lose the value written. And we also don't set its mask bit in
>>>> vlapic_do_init(). I guess I need to make a patch ...
>>>
>>> Is'n it depends on CMCI capability exposing to guest?
>>
>> Yes, that's part of what I was (effectively) saying.
>>
>>> (have no idea what's CMCI :)
>>
>> Corrected Machine Check Interrupt.
> 
> Looking at:
> 
>   #define VLAPIC_VERSION                  0x00050014
> 
> which means "Max LVT Entries" = 6 (5+1)
> 
> Looking at linux kernel apic.c:
> #ifdef CONFIG_X86_MCE_INTEL
> 	if (maxlvt >= 6) {
> 		v = apic_read(APIC_LVTCMCI);
> 		if (!(v & APIC_LVT_MASKED))
> 			apic_write(APIC_LVTCMCI, v | APIC_LVT_MASKED);
> 	}
> #endif
> 
> Which means Xen never really emulated APIC_CMCI, so wouldn't it be correct to just drop APIC_CMCI?

From the SDM it's not quite clear to me whether using the LVT count is the
correct / only way to determine whether there's a CMCI LVT entry. To me
it reads more like the MCG_CAP bit is what is the basis. Perhaps based on
that we should conditionally set the LVT count to 6 (AMD) or 7 (Intel).

> Also, taking into account that it's Intel specific.

Another part of what I said I think needs correcting.

Jan

