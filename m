Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBEB1AFF8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070105.1433759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCca-0007kr-4y; Tue, 05 Aug 2025 08:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070105.1433759; Tue, 05 Aug 2025 08:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCca-0007i0-1P; Tue, 05 Aug 2025 08:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1070105;
 Tue, 05 Aug 2025 08:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCcY-0007hu-R7
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:02:06 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b5efc5-71d2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:02:04 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af95b919093so350600566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:02:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07659dsm848977366b.21.2025.08.05.01.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:02:03 -0700 (PDT)
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
X-Inumbo-ID: 79b5efc5-71d2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754380924; x=1754985724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CtmSLy6PqvBlDIW9PGwauE7arZ7BbkR68+6Y6KWVICA=;
        b=V9ysxjmQVhQVhcwdxrpeGuiepa46RwRBLIBTwDu1VBP83SqvRv06Wo77eYI8JVXbRo
         4AqtE573QqBH+Xq85d3+LWKU2+SvwLD91y8xNWqYGqHIay1XfHjoLbTV4GfkR2uCGVB4
         0MDftJWZmwzfNIkOgT3WT/wNa3jKUJCKKYcwHt+ImseXNHSyCqUAI8OaCmeJ87NsY5sW
         OCS8GWs9NrouZDRc5zNox69lijV1zxk/Lu9WBeJD1DtiquMSqacC4/ddOIdbueVzzL6w
         WrxO4MCOU4ZrLgqbz5Wchoy4/ugdYzcY3I5oFmNQGdvKFFwwAhFiNvmFkP021v0OyM9V
         rfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380924; x=1754985724;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtmSLy6PqvBlDIW9PGwauE7arZ7BbkR68+6Y6KWVICA=;
        b=R2FTvC15wVzNljdLtselkycdLnc7eZfyo1U1jEl+Sp6eVWfoMbVlPVJhwLhAXwsjYz
         FSLRSXbXN5hl9S2auN17/bc5HrAnV74vejaLWA8d3TKj27zrkXsG4DdoH3tWVRGf7dEw
         e16FAAviBswbMoflC2dvbKu3sgZcHMd7p3aBFTagKxUHjZQRSjEJWEP4LCsHsvImaRJL
         eJzHM6cUMRrZ9kDOvJZ0/Lmdd6P5zTlTqbzLvlWmtx8S8NuMJvUTZcBztEjh7XJa4xpl
         LlusMaEP/dzaTmgRtNVTPCWp/tfYrOKqPB8Gt3UGV6lubkRfq9dx80SWw2X/k1cXkWDk
         x45w==
X-Forwarded-Encrypted: i=1; AJvYcCUgfGFFQYqmiX8tH+r6Ma1ap/UvHQ1sGJMcCJ4faSJhHIQuQ33dt5mTdSieFkKBA3nvlJRzIoBMTOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/MC/ylAjH3p8owiQCnWXu9acqtk9gG59+SlV99yPW3C2u47G5
	IPsBG32hlMKXSEbizjpUOk0CNNQuHqq78R8cmi0QLKXQH/d3QWpJI0C/J1xk6e2rA0kwFY6bZP/
	0S3M=
X-Gm-Gg: ASbGncuIXVhpOgDzDZAntFSHWMhWghWUMae0PjRghHa/UrNbvgVlEwxDrlH0WwGxho7
	SWsq9PjoFYugpyXOQzLuw4LLL7G3OErHAh1B3VQm75miClSlwtReoDhtxAIpCwL795gxA8IpM6K
	zS2hujHU9KynBhsN+JiuAyuQJB6c5URnl+YkiQGH0TxP2mEd3s6NOMY7O6Q30eWC99nlzO/sVfl
	cXSxtPa+ArnGPrCE1jDMEUMwY8XGwmi/pWFESk+ny1Nm6k+F0HxAHMpAkze/R+2j6hA+KogrmoH
	QLGEKO9GpdlXr1RflU2RT+VSCupJjvMvZKR81mdCgHtejC92Hs5IuRTEmFmi3EP152Ycy+nn59e
	QStfdWr7Kdqbz0Q8s2nB2Su5mLCDC+XgK00iBrJQd5Z9mSjJ0eBD7lt3Zk5TBKVzzeyibnkJUw6
	t6L3eJ8qI=
X-Google-Smtp-Source: AGHT+IHARCC5ug1NuLrn0wCnmLqOduhZFGQKjxjU3JOkQeWOdEzlQSUUDkqvxMdJM0hO+Wf40wK99w==
X-Received: by 2002:a17:907:d86:b0:af9:3e06:46ff with SMTP id a640c23a62f3a-af940015684mr1413696466b.18.1754380924070;
        Tue, 05 Aug 2025 01:02:04 -0700 (PDT)
Message-ID: <450982f5-4032-4b63-9635-40dbc10f6779@suse.com>
Date: Tue, 5 Aug 2025 10:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: polish hvm_asid_init() a little
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
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
In-Reply-To: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2025 17:41, Jan Beulich wrote:
> While the logic there covers asymmetric cases, the resulting log
> messages would likely raise more confusion than clarify anything. Split
> the BSP action from the AP one, indicating the odd CPU in the AP log
> message, thus avoiding the impression that global state would have
> changed.
> 
> While there also
> - move g_disabled into .data.ro_after_init; only the BSP will ever write
>   to it,
> - make the function's parameter unsigned; no negative values may be
>   passed in. Also reflect this in svm_asid_init().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Sorry, I meant to Cc: you on the submission, as it was the reviewing of
your copied code which made me spot the shortcomings (which, as indicated,
I think it would be nice if you avoided from the very start).

Jan

> --- a/xen/arch/x86/hvm/asid.c
> +++ b/xen/arch/x86/hvm/asid.c
> @@ -48,20 +48,22 @@ struct hvm_asid_data {
>  
>  static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
>  
> -void hvm_asid_init(int nasids)
> +void hvm_asid_init(unsigned int nasids)
>  {
> -    static int8_t g_disabled = -1;
> +    static int8_t __ro_after_init g_disabled = -1;
>      struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>  
>      data->max_asid = nasids - 1;
>      data->disabled = !opt_asid_enabled || (nasids <= 1);
>  
> -    if ( g_disabled != data->disabled )
> +    if ( g_disabled < 0 )
>      {
> -        printk("HVM: ASIDs %sabled.\n", data->disabled ? "dis" : "en");
> -        if ( g_disabled < 0 )
> -            g_disabled = data->disabled;
> +        g_disabled = data->disabled;
> +        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
>      }
> +    else if ( g_disabled != data->disabled )
> +        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
> +               data->disabled ? "dis" : "en");
>  
>      /* Zero indicates 'invalid generation', so we start the count at one. */
>      data->core_asid_generation = 1;
> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -12,7 +12,7 @@
>  
>  void svm_asid_init(const struct cpuinfo_x86 *c)
>  {
> -    int nasids = 0;
> +    unsigned int nasids = 0;
>  
>      /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>      if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> --- a/xen/arch/x86/include/asm/hvm/asid.h
> +++ b/xen/arch/x86/include/asm/hvm/asid.h
> @@ -13,7 +13,7 @@ struct vcpu;
>  struct hvm_vcpu_asid;
>  
>  /* Initialise ASID management for the current physical CPU. */
> -void hvm_asid_init(int nasids);
> +void hvm_asid_init(unsigned int nasids);
>  
>  /* Invalidate a particular ASID allocation: forces re-allocation. */
>  void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);


