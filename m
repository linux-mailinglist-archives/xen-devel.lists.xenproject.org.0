Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB61B345AC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093444.1448953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ4n-0007j5-3N; Mon, 25 Aug 2025 15:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093444.1448953; Mon, 25 Aug 2025 15:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ4n-0007hQ-0k; Mon, 25 Aug 2025 15:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1093444;
 Mon, 25 Aug 2025 15:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZ4l-0007h0-IC
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:25:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0cb4c79-81c7-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:25:38 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso784262666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:25:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8f8129f0sm100108566b.41.2025.08.25.08.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:25:37 -0700 (PDT)
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
X-Inumbo-ID: c0cb4c79-81c7-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756135538; x=1756740338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ93w5as36fBKPUaUUWemuifcDVw3sd4NJr5hbxKQMQ=;
        b=VUcM4I/JuGMiX1+5/WSVDVFyw+UmaSRMZQ1aZIqOTWzp043k1G5xkq432OvAXhjVJ2
         f1r8YEKDklI+EpZF/y5+JCKuQPjgjfvOpcb9DuuryIRuMnTAP0JH1i+yyzRzehHHNfwX
         d1QnOAcWVP4CKVqSjy5p0inOzQvbfrBIVmI9cHWl+hyYSXZJ9R3/2ZExZHPaGAjjIuea
         ZpEeexCz6XvAlWTVELwAx9n6wGMDawk9kMI8TNiISLY8mOPnJa34mHFP9itn0K+MN/2L
         dIUDd+w+WO3xj5O6rbOZpHxZFbBzLhGlu2tYj+fAcXqA0ukU7Cznb86lDPndqLW1Xirf
         rwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756135538; x=1756740338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ93w5as36fBKPUaUUWemuifcDVw3sd4NJr5hbxKQMQ=;
        b=JuhgB6qU4mCactbZO2voVbUZTdMsl58SnDQqVI3T0m59bMEiorpXlw3DISE6XZgyeF
         H/XYWg8rF3oSxSS8lWqsEvpG1QbCiPVpbQwh02DIRfDbqnUuzM+dVzdoBVo5Cd7s1SPH
         1zoQfpR3YEAy+UVSMEc54MJVwBdwcNGGbmKVtvIow0gurGI+ripVz9hdRsJH+34mKugD
         oqBUMwfYndc+ajyEiq6AkahQKcSIG4zM6dUGikD/CEpeFcHMThJi1f6EriKia8ucE2by
         nNR/JPjPFegatLRtXmu7vVwQy0FgH995DuTub871qrP3WhYY/Xku53sEizyyCe7i0sji
         wrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsL2mxNwlRkARTzD3XV94i9/MKpt+Wy9bMQV6CpC2fQ7vUh3zUBT1lIifGxQfJXl+6d6IQxU8UOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2rIwY70Lml9IPMEinDRUestM8ypjhsSPyPX8C8yO68rW7rYbN
	m2b9wCM+IxvlUXxCyQJd6+l9tt38JD9FGUgtFtrfm0OZnEemsbmN+ZiUqggMhISs1A==
X-Gm-Gg: ASbGncsnDILjyRgOLIwmi77/RPoHBvhjhTF3QyUOChPGjPl3I4uVm4sYaUPaqqRFw78
	VYzfBUbbSap2cv41l1wjZQNKbEJvf5WY7T8mcgv9EAyQGfNBDJsp3F6ZHTrj52fuIyuLuRzi/Hw
	Kr9Upo4PDlcWfVbtJvXsOaneTWEV0WkyygrSEIigeaJWPHuaqk8c4W+G7Xw5IvgLikvq2SvK/Z/
	rC2y533Q25YlhCldoYZVIPmWMTajnmHwvYEwKnxRN29iTYRcMaynsxoXTHJtqFZBAzJsioNSk3V
	/KRNZJ95AaYIMwMl4KCmuEZP8oApjyxfkGAhxopnkfXBrPROof0sLxL3Es7Z/k50zBUX9ntkrK5
	tY+1dWbDshNBOQZrPmHvzyu5GHsFVx7sezL8mg+VbPXREylwAWcLw2Y/S51leQrgwnm9byhKdz1
	sFvIBcx9FtM0zp4M2WNw==
X-Google-Smtp-Source: AGHT+IHTU/h+YxTjXoaR6+Y1uzW4+uveYvkss4q07+0LGlKPlyb5aXcelH5soutVhPUD5Y6Qle3R5w==
X-Received: by 2002:a17:907:1c8c:b0:afe:114f:11fb with SMTP id a640c23a62f3a-afe29631283mr1044924966b.64.1756135537752;
        Mon, 25 Aug 2025 08:25:37 -0700 (PDT)
Message-ID: <f5fc3210-2911-4b42-af8c-8a2f4bcbdfad@suse.com>
Date: Mon, 25 Aug 2025 17:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/suspend: unconditionally raise a timer softirq on
 resume
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250825151515.39177-1-roger.pau@citrix.com>
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
In-Reply-To: <20250825151515.39177-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2025 17:15, Roger Pau Monne wrote:
> The current code to restore the timer state on resume is incomplete.  While
> the local APIC Initial Count Register is saved and restored across
> suspension (even if possibly no longer accurate since it's not adjusted to
> account for the time spent in suspension), the TSC deadline MSR is not
> saved and restored, hence hosts using the TSC deadline timer will likely
> get stuck when resuming from suspension.
> 
> The lack of restoring of the TSC deadline MSR was mitigated by the raising
> of a timer softirq in mwait_idle_with_hints() if the timer had expired,
> previous to commit 3faf0866a33070b926ab78e6298290403f85e76c, which removed
> that logic.
> 
> This patch fixes the usage of the TSC deadline timer with suspension, by
> unconditionally raising a timer softirq on resume, that will take care of
> rearming the hardware timer.  Given that a timer softirq will be
> unconditionally risen, there's no need to save and restore the APIC Initial
> Count Register anymore either.
> 
> Note that secondary processors don't need this special treatment when
> resuming, since they are offlined before suspension and brought back up
> during resume, the first timer that gets setup will trigger a timer softirq
> unconditionally, for example from sched_migrate_timers() that gets called
> for each secondary processor.
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Fixes: fd1291a826e1 ('X86: Prefer TSC-deadline timer in Xen')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


