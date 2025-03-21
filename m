Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9427A6BC76
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924073.1327415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcyr-0003Cu-CH; Fri, 21 Mar 2025 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924073.1327415; Fri, 21 Mar 2025 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcyr-0003Ay-9G; Fri, 21 Mar 2025 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 924073;
 Fri, 21 Mar 2025 14:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvcyp-0003Aq-G7
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:04:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c9c7d5d-065d-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 15:04:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab771575040so612737766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 07:04:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd47d66sm161264866b.166.2025.03.21.07.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 07:04:09 -0700 (PDT)
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
X-Inumbo-ID: 5c9c7d5d-065d-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742565850; x=1743170650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cFgsKfb7eU6whCFsbM3+jzNbRKWxHxqxUKxiMAPIgGE=;
        b=SsyLftvbq69howr4gjfuMuB7ocnaFRrBLL34qev1s9nnkVR6efU9fVqg7tXbFdlN9t
         WoMfkzZdU/JSm5XFdXF5gSRtQCob6p5HaLtl7IyQ9UY4vNCOEeq9OYLWmVYDXwmUoqlq
         02HwVbeT5AEoqor8fRtothfDE1GHpccLuHZMrYWZUoNKqQ+4T/PPN4XonbD9Dz8yqm86
         asPH4ZhrwqR2kGlCJRGHR2CATfupAAlTjbYsSRYQp/U3WOX5ClvJH+lNs8QVn6sljxOM
         cQHBJIcZ2AseLXbiyBEOd+gsIFjo64d25EzGm3XF8bGywoCw77oU3ugQ7Ts5YKXC8Au/
         08lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565850; x=1743170650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFgsKfb7eU6whCFsbM3+jzNbRKWxHxqxUKxiMAPIgGE=;
        b=Vr+plCL4NkwkrmYWfJ5YZu3vb4UwkcpS3hMndv44Bd5E2aezB2xtxuec7q6+T7qAd+
         4WAvd4PmaRP68UW0yZ6AXBnWBY4kplXXfbHcMH3xFJ/cfBzHcdW4t0we0dRQIZEp68Bz
         KLhloy8Fdqncm96Du59yoZfLB6CfxjTiMdFrqEm4fdDtmp+YvRID4um4/XdTpHeHVKhV
         2W5ODBo4o/3r5yuMkr+o+84f0u4OnRajdg99FII7HH25ZGisirMcn1rqw603CatkUwei
         /6kpt9M5oQvaLSFPas6oxsVLlVbLJLrVmbrwf5Nec5vVpkMTo1/04x51l2j8rB8hirLL
         v+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUkyR9W4SpgoIkoJWFQsP/Yj1DTb6DGyhkmNy0zavL9zS3SddS0CkMWsvYWMxkbXrq6J1972E+CWGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCIrR44wEj0lnvEM6b3pNy4RyAT/rRwphSVObEG3otsow6ng/3
	Od8PuPBUw1G5wZH2hOlvq7gJUprXAXGR1mqspX/MOVAeKDjkIA+UK4Zs4qayIQ==
X-Gm-Gg: ASbGncv8niDg2LXXjIuN2rDjDvvsbhVWVG46PHv8bdhqi0b2h3vMgjL0p4sUcB6GGRC
	Ix+P5nYpR8BM9tJBMpMuAzlcesrl0wz5KkRHcJhB5slYlAm8fs76qUFBigeCx8odfcQhwQKX0+U
	PE7bVEpFwx+MJ8joiv4fICvRN4r4W3A07QVvPP6XJXV7zrMAd9jD9w+wVkB5p2uxAOHckI8nRji
	qQ322N7z77m30Dhj5lbBSeYP43JZ9+RI+1PScKrcMBahXH9nOEViIzfoybCpTVkavosNAMmqtFV
	twVO7wj0Pzl+EBJiUnIRKZ9Cu5MQJ7f96qkIgkfxxE1ejOY5X8UIvhgPALjfMWM5SfFWo6mQzhw
	zul9pqPg7iMEraeEsrz2TjI1xCUy33O1emzOZdWAl
X-Google-Smtp-Source: AGHT+IE4E6g1hcmUfK3w/HRHZSBnq5heVz6U52h66WmLptvC9ZkvezvHS5qVFzPX1nMyePRszKglAw==
X-Received: by 2002:a17:907:3da1:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ac3cdfc746dmr788745266b.26.1742565849845;
        Fri, 21 Mar 2025 07:04:09 -0700 (PDT)
Message-ID: <da301d1e-a6c7-49e1-be57-db844915ef09@suse.com>
Date: Fri, 21 Mar 2025 15:04:08 +0100
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
In-Reply-To: <CAGeoDV9Tgd1MhVutbKhWRJkMMMix5yFVRcA6vX=fP=fzqFdV1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 10:50, Mykola Kvach wrote:
> On Thu, Mar 13, 2025 at 5:34 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>> +void watchdog_domain_resume(struct domain *d)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    spin_lock(&d->watchdog_lock);
>>> +
>>> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>>> +    {
>>> +        if ( test_bit(i, &d->watchdog_inuse_map) )
>>> +        {
>>> +            set_timer(&d->watchdog_timer[i].timer,
>>> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
>>
>> The timeout may have almost expired before suspending; restoring to the
>> full original period feels wrong. At the very least, if that's indeed
>> intended behavior, imo this needs spelling out explicitly.
> 
> It takes some time to wake up the domain, but the watchdog timeout is
> reset by a userspace daemon. As a result, we can easily encounter a
> watchdog trigger during the  resume process.

Which may mean the restoring is done too early, or needs doing in two
phases.

> It looks like we should
> stop the watchdog timer from the guest, and in that case, we can drop
> all changes related to the watchdog in this patch series.

Except that then you require a guest to be aware of host suspend. Which
may not be desirable.

Jan

