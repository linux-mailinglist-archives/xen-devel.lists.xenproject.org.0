Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77752996DA6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814609.1228204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXd3-00051V-0z; Wed, 09 Oct 2024 14:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814609.1228204; Wed, 09 Oct 2024 14:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXd2-0004zf-TG; Wed, 09 Oct 2024 14:25:28 +0000
Received: by outflank-mailman (input) for mailman id 814609;
 Wed, 09 Oct 2024 14:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syXd1-0004zZ-2O
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:25:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539b2725-864a-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:25:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99543ab209so453664566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:25:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99527d3ae4sm444456066b.195.2024.10.09.07.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:25:25 -0700 (PDT)
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
X-Inumbo-ID: 539b2725-864a-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728483925; x=1729088725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq16bJoo/pFRiiuUym9iMU+LKtD8lMR8H/ig1NkW5Io=;
        b=SvaGGgATDuSdzkIzsXF/CgH9QhAbLOFuVgWwatzUEtpBTqvlB6DBIV6eCIPgUwXxol
         9VM5hODWbVGFz9CKvvAKYsrB/CpLM98RcKfCgQl5ep6p7yLKDAdf5G2WJJdGCIOWAlWS
         0tieCvmm+eg9Xe+rrVmh4QMuoQky8YN1uSpd5r/Oj7F4pnQfX2ZOvE1q86kG6m5MR8C1
         2brBZadEPju5sFv7W4w8aFyqpR8sH1phioatDzfO5UzlqNHJOB9XlBiaELyzqEU1ImCX
         JhrsB3Vf9afrfUS6dYpmt+4yVbtAshyWfYQ8xPjyGo90fByXiSyDHHN5vXarue77vYkR
         6m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728483925; x=1729088725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq16bJoo/pFRiiuUym9iMU+LKtD8lMR8H/ig1NkW5Io=;
        b=reLDfV6qgANyn8/WpjzYQm6AU7I0VNk1J2FEiGYvrP5WZfo+qv89O8HZLbyo/FendH
         /1zQkFrKYSpc9HSS0qKg69mJi8fF0m3tgxo6Pl5jG7bNeg1TcdhvVSAlXPvviaBQ+gA1
         q6wtMI369dNJEsP7neM1/T45OR63yA2TQoy9w/qThOm2geIWpPHmr9hNNMnaVSF/+ZTA
         17sag3yi1oNda1/7ZwHqCRRRtFcAq/olL87w04UhRfJEAq8SbYKhXnV+YRi1TwNvovIx
         MtZnvutBsDqKIKj1qQnQpSO6d3ieCcwMC5sPYIjsY5aGKhREGvY8TnroxzWmYUuA+Pdo
         nePQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMKAy9G7PAy3mtHe2lnJ2J1RhL4UE71Gt1S0Hp+XTJgETT3ezuHL7O4kfjcS9y856gCrOR/Qt5CdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlqBGFG0O4wxJfL3lUkmMwjsukZeTrHDe8htYPBWkKE4eyUzqr
	JG5g+XsIbhFHER2Omd5Kf89cpFdy5u1+jr1cP0RQLPfqSg9eWDjVJzya7+Gf5A==
X-Google-Smtp-Source: AGHT+IHnpoBgJmbtrUC8S1sh5hJ3ODjlfwE6dznugr/PspiU1zB8gcKBPdrn/5tgNwGh8/Yh9uLNjw==
X-Received: by 2002:a17:907:ea6:b0:a90:1300:e613 with SMTP id a640c23a62f3a-a998d327ecbmr255239066b.55.1728483925547;
        Wed, 09 Oct 2024 07:25:25 -0700 (PDT)
Message-ID: <28e07993-9463-49a5-ba75-e012056e5ab2@suse.com>
Date: Wed, 9 Oct 2024 16:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] tools/libacpi: Use LUT of APIC IDs rather than
 function pointer
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-7-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:38, Alejandro Vallejo wrote:
> @@ -148,7 +148,7 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
>          lapic->length  = sizeof(*lapic);
>          /* Processor ID must match processor-object IDs in the DSDT. */
>          lapic->acpi_processor_id = i;
> -        lapic->apic_id = config->lapic_id(i);
> +        lapic->apic_id = config->cpu_to_apicid[i];

Perhaps assert (like you do in an earlier patch) that the ID is small
enough?

> --- a/tools/libacpi/libacpi.h
> +++ b/tools/libacpi/libacpi.h
> @@ -84,7 +84,7 @@ struct acpi_config {
>      unsigned long rsdp;
>  
>      /* x86-specific parameters */
> -    uint32_t (*lapic_id)(unsigned cpu);
> +    uint32_t *cpu_to_apicid; /* LUT mapping cpu id to (x2)APIC ID */

const uint32_t *?

> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -1082,6 +1082,11 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
>  
>      dom->container_type = XC_DOM_HVM_CONTAINER;
>  
> +#if defined(__i386__) || defined(__x86_64__)
> +    for ( uint32_t i = 0; i < info->max_vcpus; i++ )

Plain unsigned int?

Jan

