Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BCA6D8F1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925358.1328224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfkG-0004T2-9J; Mon, 24 Mar 2025 11:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925358.1328224; Mon, 24 Mar 2025 11:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfkG-0004RZ-6U; Mon, 24 Mar 2025 11:13:28 +0000
Received: by outflank-mailman (input) for mailman id 925358;
 Mon, 24 Mar 2025 11:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twfkF-0004RT-9u
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:13:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00ecd397-08a1-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 12:13:24 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso27653825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 04:13:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b260fsm10484684f8f.43.2025.03.24.04.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 04:13:23 -0700 (PDT)
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
X-Inumbo-ID: 00ecd397-08a1-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742814804; x=1743419604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZDS24/aSeOVFEIRPeJ/rQUQ4NsPW0uilj/68iYsb4E=;
        b=aQOi/prZBKt5LyMNrznyIWhCWzttNt4o39dU/UGpV0xhIOZZ5toU+1aqm/4Kgc0Qob
         VT0oyU6LgvyilZ80n42cMoBmly10GV9Vf4oKUage71/e5rahsq5CB3E5cvQa44MdSQ/O
         Me+IKSav/AX0o2nD7diVHGk576Efxect0BgqeLyvOZXplzh1IwknYlmdHCOcIL4hKFD9
         jgiUn4MdP8rP+x+7S0SiO5gYgoyQilYV+pkNRcbc9Cifs0sYaq1N00csD0dU4HROC5wJ
         +nCcrNzPt8jRZe1xqNYGO3LWCOqTpWR1P+enFGuEw55imJuCJ+zu+LiF2i6CX1vUKeE/
         t3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814804; x=1743419604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZDS24/aSeOVFEIRPeJ/rQUQ4NsPW0uilj/68iYsb4E=;
        b=JrvGYWDBZxpODz5W1MJXEbPKkaQw0MnSCHRgpoSmSNQHxP/tNA6ip1rxkut9m+w7yU
         AQabCOJfKOyS50HSmL9d640IF7bGmWljWeI8KMxSX84N7u4X8gJpxIa4oFZSJOFJtaI2
         n9hTIHNTy0JbaArflobrcHK92keNiOSBt7ah1B/8YjoYk/8i7j10XUX8IqOBX+pI7deT
         DL/rayn8mdeItGUq3V04UL0Y2tvdyfzLHcpgw7IDGh1dp5KYpCeMX4n0AdIbi0yryEDO
         PyDHOHLzpNiV7q+HcchOvYpyIbo3krLnKBUjD5NwUPkjRwal4hhczaRry5RZept2sHh+
         VsTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQANS3HMv0rG7TKMDv8QQWRgylC9hDfZASxH0obrli3tqPPdsQlUlSZwqPi587f3E3RnigoFiNVTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx0bRNLPKjpvCKNttr+yfmvefILFSzGdgXE7px5LCk/ib5u/K5
	h6k6Ax9YeMJ2wwosg98jQ72RkXKgA8262E20sTQWr3Il6QHHuzKRG9+Lpc6d0A==
X-Gm-Gg: ASbGncuVv92VnGkgMMASEqGPKQPCjaU4Cu49Sd/x9ECd5e2Ng395eGDXctxyCL/aeya
	aMNnpGNdNi4F3NkqoRysP1gU0ACxQctUjGtIks4FbOPjPVDKAIN6VTKPp4lEjstI33SZ3mmti1P
	Bo6uHSm+We7XgS/8Zp0kUirjFWo5mIofAzJ1pYnCvKsYcd0FWvv2ubF37Dt0m6NcRg5MYuitK+b
	EpCR/zf9i5hybX5I79tb2zAk3IHD2lgLUqN5pAb20aVaJNIPXv9RqMdSrif5TQ1TT7WH4TJjFF1
	bU98ZdDrTpemPNNYml05r+S9ZRUyTG/Nl2SrC9ekKh9R8tBQH28BFo2Xxq2OP1baGVRkyNHmpdP
	yfsQrw1FD7pHtAQzKLQscPooJOjENNA==
