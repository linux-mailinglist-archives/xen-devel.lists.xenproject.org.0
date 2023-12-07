Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0198085B3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649760.1014618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBpt-0003d9-PO; Thu, 07 Dec 2023 10:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649760.1014618; Thu, 07 Dec 2023 10:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBpt-0003bR-LZ; Thu, 07 Dec 2023 10:42:29 +0000
Received: by outflank-mailman (input) for mailman id 649760;
 Thu, 07 Dec 2023 10:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBps-0003Zy-0Z
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:42:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f0184ff-94ed-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 11:42:24 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bfe99b6edso598986e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:42:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s16-20020adfea90000000b003333bd63792sm1093472wrm.117.2023.12.07.02.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:42:24 -0800 (PST)
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
X-Inumbo-ID: 4f0184ff-94ed-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701945745; x=1702550545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C9o94U9FucqyeIDpMPVVoTggLZbaDgC5Qr3jrS8jT2o=;
        b=g2yqtv2pLByfypnjTOUUY8MyN8o8z80uHnmTDKK2kaupBtzWZfsqsixcf9GUJYf0b1
         b8/Atju7f9eh5C8htDlEeQZ9OZjMTHECW9l/fJq70GHARZ66ttfrj3usdPPYEk8kstBQ
         0jY3kBOXSpT/Tp8FgEvbyTSNkk2DncPz3npR9Ewyrs9MgZtH6ZYeDX0Wq/7np2S1PuVk
         BhLbtFdZ4bWaTCizoDuoFVf/PknRrD6fMM5DElMF//Dzzcxov5fkoh07a88/GKmUFcop
         /6wx8xI8b3PU91Cxtj1xKLzuRUHnB0joDjUlU8P6fEQjNszZPFPrNM251fLk1WBcT5Xe
         Mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701945745; x=1702550545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9o94U9FucqyeIDpMPVVoTggLZbaDgC5Qr3jrS8jT2o=;
        b=cUsAQIUbHBufzRdVeicqx8pP9XuKCj0GyzmSDpGhFpqwV7Wo+aMQnOPUTNc+MsqhpH
         /PQ5P8DJ0kCY5I9fNWX6Rg1OjJtyTxz4/cc+eNHxYOf27pwVXO3Gg6EQyUg0B/48TaKR
         ovNEDhowmgvBAti/HumcAqtdHz7bN2+rht1s2DnWBJCLxyjIpV5H4ZvCK+/4sfMYFicQ
         URQo/tdWQSwiqHvsXPdDm071onPENC8rb4fuJQl9WhVzq6hbH0LbLLgKau9uLbOGO6xp
         +w5R5mAhCwcYJNTJuuTBlhkbruIX3oK/f7aaw/P8c/gAr7iNYJ7ChJLpB7ujIewttKUv
         jw5g==
X-Gm-Message-State: AOJu0YwDv6kb7T0ycXuHD/QzWaknir5A+ONnzlCUKGLru0QJE1dpTrrF
	UIXQddUk8c/1V5WDkfY1MA3v
X-Google-Smtp-Source: AGHT+IH4fWe9RpL9yXNv+ImxzFQdRKBKO/vh7tmYs/I5fcXDTfRtY7Fd1lJRrJIoh3r+XPp0WjD5RA==
X-Received: by 2002:a05:6512:3481:b0:50b:e980:9cd with SMTP id v1-20020a056512348100b0050be98009cdmr1212342lfr.75.1701945744807;
        Thu, 07 Dec 2023 02:42:24 -0800 (PST)
Message-ID: <77e17b59-25d9-455e-b3da-b50bb524614a@suse.com>
Date: Thu, 7 Dec 2023 11:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/acpi: remove acpi_pic_sci_set_trigger()
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <f0c7d42c12a0b89c61265cdfe67a35b07d220aa0.1701936906.git.federico.serafini@bugseng.com>
 <2205366c-c66a-419a-9232-ec41432127c1@suse.com>
 <f6245172-d094-411e-9edf-6912129abe18@bugseng.com>
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
In-Reply-To: <f6245172-d094-411e-9edf-6912129abe18@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 11:09, Federico Serafini wrote:
> On 07/12/23 10:19, Jan Beulich wrote:
>> On 07.12.2023 09:47, Federico Serafini wrote:
>>> Remove apci_pic_set_trigger() declaration: there is no definition and there are
>>> no calls to such function in the XEN project.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> A reference to the offending commit would have been nice, the more that iirc
>> I had already gone and fished that out for you.
> 
> Is it correct to use Fixes: <id> ("subj") even if there are other
> useless entities left?

It was specifically because of being uncertain in this case that I didn't
mention a possible Fixes: tag. There's no breakage from stray declarations,
so it doesn't really feel to me like a "fix".

> In particular, this is what I think should be removed:
> 
> Functions:
> __acpi_acquire_global_lock()
> __acpi_release_global_lock()
> acpi_save_state{mem,disk}()
> acpi_restore_state_mem()
> acpi_enter_state()
> {save,restore}_rest_processor_state()
> 
> Variables:
> acpi_wakeup_address
> 
> Macros:
> ACPI_ACQUIRE_GLOBAL_LOCK()
> 
> If you agree with me, I can propose a new patch which includes such 
> removals and refers to the offending commit with a Fixes.

I haven't checked the entities above, but yes, I agree other stray
declarations would want removing as well. In fact I was assuming that
removal of just one item meant no other stray ones exist (right here).

Jan

