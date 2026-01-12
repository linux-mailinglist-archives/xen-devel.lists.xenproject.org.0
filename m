Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE07D13ED5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200701.1516555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKa2-0004Gd-Jc; Mon, 12 Jan 2026 16:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200701.1516555; Mon, 12 Jan 2026 16:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKa2-0004EV-H3; Mon, 12 Jan 2026 16:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1200701;
 Mon, 12 Jan 2026 16:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKa1-0004EP-5o
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:15:45 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f20fed4a-efd1-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:15:43 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so49119765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:15:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ede7esm40100612f8f.32.2026.01.12.08.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:15:42 -0800 (PST)
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
X-Inumbo-ID: f20fed4a-efd1-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768234543; x=1768839343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uEkmx1T5Cp99HNbDPXu+PpKGAcURXg7oy00l4aR8aKs=;
        b=VZEyZ/LIatXRIVdsTT0crGNaLdKiTrFW/0E+rvq5cxYzxNjqC3B0f8qF5eAvyz1v/5
         yqpg4F7OoVvtDQzoTPTU+vdLrejq/tgMLPvBG+y8yAejEnLrd86vPlp6AZuW9Y32gO6p
         av4R1n2jxSXZNil9mCJgjRXR5Whu5uhYmngqF6D0SyjilzFyE2WwcnUJiK7UDCdJsFBf
         kDgGny/m/aSRk3LzdEglhOwW0wj/gD90EOdWqiHqgS7R/uaiQOwG390f4iZQQ+kNElUG
         wXwd3tpMxe6MTeQF4N1j4B8AbCK0GWDXeH0ckhhMbuV0LRqd50Rox37ivZKZ0A4G8EB8
         rnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234543; x=1768839343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEkmx1T5Cp99HNbDPXu+PpKGAcURXg7oy00l4aR8aKs=;
        b=h2mzCnDrr9DlsA+ILwVe7m4Fon9+l3n9WtFF1W1zrjCnbz1BlKT5id3ImofWITjyxx
         q+hAtZdYYPucbDidxU01jfUQ2sca2zpWMZIBw99qakM/A93oCLJ4l8rIRG3o2MdnAVzW
         ewkY1h+pKOPFGWuHBJCdHrhVaVDzCTGouh98zdcpb7KYzO8UkYUA4Hf8Qk4XzPH0IDQs
         LBULvgXYYGjPS8wAkDeCBYCq2LpTqoLFMVbrseyy4JmCoF2uUysXPzltnjv261RG6Hzf
         1XBu7y/h0RScuLWXKHR/ToHSy8kNJNh+GHIXlzt2+bXpFjbkc2Al4E+C34xVKd4+K/It
         3TQw==
X-Forwarded-Encrypted: i=1; AJvYcCXnCyjEh6R1dX+aBwZNWABeEj/MKBKr7olibLQTDoVNbNEgpSioLwkxddLJFLLcYl/L9uv3oiQ8loY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvUO1haYyPNyhvuyadMiO2Y4Gw3PlBYdkmvz5QxRIqEsMoQBz8
	cgGuxe28Nwo0yWt3UdfMK4QGxXPYwzhw2vqhWsnCBv8EQhAAP66ey6mt7s3DrVCfYw==
X-Gm-Gg: AY/fxX6ttH51LWVCI5a6vd5s1JQuyjlemrZAcE+WXbEP7UiUl8fm+VzOP9tW9udn/Im
	dR+Rg9rfYuy6PjY7jxlrTrdt9l2qnO/tHzvfBTKUKeZt2+YYfDWn2ukMDKN6N/9yY3i0gkMLR3s
	cF/w56XTsAzTZuf6+KzBnqtrIma8tqkavukitLxfSDkBBIneVr5ulV2RrbuiY81DIIVD7xumZ4K
	YJBOvdXKewg0WW7AZB40DEyFRENDg4LRhm2znYLaa9FOF55eCyFGs0INFd2ebufOIpyqaje5MWf
	kyvAhYrwq9D/g0lY7aq9NY0D8SClnD/pzgb4LWHowZIOEwIz0XdSDUO2XQZbNSwZjWoptsNSeJp
	8L1DYT1iDvTuZ91+IlQPHGhfhePUzDXIpzsmlKXwV5KgFMryjpV1+7HBsYi78/ev/DeH36swYAH
	1y8tRgOuD5yayQviAu/8pOhlU5PFXjjFn5FeaZ6DFoPz1qa+hyiJ2xdv7krzpGNfbfpitdYZ5kc
	UvxMYfHiWgRXQ==
X-Google-Smtp-Source: AGHT+IFCt6DfzOJNDSYT9mOIyBwixze053Gvn3sQg4YqObZyG+yXKeJkOrLsgoff8RIdFJ8pXWVOiA==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d84b26da4mr203601915e9.4.1768234543117;
        Mon, 12 Jan 2026 08:15:43 -0800 (PST)
Message-ID: <c673a353-76e2-4607-beb6-13371abf8550@suse.com>
Date: Mon, 12 Jan 2026 17:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/15] xen/riscv: handle hypervisor timer interrupts
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c63eef564d0d350f009e253b24b567488e47eb13.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c63eef564d0d350f009e253b24b567488e47eb13.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> @@ -108,6 +109,15 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +static void timer_interrupt(unsigned long cause)
> +{
> +    /* Disable the timer to avoid more interrupts */
> +    csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> +
> +    /* Signal the generic timer code to do its work */
> +    raise_softirq(TIMER_SOFTIRQ);
> +}

Why is "cause" being passed when it's not used?

Jan