X-Google-Smtp-Source: AGHT+IHICZAAFIBJIUp23U8erl9kMgKQUGN9DEfE1pCiJazCerX/UmMmWmiD0pffm825M1UID00e/Q==
X-Received: by 2002:a05:600c:1d9f:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d509ec4b1mr135132575e9.11.1742814804293;
        Mon, 24 Mar 2025 04:13:24 -0700 (PDT)
Message-ID: <d7954b37-d97f-444b-ba9f-4a3425b5ad4a@suse.com>
Date: Mon, 24 Mar 2025 12:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mirela Simonovic <mirela.simonovic@aggios.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
 <428f538a-0761-4d06-9c4f-ba74cf441b0d@suse.com>
 <CAGeoDV9Tgd1MhVutbKhWRJkMMMix5yFVRcA6vX=fP=fzqFdV1w@mail.gmail.com>
 <da301d1e-a6c7-49e1-be57-db844915ef09@suse.com>
 <CAGeoDV-2cHiLSXSZLd+Fz7G+Fw6N9Uh5u9v3Emb1ZT8U_1pdxQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-2cHiLSXSZLd+Fz7G+Fw6N9Uh5u9v3Emb1ZT8U_1pdxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2025 12:00, Mykola Kvach wrote:
> On Fri, Mar 21, 2025 at 4:04 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2025 10:50, Mykola Kvach wrote:
>>> On Thu, Mar 13, 2025 at 5:34 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>>>> +void watchdog_domain_resume(struct domain *d)
>>>>> +{
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    spin_lock(&d->watchdog_lock);
>>>>> +
>>>>> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>>>>> +    {
>>>>> +        if ( test_bit(i, &d->watchdog_inuse_map) )
>>>>> +        {
>>>>> +            set_timer(&d->watchdog_timer[i].timer,
>>>>> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
>>>>
>>>> The timeout may have almost expired before suspending; restoring to the
>>>> full original period feels wrong. At the very least, if that's indeed
>>>> intended behavior, imo this needs spelling out explicitly.
>>>
>>> It takes some time to wake up the domain, but the watchdog timeout is
>>> reset by a userspace daemon. As a result, we can easily encounter a
>>> watchdog trigger during the  resume process.
>>
>> Which may mean the restoring is done too early, or needs doing in two
>> phases.
>>
>>> It looks like we should
>>> stop the watchdog timer from the guest, and in that case, we can drop
>>> all changes related to the watchdog in this patch series.

Noting this, ...

>> Except that then you require a guest to be aware of host suspend. Which
>> may not be desirable.
> 
> I think this is not a problem; at least, I don't see how the guest
> could be aware of the host suspend.

... perhaps it is me who is confused, but: With an unaware guest, how can
the stopping be done from the guest? I.e. ..

> For now, we have three cases:
> 
> 1) The guest is suspended (actually paused) because the system
> suspends, and we pause all non-hardware domains.

... in this case in particular, which this series is about aiui.

Jan

> 2) The guest is suspended via the `xl` tool (x86 only, at least for now).
> 3) The guest requests S2R via `echo mem > /sys/power/state` or
> `systemctl suspend`.
> 
> Let's review all these cases:
> 
> 1) There is no action required here; it should be handled correctly by
> domain pause. However, I think it is not handled properly right
> now—but that is not an issue with the current patch series.
> 2) There are potential problems here. We should either notify the
> domain that it will be suspended (which is hard to implement and the
> guest will be aware of the host suspending) or suspend watchdog
> directly during the execution of `xl` commands (more preferable).
> 3) As far as I know, if `watchdogd` is running, we can simply add an
> action to it on suspend/resume events (need to review not Linux kernel
> cases). In the case of the Linux kernel driver, it already handles
> suspending/resuming the Xen watchdog correctly.
> 
> So, if I am not mistaken, we can drop all patches related to watchdog
> suspend in Xen until `xl suspend/resume` for ARM64 is implemented. For
> other cases, we should handle suspend/resume of the watchdog via the
> `watchdogd` service.
> 
> Note: As far as I know, only the control domain has `watchdogd`
> (though we could potentially set it up for other domains). DomUs can
> only use the Xen watchdog Linux kernel driver.
> 
> ~Mykola


