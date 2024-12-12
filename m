Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B029EE717
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856019.1268779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLieP-0002ob-EF; Thu, 12 Dec 2024 12:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856019.1268779; Thu, 12 Dec 2024 12:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLieP-0002n7-B1; Thu, 12 Dec 2024 12:50:41 +0000
Received: by outflank-mailman (input) for mailman id 856019;
 Thu, 12 Dec 2024 12:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLieN-0002OP-No
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:50:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b005e851-b887-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 13:50:38 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361c705434so4001935e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:50:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436255a0d5dsm15851425e9.27.2024.12.12.04.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 04:50:38 -0800 (PST)
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
X-Inumbo-ID: b005e851-b887-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734007838; x=1734612638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1IZaOfCpSXmNRz9T25v+4RtngXkGHxE0MxkPcywNabk=;
        b=NvR19gDk9tudhZ91bS6znXiydjQ7TkJdjX5PjL1m1Uu7tTvtcgtuhk96H74bCNGTy7
         w9q2VO0Ko3PzPmCBGkMjXYqQ7bxO+GZQIAMj6WFhqsLEpNfKA5wkfWqi3bO9Si6TtEPH
         BJXVk69Id2UYj6VNlg4jw07EUSu1vdDoM/rmCiZnGxhNU6+NmyRkgS/Eg8ukh4IrUUgj
         w+SIRgKzBxVyuF7HDGvxZmnbKpawmSnIUkPvlrFCkwxi+xWYrYaepYI/HO1QGTJcsWT7
         OKjzHrShSjptroaZOgzcUWzoGHmkjOtKYMP6F6Qr1DfqTgl6uN3o70ZMvcBOV2zfvSTq
         SQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007838; x=1734612638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IZaOfCpSXmNRz9T25v+4RtngXkGHxE0MxkPcywNabk=;
        b=eEZ9TJLc171tDLrTfDPBVTyV8bkA1pbQlHCfoH+StDmUrr8NLqxOgK1Tf3K0f5GVuK
         XtJvBvHHEGd09zslaba2E9LXJqQ3SleoHIb8cKpmIy1W40JwYYV2FPU5hkflJM2TOouj
         Rk1xChsLVJjZpt04+nFPQ96m/Zdep3Y8/shubUAhAC5UQwoNFTs5uvDVCyJwQ5FzHm5Y
         CtlsRvthin/lNDRvml51DN/UM+GZvcqJMfsfLhfsB/sThdWmawVNC4T0e7+Et1FCB+tz
         owz90DGclBAypbwxoA8jcc6+Iy6RLmz1aSxPhz/MK0NwQxb/FWx5p3NgIXsAdZYcyKaa
         foDQ==
X-Gm-Message-State: AOJu0YzvbXA5TmMwPrxkeb7Ga3SUrgLCblNpw7JjeUvvG/xWMvy02Q8T
	lncssM+A8FHu9GRAKms/LDXpaTCF5amjWJUwOjkHDnyjNcHFXZT/OR+S6fGa0Q==
X-Gm-Gg: ASbGncvtfmOX8/67ytqpuMIN70hPEcMrxX4PpUE4OJ40PE/13aIMeEqPgM+GANMV912
	cawoAPv1A8YQnR9KjihTcml9YlnUei5LPUzXgaG/zTrsqkNWQ8Lt+aQM3DBtMVXpH6yI/as+pxA
	G7cHFUxiJr1B35a0hgN7fmqAItYFpaILdqG8NT3wiBP+hxWGK4yOd/v9/YoAWZdxf7aCZGWEZRw
	EvF+flmcai4JOUMIMk8+yZifurKVHX4GJuWkSYM3cM1fWbg2/vXT4VKnHOPn5+DCibAQtxVeE3b
	puuqYJ0Rpao9JsbPipbkwZ6Q41TgubSo81HAB+I+iA==
X-Google-Smtp-Source: AGHT+IE5mgvC3wcWPfXRAByN8Ui8HW4lS3g0GfshOv21HDxwQ+AzMR+KkWeSy6hMwpicNkRuQcslzA==
X-Received: by 2002:a05:600c:4e4b:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-4361c429603mr43454745e9.28.1734007838414;
        Thu, 12 Dec 2024 04:50:38 -0800 (PST)
Message-ID: <89735894-2f3f-4723-921c-2e1b4b455469@suse.com>
Date: Thu, 12 Dec 2024 13:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
 <Z1mtigiI-5wkgzhK@macbook.local>
 <8fa61060-3c00-453e-be47-3a60671dc7df@suse.com>
 <Z1rS5CdF9NpXDmFu@macbook.local>
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
In-Reply-To: <Z1rS5CdF9NpXDmFu@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2024 13:11, Roger Pau Monné wrote:
> On Thu, Dec 12, 2024 at 12:53:45PM +0100, Jan Beulich wrote:
>> On 11.12.2024 16:19, Roger Pau Monné wrote:
>>> On Thu, Dec 05, 2024 at 08:41:39PM -0800, Denis Mukhin via B4 Relay wrote:
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
>>>>  
>>>>      if ( !emulation_flags_ok(d, emflags) )
>>>>      {
>>>> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
>>>> +        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
>>>
>>> gprintk(XENLOG_ERR, "...
>>>
>>> Might be more natural now that we have the macro (together with Jan's
>>> suggestion to use %pd (same below).
>>
>> Yet why would we want to log current here, as gprintk() does?
> 
> Right - I've forgotten that gprintk already prepends %pd.

FTAOD: It's %pv and logging current, which isn't what is being logged here
(an incoming struct domain *).

Jan

