Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715599048C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810434.1223154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiTb-0007Hd-0l; Fri, 04 Oct 2024 13:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810434.1223154; Fri, 04 Oct 2024 13:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiTa-0007Fn-TV; Fri, 04 Oct 2024 13:36:10 +0000
Received: by outflank-mailman (input) for mailman id 810434;
 Fri, 04 Oct 2024 13:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swiTa-0007Fh-7E
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:36:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b354dce-8255-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 15:36:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so232293666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:36:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104c231fsm226198266b.197.2024.10.04.06.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 06:36:05 -0700 (PDT)
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
X-Inumbo-ID: 9b354dce-8255-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728048965; x=1728653765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QXqof1dQaBcUE/Ue/Fb5KiPTC67hzCCEyzLD5W/0X8=;
        b=JNrPnJVEqnNdml2U5xSG/DWwDJL+K84GgHQktxKyCxVqYX0nVZJJPewwZ+CIdyAVtK
         qJJqrcleDXTGytL0/5bFs5l41gmblqODlXIU1ojiBKJye1v+T6bHmymAoE4Z0kJZW13q
         FzjeHT+T+ImXZSyZ5DsaKx1/gGEIxIBF06UQhtC1EHu/Csy8L+E6pzOdpHrVsZC2ql8v
         iAv1XXUga5I9YweTdKYUvkVeKVOn3UWlNZDW2wnwJSXk4sXvq6narwgZA4UqH94epQzw
         coZjWt+3YhIIPaj9zQcgBpA8exvdfLFXej8lFlIdV2wzhigf6Va4W9Hp+FK6xzBLJWDV
         /neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048965; x=1728653765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QXqof1dQaBcUE/Ue/Fb5KiPTC67hzCCEyzLD5W/0X8=;
        b=qAqeZNhnY5uddU64ClkwoZH1DxsQUYY9t9AfXgbczTg/5kKUtmJoTNfw8IKksyynuI
         gZDtqoZI+IOVWvT8FeFqmLpmawG2NE/KjRjcC2Euwn/wIIyr8QxLNo59G4WWKZpFjKxx
         VtpixhXps987tuq+SAK2I/vw1NiZllJS0xqUkKo6CUS82wqtg7xabet1NFN1mqBBhMbW
         kPoQM7QhPjeQBk0s6Guhs7fDLfdlyd+vWbLCJDIPUMmNNFBtuz8VzXPGFwzguDcOog09
         Hn7fXx/1W0HLG8AfotVGztTe9oCSTT6K7KPvcrCPvsWp64g/224z5gmI3enpinf9xIdr
         YSjg==
X-Forwarded-Encrypted: i=1; AJvYcCWlYs2o+8yB+Qp05NYphfHxHiMifOIsVfbet0Dk5lRFyTcdDBsGdBV49weJyjz/AvF5CoFnb9mphw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqcJEhBpqMPsmQxbmeaWXEUQr6s59tVAQgd1CsoegZ34ERoO00
	GR2gz6CKVBHRhE2DjjV7HTz9cVMAWSAe17BabhhfD4odibyMFcrtw3PZnNpugQ==
X-Google-Smtp-Source: AGHT+IHsSvSWBQSBTTWod5KXQvFBKDg2JLdXoqxY8KgVDGpzUpFjONDikW/NgkAm1dxhEAS/v6U8RA==
X-Received: by 2002:a17:907:2687:b0:a8d:fa3:bb24 with SMTP id a640c23a62f3a-a991bd1f7damr269485166b.23.1728048965516;
        Fri, 04 Oct 2024 06:36:05 -0700 (PDT)
Message-ID: <898034ff-3a73-45c2-b3e1-247f593bd073@suse.com>
Date: Fri, 4 Oct 2024 15:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 3/3] x86/hvm: make ACPI PM & stdvga emulation
 optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <9b27c594b3a63b75826a864dea08d902fd8702c3.1728032664.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <9b27c594b3a63b75826a864dea08d902fd8702c3.1728032664.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 11:35, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -742,11 +742,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    const uint32_t disabled_emu_mask =
> +        (IS_ENABLED(CONFIG_X86_PMTIMER) ? 0 : X86_EMU_PM) |
> +        (IS_ENABLED(CONFIG_X86_STDVGA)  ? 0 : X86_EMU_VGA);
>  #ifdef CONFIG_HVM
>      /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);

Nit: Blank line between declaration(s) and statement(s) please.

Jan

