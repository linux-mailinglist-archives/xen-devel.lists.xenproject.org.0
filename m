Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2BB16E1A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065115.1430453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPDU-0003n9-43; Thu, 31 Jul 2025 09:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065115.1430453; Thu, 31 Jul 2025 09:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPDU-0003lb-0C; Thu, 31 Jul 2025 09:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1065115;
 Thu, 31 Jul 2025 09:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhPDS-0003lS-8H
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:04:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d2f59a-6ded-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:04:45 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so516362f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:04:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd1a7sm1062392b3a.73.2025.07.31.02.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:04:44 -0700 (PDT)
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
X-Inumbo-ID: 66d2f59a-6ded-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753952684; x=1754557484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PGPA7zeNULQkgTTaEuRUnbzi/bU0tlmrqMv4ARljDo8=;
        b=K24NZagSjNjap7SwLQ2mDLuUxmm/SDim0Med0gv71YeC8R9376gfkXlkjjzeyWqIVJ
         YzcBeL9aTSgjP/PX/0Poa6irZh0f5fC0x+re+EHlFsZeCMfOGTl95N3B520P2G9iNdXw
         dwczjqfh8PZMLP/HlYN7AWfITUy4V0pyfkLfY80kpQXxjFKnxjkLYruZ/PyDRjd0npgi
         ok4adXSowq/2bXKClIPHFPS6JplZOGVj6UQ/eO6fchkSSbBSAiwbFWQov84Mx4VsTTSo
         gzOdNavN18xf1KyuUSUfptKjYKlcI1UdlXlFjcniekR1AfKYuccVECYsQ8e5hkxZAFm5
         oYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952684; x=1754557484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGPA7zeNULQkgTTaEuRUnbzi/bU0tlmrqMv4ARljDo8=;
        b=D4hxPKdmwhDjPS7mEb84Dbw15sJqJUiDoog+4gPnXeyswg1tRIYEhrfXk4BhrPp0Dl
         NR0CdVPslTKIV9H+UWt/txbHp1VzGvArxBNB1nO1VQIuxDAuP/7ot0m7Qfk0wtNc0hth
         HlBhjQJH93PmuhovuaLH5l8uZDo5luysByeRS1giTsVnKHpFMfxy6Vy5ps6AHFUsHcnB
         HkBOppCItUxwTY1ayxeCKO9/XjwLl/BfZCmBeBUlA3f11eMauB4rbGfLrej9J0sNtLUv
         JQ3MpaMlQAnZ/JsIMzhn/xc7OWSUOg1+bM/oZBy7sz6vdpMUqVq2gBkqvIYZeVN8cQmq
         Co9w==
X-Forwarded-Encrypted: i=1; AJvYcCVd+PMbRhI6j0/WThBR3Ng7x9rZqE18m8xIu1x0OTnKRiqvu95bQDBMw474aCwLbvkUgGVB9RgDhuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfRhOk/4pp9c7xdB/i6TG72taRz7t4+d8pNHAF4UTEOXX0yhxF
	okar4IfWhanyvXF3ihK5glstjKo0vvNUE7PuzVuntx4LQVh8sj+gfwzWaya9dAAcmw==
X-Gm-Gg: ASbGncsyPxhMVojGQ77n3VzV0JvLnjGSpJt1+IVtKfIvHz/djx8RLpz+KJfsh3l3OXf
	lbfIpCPlZpgexo6NDCwLy/742JgbscFoVzN5gH3FQwZ9xIRJ97peDUPoEZqfK3Tel5fbr+h388P
	cWjQb5oc1sQFEREE1lA39Sj8p14ktyIUONDdfTHsyQtXfxAEC2LsyHjB5KLaWBIg+ovgbSN84z8
	/Mout3/v43J8QlxocZMYRJZkjvrbWRCeXpNLwa9JXwn2ZSScG36by5smYJko3Wh/K26O2J6i+j0
	3R+RwSELcnn2nRf8ETCw6AErBqPRQU/6dQWcXodS39OhY3znazRCP1OF13HuxluMrWyrUeU6aiT
	d8f8MPIKO/TRvL/ASA8a4EwBMS5fIFTHxMgHp0kZRRfap+0pTJE0fQ/xsdZuhGADlLtz4hf+GQv
	i9bsvo29d+MKU3FMeRDw==
X-Google-Smtp-Source: AGHT+IGuFO9VFLFwEoLBD3bSIapAuPO5uOPtIGlV+AtmEsLxGkK8h0pCRDn6XKKIDm06qT+PqNHiNw==
X-Received: by 2002:a05:6000:2c04:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3b79500950cmr5268785f8f.48.1753952684511;
        Thu, 31 Jul 2025 02:04:44 -0700 (PDT)
Message-ID: <23b157e2-641f-44de-8042-a949abe25ba1@suse.com>
Date: Thu, 31 Jul 2025 11:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] x86/altp2m: Wrap altp2m-specific code in #ifdef
 CONFIG_ALTP2M
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1753871755.git.w1benny@gmail.com>
 <c1a105db2bd22d89443e9b16cccb086b4b8674ef.1753871755.git.w1benny@gmail.com>
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
In-Reply-To: <c1a105db2bd22d89443e9b16cccb086b4b8674ef.1753871755.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 12:38, Petr Beneš wrote:
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -889,6 +889,8 @@ void shadow_p2m_init(struct p2m_domain *p2m);
>  void cf_check nestedp2m_write_p2m_entry_post(
>      struct p2m_domain *p2m, unsigned int oflags);
>  
> +#ifdef CONFIG_ALTP2M
> +
>  /*
>   * Alternate p2m: shadow p2m tables used for alternate memory views
>   */
> @@ -965,6 +967,16 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
>  
>  #else /* !CONFIG_HVM */
>  struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
> +bool p2m_set_altp2m(struct vcpu *v, unsigned int idx);
> +bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
> +                                 mfn_t *mfn, p2m_type_t *p2mt,
> +                                 p2m_access_t *p2ma, unsigned int *page_order);
> +int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
> +                                mfn_t mfn, unsigned int page_order,
> +                                p2m_type_t p2mt, p2m_access_t p2ma);

These latter two already have declarations; we don't want to have two of them,
as they may then go out of sync. They simply want to move out of the #ifdef,
imo.

Jan

