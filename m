Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14995ADE3A7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 08:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018802.1395660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmHL-0006jv-Eb; Wed, 18 Jun 2025 06:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018802.1395660; Wed, 18 Jun 2025 06:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmHL-0006hJ-Br; Wed, 18 Jun 2025 06:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1018802;
 Wed, 18 Jun 2025 06:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmHK-0006hD-IW
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 06:28:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66274080-4c0d-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 08:28:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3058461f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 23:28:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748e8c829a4sm625497b3a.83.2025.06.17.23.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 23:28:06 -0700 (PDT)
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
X-Inumbo-ID: 66274080-4c0d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750228087; x=1750832887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TTVn4Hl64czbo+ZZy1AaXGIeiX0PCzGpyRcEjxxJJYc=;
        b=UMmirXpGRI00asJRJyx7NsQiOwwoanAyGT7Gp1kB3e9iEQdJeIDZofHcySzpY7fZvg
         bu51BCAH5kCO5+WXc+k+PEoQqu/cn/drribkG4VQcDSi/KZiNYepjEM873QxZu32Yegq
         Dek9tsZRdp2SwvIzrgnsI9bJCG+U1mJ/64okGNCgGwBWZ9kZltYq7daweKw8OglQMW3W
         OT6r2Qh+ryVE7J1RKL90G4mnA3ILKlkbz1zl0jeJZCz+/To9MKZp4LsZac8jsNdu6P9I
         lPn/aQrZdXnX/73hUJItp03Unu5H1xIzN+EdLnX/A2P8GtxfsDp8Tw35M9nTHyoG9Hjp
         FRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228087; x=1750832887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTVn4Hl64czbo+ZZy1AaXGIeiX0PCzGpyRcEjxxJJYc=;
        b=mp5UNvWUOQ6ufo3x1dLpakwNftrRKxqvH8J6hFoMseIDHU3Ye/qDzVNnTgGMzg1qWh
         9GC7u9F1zC+o+PLHfBxu/FW7V729mE9b1ii2iq3t5dDp65vS6d0Ceidna4beX6tewvoK
         x+wMUVf345GNulmrgoSl0zQkEVDBD9b5h20Fhj2Xd2D1k7MY0iMg0a+dhrpWs7SLR8EW
         IJWxDCEVKvvwub5o4io7LTk2pgSdCl48P8P2DPB037PWBTHEe4kUQU6qgHA52S9vQRL9
         9oXSilmyWAKvc0w9P9w7zjaQOOpDl4GWqpf08SMCJCYLrDCDppMosmBAXPohXYzLSppe
         oyNg==
X-Forwarded-Encrypted: i=1; AJvYcCWiiEUAYQjx93RHTh7UZ7gLAhMFDWYUcAss/mZn4iPTKXUApTYBxbWHqkd3XydxUix545BrM+/mO30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVqY+uWNuLqLeC3GMoIOxuD9oX7CoDaale9KjTqdwojFwPyJoy
	EP6j4eQMBLIlRQ8pDiK7RlSv1cspzWu0I/9mVmxAnaA3ceKkAuGRzpFDaRu8vu1PDA==
X-Gm-Gg: ASbGncvzlz0nWSRpttO58x9oCDxO/ip9ew7Ui079xWLIAndYUHKy/fQrZmkPuor6P2+
	+30xW8fXk/GZ9djegDnSzpNnUfyuwHmvxDm8iEZAE12cqDW0FSm+oaKHuBuwokGuEtwG4P+R79D
	cWOJX6BfcHZdCdaqoJp2hXYm8Fb3JG8sju+gwi+DHSAevw5ig5VvHu2wnqQRvtmpBHACGQ71SMI
	2Nr8fEfVFNMZSfPgJiwL45K8ew568VrxmhsNpSm9nVJz6539ZSKx/Jr6mntMKLQ1eSL5AX4D5GL
	9gPcDNi6eavlVOG2b6/p6R5hK2OdAymVbn6rIFNPCbJNqaz7WmgmOlO3A3THi2v6dJBpBk/wtP6
	6H9EuWjnyDcaDCf18MsstFG5+fWTrhDmVz7rM9nPTaWuyEt8=
X-Google-Smtp-Source: AGHT+IH6CHj7L2gZtKnioPF+XoHpgOaAE4Sk+6oHuXBf1iy/gcigmFP5syXiz9bey7wFNGLZ0BFuaQ==
X-Received: by 2002:a05:6000:1a85:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3a572e6b9f4mr13606368f8f.37.1750228087540;
        Tue, 17 Jun 2025 23:28:07 -0700 (PDT)
Message-ID: <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
Date: Wed, 18 Jun 2025 08:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
 <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken>
 <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop>
 <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
 <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2025 02:39, Stefano Stabellini wrote:
