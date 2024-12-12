Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF509EE59D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855888.1268678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhlO-0007vF-5d; Thu, 12 Dec 2024 11:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855888.1268678; Thu, 12 Dec 2024 11:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhlO-0007tW-36; Thu, 12 Dec 2024 11:53:50 +0000
Received: by outflank-mailman (input) for mailman id 855888;
 Thu, 12 Dec 2024 11:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhlM-0007tP-IS
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:53:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id becd8111-b87f-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 12:53:47 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d2726c0d45so896950a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:53:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c74c3casm10210465a12.53.2024.12.12.03.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:53:46 -0800 (PST)
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
X-Inumbo-ID: becd8111-b87f-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734004427; x=1734609227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N4h+zAxTmc1Pv7dONz90Et+cu5Hsh4CG7PbQvWTjvto=;
        b=EtzLHINi/kTWMEEottt3I7nZASSYAeb3bS+tfE6vF/TiE2HCgjn8pEfjL3Eg6xPzJq
         7MjRIdYozmV2Ul6OmmXMc5UAP1rhN2SsfoRWpXn23VUyDED/UUSaO5AT3+/T/kVBTaHK
         V5boiXjbIW57DYqICANbWXrOOi5/mTHelosVMQvm29+9GbfrVmjZvUTdXgIsNcS9OpoA
         X+ZviSvKYSPRepLGTkFN3BtDkQ9ivGFVMwj1LUm5QtslL6pTnY0N0cJRT+Ya/63ZeYQ/
         CaMfy3za0woSlewP/01PXNlfHSHZQDEzb0GNr0dI/KUhnseHDaI1QS9kJXFLqMoHfdTz
         8GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734004427; x=1734609227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4h+zAxTmc1Pv7dONz90Et+cu5Hsh4CG7PbQvWTjvto=;
        b=VfuWoFQcjgxV4Q0ms/4cr+Y65QA31MCL3enpccpyD7q1b5+XYt7v88NZPHGxrxxxDh
         RJ3q+L5sf1pfF7E0TASRGrhaIImjPWeKxyyKHzr40RUoPsPrAn1sSGpEcHv7ZOKk30XL
         pvmNFiqAvCb49nLO2lFx+wUETJRskUWrqaftv0LQuUWFQ4KzL4679Kw0jm+Z9RA7PxTm
         yO+9mlKt1EWdA8jqN4g/JFUadIb3zOjLtf8LaP4JyklxJ6Fi2szQ1kkI226jRjC50Ru6
         CUiu3Z8K0Un8UE4qEnRGFQJZ7s8+14Uwgwnf6+Ei2EmeR93rW+47LEHdcHVZAEs58Ift
         BQag==
X-Gm-Message-State: AOJu0Yy3l2RPAkSjr45dNM0ojpSIRIXVgHFYCyP43JuE2KiZvT6cKakv
	uuB4R4N2Q96Y+fxw7s1wuMOtyJNAG5a6apQ31yl0O7OlSmzLeUB+cATHhhBodw==
X-Gm-Gg: ASbGncvdDpTKNy569ox0gJckX+wmYhZH8KsSWrEUkrIg+wiIjMAd5PWW1m7wVV8iNvI
	aqx8n6g28Hfhk2cssRkfQEMxtuN9b7WfjfeH2ysYBExBqd7M4yuwClZOaxy1Cqy+uNOOTqdZCB5
	UcgaEORkBagPFV/vnhf8MyB62zNLqJfkSs2DjG6yxV19mcItkxXfeJt0HE2rqBGl3jhYnCapRHc
	uNyCKt8ldegpcjoKhD1OAFDip5ZDKa9d28s0W5rUiimlDpyAP5X/3JyPCEdwlYt+Y8v6WC6c0Tj
	2SEKCdfi3sCJ1OYGgEA2UB3xNw33ot7uU+xklGpqsw==
X-Google-Smtp-Source: AGHT+IHkHBWDvIyE6Q3neJIOYD/1G8NSHvC2IvZuUhfZEjy2oV0PSQOXQd4a55v0SG8ZNzg2l2Vy5g==
X-Received: by 2002:a05:6402:35d4:b0:5d3:e4eb:8d1f with SMTP id 4fb4d7f45d1cf-5d4edcce306mr812180a12.12.1734004426923;
        Thu, 12 Dec 2024 03:53:46 -0800 (PST)
Message-ID: <8fa61060-3c00-453e-be47-3a60671dc7df@suse.com>
Date: Thu, 12 Dec 2024 12:53:45 +0100
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
In-Reply-To: <Z1mtigiI-5wkgzhK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 16:19, Roger Pau Monné wrote:
> On Thu, Dec 05, 2024 at 08:41:39PM -0800, Denis Mukhin via B4 Relay wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
>>  
>>      if ( !emulation_flags_ok(d, emflags) )
>>      {
>> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
>> +        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
> 
> gprintk(XENLOG_ERR, "...
> 
> Might be more natural now that we have the macro (together with Jan's
> suggestion to use %pd (same below).

Yet why would we want to log current here, as gprintk() does?

Jan

