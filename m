Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB96AE1398
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020577.1396724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUuN-0007C0-RM; Fri, 20 Jun 2025 06:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020577.1396724; Fri, 20 Jun 2025 06:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUuN-0007AH-Oe; Fri, 20 Jun 2025 06:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1020577;
 Fri, 20 Jun 2025 06:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSUuN-0007AB-3q
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:07:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d60bf187-4d9c-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:07:25 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso1278612f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:07:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86518b2sm9481185ad.152.2025.06.19.23.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:07:23 -0700 (PDT)
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
X-Inumbo-ID: d60bf187-4d9c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750399644; x=1751004444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SA1FPn6AKM8E0dtTkAunz+/79tKrkDFOEgS2rFJshjo=;
        b=GZxo+J0fTeD+Mc+6X4oNOsBAjKG7RyFouNauhO6Jy+Xg511a0WPeVUn1hEaS2iErv3
         tMJTdJJzYPd0tg0sM6fZHYG3lrYqHDCkQMhym/eGojLWSjkZV8o7rEaCSqAW2wtVLXpX
         5bzV76oIDnEnUyxmPsLa/Sq1so0i3J4F+8n4ZQ6zIHJonSxyc7tQvWdv8/IJsdv0J7rE
         Otx6uZ7RepoRRWyNCQxs9tucnzgB7TwDCg0sc5R7ZkigyNNhOk7QUUNa8NGhUEdi8Tm9
         s6ylnNIFcrBjsFuf/Zl319OS0Fxd2vJ6GXTusTKbTzVROaomMOFg/XsNkvema9SYr+FG
         vEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750399644; x=1751004444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA1FPn6AKM8E0dtTkAunz+/79tKrkDFOEgS2rFJshjo=;
        b=s182HMhaAxpswEzfDNyuHtJXbxYgIibOctbev5HeYFYePHaDXpP5yje8Ds7m8Il62A
         3fu1SMFzm67uOyNZAt+H2I0lsEQ5ni8VaMM4JR5Bq2JRQBOgtDeDPiEo6tYtGEvDe5iw
         4nfvefPWz3XNS6WEHjjAAODIJ6Dt5mkbtjFaPsYG0QBUKQh4zvAHjyKKvuBc9vygejB1
         JIq1V1GTa+KzLXLmD+HwbhgyJoePiRoT9/o0IqnQg1OZDmfjcUsdDuKzoeLskprq8DL6
         WdWhFpi/6sd0CwI9pFoiZNKLdZKABtJxW2YJ3PDhmfsN9j7esx2v7zjz8epUedlSkHD1
         SxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXxYoNiKFTyWLDdBL6iJnzPXUCmV6pbviFpOgmW0Ud+Y56LjID6qY0bd8FZzFQ0oLsXyzW9zhNNQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3e+2/G+K8jZXrFBm0m8FWYVjMco4sTXFTTEEfYVAA09J7d3jo
	MTN4gBYOGiJGa4yDUysa32NGhwK8808hkecANil80VId6f1B6hPQ6AI+k3Ayo+nF4w==
X-Gm-Gg: ASbGncshA23m0Am9uEnXa4FYQkZ2ts8NT82Vt0IJ+XR4x2GjLcQbsTJWFx6xfftzx/6
	Q4/ywGjN05O21iyHBpxS7Cisuds1x80/kcQfunEC0JOsxzO0rBjZNWE0ZPga/x/aamclyTr3GMx
	6fqmn/LBXSRcVXRIq47piy6xCJprvwytL7U7ZLZYef21wN5yaaDiXxBo5uiYHzxNv3GvfheELmD
	AAT6SjXso6WaUUkP/LonWmqte0clPHflyK02zEQcy8sUGpCwssNwG9uuyx5V13d+4Ek7hVvQD0g
	wHS5AaHc6LU6QGVbC6kycyM4dkCASnKjNwljrcDp+IF2bG1Ea5GgxhEVqHSfDNjUdgKLNlRGnFO
	XcjtoDzvhyM6NUlRmDaazXj7caG6P5GRe4GjnXTSFEDDUZKk=
X-Google-Smtp-Source: AGHT+IHSx8XGwumblfyI4FHK6xe9nojpydZbH66fLatZ2pTtVaSux5TljF7AuyH+q7fipfIj64gU/w==
X-Received: by 2002:a05:6000:290d:b0:3a5:2848:2445 with SMTP id ffacd0b85a97d-3a6d12e3666mr1054832f8f.16.1750399644313;
        Thu, 19 Jun 2025 23:07:24 -0700 (PDT)
Message-ID: <15db8155-3d3d-41e9-92be-957067a34e5f@suse.com>
Date: Fri, 20 Jun 2025 08:07:13 +0200
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
 <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 02:45, Stefano Stabellini wrote:
