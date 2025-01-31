Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB115A2398D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 07:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879840.1290050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkY1-0007bm-OI; Fri, 31 Jan 2025 06:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879840.1290050; Fri, 31 Jan 2025 06:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkY1-0007Ye-Jr; Fri, 31 Jan 2025 06:30:37 +0000
Received: by outflank-mailman (input) for mailman id 879840;
 Fri, 31 Jan 2025 06:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdkY0-0007YY-NH
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 06:30:36 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e07f1871-df9c-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 07:30:35 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so171295866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 22:30:35 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f10a:3123:f9e9:b484:6874?
 (p200300cab741f10a3123f9e9b4846874.dip0.t-ipconnect.de.
 [2003:ca:b741:f10a:3123:f9e9:b484:6874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7e90sm242505266b.11.2025.01.30.22.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 22:30:33 -0800 (PST)
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
X-Inumbo-ID: e07f1871-df9c-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738305034; x=1738909834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1W4c8uBbuL7vMjIiA9qV8VqjX57zd2oaWcyYJ5Ma2m4=;
        b=PxB2EPhvPSsMtYqy8TQHFE7t8CvXDL+YurmcOkxExu7Z/+huHMbG7vSTXQezNzIICS
         +lBIZaNd9bCWE3MuJ8r32wSMKsldSnSndN2auAJekeld/v+P9h/SfsZkOY2VZIwB6E6h
         w+yIYIbaEZIVeiA8MpXuZrxZfgp0uvNN1ztqb5C/T79gsA0A9RrMaCEC/SuSzsiD+VNn
         yXGCQdglKY3lKPiloO0wK1jVR605OCpFCvHJyiEBLIqPcNxQPmliElUixDcyQYyCvmrU
         f4cRZ6BqfdNh3I80SPLffyOMOhWAMtNPMy9qxECJ0uVCM3yQZb5Q7NtrYt0m/MISYImQ
         UB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305034; x=1738909834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W4c8uBbuL7vMjIiA9qV8VqjX57zd2oaWcyYJ5Ma2m4=;
        b=SuOKANPXaXSk1Uz+hG9Kh4ua1Lpi1RWYC81P+uL4v1jTakvoarcWaO5WfvCf2M+gRM
         5fec2PhxzJmz7qWlRCESE8oqX4BitInGYmw5WSeXWZCXDb3tO+jDRjtvn3vUIEe+FYEm
         BpJ7aiW5/qE1e2ROh30O3YJsF+qTBRbPsm+Vb2ewS/7XtXR+bqZW89708M41pli4yWMV
         JymP7fGeq0ppS0ClR+Y3UErGX7vddPIbDWdZjSsdJuYX7+sPYrBeSuZWG4jK7A5/JkB0
         iNexxvEwrM0udDJfCCmiOK5av40tpq6gLi1jNmFGzYGTBawDBr+nqFae7I4iYk3uqrpM
         cl3w==
X-Forwarded-Encrypted: i=1; AJvYcCWoIQjnUa7wyrBGxV8E1xVm16/KEYoTRLIlRJCyXKU6CuWf/mVDOoGZQ+3jc6w/kfo7hPnUkkePA/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzawmNLVEhZEqFLEouW0hUDlUKmzTxwku+pdvsB8kyEEe1LXnW3
	NrL3lc3KJnilJSHeKzpmSSZ/280KYTKPxZeAsVbfHO51ELYmJRvuQ3/zl+EtWA==
X-Gm-Gg: ASbGncu+kJvH0Js1+7TLa2hNrW7C08iiEmJ/qFIauLiyMoIgayT9rcX1u4eus8FI3pE
	ovnbViO1BtUP/0pnUb9+YV73z3ZinZwCeXd6lPlS5XIaTnjgam1PZeFrPZccXLnNplziajv3Wvs
	UcOXsE0nHLYbKORYHowLgS6HbyLwfEgIV1rPc5q6nmEk8aXb1xy6fyvUzI7cev4cJc0jnwBY2D5
	kYSLSUGgWVcL2dg6MLHO6OQsWOgNd5Dhq9k+J3NWn/ZO3wQ/sNrhew8lcEpuU65Vb8gkFATzwfV
	d8JvoQ0FNKotuw3sD+E7JHZsdTuUs+uUuQn/662Kw5Lhr/xuGrTFx2LXRQI+0VqIEBxA9Ig5bpe
	nce3CdTu8ckPJKYk1KZOEEkNy0etCej+WLH8VlYfb5AkuJNKtOw==
X-Google-Smtp-Source: AGHT+IHw9EWsQunkJ67ku6vDrhG0u3Mp0tYaedwIIlSK7KBhJp6NuCZsWpP2wbG5QG2Q3z8h3vh92Q==
X-Received: by 2002:a17:907:7da2:b0:aae:fd36:f511 with SMTP id a640c23a62f3a-ab6cfe4003amr1086413066b.47.1738305034144;
        Thu, 30 Jan 2025 22:30:34 -0800 (PST)
Message-ID: <b850c2b1-5aa9-4e64-9161-ba55028b43a7@suse.com>
Date: Fri, 31 Jan 2025 07:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
 <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com>
 <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
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
In-Reply-To: <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.01.2025 01:26, Tamas K Lengyel wrote:
> On Thu, Jan 30, 2025 at 8:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.01.2025 11:19, Sergiy Kibrik wrote:
>>> Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
>>> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
>>> feature, with mem_access & monitor depending on it.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> I don't think this is applicable; my suggestion went in a different direction.
>>
>>> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Before considering to ack this, I'd like you, Tamas, to confirm this is really
>> what you had thought of. In particular ...
>>
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -37,7 +37,7 @@ obj-y += irq.o
>>>  obj-y += kernel.init.o
>>>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
>>>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>>> -obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>>> +obj-$(CONFIG_VM_EVENT) += mem_access.o
>>
>> ... changes like this one look somewhat odd to me.
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -92,7 +92,7 @@ config HAS_VMAP
>>>  config MEM_ACCESS_ALWAYS_ON
>>>       bool
>>>
>>> -config MEM_ACCESS
>>> +config VM_EVENT
>>>       def_bool MEM_ACCESS_ALWAYS_ON
>>>       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>>>       depends on HVM
>>
>> What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn't that
>> become VM_EVENT_ALWAYS_ON then, too?
>>
>> Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at least
>> documentation purposes, then also gain a dependency on VM_EVENT?
> 
> MEM_PAGING, yes. MEM_SHARING, definitely not. MEM_SHARING is perfectly
> functional without vm_event.

Is it? I see e.g.

    if ( sharing_enomem )
    {
#ifdef CONFIG_MEM_SHARING
        if ( !vm_event_check_ring(currd->vm_event_share) )
        {
            gprintk(XENLOG_ERR, "Domain %pd attempt to unshare "
                    "gfn %lx, ENOMEM and no helper\n",
                    currd, gfn);
            /* Crash the domain */
            rc = 0;
        }
#endif
    }

in hvm_hap_nested_page_fault().

Also - you responded only to a secondary remark here. What about the
more basic points further up?

Jan

