Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42088A306C8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885182.1294964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmRr-0004ae-Gf; Tue, 11 Feb 2025 09:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885182.1294964; Tue, 11 Feb 2025 09:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmRr-0004Wm-D3; Tue, 11 Feb 2025 09:20:55 +0000
Received: by outflank-mailman (input) for mailman id 885182;
 Tue, 11 Feb 2025 09:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thmRp-0004Wg-TD
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:20:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b15c864-e859-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:20:48 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7d583d2afso192795266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:20:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78e561ba0sm849213866b.137.2025.02.11.01.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:20:47 -0800 (PST)
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
X-Inumbo-ID: 7b15c864-e859-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739265648; x=1739870448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/uQDz87UrV+YOOitnzmJdYZMPous98Y8ZDBx1Di4Qhc=;
        b=bHne/00bp6wFyXzW0++gvavflERXvhmR2g3UWgGcGqQZn9iHOGLiz9k0cVH7G8xkFz
         tI+Vj7u2EyYtSON/9sL2QFNMAxZY8zoAffsYUzwIuP6rzus8fkc+ojGh0yA6Kt+CyZtP
         2Ea82pN80l0UmPeFkRl5onukxMW2TfFtPHbxyE+ILRzR/enofhxF7asMP47rGbFA57Qn
         lbk/vxAlef9pVghRED9J55SPejYhZOf6OS+QGIvSxFDvnPYO+e3Pn6YFLSypQSrBTWcw
         k/J188UC25kqSsShi4LYbNQX/uZUeHYf1RcsxB/Ey4Fbo8f31dIAWuJgJMJ+LKJVjcNT
         zTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265648; x=1739870448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uQDz87UrV+YOOitnzmJdYZMPous98Y8ZDBx1Di4Qhc=;
        b=fTnaCiUOozP0c65wYue7lvKUeROA9AFwI7YRhcB4NtlLPCTSejF3PjVXVNLn/zzthw
         0SMmLzdTUMhSU8QBI66yBO9JljxlFaVgpqRQ2N5+e7+zi6P1hfHI3h7TTBTrPWTD5IJ5
         L4ectzSakR0BHzC2O9Ns2vTannqLxf4NQE7DosEIot+MxNulAtnbTBt5Yh4QpW8RQFf/
         rnXm4UtYIuwTgeuQCN2IRbBi+vT3GloG5GLQaKL1T1dBzTGoy6ZUEzIBwgFgsNB2cwij
         KpVzIP/KbCdzPl3EnHCFtW6y2GlbT4b6xJSu6I5pRfK6UXPwmft7nhw/ss9LGAk7diwa
         t/XA==
X-Forwarded-Encrypted: i=1; AJvYcCV0xR4IwKtVK+Q3ir0pJdU4RADXyhUuHo86hakJy9XSF/0ezpUlBfCYzVB5n6j17AVoi94PCn0OgNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs0qdoXmWb2aRXkIQ7eYGleJAwH0PxAJ0bsV0JfQybugZeZAfe
	1Z5nmgmfuOyP4GaT+saC7RxuFZ3tt+fo/QU9OuhiMCwyfFfynb2cd4B0tiITlg==
X-Gm-Gg: ASbGncuRe6J4ijtNlphQ5kb9ugYWS1P/d9q223mawenbMME/eIZ3aZuacQh2ozkwGH2
	x8deW54rdRnLFk7EHVEP1rdWcMDEvhCUxzkd1L9wTey/GXa+bAj8KqstAyrE29XQqMQU5P2Q8aw
	T6tE+Uy2kbr+7/QbbUWXAUPlQqMD06j+hdmwOvTKj6rUM5K2xhdwl8rfIBy9CqbRxqDp8z7LdO/
	teMCyX3K9UX4dZhijFidgjf1078s1RWvEKmfJT544ThQrOUX9cf3K5KH+2QnFHrsVzvSnjBuDoQ
	oc9uARhV400N2GdNXHjCiAUY6xCYUBJzEozI9mEUluYKQyd7BQf1y4Bepj1hy+Yf0h7vl6KtoDW
	n
X-Google-Smtp-Source: AGHT+IGU5kYrqDvz4Upd9ZtSv6jkw/4qbPvMRkavcKwFWDFabNLQqQfGXiA0Qn2uWzviUBDcBTnQ9Q==
X-Received: by 2002:a17:907:7d90:b0:ab6:f0d3:9687 with SMTP id a640c23a62f3a-ab7dafc1750mr195037166b.21.1739265648171;
        Tue, 11 Feb 2025 01:20:48 -0800 (PST)
Message-ID: <37ae9a7f-5ac7-49fd-975a-2f1bbb788262@suse.com>
Date: Tue, 11 Feb 2025 10:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] xen/x86: prevent local APIC errors at shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <c9b8ae2c-ed90-4256-8a61-19ed85b1a774@suse.com>
 <Z6sPU2y7qHMjAZ30@macbook.local>
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
In-Reply-To: <Z6sPU2y7qHMjAZ30@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 09:50, Roger Pau Monné wrote:
> On Tue, Feb 11, 2025 at 07:39:12AM +0100, Jan Beulich wrote:
>> On 06.02.2025 16:06, Roger Pau Monne wrote:
>>> The following series aims to prevent local APIC errors from stalling the
>>> shtudown process.  On XenServer testing we have seen reports of AMD
>>> boxes sporadically getting stuck in a spam of:
>>>
>>> APIC error on CPU0: 00(08), Receive accept error
>>>
>>> Messages during shutdown, as a result of device interrupts targeting
>>> CPUs that are offline (and have the local APIC disabled).
>>
>> One more thought here: Have you/we perhaps discovered the reason why there
>> was that 1ms delay at the end of fixup_irqs() that was badly commented,
>> and that you removed in e2bb28d62158 ("x86/irq: forward pending interrupts
>> to new destination in fixup_irqs()")? May be worth mentioning that by way
>> of a Fixes: tag.
> 
> Hm, so you think the delay was added there as a way to ensure any
> pending interrupts would get drained (ie: serviced) on the old target?

So far I didn't have the slightest idea why that call had been there. This
at least gives a possible reason.

> I'm maybe a bit confused, but I don't think the delay would help much
> with preventing the local APIC errors?  Regardless of the wait, if the
> interrupts target offline CPUs there's a chance receive accept errors
> will be triggered on AMD.

But fixup_irqs() right now runs ahead of actually offlining the APs.

Jan

