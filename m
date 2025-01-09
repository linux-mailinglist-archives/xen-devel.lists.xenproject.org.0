Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AAA07C47
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868852.1280354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuje-0007Z2-FQ; Thu, 09 Jan 2025 15:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868852.1280354; Thu, 09 Jan 2025 15:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuje-0007XS-Ck; Thu, 09 Jan 2025 15:46:14 +0000
Received: by outflank-mailman (input) for mailman id 868852;
 Thu, 09 Jan 2025 15:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVujd-0007XK-23
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:46:13 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d975fe0f-cea0-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:46:11 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so725046f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:46:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a9407fd62sm318816f8f.92.2025.01.09.07.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:46:10 -0800 (PST)
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
X-Inumbo-ID: d975fe0f-cea0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437570; x=1737042370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oQVwmZxbNLLILr1CnM8P4SWHt7jRq2iQ5dx8sauSL5o=;
        b=RO6MA01kyX8wRR9WF6PSyk+EUFcZTPj9hKUPY7YCbSw8k4909sCHmA3cVkqRzNe2ej
         kmYqRt0p++Ns+1qWatRiDhc1sOveM56PggZyifIDMrt8LtBdBHh7uN3G4ee5FBsJswLc
         Ua4MDb6mN1uOZ/ZkI8xrYjjvgSm5Y7hwqRMm56s5IfMj1S8+4JY181d76rQVBJ4rPMCa
         BNb0Mvmq75/sLTC5OvOcP0m2J2UUKYOLsPjI8LMZD+n/56i/CpNWdBgjqydwfMi9d0rW
         7lnjsHT0r48hfZT302bggcXUUcL8CzJKdzzMa2FVZJ7LOqBoSwS6O5CjCFIhIV9V+b4A
         zByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437570; x=1737042370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQVwmZxbNLLILr1CnM8P4SWHt7jRq2iQ5dx8sauSL5o=;
        b=AC6g+hpxROnypnyug8JzFUm55dlwLir+AhTRl320MQJJwWOTgjYMoVZ+r0lreuVL43
         z5mrfNbtOmKCvhTTRq0HD/k6xfV0fbU9pug8zCP4HH6ez2YOBUoyIRDI7Ts2WocqHc3l
         loNRj5bIATWS1iuzPbjFQ93mkjjYOj4sP/4kcS/6lFQ1/ZADidHVbG+R3CzagXvSE8YC
         wwBChhuwx3ndaZBWmovme+HE6veWRn1jQ27fT7vX+BDFjciD0CY0kBZHirKw16yk0YBc
         lxn39OXhYsF2Os9KdhaXHRjYowmqaXoLB+rl07/dDnIUMWXK6JVKvQrFn/pgWX9uha6d
         3tQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2NuleMxNgqeWQNMRUAdU8vS/Ai1v1igLRzr9aX3lVsqnr6LXCh2dpsKvhFs787wmzcdsuEwuzTi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5uoBhiibPU+RlXiHp+whFsspjZ6CgtffkpuNk3nHrlPJ1JLCw
	D+/vGhtHHwiP+SwzJa/CwyOmgRvyOcspoAeQwRTovR44U82+6zKJYaCh3TNphw==
X-Gm-Gg: ASbGnct2Nzx6cL8qOoeMgEKyFujmGf8kl18dPvr/Y9Iepdw61rC7oN89vsPeB891T8J
	bJGu+cszvWtZoUP9GX41OTgOVN96h0sbnhn3EEdvpSlVtTlh5kkpe4tQi4etIV7o2C5uudmTax3
	J2AV19uU2QgCXM1Xg5/NdTqRnRskUFsO9WrQj/sktOyj3Tx0ToMIgV3mb2TNiZaxawagjugxAJx
	jDJa286Z4ysRMAfRLYoPsZDNs23bsOwK9wAP58Lkp092MJ6o5H+ylrJ3cithEh4GsPw//J8AwHm
	SIvH05vTyrZLcqfs+cuuMzGhIGR0ihfp7WeKX9ye3Q==
X-Google-Smtp-Source: AGHT+IFr7L4PH8JBbsjr7AdoYXvWdFX0VMLQaxUyz+WwqcnsMDw8Px2hlkDY8NCwPlqSxEvpzJ0wNA==
X-Received: by 2002:adf:b197:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38a88b89a0amr4570426f8f.22.1736437570592;
        Thu, 09 Jan 2025 07:46:10 -0800 (PST)
Message-ID: <cb4fbf1a-df46-4891-9614-f5d87512a654@suse.com>
Date: Thu, 9 Jan 2025 16:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] xen/events: fix race with
 set_global_virq_handler()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250109105935.23585-1-jgross@suse.com>
 <20250109105935.23585-2-jgross@suse.com>
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
In-Reply-To: <20250109105935.23585-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 11:59, Juergen Gross wrote:
> There is a possible race scenario between set_global_virq_handler()
> and clear_global_virq_handlers() targeting the same domain, which
> might result in that domain ending as a zombie domain.
> 
> In case set_global_virq_handler() is being called for a domain which
> is just dying, it might happen that clear_global_virq_handlers() is
> running first, resulting in set_global_virq_handler() taking a new
> reference for that domain and entering in the global_virq_handlers[]
> array afterwards. The reference will never be dropped, thus the domain
> will never be freed completely.
> 
> This can be fixed by checking the is_dying state of the domain inside
> the region guarded by global_virq_handlers_lock. In case the domain is
> dying, handle it as if the domain wouldn't exist, which will be the
> case in near future anyway.
> 
> Fixes: 87521589aa6a ("xen: allow global VIRQ handlers to be delegated to other domains")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



