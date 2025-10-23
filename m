Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F4C01E6F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 16:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149235.1480918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwep-0007hU-Bz; Thu, 23 Oct 2025 14:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149235.1480918; Thu, 23 Oct 2025 14:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwep-0007fE-8n; Thu, 23 Oct 2025 14:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1149235;
 Thu, 23 Oct 2025 14:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBweo-0007f2-0H
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 14:51:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7775fe1-b01f-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 16:51:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso732664f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 07:51:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898ccc60sm4534655f8f.34.2025.10.23.07.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:51:10 -0700 (PDT)
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
X-Inumbo-ID: b7775fe1-b01f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761231071; x=1761835871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W6IQUqU5y2BjJHB6T+rWPpfpRczNxrZxlcpdt3jP1ec=;
        b=HR7lNqLpbLaFVoT9gxrErNOMo2P8EW+ViIXkTf23mrRX/6UOY7vXwp83hdIq3rbQms
         tUXuYNI/L4+VJw7PfqUEoluKGm52XPxekn1AwlDW6hoGeDwFNpbGrSZvXT/WvnP/CFfQ
         ngcx4Zpj3/Tk7229D1nfpLkUCRKIX0cAIzVyEH0L3C0hENUdQQYcRdLmC1wmZNXU/Hhn
         33AE+KzEm7wOZjcVnwhaKIF0HB3m3IimTdcBl1pKTPw6FpkSdhbNa4yMLv+HBfVo1Dnl
         CuNPGmusSFwweF/975jVLp80OWqe6cr2pGO7B920HS+EcDJn4h5rhjW0NA0dGV2htxc5
         bKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231071; x=1761835871;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6IQUqU5y2BjJHB6T+rWPpfpRczNxrZxlcpdt3jP1ec=;
        b=ofmav6Ov5a4euHdLux2jbMp5UQTJCOQnoqpP6WzmWzOn0znGv6PJx3EMezsJejN0C4
         7XbFdTfdpecfZ8jO/ql121FFXIt9dZIpSXqKtl7A9e9s2P5JZW4JSM2b7dsXfV8stXAc
         FBuXKmVWQokLU+a2mW1weu/Sr1s6QGQWNcujUSHtjca4Y2aZEUHZcEFzndFtCKAkdHLl
         7Uh9cBcUQW4LvfLOEYi/uQi3hgaHu6IS6idj9IHXMuYQY1IB+v2Nze2DDmGPEuoRWG1W
         V5qtb3t2rrOm9NFk8ZLbrXeowis6tEHaqslnJTBagiiGNoLMhCXkTO1AS3VqFzGoVusu
         CQHg==
X-Gm-Message-State: AOJu0Yyu4cBqLvDeFlFiczYpqElJ8CzQeTnvxcwdrZd+LU3N6qh6sI4R
	yFt1sCTyrvYyFt6FNAbFzfzHSU0bRi3+VwhMgyd2zSsV7QN6B6tjql0cU29zl+3+d8taU++kpss
	E0Pw=
X-Gm-Gg: ASbGnctrQLKUiHwbEP/VZVLgXBliia45eUriOhOg5IfUdBvgSjhtfhDoF26oHBkHQQy
	e9Mv57GbxaU4vhY3XMGoUe1xwlTSvd+FuTGq5+oFJYbWxE2SLx6Zi1VSr/aynttBixB6HZ8yTjq
	gwfLsIBgm5KIyV6cfTByg0xMjAzI+0fjn6BE4xRzxwsNwlEdD3ME+4meV3bBM61LXuJPQlbXjt4
	nbEXoDvcLREh647BNBmF8VQy+xJS2vmx+0kVZf0qFmJxJauETA5ycqd9VizjbBjq0LXssd1Z0QC
	HE2Rnhx21uHHsSw65UyGvcGgGQLZ60gz6UEnTGFNIH+z1vNQ1Kc/5dOnRoAf2eDnYfrReqpi7tV
	cHhAFn1/9wZ1wRnWDOpqkPDkJKBvSB27XXVrMyys6l6s75ocNM7GmjyjJqC9XaMNLcavRHJXP1j
	2ufrLqgs/XJ/S4/6Fx/65FA47STLB0fygKreILS5Pjn/nqr06SS8+xrPFj+/u3
X-Google-Smtp-Source: AGHT+IFByNgEABmj/Fwrdq+9iBo5cJ+VhJv7KIqhhK+YOgjAkm5+7L/vSIJqhN/b2kABX4DTSxn9cQ==
X-Received: by 2002:a05:6000:1a86:b0:3ee:109a:3a83 with SMTP id ffacd0b85a97d-42704d948c3mr16749248f8f.29.1761231071147;
        Thu, 23 Oct 2025 07:51:11 -0700 (PDT)
Message-ID: <496e8dcc-f389-4e87-be9d-c52f2914dbc9@suse.com>
Date: Thu, 23 Oct 2025 16:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 1/9] x86/HPET: disable unused channels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <53011168-7b4c-4232-9295-f33399580578@suse.com>
Content-Language: en-US
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
In-Reply-To: <53011168-7b4c-4232-9295-f33399580578@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 13:18, Jan Beulich wrote:
> @@ -526,6 +524,8 @@ static void hpet_detach_channel(unsigned
>          spin_unlock_irq(&ch->lock);
>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
>      {
> +        hpet_disable_channel(ch);
> +        ch->next_event = STIME_MAX;
>          ch->cpu = -1;
>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
>          spin_unlock_irq(&ch->lock);

Now that I have everything else working, I thought I'd look into where the
excess IRQs come from on Intel hardware. Since my earlier experiment with
making conditional the write in hpet_enable_channel() / hpet_msi_unmask()
had failed, I was misguided into assuming some more complex logic in their
HPETs. It now appears to be as simple as I initially suspected: It's 0 -> 1
transitions of the ENABLE bit which cause immediate IRQs. And the reason
why the removal of the mask/unmask pairs in patch 2 weren't (sufficiently)
helpful is above: We better wouldn't disable the channels, to avoid said
(mis-)feature. Instead I'm now intending to merely write a long timeout
value here, along the lines of what I did in this version (code there fully
dropped in v3 though) in patch 8.

Jan

