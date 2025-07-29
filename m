Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CEDB14E1E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062662.1428388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugk5S-0000KK-7W; Tue, 29 Jul 2025 13:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062662.1428388; Tue, 29 Jul 2025 13:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugk5S-0000It-45; Tue, 29 Jul 2025 13:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1062662;
 Tue, 29 Jul 2025 13:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugk5Q-0000In-Vz
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:09:44 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab846e5-6c7d-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 15:09:43 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b7862bd22bso445922f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 06:09:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f328ef38asm1657015a91.36.2025.07.29.06.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:09:41 -0700 (PDT)
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
X-Inumbo-ID: 4ab846e5-6c7d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753794582; x=1754399382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tDdWknX6Nk4kptj27QZGDgOqAYtWIesykWW6+ZvAEPY=;
        b=PWuPoNyRtBGWppGK3TczGFmGgtIpGVfYUWEi7EjvlkbZgE0QowOD/3VxN+9KE+XCuR
         PehhIL1pYMIvtmprpTLKFuteYneSu/ut77uLJmC/BsS6BfbO9ag5XJflHKNvv2DhiWIz
         4AMGp0TFwyCVZUmagX5cUoUetBHH5S4CknC7aRu+xDNwod868unWoRkvRDrqWEQzPKUS
         zJqinlUf0F4oywoSdcM4hYGUdy5xumhUXT0k93eFmRgjGVRtBb3+oi5Dq2eV3rYmWza3
         zcnBfDOt8CW5XOSExrov/VVx8wpEjPmElyonzorylHXkz7AveWqN0twl21vzN2i7f/3h
         s4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794582; x=1754399382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDdWknX6Nk4kptj27QZGDgOqAYtWIesykWW6+ZvAEPY=;
        b=DD68FTVjr1T/ywqiOjtMG2+PSWCIG8U9B/BuiFl8Xlt02KcJLtsCLoWMcqRoNG+orH
         AO2P3EJd2EniPK19wAqDZ9qZY89GjC0JG3PifZOLDM66Anp8ZDOL1vc4VWqrOmJKD6DZ
         F37U+bqe8H/UvYAtN3kA3WEoU+MmSuK+K3IvqqZaOxa2ALrxYJEsG91RCXh23c34BLxX
         Fi/R0vhxesQmMyuKhSor++seO4Lu5/LA6+e2jFMsw6HjEq/W5S8CTLITrgxeCjk+fGsG
         coO0wEiklaxoj3V6m5Va/XMkOSVqWEmXlOKheiKdxkPmmsBDvcnKKjyIWCxDNNgX8Uor
         1EGA==
X-Forwarded-Encrypted: i=1; AJvYcCWL/Q0RmSIKpg4j4wRL1XxhsLzvPYmFhT9ADD71nQ0/V4aHhly4Jy3MBHVv7aP00QFjk4BxNANvFdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb7CtX4tiXMohvfKwdXChgoAMfdUsOvlzv6LszaI7upym7VfFi
	pB1SStEex5/4kq5msFIsbCVJwZfbMvJi6vIg4pRWLRk7/X7fTd0ifNWUffG+2nohrBBmXRbe9HB
	BI+s=
X-Gm-Gg: ASbGncuZa5dZfYKaMVB7qwXiEuEc2QarJsWvz5yVZuwJDy1DCnJjsYp7VIrYqtm0QWm
	ycOrns2Sr4R/Zul5Vi8FG8PxWwCf3xP6gbosSkcVqvJ9fZh7nwAXJjYowCpRaE8ZPDEitbRQEXR
	QIEN9cAkIalNDGtObp2neVi2VEtngZ3qAv51nrVZUWvRh0HjqAE8WuS3BwChz30LE4BFzszu0AH
	kREVYSvIIox2rY7yelmcrNnhEleiyCmT3K7PMbAqirL9xVwt/hK+kZpCoz/PP5/E+DBQLAzr5wP
	55K0B76qo0U+rD0TCqq0wUv8Z/kuJ8zUSptIQqKvrAs4Q3ztQ5wbBfIIIKHOci2ZjHXkrtct/4A
	R0HOqJAMmJV8v2QUWT2yGuE8np5/X13KMAEkcWzbYfYpOg589H/MVd0qGRIszDPhknKlHbiTJYn
	dvYl06D2w=
X-Google-Smtp-Source: AGHT+IFrerhCCVxesSd/Q4P5RxNpLozdnwbyZ39hiRto5MPxVO3wLXLTQ5Hb8f/K31QrvvV25BIp6g==
X-Received: by 2002:a05:6000:1acd:b0:3b7:533f:cb60 with SMTP id ffacd0b85a97d-3b78e623e0fmr2671559f8f.22.1753794582386;
        Tue, 29 Jul 2025 06:09:42 -0700 (PDT)
Message-ID: <f94586c9-fdf8-4d04-8490-1a9b1a57bcc2@suse.com>
Date: Tue, 29 Jul 2025 15:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
 <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
 <029ca331fd380a855aff95ae9cae799e@bugseng.com>
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
In-Reply-To: <029ca331fd380a855aff95ae9cae799e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 15:02, Nicola Vetrini wrote:
> On 2025-07-29 14:39, Jan Beulich wrote:
>> On 29.07.2025 14:21, Dmytro Prokopchuk1 wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -367,6 +367,13 @@ constant expressions are required.\""
>>>  }
>>>  -doc_end
>>>
>>> +-doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void 
>>> (*)(void *)' is safe
>>> +because the semantics of the 'noreturn' attribute do not alter the 
>>> calling convention or behavior of the resulting code."
>>> +-config=MC3A2.R11.1,casts+={safe,
>>> +  
>>> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
>>> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
>>> +   ref(property(noreturn)))))"}
>>> +-doc_end
>>
>> As I understand it, this is about any function, not just void (void *) 
>> ones.
>> Hence throughout anything textual in this patch, may I ask that this be 
>> made
>> explicit by inserting e.g. "e.g." everywhere?
> 
> Technically yes, in practice other implicit function pointer conversions 
> would be caught by -Wincompatible-pointer-types and similar flags so 
> they don't even come into play. However I agree that adding that is 
> clearer.

Perhaps a misunderstanding: With "any" I meant any which has a noreturn
attribute, when converted to one with otherwise the same signature. But
irrespective of the particular return type or parameter types (i.e.
specifically not just void (void *) ones).

Jan