> On Thu, 12 Jun 2025, Jan Beulich wrote:
>> On 11.06.2025 21:07, Stefano Stabellini wrote:
>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>>
>>>>>>> If virtual UART from domain X prints on the physical console, the behavior is
>>>>>>> updated to (see [1]):
>>>>>>> - console focus in domain X: do not prefix messages;
>>>>>>> - no console focus in domain X: prefix all messages with "(dX)".
>>>>>>
>>>>>> While, as indicated (much) earlier, I can see why omitting the prefix
>>>>>> may make sense for the domain having input focus, ...
>>>>>>
>>>>>>> --- a/xen/drivers/char/console.c
>>>>>>> +++ b/xen/drivers/char/console.c
>>>>>>> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>>>>>          if ( is_hardware_domain(cd) )
>>>>>>>          {
>>>>>>>              /* Use direct console output as it could be interactive */
>>>>>>> +            char prefix[16] = "";
>>>>>>> +            struct domain *consd;
>>>>>>> +
>>>>>>> +            consd = console_get_domain();
>>>>>>> +            if ( consd != cd )
>>>>>>> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
>>>>>>> +            console_put_domain(consd);
>>>>>>> +
>>>>>>>              nrspin_lock_irq(&console_lock);
>>>>>>> +            if ( prefix[0] != '\0' )
>>>>>>> +                console_send(prefix, strlen(prefix), flags);
>>>>>>>              console_send(kbuf, kcount, flags);
>>>>>>>              nrspin_unlock_irq(&console_lock);
>>>>>>>          }
>>>>>>
>>>>>> ... this, aiui, is a behavioral change for the non-dom0less case, where
>>>>>> Dom0 output will suddenly also gain the prefix. Which I don't think is
>>>>>> wanted: Switching focus between Xen and Dom0 should remain unaffected
>>>>>> in this regard.
>>>>>
>>>>> This change ensures that dom0 traces aren't mixed with domU traces when domU
>>>>> has input focus, or with Xen traces when the administrator is in the diagnostic
>>>>> console.
>>>>
>>>> That's what the description also tries to describe, yet I still regard it as
>>>> a behavioral regression in (at least) the described scenario. The hardware
>>>> domain presently not having (d0) prefixed to its output is deliberate imo,
>>>> not accidental.
>>>
>>> If we only consider the classic dom0 and dom0less usage models, then
>>> what you wrote makes perfect sense. In the classic dom0 case, it is best
>>> for dom0 to have no prefix, which is the current behavior.
>>>
>>> However, things become more complex with dom0less. As we have discussed
>>> previously, it has already become desirable on both ARM and x86 to align
>>> on the same behavior. During our last discussion, the preference was to
>>> add a '(d0)' prefix to clearly differentiate output from dom0 and other
>>> domains.
>>>
>>> Up to now, we could easily detect the two different cases depending on
>>> the boot configuration. The problem arises with Denis' patches, which
>>> add the ability for dynamically created guests via `xl` to access an
>>> emulated NS16550 UART that prints to the console. Because these guests
>>> are created dynamically, it is not clear how we are going to handle
>>> this case.
>>
>> Why would this be not clear? We already prefix their output with "(d<N>)"
>> when going the traditional way. The same would then apply to output
>> coming through the emulated UART.
>>
>>> If we follow the dom0less preference, then we would need a '(d0)' prefix
>>> for dom0. If we follow the classic dom0 model, then dom0 would remain
>>> without a prefix, and the new domUs would have a prefix. This would
>>> cause an inconsistency. However, this is what we have today on ARM with
>>> dom0less.
>>>
>>> If Jan feels strongly that we should retain no prefix for the classic
>>> dom0 case, which is understandable, then I believe the best course of
>>> action would be to change our stance on dom0less on both ARM and x86 and
>>> also use no prefix for dom0 in the dom0less case (which is the current
>>> state on ARM).
>>
>> Leaving aside that "dom0 in the dom0less" ought to really be not-a-thing,
>> I disagree. Present behavior of not prefixing the domain's output which
>> has input focus continues to make sense. That requires Dom0 to have a
>> prefix whenever it doesn't have input focus.
> 
> If I understood correctly I like your proposal. Let me rephrase it to
> make sure we are aligned. You are suggesting that:
> 
> - domains without input focus will print with a (d<N>) prefix
> - the domain with input focus will print without a (d<N>) prefix
> - this applies to both DomUs and Dom0

Except in the non-dom0less case, at least up and until there's at least
one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
regardless of the presence of e.g. "conswitch=".

Jan

> - this applies to both predefined domains and also dynamic domains
> 
> I am OK with that. I believe this is not the current behavior on ARM but
> I can appreciate the simple consistency of it.


