Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62FB20064
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076962.1438067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN3a-0006HF-QP; Mon, 11 Aug 2025 07:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076962.1438067; Mon, 11 Aug 2025 07:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN3a-0006Fd-Ni; Mon, 11 Aug 2025 07:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1076962;
 Mon, 11 Aug 2025 07:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulN3Z-0006FE-Rk
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:34:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada540e0-7685-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 09:34:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6180b9e4e74so3299117a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:34:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm1966038266b.90.2025.08.11.00.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 00:34:55 -0700 (PDT)
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
X-Inumbo-ID: ada540e0-7685-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754897696; x=1755502496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xnhLHmlAdg3UBmQKbDdLSbrl7y/jkLDjBREa5M48IFo=;
        b=Rdia5uF8q7PQ6BBnUaGTcOXfIbJBoN9RxJLMrsG6s/VlobC2qNOGODx0O5vUxsF3xy
         7BYQvllSbr+0eJGWMh/VEe8TGEZ9fTXCyLBUV69L3MRXZRZ3C41IVV5eC73A524WjNLa
         afrF4mKD1k7QKgAJRn28vsqqyrmq1Aus2dJLukItEWrU8y2wOrTLaFV+aoE9FV9MsYdm
         b3qjWNfDeenX1CKxaaz06G3VtsBoJ8bjSp4PjiXnugPyBQfQBSwZsnEtouLDMH1KupGn
         eh6nEU8VK4npqt7AMNvsJmePIv36wEUctRWToBmdPfMMS3v8hgcoksm7IqDUdj7NzVlw
         eo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897696; x=1755502496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnhLHmlAdg3UBmQKbDdLSbrl7y/jkLDjBREa5M48IFo=;
        b=k2Yw31mwEiXm7szCcuNQHEeBu8W8lVqTwjOhOzB/sgNygxe84t9I7EiiqGB9FLmuU1
         OywS9BTuGpUz3ELdwYqvep6TsajxrtIq4jBV5W2KPktVJ33hLxsQAFCmRHpXhgSJXL1e
         dpYm0Gy1IKmUOM3Nt7QbNNl+4fk+6+tvBDvAtclO9g09yX5cx18UyJozV1SkKUZLNEfc
         tT3+hPm123yA7cW9EGGRMiRdWEWFx08Ws/zUwUawHNd68epjh5opHPbJOQbH6TAG7c6L
         17UziXUviV6XBlIBSSXx+t8o5ZWu4GtZLEljEJvpjKj+zj8RenYm3u2QbnWp3Up/v5f1
         M7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUFkTLbgicow3/H6n5GoRyINLUos1BEGQBIb2J1KlA04wR4cu/hLr2IFO3gDBis8TzK5fLc/+kBbPQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdTwUnK1z/bi67nxlKQ2ALbEfOzH8MKMM/DNc5tv6ZapA6a241
	NgEhWJpacctF7H6XxMqo5x6xRiac6i8qGW4eU7u+9MX8gq3bwM2IiNDBSJTW4ZucrA==
X-Gm-Gg: ASbGncsoHur/uKRvIN9WcVpShq9Z1rHjtT14RM+ArnYmARtQWFAohznt5pKxgBfikLN
	kYWOZIn0j/5GsBRw6yiJPHgs9xocQRF352nVsuL0v3Ou7X9a0Wgn9tVLhYU1XjOFuMzYy8itisd
	noayksslbHAKcBlqWfMNduqisKERdDexz5GV4CJMX1FVO4MQWBhARVgEdQ+5OhEM7jP8vzVJwpk
	8SA27suFzTy8EM8la5WtnQt4RWfzCxjcBHUC+oSHbzzapXyVB6+1cIZ8ZWZKteSSjX/qS4K/LyO
	X/9r1t/xrMt/HAk4rxQ3lk883TW5KS8iFxMoWLBqj+eF0WD+LgoZwD551rG7qiLjTdeSrEi1B9/
	xypeSsKTJjLA6QwK0uGYmcpprbsmv1kRg1YWNXCPzaO/N61yAeStAt9nTuq/I/XIb8RVcjHY4+M
	mnSAE+I78=
