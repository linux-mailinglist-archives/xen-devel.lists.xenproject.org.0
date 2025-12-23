Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822FCD9E79
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 17:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192680.1511808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4yb-00028R-FZ; Tue, 23 Dec 2025 16:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192680.1511808; Tue, 23 Dec 2025 16:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4yb-00026S-Ct; Tue, 23 Dec 2025 16:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1192680;
 Tue, 23 Dec 2025 16:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY4ya-00026I-GL
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 16:11:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd00a426-e019-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 17:11:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so46261335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 08:11:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm247204175e9.9.2025.12.23.08.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 08:11:06 -0800 (PST)
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
X-Inumbo-ID: fd00a426-e019-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766506267; x=1767111067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqo5wDbuAUVDMAX9DWfPckr5yjybwEaleuaH630r/Og=;
        b=dzZ+sobQhckGyxoQ0xMFfjPFOdmYD+K2/Wr6p9nba1uLqCgxIBkmo66mUXddsTXv8M
         vVYRu6XpU/LvYJpHb215p9czkKoU1g+TSseiAgfYSxPEIu1NSq7fvwioBjKhywrexl79
         cxHlDkzlt7YbgX9boQrfbrIbfbkjkoDwHznm1H+vIJwsTbWAuahkr9OtTjHC5TJZX/Df
         uA7KkXADreYBvBiTc5YhXnGvd/cD9QxQja1r5oa8cSsqhRH+6/HSeOxxd/s/3bujASjA
         jdwOi4D+W+1EEys9mGAKY2a3Y1IEaqj/tNCfB/sPwtSsoeXhZAsVMasDaWVUEsIQyq/6
         YNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766506267; x=1767111067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nqo5wDbuAUVDMAX9DWfPckr5yjybwEaleuaH630r/Og=;
        b=k0kvoEJVEWimHQKwyINlsk/lpwuGWTT9F+H3QYnxAkH0sLzY1bXZFUVoHWBszftbbF
         VDZ4TF/A8MCmNiWxkeWzuKPyNvPNZm05SfrUI8BMoAv1guNj59jquKKt2jme4y0Pdbb5
         h48+/zliZKTCyI9GUosbRLijgZ3lDW1SE9JC5IH6yncm0F8miWHyllWtLWM3lyQcEMq1
         jd1eXMjD2IbOpheCcoXeCua+N15STpytOlL+9XSFbz8XWSh2yzCHFxxBcx8vyxhNCekW
         FDYL//pA5wLxto6xF7vfUt+awKD0ahpIWncBWbIWgXiM3uMBtjpv/lK8CFIkuGPojZ9q
         DcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV86cs9ZRg7Cd3LYTLe140M7LzOxhAjZskobxdmdyq3RjThzapO+B1MEQIaC5PcAW6yYakIFVtsF7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYfYEvB4fkt7cMAcJN+Eua5/MaYCSLQAzn/YvIgE81gPVbpfvU
	fkmlBayGnK2M0tO/gLGlt377asEdAwBI5iqwRLvl0QCSNsTleeYtISBCDImRJ7HEeQ==
X-Gm-Gg: AY/fxX4VuuuGG66lqyajDxBWMkHzO5F/9RfV4uZs7NDvmJpb9ZWusftoL8uE1gD271f
	gjjsdd85Z1XHMOWslDsD8N8b0kFwei1PGqlED9jXib3+SXL5wi3ZB83TK0LbgQ7s5KAW8fHg8IW
	NsKFre89W0+p7AW0Lr4WZiw8pVGg8ZIGgZQdaoA2Hn3kU1ddpeG5NL2aUaAml5Pt/aQ4lday6/K
	Qdfq2Q3KbjT4gplx9HVzzAlTMFA0YDIbXQSC414k8Wg0j3BOON09PKtAdH1QeRmRwm0IubKzgzZ
	302sBdcbwCGgvJLHEd60WM7CYHP5FvzbUNlKhHuokgU9p8U90iC3SkMZF/qgkBI0frbZzDOgSI5
	TWqhWhUDSuPnDTexqfjHqZSL9U9tbV0/cKEYsHs5TzFE3ndX+Tlic4FU73aEdCQuAl3NvOGPmQc
	+9fG4JKo6k6JsAc3U2lvSe52T+i07kOcztrqWoDa/dJbv4uyyWSxcit7OztSSr2/Za7Osfzv7L8
	JiIRR/XpwVW/w==
X-Google-Smtp-Source: AGHT+IGsAI9FZgLBIsvL83CNcSQw8hzv/PGJlHvzpL8QFcry5wEuDe30pf5twxIBNwbdvVYDrMvj9w==
X-Received: by 2002:a05:600c:4711:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47d195c1a71mr162729425e9.34.1766506266739;
        Tue, 23 Dec 2025 08:11:06 -0800 (PST)
Message-ID: <74eec4dc-de48-4060-8f87-ba04023fda17@suse.com>
Date: Tue, 23 Dec 2025 17:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> +static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
> +                                     struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +
> +    switch ( eid )
> +    {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        vsbi_print_char(regs->a0);
> +        break;
> +
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        ret = SBI_ERR_NOT_SUPPORTED;
> +        break;
> +
> +    default:
> +        /*
> +         * TODO: domain_crash() is acceptable here while things are still under
> +         * development.
> +         * It shouldn't stay like this in the end though: guests should not
> +         * be punished like this for something Xen hasn't implemented.
> +         */
> +        domain_crash(current->domain,
> +                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",

Hmm, wait - patch 1 says you would consistently use #%lu for FIDs. I can adjust
while committing, unless you tell me not to.

Jan

