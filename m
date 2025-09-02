Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7CB4059A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106550.1457210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRTk-0005iW-1S; Tue, 02 Sep 2025 13:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106550.1457210; Tue, 02 Sep 2025 13:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRTj-0005g4-Tv; Tue, 02 Sep 2025 13:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1106550;
 Tue, 02 Sep 2025 13:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utRTi-0005fv-0b
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:55:18 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74223d1b-8804-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 15:55:16 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b042cc39551so309891666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 06:55:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0413782b94sm686669066b.35.2025.09.02.06.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:55:15 -0700 (PDT)
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
X-Inumbo-ID: 74223d1b-8804-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756821315; x=1757426115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3668wISdCNXIO132PPwWE7rbS8MSARervAVnM57aFY=;
        b=Hi0rXo2nZsv/jyert0hiI36K0jZe4Xihrn0vJRKuW0Gui1hN3c+l8LVvz8yqaz5H4+
         4cV/+Xaxb/tUpnG+zu+A8vfua1x9w3lsOlnq2BiMTRmnSbsz4JzAeGn9Mlj1EwaEkQXr
         9YM5DReZShslcxVmYj4cbQ3gtPN5pR5LnCk6X9hxgJT3VQxF+BxFJEeXkPCCPJF7KIJd
         04D+KlO2F/FiTDgbuiXISFKUMllObdqsM5lVWaRAPVbKaPnJLO9B9bXlEo/AUxWeUTa3
         nMmEpCHEFW1J+0cI3YY1jYZvLQgYn/QxzvcP3PjC9Ch9k/t2UNFqdGBJkFQInb9qKh3U
         GSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821315; x=1757426115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3668wISdCNXIO132PPwWE7rbS8MSARervAVnM57aFY=;
        b=A8r9UjgaBebKNKc3H+ksUBm7w7A4fEENpDBoOw7n0+WY/i7buGAnyBNUe+YYo8Ht3t
         nl0D6Pk/l2YAXGSaxGK/ikCPu0Oulc1F7A2urGxjU0lPDf5coce3by7NkjQflJeglOxO
         vFrCXRl8nTUDLFK0hlQBxUSj3COD3AxM8gItBH4CaQQdd/kqug4m0rHASlM1m1+9mmLs
         Ysucl1ihFgl522tMbz1dAM1wvwxM0EnfliYgSQBOM0J9DZQgQlPE29JRs/OEWc38mWle
         gybimWaCdZQhBRM1KwDRzomIwkqP86uM2caiG5UlgNH8cb9LwsDbTFwfM5a9PvrCsxqK
         I1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqcYLVxUuJcn4gg31pmcOomgaw8EcDs04Y7YPY7+y7uBj9RB7/n+p+iaaDvDA8tEhp0/pLe6fS2ws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvNFRivbZI/pUkAI1zL/eyEg6kF7kgyQixOj0/to2RWvZdxIEe
	ckOfwilkw89s/BH6vkcFUyNVqk/nkNHRPHHcLzGH2GkO7Gm5EKNNdybr0lnsRbmuSg==
X-Gm-Gg: ASbGnctFraqzjI8zBtsUkmQEG8Mf41yF2MN+M35SdRhLhMFF285ZQtAO/MHu9cVCqMM
	erA0ghuj70fyHZa3xnFYSvMl7J3xnxDtga0d4AknNi4osfyEPj04evga6BtW2D0ZV4PJcq6ezCl
	/CMHe6OYE89S4bBAIJ4ob4noFUaYv1o9iYQQ3Q3KfkhroiUPdDAamdciubeQpvZ4qOozrhZmyMH
	p6RVOlY1Gs2tN+ro9r9wK3NIDyMa1i4UTy2nDFuIPvyq0UBBHts/z6Rq3GQy7TQD19ozAaK71gs
	/qzHNoimnrDRUnQgw/wRSUy23ge4PJH/9Z8ZIkmob9rWWFtvP8mwlYdd9CadYJ28J03yWkZjqZh
	uckjTzKU0K7TrfAyLQTMYmT9ik/NDu1h9gta+V+DJC63TgR5ryycwFNhVVA5JvjN/lyIbQk/IED
	uB7U/ItZhOJi1WfbdPvg==
X-Google-Smtp-Source: AGHT+IF9QDkVBnRtFt5jjzyMjbAHI4XouiD1dZ6Eh5tHSBeVSaMpw6tOQD5B7nyVWkqGh/VDITWPuQ==
X-Received: by 2002:a17:907:d10:b0:afe:dc88:e65 with SMTP id a640c23a62f3a-b01d97400ffmr1278919066b.30.1756821315357;
        Tue, 02 Sep 2025 06:55:15 -0700 (PDT)
Message-ID: <5953e9aa-4b56-4112-b952-7b4ff0ca2a62@suse.com>
Date: Tue, 2 Sep 2025 15:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
 <aLb0I01WASpFremM@mail.soc.lip6.fr>
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
In-Reply-To: <aLb0I01WASpFremM@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 15:41, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 02:28:27PM +0200, Juergen Gross wrote:
>>> What puzzles me is that:
>>>
>>> - %cr2 is 0, so probably the first fault wasn't a page fault
>>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
>>>
>>> Could it be the code has been moved to this location, or is about to
>>> be moved away afterwards?
>>
>> And indeed: from the full boot log I can see:
>>
>> (XEN)     virt_base        = 0x0
>> (XEN)     elf_paddr_offset = 0x0
>> (XEN)     virt_offset      = 0x0
>> (XEN)     virt_kstart      = 0x200000
>> (XEN)     virt_kend        = 0x17bab90
>> (XEN)     virt_entry       = 0x20e4d0
>>
>> So virt_kentry is very near to the RIP.
> 
> thanks to this, I think I found the issue:
> with Xen 4.18, the kernel is started with ebx=17bb018; with 4.20 it's
> 100018.
> 
> The bootstrap code assumes that the kernel is after the kernel, and the

DYM "start info is after the kernel" or some such, seeing that that's what
%ebx is about?

> kernel symbol table. That seems to be no longer true with Xen 4.20 and a
> PVH dom0 (but probably still true in all other cases).
> 
> I can deal with that, but with the new layout how do I get the end of the
> symbol table ?

You'll need to handle that internally, I expect, perhaps from properties of
your (ELF) binary.

Jan

