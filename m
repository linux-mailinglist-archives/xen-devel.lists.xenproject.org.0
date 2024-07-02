Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E8923AD6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752195.1160338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaEv-0008Fd-M4; Tue, 02 Jul 2024 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752195.1160338; Tue, 02 Jul 2024 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaEv-0008CR-JH; Tue, 02 Jul 2024 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 752195;
 Tue, 02 Jul 2024 09:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOaEt-0008C8-Ji
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:55:55 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45bd28a5-3859-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:55:54 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso47041541fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:55:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802466aedsm8073157b3a.46.2024.07.02.02.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:55:53 -0700 (PDT)
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
X-Inumbo-ID: 45bd28a5-3859-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719914154; x=1720518954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju3vLadfwD2kGsscFhv9lR9Kmb/82EFBsN9CfYrynyk=;
        b=aCgSa7UPA9LjaVTsOlREUM062Bp0mAAjTdoUqJ2YoCBtOz7RD01bbk2VnnKtDz3Fyc
         fihepn8Q8N0uM4Df2j1Dc4JkwCGmZzhH/SYbbw5u00I4iUGcNzS2ZMTI2/8ENiiTdJwu
         pF8aKehxeq5J5GW7C64hot99ciBM6HhrsN/yWBeXK7weh3Ya3WvbQipo1ARMxSJgYDmz
         w/5ZzxLseA0cxJtnoBfmSpAntCFF4PPi+HU/yckHBOFMHPQ+KCbJbEPTBHuO9x+9UB+U
         Wazo6EmhAGxzm5YQNOPYBbV5UhARLeZzs+UPJTNd/TpxHKC/1/eptifCFz/OyxG1nn76
         dECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719914154; x=1720518954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju3vLadfwD2kGsscFhv9lR9Kmb/82EFBsN9CfYrynyk=;
        b=TMNShBlBKTCdFqjFlxaA0/Kg1TxqSzsntG0sqDnY/v0FjPvMD5eg2bKvplOT25oWbD
         jV5N/Fe52gPATsg3Hv4AN+C4aAwZ/krwX3Kcp9WGKYq48ZZdh7zKzY5N4hLfrUQfwuz4
         FH5eNKetXIxClSEfAm1qZj3EZdZPJaZdZHiL4izseXAx3TPpAS58XH+FWqR7Tlnfp8Ib
         0zhSTt/nI1HOWIl7rweGGI9cqk8+XO3kc/wHVvBRiPeXn81WbP4mD0LC4ZLmgra131Z/
         Zg9iIESqsFABV3XKg8z8dPp0pIvv67hhx7SKwlP6jjodgTca+MsBpO1zPkt14ZM0EF6N
         RB3A==
X-Gm-Message-State: AOJu0YxL2+IVOfdVn7SAXidtrsoaEubizInZZjmsM/UOGHb4EG8yLvc8
	hZOdD47/l6hU/7GRJE0aPGswcgodY4hXZWgGxKVai5DcUujqvMsJ5Pet7nzc+Q==
X-Google-Smtp-Source: AGHT+IG0mDlsPCiysXwjz4JHRmbXQwLDwJkwmTTrZDq5alw8HP6AOtRjGGDL0/fofRLGuPjPh1Qy9w==
X-Received: by 2002:a2e:9156:0:b0:2ee:493f:d751 with SMTP id 38308e7fff4ca-2ee5e3bef51mr55461621fa.23.1719914154138;
        Tue, 02 Jul 2024 02:55:54 -0700 (PDT)
Message-ID: <ee0f4549-822c-4364-baba-934693d766a2@suse.com>
Date: Tue, 2 Jul 2024 11:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.19? 3/3] cmdline: document and enforce
 "extra_guest_irqs" upper bounds
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com> <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com> <ZoKvP6StEbMTgjrY@macbook>
 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com> <ZoLIpulcC7dqtxYR@macbook>
 <a733033f-e456-4488-a9f8-845a7874268d@suse.com>
 <f4ea9d1e7fd17e8ca64461b3df29735c0ee5998c.camel@gmail.com>
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
In-Reply-To: <f4ea9d1e7fd17e8ca64461b3df29735c0ee5998c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2024 11:50, Oleksii wrote:
> On Tue, 2024-07-02 at 10:26 +0200, Jan Beulich wrote:
>> On 01.07.2024 17:17, Roger Pau Monné wrote:
>>> I think we are in agreement about what needs doing.  I can provide:
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> With the changes we have agreed to arch_hwdom_irqs().
>>
>> Yet another request for considering for a release-ack.
> It doesn't fix any real issue, does it?

It does address a bug report we had, by folks specifying excessively large
values with that command line option.

> It just provides limitation of how many pIRQs can be used by domain.
> 
> Anyway this change is low-risk so:
>  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

Jan