> On Wed, 18 Jun 2025, Jan Beulich wrote:
>> On 18.06.2025 02:39, Stefano Stabellini wrote:
>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>>>>
>>>>>>>>> If virtual UART from domain X prints on the physical console, the behavior is
>>>>>>>>> updated to (see [1]):
>>>>>>>>> - console focus in domain X: do not prefix messages;
>>>>>>>>> - no console focus in domain X: prefix all messages with "(dX)".
>>>>>>>>
>>>>>>>> While, as indicated (much) earlier, I can see why omitting the prefix
>>>>>>>> may make sense for the domain having input focus, ...
>>>>>>>>
>>>>>>>>> --- a/xen/drivers/char/console.c
>>>>>>>>> +++ b/xen/drivers/char/console.c
>>>>>>>>> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>>>>>>>          if ( is_hardware_domain(cd) )
>>>>>>>>>          {
>>>>>>>>>              /* Use direct console output as it could be interactive */
>>>>>>>>> +            char prefix[16] = "";
>>>>>>>>> +            struct domain *consd;
>>>>>>>>> +
>>>>>>>>> +            consd = console_get_domain();
>>>>>>>>> +            if ( consd != cd )
>>>>>>>>> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
>>>>>>>>> +            console_put_domain(consd);
>>>>>>>>> +
>>>>>>>>>              nrspin_lock_irq(&console_lock);
>>>>>>>>> +            if ( prefix[0] != '\0' )
>>>>>>>>> +                console_send(prefix, strlen(prefix), flags);
>>>>>>>>>              console_send(kbuf, kcount, flags);
>>>>>>>>>              nrspin_unlock_irq(&console_lock);
>>>>>>>>>          }
>>>>>>>>
>>>>>>>> ... this, aiui, is a behavioral change for the non-dom0less case, where
>>>>>>>> Dom0 output will suddenly also gain the prefix. Which I don't think is
>>>>>>>> wanted: Switching focus between Xen and Dom0 should remain unaffected
>>>>>>>> in this regard.
>>>>>>>
>>>>>>> This change ensures that dom0 traces aren't mixed with domU traces when domU
>>>>>>> has input focus, or with Xen traces when the administrator is in the diagnostic
>>>>>>> console.
>>>>>>
>>>>>> That's what the description also tries to describe, yet I still regard it as
>>>>>> a behavioral regression in (at least) the described scenario. The hardware
>>>>>> domain presently not having (d0) prefixed to its output is deliberate imo,
>>>>>> not accidental.
>>>>>
>>>>> If we only consider the classic dom0 and dom0less usage models, then
>>>>> what you wrote makes perfect sense. In the classic dom0 case, it is best
>>>>> for dom0 to have no prefix, which is the current behavior.
>>>>>
>>>>> However, things become more complex with dom0less. As we have discussed
>>>>> previously, it has already become desirable on both ARM and x86 to align
>>>>> on the same behavior. During our last discussion, the preference was to
>>>>> add a '(d0)' prefix to clearly differentiate output from dom0 and other
>>>>> domains.
>>>>>
>>>>> Up to now, we could easily detect the two different cases depending on
>>>>> the boot configuration. The problem arises with Denis' patches, which
>>>>> add the ability for dynamically created guests via `xl` to access an
>>>>> emulated NS16550 UART that prints to the console. Because these guests
>>>>> are created dynamically, it is not clear how we are going to handle
>>>>> this case.
>>>>
>>>> Why would this be not clear? We already prefix their output with "(d<N>)"
>>>> when going the traditional way. The same would then apply to output
>>>> coming through the emulated UART.
>>>>
>>>>> If we follow the dom0less preference, then we would need a '(d0)' prefix
>>>>> for dom0. If we follow the classic dom0 model, then dom0 would remain
>>>>> without a prefix, and the new domUs would have a prefix. This would
>>>>> cause an inconsistency. However, this is what we have today on ARM with
>>>>> dom0less.
>>>>>
>>>>> If Jan feels strongly that we should retain no prefix for the classic
>>>>> dom0 case, which is understandable, then I believe the best course of
>>>>> action would be to change our stance on dom0less on both ARM and x86 and
>>>>> also use no prefix for dom0 in the dom0less case (which is the current
>>>>> state on ARM).
>>>>
>>>> Leaving aside that "dom0 in the dom0less" ought to really be not-a-thing,
>>>> I disagree. Present behavior of not prefixing the domain's output which
>>>> has input focus continues to make sense. That requires Dom0 to have a
>>>> prefix whenever it doesn't have input focus.
>>>
>>> If I understood correctly I like your proposal. Let me rephrase it to
>>> make sure we are aligned. You are suggesting that:
>>>
>>> - domains without input focus will print with a (d<N>) prefix
>>> - the domain with input focus will print without a (d<N>) prefix
>>> - this applies to both DomUs and Dom0
>>
>> Except in the non-dom0less case, at least up and until there's at least
>> one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
>> regardless of the presence of e.g. "conswitch=".
> 
> In the non-dom0less case, since dom0 has focus, it would naturally be
> without (d<N>) prefix. Unless the user passes "conswitch=". Honestly, I
> wouldn't special-case conswitch= that way and would prefer keep things
> simple and consistent without corner cases. I don't think conswitch= is
> so widely used that it is worth the complexity to special-case it.

Widely used or not - _I_ use it all the time in debug configs where serial
is available.

Jan

