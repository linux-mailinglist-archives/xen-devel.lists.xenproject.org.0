Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A7849C8A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676116.1051996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzYB-00030b-1n; Mon, 05 Feb 2024 14:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676116.1051996; Mon, 05 Feb 2024 14:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzYA-0002yk-VD; Mon, 05 Feb 2024 14:02:18 +0000
Received: by outflank-mailman (input) for mailman id 676116;
 Mon, 05 Feb 2024 14:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzY9-0002ye-Sd
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:02:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b429e2a-c42f-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 15:02:16 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b402116e5so411569f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:02:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t10-20020adff04a000000b003392206c808sm8079238wro.105.2024.02.05.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:02:15 -0800 (PST)
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
X-Inumbo-ID: 2b429e2a-c42f-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141736; x=1707746536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdbLGgIFQ8R+s1/q4QmsyMW3KYfCZDydBE9Pbqdi9y8=;
        b=bHeVE96iEAvxIMHNnM2T6CREHTl5talzetbNyZbvMyOek+y47e96PjYkpi+sOuxsAY
         WWBRb+fzTmw+azkJfchkVSw+c737kyyejS1yAvtSf8ylHaBUj9dY5SRbn68xwnEA0j4N
         U0EjADXOv/1MkRGHlhW7Vl6nT4iy8OqEVVMK/+s7Ycn7lya2DIyqlZmw3DfzjjYuNc/a
         WHVAzXIAdRR/TSOccWUC9Y/Z2jvdzENmRmp6DzLbGeE9YDleyU+V0C+wfAqX0Qbz7MdK
         MjvPzV5B6ieyYi5s2M5f3q++pamrfOKwTATiEWlaKSeIUdJ39FNKuSVZxf+8gsWy4R/5
         sqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141736; x=1707746536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdbLGgIFQ8R+s1/q4QmsyMW3KYfCZDydBE9Pbqdi9y8=;
        b=L2SF6yjmvskD3eF96lM4yIR9vogfLhCtCRNUuySAit4uJrpfYEhun0gFyF0nCJ4MNz
         hL6csroQ+xHL1xTLGhg1yGyRxnMUZhkKl2BdHN4B1EtV5KM/YmAO1z5zvj8JEcTesNbq
         9LWC72GMRv4+lgMGL5491gYthhYuz1T77ElZwXPIcGsS0wZdw958/bAZEuMI4Vt2JIby
         I9KZHRq6f0EH6IaqvEUbPBB8XzoS8rcEvEuKiDaNsfBpJXkhV96kVbkNMjPzE7ArwEw8
         r30zzyLMYFI6eGm1SF71xEXbZaIPFHMl1ZqGK+fXNjxqk2JxylVmlipYjgFPnC34gJZl
         q05g==
X-Gm-Message-State: AOJu0YymT3Xv66NVMcn/7H/2PmfbPcxy2PXkhvJBxV382MX3u9nD9Ikk
	YDpj+9jsQ08+WScdvAUckKTGMaWaHn+3WUH48AfSBxGPTeXVAvK5fXEFI6bHVw==
X-Google-Smtp-Source: AGHT+IFBGL7x0Lq/IGB0XCGLTTtLnpd/GbVhHxBgeyF0c4E5jkBKxx/llTTndYurambVlr8t+w59dA==
X-Received: by 2002:a5d:4809:0:b0:33b:1131:ebfd with SMTP id l9-20020a5d4809000000b0033b1131ebfdmr8781342wrq.49.1707141736150;
        Mon, 05 Feb 2024 06:02:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXP0fPeHZzcNDfu4yKGWVDpuOV+waIgQWKtnTH5eMbjKwfLC/hCNVZ652vqrXfLG6QvH1fYovHWMNx5SJEUW1BCRXkVSRwoXy/Xn/Ut1FQesTCosTUi3v7QkpPQPyKeqsnKy2IfnCkC8GVbHjlzmHIYWTX2xqSnwL22vYERM2QA1uk5X0J8iGwoEeprZGORgPSYkaatPxoIW3iIt0Mzn9iqzCs7oOXBkVzdDLCnha9/8Ya54IUg+0jebjySPNKLljcN9YLO0F3eYa6IkbTZwSGmx88BKWpBKTJM8FPQXjuO2gGpzr4=
Message-ID: <6f4dc7e2-c54d-4dce-8cd3-7fd45391eb0d@suse.com>
Date: Mon, 5 Feb 2024 15:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <f20d2cef-4435-4b9a-9ad8-61ceddb6bcba@suse.com>
 <f97088c6-ec2e-4c60-b91d-ec1a30d077df@citrix.com>
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
In-Reply-To: <f97088c6-ec2e-4c60-b91d-ec1a30d077df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2024 14:51, Andrew Cooper wrote:
> On 05/02/2024 1:32 pm, Jan Beulich wrote:
>> The type not being used in do_bug_frame() is suspicious. Apparently
>> that's solely because the type uses a pointer-to-const parameter,
>> when so far run_in_exception_handler() wanted functions taking pointer-
>> to-non-const. Expand use of const, in turn requiring common code's
>> do_bug_frame() as well as [gs]et_irq_regs() to also gain const. This
>> then brings the former function also closer to the common one, with
>> Arm's use of vaddr_t remaining as a difference.
>>
>> While there also replace the bogus use of hard tabs in [gs]et_irq_regs()
>> (I clearly didn't mean to put it in like this).
> 
> I meant to query that at the time and clearly forgot to.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm still confident we can get rid of the fake frame in the serial
> drivers, but this is an improvement nonetheless.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I'll rebase my work over this.  It's going to collide horribly.

For the patch here they're affected only because I stuck the patch at
the end of the series. I think it ought to be possible to move it to
the front, and then it could be left to be determined whether my
introducing of set_irq_regs() in the poll handlers could actually be
avoided by whatever work you have pending / in progress.

Jan

