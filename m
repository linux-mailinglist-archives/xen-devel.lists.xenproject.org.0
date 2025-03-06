Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE31A54BB0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903500.1311427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqB2Y-00074g-AC; Thu, 06 Mar 2025 13:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903500.1311427; Thu, 06 Mar 2025 13:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqB2Y-00071t-7U; Thu, 06 Mar 2025 13:13:30 +0000
Received: by outflank-mailman (input) for mailman id 903500;
 Thu, 06 Mar 2025 13:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqB2W-00071M-NZ
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:13:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca1c0ac8-fa8c-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 14:13:26 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so3961135e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:13:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c6f4sm48907195e9.34.2025.03.06.05.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:13:25 -0800 (PST)
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
X-Inumbo-ID: ca1c0ac8-fa8c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741266806; x=1741871606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mn03y2X7USnkyf2hTZrquiL7k0cJX/o3gpj6HLPD0iM=;
        b=fyrONvOE2bHtKa5msHrRjTD+EWim2ktfAAWxtfeXwbO7JkXY2Gkpw8duvxUZHZy//q
         29ihEOVdS5vgzkVGoutHeYew1B3CITh8HcjgKo3/gjxBR4CkrSwYhi+YQ6wDY8yf7GB2
         JOtnTEglWGLb1EJT454sxQdgRrT8iBG3GTI/jMTsuA8Z7xuLol/pbqXc8Z9QUbP+Bv6i
         vil2yN59W3Ub2L6vkbjGHpwtHI0FMYuFIUemUswZp+0o4c2J8MM6wd2Q720dp1SRNkfV
         35kDQMjtu8q8GVs8TlvXmqDCFqJbbeTeE8aHzBTl7T/oG3tGA9ff3FHYsy7dElgQR8IA
         3lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266806; x=1741871606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mn03y2X7USnkyf2hTZrquiL7k0cJX/o3gpj6HLPD0iM=;
        b=jucRWkfzd7WIrSM9njZ238Qawa1YhsbfS+JuFdYvuDzaKDA/Vl32/EySZCRo3Aghbe
         BLTDjOZZRF1QkTS6Ge9Nxa0tsknJgrv0WiwUlN1g95laghG6wTALtd5A1oq5KipT5+NI
         eFIeaLR32bwi9xOU+t0WOop1xKlElCexRGorM8BiipfbUwjTKTRgFXD6G8YmIFMOn/lV
         k6gl9QYGdup8EtGPlJwU5SR7ojo6oA1GquuPV2MpxOIA95IESkPztFycpZZtN/q4SQoX
         H7TqzswkTxU+kraHduUdqX2Y1NNtfTF6Fpafa6/aajz+4Z7LlHJC9KbK2Xktpt0OMe4L
         bt1A==
X-Gm-Message-State: AOJu0Yw0giZyTBPepQKObzbRdkkyKmIVcaLzjpTPQ8qfsmtsfM/sxn+m
	IeuPJe0k5z6MdvNbXv6G1IiTp5jNHy4pNo/v8fD1ZAO1IEgdThAzwqEX09u6QY92SitElPxAFs8
	=
X-Gm-Gg: ASbGncv8/GTtn8Gtt1MB+U6e3bLOEB84LED8zV/yvVib+47MstKOPFiVsq6p/xTAVzq
	w70UuSPfB+4C89At4ZQWDLKYo34M+CdZRPvjvhEJiYpFuEaXVjwD8GXgv79iYqwA8uA7LALD6/F
	0R4eU/I6RRtsxgFCFpabCwPeYDO5wHivDxB05XS7QVJiWPx0WbVfsZ30SxXlekDl5/v+aYyoM7N
	x7LnmG5UnLnCdJiCvXY13Uj7pIl2MoGnQoVLYKnF0iwfVpGy9g+pxz1m+Fq2xpPSSLuH1pbg+mq
	KWRg8itBM2mBMPGtRLjRLEmMxzEvpYtrR15XutIVLzAXwTq4Rat2Fi+eb9XdySAR7ptQ0LMvG3Z
	NIC/R6WjO+6l4F4HdzbJT14csJ7bSXA==
X-Google-Smtp-Source: AGHT+IHTdvAwhXdkh4jDgh7C8LArVXwB1tRaw6mol4SGmSmTbsSt4ReMYhXZc35d3ttGBoJDbSJ7hQ==
X-Received: by 2002:a05:600c:35ca:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43bd2989faemr71056555e9.16.1741266806054;
        Thu, 06 Mar 2025 05:13:26 -0800 (PST)
Message-ID: <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
Date: Thu, 6 Mar 2025 14:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 00:32, Stefano Stabellini wrote:
> On Wed, 5 Mar 2025, Juergen Gross wrote:
>> On 25.02.25 12:10, Juergen Gross wrote:
>>> Ping? Especially ...
>>>
>>> On 04.02.25 12:33, Juergen Gross wrote:
>>>> Xenstored is using libxenctrl for only one purpose: to get information
>>>> about state of domains.
>>>>
>>>> This patch series is removing that dependency by introducing a new
>>>> stable interface which can be used by xenstored instead.
>>>>
>>>> There was a RFC series sent out 3 years ago, which I have taken as a
>>>> base and by addressing all comments from back then.
>>>>
>>>> The main differences since that RFC series are:
>>>>
>>>> - Instead of introducing an new main hypercall for a stable management
>>>>    interface I have just added a new domctl sub-op, as requested in 2021.
>>>>
>>>> - I have added a new library libxenmanage for easy use of the new
>>>>    stable hypervisor interface. Main motivation for adding the library
>>>>    was the recent attempt to decouple oxenstored from the Xen git tree.
>>>>    By using the new library, oxenstored could benefit in the same way as
>>>>    xenstored from the new interface: it would be possible to rely on
>>>>    stable libraries only.
>>>>
>>>> - Mini-OS has gained some more config options recently, so it was rather
>>>>    easy to make xenstore[pvh]-stubdom independent from libxenctrl, too.
>>>>
>>>> Please note that the last 4 patches can be committed only after the
>>>> related Mini-OS patch "config: add support for libxenmanage" has gone in
>>>> AND the Mini-OS commit-id has been updated in Config.mk accordingly! The
>>>> Mini-OS patch has been Acked already, so it can go in as soon as patch
>>>> 5 of this series (the one introducing libxenmanage) has been committed.
>>>>
>>>> As patches 1 and 2 change current behavior, Jan didn't want to give his
>>>> Ack (he didn't reject the patch either). So I'm asking other "Rest"
>>>> maintainers to look at those patches specifically.
>>>
>>> ... patches 1 and 2 could need an additional opinion.
>>
>> And another ping.
>>
>> One of Andrew, Stefano, Julien, Roger, Anthony, Mical: Please have a look.
>>
>> The related discussion between Jan and me can be found here (patches 2 and 3):
>>
>> https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/
> 
> I didn't do an in-details review but based on Jan's comments and your
> replies, I think they are an improvement. If someone else wants to do a
> proper review, they would be welcome.
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I've taken the conservative approach and interpreted this as an ack for the
two patches in question only, rather than the entire series. Please indicate
if it was meant the other way around, as then the final 3 patches could also
go in.

Jan