X-Google-Smtp-Source: AGHT+IHpO33tqORSb2xzYM4z9vFKGmBHNNFJV3GXLAyAjMU6JUMsrzZcT3ezwBQbdd3xuKFoDixuqw==
X-Received: by 2002:a17:907:7212:b0:af9:3c68:f743 with SMTP id a640c23a62f3a-af9c6516d1emr987755766b.34.1754897695872;
        Mon, 11 Aug 2025 00:34:55 -0700 (PDT)
Message-ID: <6953603b-8c3f-4f12-9f5e-45cb553fe8cc@suse.com>
Date: Mon, 11 Aug 2025 09:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-3-dmukhin@ford.com>
 <a416cc08-5970-433a-8015-5d2aa961a000@suse.com> <aJeZpiM35gOtB+4Z@starscream>
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
In-Reply-To: <aJeZpiM35gOtB+4Z@starscream>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2025 20:55, dmkhn@proton.me wrote:
> On Mon, Aug 04, 2025 at 12:11:03PM +0200, Jan Beulich wrote:
>> On 31.07.2025 21:21, dmkhn@proton.me wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -1,6 +1,8 @@
>>>
>>>  menu "Common Features"
>>>
>>> +source "common/emul/Kconfig"
>>> +
>>>  config COMPAT
>>
>> Why at the very top?
> 
> I did not find a better place, since the settings are not sorted and to me it
> makes sense to list emulation capabilities first...
> 
> Where would be the best location for that submenu?
> Close to another submenu `source "common/sched/Kconfig"`?

At least below there. Possibly yet further down.

>>> +int vuart_init(struct domain *d, struct vuart_params *params)
>>> +{
>>> +    const struct vuart_ops *vdev;
>>> +    int rc;
>>> +
>>> +    if ( !domain_has_vuart(d) )
>>> +        return 0;
>>> +
>>> +    for_each_vuart(vdev)
>>> +    {
>>> +        rc = vdev->init(d, params);
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +
>>> +    d->console.input_allowed = true;
>>
>> Unconditionally?
> 
> Thanks.
> That should be a least under rc == 0.

You only ever make it there with rc == 0, though. (In fact that variable's
scope would better be just the loop body.)

>>> +/*
>>> + * Put character to the first suitable emulated UART's FIFO.
>>> + */
>>
>> What's "suitable"? Along the lines of the earlier remark, what if the domain
>> has vUART kind A configured, ...
> 
> "suitable" is meant to be the first emulator with put_rx != NULL.
> I will update that.

Except that, as iirc Roger also pointed out, "first emulator with put_rx != NULL"
is a questionable condition.

>>> --- a/xen/common/keyhandler.c
>>> +++ b/xen/common/keyhandler.c
>>> @@ -22,6 +22,7 @@
>>>  #include <xen/mm.h>
>>>  #include <xen/watchdog.h>
>>>  #include <xen/init.h>
>>> +#include <xen/vuart.h>
>>>  #include <asm/div64.h>
>>>
>>>  static unsigned char keypress_key;
>>> @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char key)
>>>                             v->periodic_period / 1000000);
>>>              }
>>>          }
>>> +
>>> +        vuart_dump_state(d);
>>
>> How verbose is this going to get?
> 
> Looks something like this:
> ```
> (XEN) [   88.334893] 'q' pressed -> dumping domain info (now = 88334828303)
> [..]
> (XEN) [   88.335673] Virtual ns16550 (COM2) I/O port 0x02f8 IRQ#3 owner d0
> (XEN) [   88.335681]   RX FIFO size 1024 in_prod 258 in_cons 258 used 0
> (XEN) [   88.335689]   TX FIFO size 2048 out_prod 15 out_cons 0 used 15
> (XEN) [   88.335696]   00 RBR 02 THR 6f DLL 01 DLM 00
> (XEN) [   88.335703]   01 IER 05
> (XEN) [   88.335709]   02 FCR 81 IIR c1
> (XEN) [   88.335715]   03 LCR 13
> (XEN) [   88.335720]   04 MCR 0b
> (XEN) [   88.335726]   05 LSR 60
> (XEN) [   88.335731]   06 MSR b0
> (XEN) [   88.335736]   07 SCR 00
> 
> ```

Definitely too much (for my taste) to put under 'q'.

Jan

