Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52BA4F9FA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901951.1309949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl2A-00087U-Ul; Wed, 05 Mar 2025 09:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901951.1309949; Wed, 05 Mar 2025 09:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl2A-00085h-Rh; Wed, 05 Mar 2025 09:27:22 +0000
Received: by outflank-mailman (input) for mailman id 901951;
 Wed, 05 Mar 2025 09:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpl29-0007je-Cl
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:27:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076917d5-f9a4-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:27:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso44338785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:27:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c56esm12116245e9.8.2025.03.05.01.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:27:15 -0800 (PST)
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
X-Inumbo-ID: 076917d5-f9a4-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741166836; x=1741771636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JIbWlmogagG8Nr4p/sVEF/l1fBAdfQL5Wmo+JZUrh9Y=;
        b=GJajAuaZV0F4TIt0EwxnvdPx6l1N4sxzUAs9IS0WidI0YrOFqS87uqa+C+31XuOc2h
         vt+WF3PgUENejBK98wH3PsBumX0OSKtK4r+X3/ALJn/yYzrcGf8QgVKmzrqi58uG14BM
         IiG2N3cdCaRXeMVznZum5ejmmUYpOONOKbKMubc2bvsG75IC7CgReNe5xEMK6zRv/xuj
         A40Br3sJ/xLMDOTcWd9euOSbAG+PPKdNE4ZYWAM4J2cOo2fWMupgAqXWbihIDOInWqjj
         oeTPvpE/hyhNuB4BbJ9r/sfKL5vZpxlvcAO6M3vb6z7+Avsmraak8INv1gxsrFKxPd6f
         V4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166836; x=1741771636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIbWlmogagG8Nr4p/sVEF/l1fBAdfQL5Wmo+JZUrh9Y=;
        b=boM4Eo69jq+lE3NTuEXeVw9xXSivVvOx9bdKxhfQSGbf5R0hn1pqu0GMqXdXSbwrMc
         iaMp1V/TRcMiY223lkBVQEYzigoeDzBSpy+YBrvCyeAIDMeLywYJGKQ4/AkH4eEUNeuL
         79HSc8X+DDyiz4CA4ZQv0HUY0IN6sMrkWgaCJe6HEy3mv6m7GKAtmfvPgVfsiYPlSqLG
         G60aFdhaNVXrJ+B5/6G9d0CdJq8Uh1i4jIXdoCncoaZ+E0divCYv6JIcw2FFFJ6wPVJn
         5W7Fqf0EzVkjLM/HwxMr0w0s4EpDanBdhGZwxgvkZNrHNg33xbWDFgZ6n9D5rZtPShwl
         G4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUtWWhFz+QKorBa+h+z8hZJzb3LwjnGbDcT+nu2Qxp+8dLM+klObhmTQZq3/iane4Wq3DOPRwk/I40=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/jEPcSsE6+KOPlvlZSyS0LjgMW7KOFkGZjWz9i9Ko8sfNj2QX
	+ZORIW88ogpotahmjIF+4Du9cwvaGDTpj6KqkjfsywcUldCokoBmeWixcLoKuQ==
X-Gm-Gg: ASbGncs0ZEzTYaRVk5jagQYkgXAFFm14F7YiV0C02vMCILAYnnnxts5ggqSfStlyoyx
	og0KS0Qaz+OuoJm/rg4IeY0KnO0mkqc+kbNYQW2ZMASNSp2Wd56CD21judq1aniEHVl87xxgyqW
	kkNF68bFjVc5MIzOmaN6ICM41c6kRJEeEdcMej56uhuEO94mDrkIGI7ssUS1vygmMGX25bUk8Ss
	99dWts2866Hnad/q0t5wfKPpSWiBfFXasBSIHzxjaGOzZiJ1aEgiEglSSq42Z4qyy+9L8PuA0zP
	Ew/C1qL+VwELb/Tqo48Kko3YgVlEA/v4NiSoyskMoZT5OytNV0+rx1KH3kcz1Y1vVjBVJnpr6St
	vReJjHQ7NoDBh6SAS5XG9ASfKFjhpkA==
X-Google-Smtp-Source: AGHT+IFLwYDBG8NgusDkzaRW7RPPrt5+C/nKL3xvGTFWETJurLaRumpYNU7hDxR+oWNfh+4py9hR7g==
X-Received: by 2002:a05:600c:1d0f:b0:43b:d203:da18 with SMTP id 5b1f17b1804b1-43bd295494bmr14776665e9.13.1741166836145;
        Wed, 05 Mar 2025 01:27:16 -0800 (PST)
Message-ID: <7fc9ee31-dfce-4fba-ac11-4d6ff2acc2f9@suse.com>
Date: Wed, 5 Mar 2025 10:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/watchdog: Identify which domain watchdog fired
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2025 00:29, Andrew Cooper wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1534,12 +1534,19 @@ long vcpu_yield(void)
>  
>  static void cf_check domain_watchdog_timeout(void *data)
>  {
> -    struct domain *d = data;
> +    /*
> +     * The data parameter encodes the watchdog id in the low bits of
> +     * the domain pointer.
> +     */
> +    struct domain *d = _p((unsigned long)data & PAGE_MASK);
> +    unsigned int id = (unsigned long)data & ~PAGE_MASK;
> +
> +    BUILD_BUG_ON(!(alignof(d) < PAGE_SIZE));

    BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);

> @@ -1593,7 +1600,17 @@ void watchdog_domain_init(struct domain *d)
>      d->watchdog_inuse_map = 0;
>  
>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
> +    {
> +        void *data = d;
> +
> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));

        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(*d));

Jan

