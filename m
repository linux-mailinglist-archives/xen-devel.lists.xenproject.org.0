Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118319EB66A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852870.1266542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL36x-00086P-O0; Tue, 10 Dec 2024 16:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852870.1266542; Tue, 10 Dec 2024 16:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL36x-00083g-KA; Tue, 10 Dec 2024 16:29:23 +0000
Received: by outflank-mailman (input) for mailman id 852870;
 Tue, 10 Dec 2024 16:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL36v-00083a-OI
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:29:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e89ad5a4-b713-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 17:29:20 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so4279495f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:29:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd3891dc95sm5975595a12.42.2024.12.10.08.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:29:19 -0800 (PST)
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
X-Inumbo-ID: e89ad5a4-b713-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733848160; x=1734452960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5lnSf05nwTVWJKi+tgZCBqtG2UysvUg321LfM1SKTFA=;
        b=FGAOzSy1JtE4L2Yajd709ZsiDrfjSOm5Xt7+eLq27Q5bWruQKH+kjfjzwZlAJxiVUr
         3rNkZ2DimtsK9bBsDdUcTGRccNzfBkwJKDvHzneiBsNgOLCaoCiXTQ6VqpwoEbuwsYcw
         303oyR5OU5fX8GadNihf0LINYmryrB7AQIXxs1Aq9Hdk8Wks+eptBY1/jZ21qizy7Sr8
         zeNadbNm6zm9quZWjyd7JEMNRmz7NMXbSgWdk/CefDmfuCuOgOfgVNlepfIH7ZuDLmP5
         h/BDi46hw+wuJfo+F7UeY6c5qOD3MDl8TwkN1L6i0ymh5uPMxuIRvEyxgBVdPQu8jA+o
         REWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848160; x=1734452960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lnSf05nwTVWJKi+tgZCBqtG2UysvUg321LfM1SKTFA=;
        b=JanKXyq+vzjeHiljNGNA7uIIqqdcgGZqK1ToLPs+8U+JGdtMYjIs7u+0XuNQkDJiOe
         DCvA/fv/AIlcS5gORYgJ9bgv3lUHNU5jP5FIMtKSS0Bm1ktKZDJyFkwE/soekc9r/2Nx
         zP229pJTW6yno987D+eA4h/DFq8s2dkfCHCsg0mNSdfUBLVERKkIlVyL9G4Dh7jLkYUD
         OUECHLLOavgJsbOLY7u3XlpSMdc+JWOd9sqkUxmjWEzNK0ugrmYMAPE7KyiFJzSSvDKT
         q4oJb4tqWeKn0fiaHA85a+wR+9IPKM+iJyGynTUAKh4O9op80oLDHjec9NGmG3STytsE
         fBWw==
X-Forwarded-Encrypted: i=1; AJvYcCUgf4l33cDdoUsDtVfBgK8SH6jawt+QCNQBicUk1Bkx99gsPDUipUXJ5bViYji8Zg1kqKF3aR8dzE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ5yMVBhQAnqN43jka2yXdADSkKBsZXggDvJoVBUe8PFNvZMMf
	Qy1u2DaZmqw+Pw20xEHH84VKCTQX6ACK8jZY2fUnBumn33cEqhgiNk1mwLPzLg==
X-Gm-Gg: ASbGncsZUCeKRcapZP2Srt2Y5dEScix61eQcxZvQEFMBYckplbNvgjUqPcYkBSc1N6q
	h7AuXwBLmFoJO5q0mWqdCvwy0zzllH29jRJc3hAPVdWl0TyaQDl+S7AL0ECoCnvBCGH2KoqoK9V
	ATat9TXAcWY+GiGqf+vSdpunpYbcbn8mLmOiT14u93Lyu7doQGbkgMPy6JbRxaY2b69FJWLMWGF
	e5cJ0mNTtNNXg8fugwKVAdTZiCd6OFDWJhDce9mp6lXVidyYwcfDI6EzpHhqZ/2+VIZL0AxhpMN
	aRr/TJxyE1yUCrwtbZ/iFytCXT8c8bt5N0qXhpc=
X-Google-Smtp-Source: AGHT+IFuf9JNaiEBCW5wCIJN0XU5iIw+DLOP0RrU+9KfGH8ZJMiDC8PTcE+u/8gVRyz29nrzQgJigQ==
X-Received: by 2002:a5d:5983:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-386453fbb9cmr3909104f8f.44.1733848160226;
        Tue, 10 Dec 2024 08:29:20 -0800 (PST)
Message-ID: <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
Date: Tue, 10 Dec 2024 17:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
 <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
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
In-Reply-To: <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 16:52, Jürgen Groß wrote:
> On 09.12.24 18:04, Jan Beulich wrote:
>> On 06.12.2024 14:02, Juergen Gross wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -192,6 +192,54 @@ static void domain_changed_state(const struct domain *d)
>>>       spin_unlock(&dom_state_changed_lock);
>>>   }
>>>   
>>> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>> +                                  const struct domain *d)
>>> +{
>>> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
>>> +    if ( d->is_shut_down )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
>>> +    if ( d->is_dying == DOMDYING_dead )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>
>> The public constant saying "dying" isn't quite in line with the internal
>> constant saying "dead". It may well be that Xenstore only cares about the
>> "dead" state, but then it would better be nemaed this way also in the
>> public interface, I think.
> 
> Okay, I'll rename it to "XEN_DOMCTL_GETDOMSTATE_STATE_DEAD".

Well, maybe have both DYING and DEAD, even if Xenstore right now needs only one?

>>> @@ -866,6 +873,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>                   __HYPERVISOR_domctl, "h", u_domctl);
>>>           break;
>>>   
>>> +    case XEN_DOMCTL_get_domain_state:
>>> +        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        copyback = 1;
>>> +        ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
>>> +        break;
>>
>> Especially with this being a stable interface, surely the two padding fields
>> want checking to be zero on input (to possibly allow their future use for
>> something input-ish). Then even the memset() in the function may not really
>> be needed.
> 
> I'll add the check. Removing the memset() is a little bit doubtful, as this
> might result in leaking hypervisor data e.g. in case a domain isn't existing
> (this will copy the internal struct to the user even in the -ENOENT case).

Which internal struct? The function is passed &op->... for both parameters.
And op is fully copied from guest space.

Jan

