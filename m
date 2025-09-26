Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70853BA28A5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131050.1470280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v228p-0005zK-MR; Fri, 26 Sep 2025 06:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131050.1470280; Fri, 26 Sep 2025 06:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v228p-0005xs-JP; Fri, 26 Sep 2025 06:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1131050;
 Fri, 26 Sep 2025 06:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v228o-0005xh-4i
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:41:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5a3310-9aa3-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 08:41:13 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3194020e86so308152966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 23:41:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f76b4sm305704266b.64.2025.09.25.23.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 23:41:12 -0700 (PDT)
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
X-Inumbo-ID: cb5a3310-9aa3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758868873; x=1759473673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=imjnvPcdq+TnzWHoWy3kQ55QTfnBETriswp4UbSSVOw=;
        b=edG3qMCHXCE6jKExtzxxZPKGzSDMYkNwMw8SGRXVdZdwvJfU+cIquK16uGmFZ5c4J6
         6cp/POeoGYBym0lDbkROqB0p4GqIVV9omCCm0tx8ghTuc+InFcHi42xF4rhqhRAWvD72
         FqfHNxXWuNd390HwIg7GgGrq0OgXXrYm9/RiiIavhQnuwPxUDOVJeB2fQ/ddNrrKMrjs
         sZ/26m4bMYZRiFky9nScIkrkaEw3MVZ/x1IKL6/QjD/DXxumAGMtYqeRm5Ri0EUzus7w
         rq5I42bX933XMf8k89SkUm7Jau9YPbzw8HU7Nyz2kJEvQYdNLiAbNIIYgJx+U0CCDCg0
         L/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868873; x=1759473673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imjnvPcdq+TnzWHoWy3kQ55QTfnBETriswp4UbSSVOw=;
        b=WDz5I59KW/ZRJ5fPJ15ROfkUuqSqmAGXQMKIP5ZAGji2FgLksS4q/8RUF+4SS33DAx
         mYIC1hsyb+tTA/tRBjw+irjD1XbvsY49zsMffkFK/IHSRfR6xr0Y6Hxy7VLRLgIf3dcZ
         YT57NlywSr6vWPX1yMjG9fFzVx5HjhPuEQG/FA7hoPum8WDYZVRUIDsn1qsT/BobjkNF
         rIelgaOkyWXh0yVnDQD4IFGv9A1Qq9tWnlSuiG1VV0FdKRJw+EfoWCiz1X4qwC3mopzL
         ZIL/SOv+uzxlsI9EFu3wAtN1EVbRLc441BpH3Mhu0N+clUMejp+0IQFgGxITgQC3rAfZ
         291g==
X-Forwarded-Encrypted: i=1; AJvYcCVBFKFkFOnjHSfTN7P3rhjgadu8rlgbMZnlFI0oHEy5KJzenRe4vgjQSICo1/gZb/yw4pVdtKOyPo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypI6e5PHUEUnmscFv1Of3Q1yw2E+L90MCWHvYawplG0oRfZnco
	BH2if4fOUCa0h9wFcGHCMqJo9NuwUHDtxIsPfOCk+iJylux9/Dvwv7QLfn+zX0ubig==
X-Gm-Gg: ASbGnctgszR5C31zX7lMaNltYWrEuZB4vP6/GjvbCZ3uLdXCKbejJ7QCaMjn/RUWp91
	lHdhLcBlX41iXVzY5n+11EMVsz7mwqCy7ebRgMMvnmtcfM0vAZ5BXVwNnj82xJP/hAhUPxklCkT
	Icc/7EZLfHVaxgCTlufsyaI3MG4Tz750BXi2YvaEVspRXPAFWV2MyHSweTrt0TuAFFVubihex6d
	tUnQ0IMviVqcQkdnImU4hlEJJN4fUUo5xpveBMKmmgul+X6eGMa44C27iQhQe9xmSbJvJ9P517R
	4X07T0T+W/OG3VirKFwPLU249LLc/BDbOX1PYdNdy3N0zmkw1e0mHaWc0TyXq/qYcCtzYObs9mo
	Pq5InhVcGcyfsjqVFG1hxtpdEBlSYAzf6+rDnO2XCh9szrE5p7owUqcw1+OpGo3icHyCShNueI9
	Paw8t71KI=
X-Google-Smtp-Source: AGHT+IFpcLiKxmjxMB4PaIYkjDteFzI1TGx+1meyKHiqpCOZ5CCWwoIP7cpLCveES4u999mEPY9z0g==
X-Received: by 2002:a17:907:86a8:b0:b0a:aa7e:a193 with SMTP id a640c23a62f3a-b34b8d7de70mr672985666b.21.1758868872588;
        Thu, 25 Sep 2025 23:41:12 -0700 (PDT)
Message-ID: <c509276f-1e7d-4cef-81de-dd227a32c7ec@suse.com>
Date: Fri, 26 Sep 2025 08:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/flask: limit sidtable size
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
 <de8380a4-cad9-4589-ae46-8649036186b2@suse.com>
 <7b36e8fe-c19d-40eb-b1d7-d869cdfb1a28@apertussolutions.com>
 <aef15bee-be58-4749-95dc-3f87bc2540f8@epam.com>
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
In-Reply-To: <aef15bee-be58-4749-95dc-3f87bc2540f8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 08:32, Sergiy Kibrik wrote:
> 06.09.25 01:01, Daniel P. Smith:
>> On 9/2/25 05:41, Jan Beulich wrote:
>>> On 01.09.2025 12:52, Sergiy Kibrik wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
>>>>   
>>>>   	  If unsure, say Y.
>>>>   
>>>> +config XSM_FLASK_SIDTABLE_ORDER
>>>> +	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
>>>> +	range 4 32
>>>> +	default 32
>>> When 32 is chosen (i.e. also the default when the prompt is hidden), ...
>>>
>>>> --- a/xen/xsm/flask/ss/sidtab.c
>>>> +++ b/xen/xsm/flask/ss/sidtab.c
>>>> @@ -14,6 +14,8 @@
>>>>   #include "security.h"
>>>>   #include "sidtab.h"
>>>>   
>>>> +#define SID_LIMIT ((1UL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)
>>> ... for Arm32 I expect either already the compiler will not like this construct,
>>> or the latest an UBSAN checker would object.
> 
> you're right, arm32 toolchain is not building this.
> Would the following be acceptable then? :
> 
> #define SID_LIMIT ((1ULL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)

Personally I'd consider this an abuse of the ULL suffix. But it'll be Daniel
to judge in the end.

Jan

