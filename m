Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B6CD3A0FF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 09:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208004.1520236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkKo-00005y-IW; Mon, 19 Jan 2026 08:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208004.1520236; Mon, 19 Jan 2026 08:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkKo-0008UO-Er; Mon, 19 Jan 2026 08:10:02 +0000
Received: by outflank-mailman (input) for mailman id 1208004;
 Mon, 19 Jan 2026 08:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhkKm-0008Mc-Dh
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 08:10:00 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ef04f9c-f50e-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 09:09:58 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso26058075e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 00:09:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8d90b3sm183498265e9.15.2026.01.19.00.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 00:09:57 -0800 (PST)
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
X-Inumbo-ID: 3ef04f9c-f50e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768810198; x=1769414998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QoHB5wvizaAWl1D7bMe7q23T+DHS/1w+EkPraaCrKpw=;
        b=VZDrI9E/jmC3JapNybqwJch8oCOl0Kqi6d7E5EbuCxaSBuFMsOx9WESaEfJDO7Dvju
         PRKDxLcszNRFmmcYQ1ftAB6coa/sn2eFdPAb/BlmSuEDxYdtZF0qQdCbMZfymbyFSxpP
         PrlE3HpaP4qv+hACYOVq3cv2RTyRu0vBgdbveDysIZ9ITFRoblZMaw/xu2tBjlU2v5ZZ
         EMAel3Sx3lMR5K1RBlqpCyDvRJRz8QJmDI7UD5htXjEmv+MaB9a6w3NIDywl8TJskE07
         7yooyyeJj54w3cY7smOV4reFdaZ0VcFyXgdQJdStbFlw8yeN9msgClBxwVbiaR06/pOl
         hnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810198; x=1769414998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoHB5wvizaAWl1D7bMe7q23T+DHS/1w+EkPraaCrKpw=;
        b=tpJZ7hbq4zW9Xz79/ad9hWjICJ6Lp8TMULFMkpoysWA7L1FgAYRvdudozB2zwTBuTY
         QkLmvhwxbuIN2XZJjrNG1F+Jg9EK2gVyFwVvAPj1wKk1SvxyqamgpI8EkiJpko+LB/8H
         5kcnWHHxsFOXpaYYF4dFFlK4BgDL+0Whiw6OD60nKJ43YNGvwTPv3kFMGwyx4W1Pen2Z
         Y4m5ixQvTdWIyO9YMdPsh8Ntq0IqQAMIEm+zkNAO2vkawud5EV4SmqVKMIs0VMEee87S
         NNJbOgGMW3jPXSuwq1QogxCt3Lf6BX0YSe+d107yi6lXiE8jQzIqlbv7fnytOaTIrapi
         fe3w==
X-Gm-Message-State: AOJu0YwwLyNnOkdeXT/H8tULcJWMETY+rnprnnPe1urHDV3ezAEAZD8k
	1BTJMcLXX0JjSP++xIDXts2Ap3mJfJCY6fgx+yfh3anBD5lq9jp3HVU2XKSQnxOvXw==
X-Gm-Gg: AY/fxX63b4RxDqSAZVSOF4p9wQSJmeRoOmUbf8H2ne7gEv0aDUtDzNSzBl2oZo7Hwcp
	0VKMszcGtn56orX7uIeIFrqD8eBnEj0nUHG6nQPxNoW0pNwtI5aZh+c1sY8V/R7tzzSLAjey8wk
	zlbAAPpaDh+EDydgWKFVstFxGZHVMyYzgActUdnG8KX68+TX9r/yVEivq05GfSL1KbzSzNcQulp
	dlzCyETegFMz0/ev9FAhGAaE6BiaVYjWxdPrFsUJQvm0uz4QlqBGVliHDQl1hW2ma9ebESMoQCm
	8eccyHrywZTMLdAsKmQrKF6JSgQo9CzrN+gF1zjdvEVWTIDWK/IxC+Uqu9sb+By0jZbGQc/rfdw
	GuVgNasWqqr/Iy/bIoq/J9kwdUlFijMa2wEWAudx1fXjgTOLDCwk8ftcODtjtTZ0O4QhIjcXdoi
	3+rD10LSCou9aOOekByu/RzJmCRy67T8v9Vy2/NyLt1SDMPJZEsYBvIPvaM4qyyFSj6inEW8vC8
	Ts=
X-Received: by 2002:a05:600c:4e43:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-4801e358875mr128177165e9.35.1768810197714;
        Mon, 19 Jan 2026 00:09:57 -0800 (PST)
Message-ID: <1c6152e0-fbb5-4dd1-b8e8-6610251df9c1@suse.com>
Date: Mon, 19 Jan 2026 09:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2601161307120.72558@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601161307120.72558@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 22:07, Stefano Stabellini wrote:
> On Tue, 13 Jan 2026, Stefano Stabellini wrote:
>> Allow multiple dom0less domains to use the console_io hypercalls to
>> print to the console. Handle them in a similar way to vpl011: only the
>> domain which has focus can read from the console. All domains can write
>> to the console but the ones without focus have a prefix. In this case
>> the prefix is applied by using guest_printk instead of printk or
>> console_puts which is what the original code was already doing.
>>
>> When switching focus using Ctrl-AAA, discard any unread data in the
>> input buffer. Input is read quickly and the user would be aware of it
>> being slow or stuck as they use Ctrl-AAA to switch focus domain.
>> In that situation, it is to be expected that the unread input is lost.
>>
>> The domain writes are buffered when the domain is not in focus. Push out
>> the buffer when the domain enters focus.
>>
>> Add the console_lock around serial_rx_cons modifications to protect it
>> against concurrent writes to it.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Ping?

I'm sorry to ask, but doesn't this come a little early? (I for one simply
haven't found time yet to look at the v3 of this.)

Jan

