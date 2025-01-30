Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843EA22DBA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879566.1289774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUZO-0008Tx-UN; Thu, 30 Jan 2025 13:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879566.1289774; Thu, 30 Jan 2025 13:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUZO-0008RQ-R7; Thu, 30 Jan 2025 13:26:58 +0000
Received: by outflank-mailman (input) for mailman id 879566;
 Thu, 30 Jan 2025 13:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUZN-0008RK-Dm
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:26:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfcf1d43-df0d-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 14:26:55 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab68d900c01so149425166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:26:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47f1d82sm118391166b.84.2025.01.30.05.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:26:54 -0800 (PST)
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
X-Inumbo-ID: dfcf1d43-df0d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738243615; x=1738848415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6aCxvRY+6Ki+8WSIgd9W/FxeozYzgX8mNfdrBuzYoUI=;
        b=YWyvLi9+fVqh9TJu0DlZ904PlAnWU1JgVYoSVMWS0+AGh9P1uI3p0i1AhkfJWLNO6Z
         39q92h9PrIZJbjk575pNnQCcrM+SjXU5BdF121brsHDu49orfpkBw+H4ZMlPpyohlp3o
         ujzCHQxJF2hEwIBH9fHFKvo5JHzKWFtPZ1aTqVcuYjfNuvizk2nUWmjkhkJ2JE3SX7cI
         bq2a8x7ZZeRUdvEiXxn5aOPBkSy1nn4wgJ8cuUzlpRtBeITHerneRu+hFRMU/PJ7puTD
         oS/jdFrEeXARoiLtv2czA30tlkFtzWiAbgS8KAy6BGNX9+W4Kh1FUp6d3OpXuzrfNf0W
         2A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243615; x=1738848415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aCxvRY+6Ki+8WSIgd9W/FxeozYzgX8mNfdrBuzYoUI=;
        b=P/i4wz9hqHjLNVKePfceOvDJc8d3gaG5cB9X1nhaCvCztp0gnpkhq3PqVFMEKjMXyu
         FLpnOBlclpV2DrdACiS/8I7nNObSRU0Z+fd3AqJWiq5cKDpbD0CmFChKd+UWgKcX7B6T
         6EUhu7dKOMaCfR5mdr/lGwrkK2gzBvbWqiH6V2sCIWhVaECSts6IiKlJKMPVXN3tLTAs
         EntQyV4lpw7QOh8f/7GR7uyE2eY161zIttaFldmbp8c7vwcXC44h4rf1GGhKEu3Ic6I0
         /6DLTKaL8xeum1F1y/JJyRj2iJ1zMBPK2rbMB2xA4uzJLgnmBmhuzJ07GV9RW0BL2G4f
         BI0w==
X-Forwarded-Encrypted: i=1; AJvYcCU92kBjQyC504KbuYbSRqXIA7ozNmpm+K6LHKmeFwGrV7jinSw34kg85Qbto7a2LbIyUYzBW9HRgHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmLUsnP5rSoQrXx70b6gv2t0v0fd1vUnNu+t9THBNqZeu6Mfmz
	l5Lrcl/P/8h2KejaGpvWt2u/SPMAyUTFjPbQ0gW6rQBC5IKSpwljI95sd3kXjA==
X-Gm-Gg: ASbGnctR/JN6BdUWRFXM40A/1BcXBcaWGRqv8k9UOxp2eYBsepa7AQU0gdMlEUA9Y5V
	xT6Y3HApG2cHl1C4aVpkhSJ2ihgoVPdZQSeF6i+R+9lPx4YF8WpLmSCarskVhXOQ8lcKotzIEkl
	R83mZJTdldLDHk47osdPL/AwPPxaAZ53EhKNdL77eOLsfniOoKPsEn3PkrCF6fQ7FmsevAFxY7g
	fOtPsZoTlWhHLE9pkTC7R8wn2BJ/umg2oHNCFv0fUL/D2sDy1EcNMRrqN4K9BGaHsVHZw5H04TF
	XXgTP65YSK6bjNZfeulJqAjF7Kh8IwJVlV+VOUJvb8HJFyEVvskRhpg5YBgV+LH5qIkKMQB7AzZ
	9
X-Google-Smtp-Source: AGHT+IFDK8QoP1TAn8CfLD3B13Q2irPlmZB+HW3FlA0YH8kNsQJNv1dU5kriIUUiBZo/qhbo/tx7iw==
X-Received: by 2002:a17:907:1c0b:b0:ab6:e04e:b29 with SMTP id a640c23a62f3a-ab6e0bb4a12mr266541166b.3.1738243614988;
        Thu, 30 Jan 2025 05:26:54 -0800 (PST)
Message-ID: <e3be3cb3-4a2e-4a39-8c83-f23e56cc7b75@suse.com>
Date: Thu, 30 Jan 2025 14:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 11:19, Sergiy Kibrik wrote:
> @@ -58,7 +58,7 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>      return NULL;
>  }
>  
> -#endif /*CONFIG_MEM_ACCESS*/
> +#endif /*CONFIG_VM_EVENT*/

Oh, also - as you touch this anyway: Would you mind adding the mising blanks,
just like we have them ...

>  #endif /* _ASM_ARM_MEM_ACCESS_H */

... on the immediately following line?

Jan

