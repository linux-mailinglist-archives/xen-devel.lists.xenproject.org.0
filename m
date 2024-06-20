Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089E910993
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 17:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744791.1151902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJVy-0002v1-Nh; Thu, 20 Jun 2024 15:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744791.1151902; Thu, 20 Jun 2024 15:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJVy-0002sk-Kr; Thu, 20 Jun 2024 15:15:54 +0000
Received: by outflank-mailman (input) for mailman id 744791;
 Thu, 20 Jun 2024 15:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKJVx-0002se-F8
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 15:15:53 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb93a3fb-2f17-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 17:15:52 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso10888091fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 08:15:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fedcf36c22sm11347360a12.9.2024.06.20.08.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:15:51 -0700 (PDT)
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
X-Inumbo-ID: fb93a3fb-2f17-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718896552; x=1719501352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ht+5TDug4TcE2w45ccuq+95zRR/OmLFjn/G12EAkvY=;
        b=fklYfQ5soZqPbG1p8cdXZ1yF/98FgwJi8SDnPXrHsUgNXHHJh2LtBfJofyJFewKxZC
         oCBVcv56/+zockRnoO1dBRejSNGJDRXWk3o4hz/SRzDDU5Pe+tMXL0ENQTD/31/+CGZ3
         RZwmo1MMiwBtUwYisGQ3eZvRfmWnYipT5bIOFcBHYM44hUciGXTxqZkPF+8sy2FSx+mX
         fhWlZR/fpqkMGccVCvL6Gr7IgpW6HTTG7FJDyOwnQAmweqvK/iBYjsCwmOwFnWXXDNoR
         vSOBa4N23E8HvF4dgBx3rNXR+ck0pPxcTDj79ZiwsXr+acQFgx/AKVTblSCH/SB/nFNu
         9meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896552; x=1719501352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ht+5TDug4TcE2w45ccuq+95zRR/OmLFjn/G12EAkvY=;
        b=AC8zVxoGBEsp/NViUvP8Dze0SCHD7G+hcGqaBhLwJ9RDwIMnSTURcxH+mL8wFtu2zV
         UHyPikSjzI6rI6luBrB8CJ9Vng3FsLTVEoOTFD8XYVnAjLTWluQ5oxrzNXigh8FiVkob
         JWBSdAu90yKa7D0UFlIClMxS+DsIaTYA8WI1Octfvjvs+WKgm+1oOIBch1JVMKij5LIX
         usFAl/nLKWo0VhSGHyekWViO9cCpYS/Q+81DUntpDIYbPgZn33EzT+FJTTl24dyJN3Pa
         PqV3nR2vUIUPzBnRq7F0DrobmbWQNr3ahD/Scu2cxgRgTgXRjAgEMc3PcgWkOHQ8bb4f
         fL0w==
X-Forwarded-Encrypted: i=1; AJvYcCWmnEJHDW8eAmnLEPMNsr/Vke2Mk7NKmuzymm/yFjbxfw0RyMZUu4HgtWIJ9MwnHrZK4NJ/sEc3ZUnAmVmEacq0Dd8du+cTTfYwZ1ZrZ60=
X-Gm-Message-State: AOJu0YyUom0IsY0yQ9eebUMF/zwj4XRy0sUD4Yc6UQMCwJQvTNaoFPV3
	RgfJvf7UJFkS8reffcyr/FKXDUCpUvlOIFHjxzy9DsmqfleYJN7uhqgRTcLnEfNXKTvG1F6yTNY
	=
X-Google-Smtp-Source: AGHT+IGnlqJ6FoRF3Jz6ct8Tz74MC5gUjv7u6K3dGpAHNOLO5nMQBfbOB9kJd7/pVYF462lRVgU0Ww==
X-Received: by 2002:a2e:860e:0:b0:2ec:1a6:7b01 with SMTP id 38308e7fff4ca-2ec3cfe89ddmr34473451fa.33.1718896551868;
        Thu, 20 Jun 2024 08:15:51 -0700 (PDT)
Message-ID: <b2af04fd-1a7c-4e17-9683-b00c11521a24@suse.com>
Date: Thu, 20 Jun 2024 17:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/apic: Fix signing in left bitshift
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
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
In-Reply-To: <6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 16:31, Matthew Barnes wrote:
> There exists a bitshift in the IOAPIC code where a signed integer is
> shifted to the left by at most 31 bits. This is undefined behaviour,

s/at most/up to/ maybe?

> and can cause faults in xtf tests such as pv64-pv-iopl~hypercall.
> 
> This patch fixes this by changing the integer from signed to unsigned.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
>  xen/arch/x86/io_apic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1756,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
>           !io_apic_level_ack_pending(desc->irq) )
>          move_native_irq(desc);
>  
> -    if (!(v & (1 << (i & 0x1f)))) {
> +    if (!(v & (1U << (i & 0x1f)))) {
>          spin_lock(&ioapic_lock);
>          __mask_IO_APIC_irq(desc->irq);
>          __edge_IO_APIC_irq(desc->irq);

For one, can you please also take care of the similar issue in
mask_and_ack_level_ioapic_irq()? And then here and there, can you please
also address the style issue(s) on the line(s) you're touching? In both
cases it will want to be

    if ( !(v & (1U << (i & 0x1f))) )
    {

thus bringing both fully into proper Xen style afaics. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

