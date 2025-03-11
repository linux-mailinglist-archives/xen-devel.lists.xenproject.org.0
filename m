Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE68A5C206
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908104.1315257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzN8-0008BD-IH; Tue, 11 Mar 2025 13:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908104.1315257; Tue, 11 Mar 2025 13:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzN8-00089g-FM; Tue, 11 Mar 2025 13:10:14 +0000
Received: by outflank-mailman (input) for mailman id 908104;
 Tue, 11 Mar 2025 13:10:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trzN7-00089Z-CX
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:10:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f820f2-fe7a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:10:11 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-391342fc148so2598451f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 06:10:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfc96sm18445614f8f.31.2025.03.11.06.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:10:10 -0700 (PDT)
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
X-Inumbo-ID: 29f820f2-fe7a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741698611; x=1742303411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kZxzBfeMvtS8msc4AUdZye+paWIRQWsY02FYX9D/dyU=;
        b=aXTG4GJomasvzYn3/08M6fWlTyn5aYN5byhrV4x2/47tyLawdlFqxQZfRSejQPK0ME
         HhYcwDLLZe54K/yGOFlVciaVwTJYpTBcdk4satfpYP1YjmPOvjqgBKTb/V6EmXoTEErq
         EjhGjSF50tyY76QNu1C9b+9LJL+4VznjCO/Z37oxTMbsmMOgSgUjgy0dCvDT/YA85Gpt
         tcD6JqV9UlZ30feRaqMsCYvY35VclKue5eNhsDluTex1MBbok/OIpehEJuiod06DST3e
         9f/ARL7dpYoMCDHIyykIR1wrH6OaHepRIBi3SbSnrPlHL9J0EjHh/+zOkHQR9/XzVP0o
         rWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741698611; x=1742303411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZxzBfeMvtS8msc4AUdZye+paWIRQWsY02FYX9D/dyU=;
        b=jtZNKz+aeZAnNGS43WScGJCjS9iJGr7VZOov060cxMNrCaSGc2fS3dcGJpwjC+Zo/A
         daMw9BdiIiE2XlVa9DlPe3vI18zBkUOkITpphSFwrEQuurMAEwRS2j69Jb2l5+KjnnGe
         y/tXyckCsnQ4rDDE8/KstV7+uNnSFolQgDu3wi4aGV4JMF2pWbr3I3FRTqqgetJCCmtG
         6CySl0KmWDizlyDJf0tPTijGp6bdlcLwo+gUvAgLBgukblKHap7/MP40fKGrIXs9Uq0F
         p+dyQCZnyPlncfx6X1T1ZAgJtrOA6G1xa5k27mXpKRgMMifnPF+/1++nCeUNNYndfuLI
         HUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+81320mxFEcwBqNtk7NlZGszDHinb/8yaYlso/Mixm8jG1JWS2OzSE5fTBkKSx2RuJ/l3FQ5ko18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9bAmkV6lYtlHVLHbk3ekKfZazONXQMMqNsaqEGOVNoN+8RMBj
	wb0erBv8qqzcY/j35V/NtskhJ+t5PgXSYOhoPPmuiybMNJZ+gufx9KNYlqyiLQ==
X-Gm-Gg: ASbGncuL9A+8AqWfmWq4hRkiAXksuiA3pqKvhfhGlZ+D6WI4GjdT3w0uqQJV/HxYhwE
	TetRULS4l1tpJiWTLwrctqQv0/hNrzNwLJ7cIemajDU3onU24IhREfuZapODXmpcI9qSnuZlQoZ
	jXzPSTP7oPxQ24njXWna7Y9aS+v+gHDLl5l82oV0aomQeMhsZ54LVOB9mUCU+27kj1IflInAye0
	bh6bseYgGXknsiMwCfkl0qPlsYvNmIKuwsOnSrtR96vIc9c6/Ea3e1NL9YTbV8Q9b09WmpeJIxX
	btvgSYMmabA2JQ4p3mdGNDJcHhzeyqOtj6abIrJZZqDnQFTIRAveDazNYr1sM9wYDHDokHlScbQ
	5Mbthaw/lhsO7ibrhEPByptHgNqd/0w==
X-Google-Smtp-Source: AGHT+IGjgWsrvzzfEZbJBBfLP7b3NXl+vu6YRfQZwy/4AhwAC/+SYuRPlvSDF6NzMYVciulPb5U/tQ==
X-Received: by 2002:a05:6000:1acd:b0:390:d796:b946 with SMTP id ffacd0b85a97d-3926c1ce312mr4745960f8f.44.1741698611073;
        Tue, 11 Mar 2025 06:10:11 -0700 (PDT)
Message-ID: <369daf2d-63de-4375-a11e-401135ede43b@suse.com>
Date: Tue, 11 Mar 2025 14:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/vmx: fix posted interrupts usage of
 msi_desc->msg field
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250311120652.61366-1-roger.pau@citrix.com>
 <20250311120652.61366-2-roger.pau@citrix.com>
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
In-Reply-To: <20250311120652.61366-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 13:06, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -396,6 +396,13 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>      const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
>      struct irq_desc *desc;
>      struct msi_desc *msi_desc;
> +    /*
> +     * vmx_pi_update_irte() relies on the IRTE already being setup, and just
> +     * updates the guest vector, but not the other IRTE fields.  As such the
> +     * contents of msg are not consumed by iommu_update_ire_from_msi().  Even
> +     * if not consumed, zero the contents to avoid possible stack leaks.
> +     */
> +    struct msi_msg msg = {};

What the comment says is true only when pi_desc != NULL. As can be seen in
context above, it can very well be NULL here, though (which isn't to say
that I'm convinced the NULL case is handled correctly here). I'd view it as
more safe anyway if you set msg from msi_desc->msg.

Jan

